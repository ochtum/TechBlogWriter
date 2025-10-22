# 記事タイトル
開発生産性を加速する：9つのオープンソースAIとMCPプロジェクト — セクション素案

# タグ
MCP, generative AI, GitHub Copilot, VS Code, 開発生産性

# 記事のターゲット層
- 開発者（初級〜中級）、技術系ブログの読者、OSSメンテナ／導入検討者

# セクション1: イントロダクション（導入）
AIを実務の開発ワークフローに組み込むためには、AIが外部ツールやアプリと安全かつ文脈を維持して連携できる仕組みが必要です。本シリーズでは、GitHubとVS Codeチーム（およびMicrosoft OSPO）が支援する9つのオープンソースMCP関連プロジェクトを取り上げ、実践でどう活用するかを解説します。

# セクション2: MCPとは（初心者向けの簡潔説明）
MCP（Model Context Protocol）は、LLMやエージェントが外部ツールやアプリと対話するための共通プロトコルです。ポイントは「権限の明示」「やり取りの文脈化」「安全なツール呼び出し」です。初心者には「AIが外部の道具を安全に使うためのルール」と説明すると分かりやすいでしょう。

# セクション3: この記事で見る3つの観点
1. フレームワーク／プラットフォーム統合 — 実際のアプリやエコシステムにMCPを組み込み、AIがその環境をツールとして利用できるようにするアプローチ。
2. 開発者体験（DX）とAI支援コーディング — IDEやエディタでのドキュメント取り込み、セマンティック検索、編集支援など、日常の開発を改善する取り組み。
3. オートメーション／テスト／オーケストレーション — MCPインフラを本番運用に耐える形でテスト・監査するためのツールや手法。

# セクション4: 紹介するプロジェクト（短い1段落説明＋リンク）
- fastapi_mcp — FastAPIのエンドポイントをMCPツールとして公開するためのライブラリ。認証や最小限の設定を提供します。https://github.com/tadata-org/fastapi_mcp
- nuxt-mcp — Nuxt（Vite/Nuxt）アプリの開発支援ツール。ルート検査やSSRデバッグでアプリの文脈をモデルに渡せます。https://github.com/antfu/nuxt-mcp
- unity-mcp — UnityのAPIと連携し、AIでアセット管理・シーン制御・自動化を支援します。https://github.com/CoplayDev/unity-mcp
- context7 — コードベースからバージョン固有のドキュメントやコード例を引き出し、LLMに正確なコンテキストを付与します。https://github.com/upstash/context7
- serena — セマンティックなコード編集／検索を提供し、エージェント駆動のコーディング体験を向上させます。https://github.com/oraios/serena
- Peekaboo — 画面上のSwiftコードを解析してGUI自動化やAIコンテキスト生成に使える情報を抽出します。https://github.com/steipete/Peekaboo
- coderunner — LLMをローカルでコード生成・実行できるランナー。サンドボックスで安全に実行します。https://github.com/instavm/coderunner
- n8n-mcp — n8nのワークフロー自動化をMCP対応にし、ノード操作の自動化をAIで支援します。https://github.com/czlonkowski/n8n-mcp
- inspector — MCPサーバーのプロトコルやOAuthフローを検査・テストするツール。LLMプレイグラウンドや評価シミュレーション機能があります。https://github.com/MCPJam/inspector

# セクション5: 実践ハンズオン（短い手順案、初心者向け）
- fastapi_mcp のお試し（概略）:
  1. ローカルに簡単な FastAPI アプリを用意する（`uvicorn`で起動できる状態）。
  2. `fastapi_mcp` をインストールして、README のセットアップ手順に従い MCP エンドポイントを公開する。
  3. 提供されるサンプルの MCP クライアントからツールを呼び出し、AI がエンドポイントを利用できることを確認する。

- coderunner の簡単な試行案:
  1. `coderunner` の README に従いローカルでセットアップする。権限設定とサンドボックスの確認を行う。
  2. 簡単なコード生成タスクを LLM に依頼し、生成されたスクリプトをサンドボックス内で実行して結果を観察する。

# セクション6: 判定チェックリスト（導入検討時）
- セキュリティ: 認証・権限分離・監査ログが整備されているか
- 再現性: ローカルやCI/CDで再現可能か、テストが書けるか
- 活動性: ドキュメントとコミット頻度、Issue対応状況は健全か
- 組込みやすさ: 自社ツールチェーン（言語・フレームワーク）に適合するか

# セクション7: まとめと推奨アクション
MCPを活用するプロジェクト群は、AIを現場で安全に活用するための重要な基盤を提供します。まずは1プロジェクトをピックしてハンズオンを行い、実運用での課題（認証、監査、CI統合）を洗い出すことを推奨します。

# 参考・出典および補足調査
- 元記事: "Accelerate developer productivity with these 9 open source AI and MCP projects" — https://github.blog/open-source/accelerate-developer-productivity-with-these-9-open-source-ai-and-mcp-projects/
- 著者: Kevin Crosby — https://github.blog/author/kevincrosby/

※ 画像は `元ネタ\\画像` に保存してください。画像の自動取得用スクリプトは `scripts\\download-images.ps1` にあります。

