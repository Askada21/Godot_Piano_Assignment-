extends Node2D

var note_paths = {
	# white keys
	"C":  "res://sounds/C.wav",
	"D":  "res://sounds/D.wav",
	"E":  "res://sounds/E.wav",
	"F":  "res://sounds/F.wav",
	"G":  "res://sounds/G.wav",
	"A":  "res://sounds/A.wav",
	"B":  "res://sounds/B.wav",

	# black keys
	"Cs": "res://sounds/Cs.wav",
	"Ds": "res://sounds/Ds.wav",
	"Fs": "res://sounds/Fs.wav",
	"Gs": "res://sounds/Gs.wav",
	"As": "res://sounds/As.wav"
}

var key_map = {
	KEY_A: "C",
	KEY_W: "Cs",
	KEY_S: "D",
	KEY_E: "Ds",
	KEY_D: "E",
	KEY_F: "F",
	KEY_T: "Fs",
	KEY_G: "G",
	KEY_Y: "Gs",
	KEY_H: "A",
	KEY_U: "As",
	KEY_J: "B"
}

func play_note(note):
	var p = AudioStreamPlayer.new()
	add_child(p)
	p.stream = load(note_paths[note])
	p.play()
	p.finished.connect(p.queue_free)

	var visualizer = get_node_or_null("Visualizer")
	if visualizer:
		visualizer.pulse_note(note)
		
# handle keyboard from PC/mobile
func _input(event):
	if event is InputEventKey and event.pressed and not event.echo:
		if key_map.has(event.keycode):
			play_note(key_map[event.keycode])

# handle touch/click
func _on_c_pressed() -> void:
	play_note("C")

func _on_d_pressed() -> void:
	play_note("D")

func _on_e_pressed() -> void:
	play_note("E")

func _on_f_pressed() -> void:
	play_note("F")

func _on_g_pressed() -> void:
	play_note("G")

func _on_a_pressed() -> void:
	play_note("A")

func _on_b_pressed() -> void:
	play_note("B")

func _on_cs_pressed() -> void:
	play_note("Cs")

func _on_ds_pressed() -> void:
	play_note("Ds")

func _on_fs_pressed() -> void:
	play_note("Fs")

func _on_gs_pressed() -> void:
	play_note("Gs")

func _on_as_pressed() -> void:
	play_note("As")
