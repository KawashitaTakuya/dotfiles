# Ka1kai dotfiles

## vim Setting

- .vimrcと.vimフォルダをroot直下に置くと幸せになれる

### molokai with vim
https://github.com/tomasr/molokai

- vimrcに入れているがエラーが出るときは以下を手動で対応する
```
mkdir ~/.vim
cd ~/.vim
mkdir colors
git clone https://github.com/tomasr/molokai
mv molokai/colors/molokai.vim ~/.vim/colors/
```

### Editor Config with vim
https://github.com/editorconfig/editorconfig-vim


## VSCode Setting

１．自分の環境に合わせてVSCodeをインストール <br>
 https://code.visualstudio.com/

２．EditorConfig VS Code SnippetをVSCodeに入れる <br>
 https://marketplace.visualstudio.com/items?itemName=zgudino.editorconfig-vscode-snippet

３．code settings sync をVSCodeに入れる <br>
 https://marketplace.visualstudio.com/items?itemName=Shan.code-settings-sync

４．SyncUpdateでGithubに上げてる自分のセッティングを反映させる
- tokenはtoken.txt（もしくはGithubのGistのコメントのところ）

### VSCode with Unity

１．拡張機能を入れる
- Legacy C# Support <br>
 https://marketplace.visualstudio.com/items?itemName=ms-vscode.omnisharp

- Debugger for Unity <br>
 https://marketplace.visualstudio.com/items?itemName=Unity.unity-debug
 
２．インテリセンスが聞きかないので必要そうなもの入れる
- .Net Core <br>
 https://www.microsoft.com/net/core#macos
 
- mono Framwork
```
brew install mono
```

３．Unity側の設定
- VSCode Pluginを入れる <br>
 https://github.com/dotBunny/VSCode/
  - Unityの設定→External ToolsをVisualStudioCodeにする
  - VSCodeタブのEnable Integration, Use Unity Debuggerにチェックを入れる

## Font Setting

- Install Inconsolate <br>
 https://fonts.google.com/specimen/Inconsolata

