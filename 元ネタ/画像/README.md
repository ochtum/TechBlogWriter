このフォルダには、記事から取得した画像を保存します。

手動ダウンロード手順（Windows）:

1. ブラウザで以下のURLを開く。
   - https://avatars.githubusercontent.com/u/6313838?v=4&s=200
   - https://github.blog/wp-content/uploads/2025/10/gitmerge1.png?w=300
2. 画像を右クリックして「名前を付けて画像を保存」を選択。
3. 保存先フォルダをこのリポジトリの `元ネタ\\画像` に指定して保存。

必要に応じてファイル名をわかりやすく変更してください（例: `kevincrosby-avatar.png`, `gitmerge1.png`）。

注: 自動でダウンロードするスクリプトを `scripts\download-images.ps1` として追加しました。簡単に画像を取得できます。

自動ダウンロードの使い方（PowerShell / pwsh.exe）:

1. リポジトリのルートで PowerShell を開く（`pwsh.exe` を推奨）。
2. 次のように実行します（URL は複数指定可）：

```powershell
pwsh.exe -File .\scripts\download-images.ps1 -Url "https://github.blog/open-source/accelerate-developer-productivity-with-these-9-open-source-ai-and-mcp-projects/"
```

3. 画像はデフォルトで `元ネタ\\画像` に保存されます。既存ファイルを上書きする場合は `-Force` を付けて実行してください。

