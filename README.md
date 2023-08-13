## このリポジトリは
GraphQLの勉強リポジトリです。

## 学んだこと
### GraphQLとは
> GraphQLはAPI用のクエリ言語であり、データ用に定義した型システムを使用してクエリを実行するためのサーバー側ランタイムです。GraphQLは特定のデータベースやストレージエンジンに縛られることなく、既存のコードとデータに支えられています。

https://graphql.org/learn/

- GraphQLにおける用語
  - Schema: スキーマ。定義したデータのひとかたまり。Railsではモデルと同義？
  - Field: フィールド。スキーマの構成要素。
  - Type: フィールドの型情報。
    - Object Type: オブジェクト型。{}が続くフィールド（スキーマ？）の型。
    - Scalar Type: スカラー型。値が続くフィールドの型。
    - Union Type: 統合型。複数の型を統合して定義する型。
  - Interface: 一般的なインターフェース。GraphQLでもインターフェースを定義できる。

### GraphQL関連Gem
- RailsにGraphQLを導入する時は以下のgemを利用する
  - graphql
    - RailsにGraphQLの仕組みを導入できる。各種generateコマンドも用意されている。
  - graphql-rails
    - http://[project-name]/graphiql にGraphQLクエリ実行ページを導入できる。develop環境だけに導入するのが通例。
  - graphql-batch
    - GraphQLで発生するN+1問題を解消するGem。Loaderの定義は公式がexampleを用意してくれているが、内容の理解には知識が必要そう。

## 参考資料
- GraphQL [https://graphql.org/learn/]
- [Rails基礎] GraphQL基礎講座 [https://zenn.dev/igaiga/books/rails-practice-note/viewer/rails_graphql_workshop]
