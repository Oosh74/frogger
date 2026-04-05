extends StaticBody2D


const TREE_2 = preload("uid://y3ndpd5bhsi3")
const TREE_1 = preload("uid://d0so81ys3820n")

const TREES = [TREE_1, TREE_2]


func _ready():
	$TreeSprite.texture = TREES.pick_random()
