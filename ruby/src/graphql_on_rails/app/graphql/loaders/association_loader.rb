module Loaders
  class AssociationLoader < GraphQL::Batch::Loader
    def self.validate(model, association_name)
      new(model, association_name)
      nil
    end

    # modelはモデル、association_nameは関連名（has_many booksのbooksなど）
    def initialize(model, association_name)
      super()
      @model = model
      @association_name = association_name
      validate
    end

    def load(record)
      raise TypeError, "#{@model} loader can't load association for #{record.class}" unless record.is_a?(@model)
      # Promiseは貯めてあとで実行(resolve)してくれて、resolve済み(ロード済み)かどうかを管理してくれる
      return Promise.resolve(read_association(record)) if association_loaded?(record)
      super
    end

    # We want to load the associations on all records, even if they have the same id
    def cache_key(record)
      record.object_id
    end

    # 取得実行時の処理
    def perform(records)
      preload_association(records)
      records.each { |record| fulfill(record, read_association(record)) }
    end

    private

    # その関連が本当にあるかを確認
    def validate
      unless @model.reflect_on_association(@association_name)
        raise ArgumentError, "No association #{@association_name} on #{@model}"
      end
    end

    # preloadなどN+1対応をやってくれる
    def preload_association(records)
      ::ActiveRecord::Associations::Preloader.new(records: records, associations: @association_name).call
    end

    def read_association(record)
      record.public_send(@association_name)
    end

    def association_loaded?(record)
      record.association(@association_name).loaded?
    end
end
end
