# タイトル
開発生産性を加速する：9つのオープンソースAIとMCPプロジェクト

# 概要(100文字以内)
GitHubとVS Codeチームが支援する9件のオープンソースプロジェクトを紹介。MCP（Model Context Protocol）を活用して開発ワークフローをAIネイティブにする取り組みの概要と実例を分かりやすく解説します。

# 要約
この記事は、GitHub Copilot と VS Code チーム（および Microsoft OSPO）が支援する、MCP（Model Context Protocol）とAIを活用した9つのオープンソースプロジェクトを紹介する公式ブログ投稿を日本語に翻訳・整理したものです。主なテーマは（1）フレームワーク／プラットフォーム統合、（2）開発者体験とAI支援コーディング、（3）オートメーション／テスト／オーケストレーション、の3点です。各プロジェクトはエコシステム統合、エディタやIDEのAI強化、MCPインフラの信頼性向上など、実運用で役立つ機能を提供します。

# 初心者向けの説明
要点（初心者向け）：
- MCP（Model Context Protocol）は、LLMやエージェントが外部ツールやアプリケーションと安全にやり取りするための共通プロトコルです。MCPを利用すると、AIがあなたのコードや実行環境、ブラウザやエディタにアクセスして、より実用的で文脈に沿った支援が可能になります。
- この記事で紹介されるプロジェクト群は、MCPを使って現実の開発ワークフローにAIを組み込むためのスターターキットのようなものです。たとえば、FastAPIのエンドポイントをMCPツール化したり、IDEにドキュメントやコードスニペットを直接取り込んだり、ローカルで安全にコードを実行してAIと対話するためのランナーがあります。

主なプロジェクト（記事で挙げられた9件）と短い説明・リンク：

1. fastapi_mcp
   - 説明：FastAPIのエンドポイントを簡単にMCPツールとして公開できるライブラリ。認証や最低限の構成を提供します。
   - リポジトリ：https://github.com/tadata-org/fastapi_mcp

2. nuxt-mcp
   - 説明：Nuxt（Vite/Nuxt）アプリのルート検査やSSRデバッグのための開発者ツール。アプリの文脈をモデルに渡しやすくします。
   - リポジトリ：https://github.com/antfu/nuxt-mcp

3. unity-mcp
   - 説明：UnityゲームエンジンAPIとやり取りし、AIを使ったアセット管理やシーン制御、自動化に役立つインターフェースを提供します。
   - リポジトリ：https://github.com/CoplayDev/unity-mcp

4. context7
   - 説明：コードベースから最新かつバージョン固有のドキュメントやコード例を引き出し、LLMのプロンプトに直接流し込むことで、より正確なコンテキストを提供します。
   - リポジトリ：https://github.com/upstash/context7

5. serena
   - 説明：セマンティックなコード編集と検索を行うツール群で、エージェント駆動のコーディング支援を実現します。
   - リポジトリ：https://github.com/oraios/serena

6. Peekaboo
   - 説明：画面上のSwiftコードや構造を解析して、GUI自動化やAIコンテキスト生成に使える情報を取り出すツールです。
   - リポジトリ：https://github.com/steipete/Peekaboo

7. coderunner
   - 説明：LLMをローカルの実行パートナーに変えるツール。サンドボックス上でコードを生成・実行し、必要なツールを自動インストールして出力を返します。
   - リポジトリ：https://github.com/instavm/coderunner

8. n8n-mcp
   - 説明：ワークフロー自動化プラットフォームn8nをMCP対応にするプロジェクト。ノード操作やワークフロー作成をAIで支援します。
   - リポジトリ：https://github.com/czlonkowski/n8n-mcp

9. inspector
   - 説明：MCPサーバーのプロトコルハンドシェイクやツール、OAuthフローを検査してテスト・デバッグを行うツール。LLMプレイグラウンドや評価シミュレーション機能もあります。
   - リポジトリ：https://github.com/MCPJam/inspector

簡単な使い方の例（入門者向け）

- まずは記事で気になったプロジェクトのREADMEを読む。たとえば `fastapi_mcp` を試す場合は、ローカルにFastAPIアプリがあれば簡単に試せるはずです。リポジトリの手順に従ってMCPエンドポイントを立て、サンプルのMCPクライアントと連携させることで、AIがエンドポイントをツールとして呼べるようになります。
- `coderunner` のようなツールは、まずローカルでサンドボックスを立て、簡単なスクリプトを生成・実行させる流れを確認すると、LLMとのインタラクションが理解しやすくなります。

参考・出典

- 元記事（英語）: "Accelerate developer productivity with these 9 open source AI and MCP projects" — https://github.blog/open-source/accelerate-developer-productivity-with-these-9-open-source-ai-and-mcp-projects/
- 著者: Kevin Crosby — https://github.blog/author/kevincrosby/

補足（翻訳と追加調査について）

- 本文は英語記事の日本語翻訳および要約です。原文に不明点があれば、各プロジェクトのREADMEやリポジトリページ（上記リンク）を参照してください。

# 画像について（保存場所：`元ネタ\\画像`）
以下の画像が記事内に見つかりました。リポジトリ内に画像ファイルを保存する必要がある場合は、下記URLからダウンロードして `元ネタ\\画像` に配置してください（自動で取得していないため、手動ダウンロードをお願いします）。

- GitHub avatar (Kevin Crosby): https://avatars.githubusercontent.com/u/6313838?v=4&s=200
- 記事中の画像: https://github.blog/wp-content/uploads/2025/10/gitmerge1.png?w=300

ファイル作成日: 2025-10-20
