tool
extends TextureRect


export (float) var percent_full = 0.0 setget set_percent_full#0 - 1.0

export (Texture) var empty
export (Texture) var ten_percent
export (Texture) var twenty_percent
export (Texture) var thirty_percent
export (Texture) var fourty_percent
export (Texture) var fifty_percent
export (Texture) var sixty_percent
export (Texture) var seventy_percent
export (Texture) var eighty_percent
export (Texture) var ninety_percent
export (Texture) var full

func set_percent_full(percent):
	percent_full = percent
	refresh_fill_texture()

func _ready():
	refresh_fill_texture()

func refresh_fill_texture():
	texture = get_fill_texture()

func get_fill_texture():
	if percent_full <= 0.0 or percent_full <= 0.05:
		return empty
	if percent_full > 0.05 and percent_full <= 0.15:
		return ten_percent
	if percent_full > 0.15 and percent_full <= 0.25:
		return twenty_percent
	if percent_full > 0.25 and percent_full <= 0.35:
		return thirty_percent
	if percent_full > 0.35 and percent_full <= 0.45:
		return fourty_percent
	if percent_full > 0.45 and percent_full <= 0.55:
		return fifty_percent
	if percent_full > 0.55 and percent_full <= 0.65:
		return sixty_percent
	if percent_full > 0.65 and percent_full <= 0.75:
		return seventy_percent
	if percent_full > 0.75 and percent_full <= 0.85:
		return eighty_percent
	if percent_full > 0.85 and percent_full <= 0.95:
		return ninety_percent
	if percent_full > 0.95:
		return full
	
