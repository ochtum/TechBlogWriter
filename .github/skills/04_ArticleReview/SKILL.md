---
name: 04_ArticleReview
description: このプロンプトは生成AIが作成したSEO記事本文をレビューするためのものです。
---

- ワークスペース解決ルール:
  - $ARGUMENTS の先頭に `Workspace: C:\absolute\path` の形式でワークスペースが指定されていれば、それを `{Workspace}` として使います。
  - 指定がない場合は、実行時のカレントディレクトリ（スキルを呼び出したプロセスの作業ディレクトリ）を `{Workspace}` として扱います。

あなたは依頼されたとき、`{Workspace}\記事\記事本文`にある内容をよく理解し、次のことを実行してください:

1. 前提条件`{Workspace}\.specify\memory\記事レビュー-constitution.md`を読み込んでください。
2. `{Workspace}\記事\記事本文`をレビューしてください。
