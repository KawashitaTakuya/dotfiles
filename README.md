# Ka1kai dotfiles

## vim Setting

### start Up
- .vimrcと.vimフォルダをroot直下に置くと幸せになれる

### molokai with Vim
https://github.com/tomasr/molokai

- .vimrcに入れているがエラーが出るときは手動で以下の対応する

```
mkdir ~/.vim
cd ~/.vim
mkdir colors
git clone https://github.com/tomasr/molokai
mv molokai/colors/molokai.vim ~/.vim/colors/
```


## VSCode Setting

１. 自分の環境に合わせてVSCodeをインストール
 - https://code.visualstudio.com/

２. EditorConfig VS Code SnippetをVSCodeに入れる
 - https://marketplace.visualstudio.com/items?itemName=zgudino.editorconfig-vscode-snippet

３. code settings sync をVSCodeに入れる
 - https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync

４. SyncUpdateでGithubに上げてる自分のセッティングを反映させる
 - tokenはtoken.txt（もしくはGithubのGistのコメントのところ）

### VSCode with Unity

１．拡張機能を入れる
- Legacy C# Support
 - https://marketplace.visualstudio.com/items?itemName=ms-vscode.omnisharp
- Debugger for Unity
 - https://marketplace.visualstudio.com/items?itemName=Unity.unity-debug
 
２．インテリセンスが聞かないので必要そうなもの入れる
- .Net Core
 - https://www.microsoft.com/net/core#macos
- mono Framwork
```
brew install mono
```

３．Unity側の設定
- VSCode Pluginを入れる
 - https://github.com/dotBunny/VSCode/
  - Unityの設定→External ToolsをVisualStudioCodeにする
  - VSCodeタブのEnable Integration, Use Unity Debuggerにチェックを入れる

## Font Setting

- Install
 - https://fonts.google.com/specimen/Inconsolata
