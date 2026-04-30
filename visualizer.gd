extends Control

@onready var bars = $Bars.get_children()

var energies: Array[float] = []

var note_to_bar = {
	"C": 0,
	"Cs": 1,
	"D": 2,
	"Ds": 3,
	"E": 4,
	"F": 5,
	"Fs": 6,
	"G": 7,
	"Gs": 8,
	"A": 9,
	"As": 10,
	"B": 11
}

var bar_to_note = [
	"C", "Cs", "D", "Ds", "E", "F",
	"Fs", "G", "Gs", "A", "As", "B"
]

var note_x = {
	"C": 0,
	"Cs": 25,
	"D": 50,
	"Ds": 75,
	"E": 100,
	"F": 130,
	"Fs": 155,
	"G": 180,
	"Gs": 205,
	"A": 230,
	"As": 255,
	"B": 280
}

var bar_colors = [
	Color("ff4d4dff"),
	Color("ff804dff"),
	Color("ffcc4dff"),
	Color("ccff4dff"),
	Color("66ff66ff"),
	Color("4dffccff"),
	Color("4dccffff"),
	Color("4d80ffff"),
	Color("9966ffff"),
	Color("cc4dffff"),
	Color("ff4dccff"),
	Color("ff6699ff")
]

const BAR_WIDTH := 12.0
const MIN_HEIGHT := 8.0
const MAX_HEIGHT := 140.0
const TOP_MARGIN := 90.0
const LEFT_MARGIN := 20.0

func _ready():
	energies.resize(bars.size())

	for i in range(bars.size()):
		energies[i] = 0.0

		var bar = bars[i]

		if bar is ColorRect:
			bar.color = bar_colors[i % bar_colors.size()]

		if bar is Control:
			bar.size = Vector2(BAR_WIDTH, MIN_HEIGHT)

func pulse_note(note: String):
	if note_to_bar.has(note):
		var i = note_to_bar[note]
		energies[i] = 1.0

func _process(delta):
	for i in range(energies.size()):
		energies[i] = move_toward(energies[i], 0.0, delta * 3.0)

		var note = bar_to_note[i]
		var h = MIN_HEIGHT + energies[i] * (MAX_HEIGHT - MIN_HEIGHT)

		var x = LEFT_MARGIN + note_x[note]
		var y = TOP_MARGIN

		var bar = bars[i]

		if bar is Control:
			bar.position = Vector2(x, y)
			bar.size = Vector2(BAR_WIDTH, h)
