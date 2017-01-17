

if [ -e $HOME/.zsh_profile ] ; then
	source $HOME/.zsh_profile;
fi

# rid35305287 NB_岡
export HUBOT_CHATWORK_TOKEN="faa7b99e436a55c4cd29f29232d89120" # APIのアクセストークンを入力します。
export HUBOT_CHATWORK_ROOMS="35305287"   # カンマ区切りでルームIDを指定します。
export HUBOT_CHATWORK_API_RATE="350"   # 1時間あたりのAPIリクエスト数(間隔)を指定します。

