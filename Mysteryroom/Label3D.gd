extends Label3D

var instance = null

func _ready():
	instance = self

	change_text("なんとしても、脱出しなくちゃ。\nてがかりを探そう。")

func change_text(new_text: String):
	# テキストを変更します
	if instance != null:
		instance.text = new_text
