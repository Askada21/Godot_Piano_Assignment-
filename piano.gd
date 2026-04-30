extends Node2D

@onready var volume_slider = $UI/VolumeSlider
@onready var pitch_slider = $UI/PitchSlider
@onready var melody_timer = $MelodyTimer

var note_paths = {
	"C":  "res://sounds/C.wav",
	"D":  "res://sounds/D.wav",
	"E":  "res://sounds/E.wav",
	"F":  "res://sounds/F.wav",
	"G":  "res://sounds/G.wav",
	"A":  "res://sounds/A.wav",
	"B":  "res://sounds/B.wav",

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

var melody_pattern = ["C", "D", "E", "G", "A", "G", "E", "D"]
var melody_index = 0

func play_note(note):
	var p = AudioStreamPlayer.new()
	add_child(p)

	p.stream = load(note_paths[note])
	p.volume_db = linear_to_db(volume_slider.value)
	p.pitch_scale = pitch_slider.value

	p.play()
	p.finished.connect(p.queue_free)

	var visualizer = get_node_or_null("Visualizer")
	if visualizer:
		visualizer.pulse_note(note)

func _input(event):
	if event is InputEventKey and event.pressed and not event.echo:
		if key_map.has(event.keycode):
			play_note(key_map[event.keycode])

func play_next_melody_note():
	var note = melody_pattern[melody_index]
	play_note(note)

	melody_index += 1
	if melody_index >= melody_pattern.size():
		melody_index = 0

# UI button signals
func _on_melody_button_pressed() -> void:
	play_next_melody_note()

func _on_start_button_pressed() -> void:
	melody_timer.start()

func _on_stop_button_pressed() -> void:
	melody_timer.stop()

func _on_melody_timer_timeout() -> void:
	play_next_melody_note()

# Piano key button signals
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
