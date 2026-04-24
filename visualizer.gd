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

const BAR_WIDTH := 24.0
const BAR_GAP := 6.0
const MIN_HEIGHT := 20.0
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
			bar.position = Vector2(LEFT_MARGIN + i * (BAR_WIDTH + BAR_GAP), TOP_MARGIN)
			bar.size = Vector2(BAR_WIDTH, MIN_HEIGHT)

func pulse_note(note: String):
	if note_to_bar.has(note):
		var i = note_to_bar[note]
		energies[i] = 1.0

		if i - 1 >= 0:
			energies[i - 1] = max(energies[i - 1], 0.45)
		if i + 1 < energies.size():
			energies[i + 1] = max(energies[i + 1], 0.45)

func _process(delta):
	for i in range(energies.size()):
		energies[i] = move_toward(energies[i], 0.0, delta * 3.0)

		var h = MIN_HEIGHT + energies[i] * (MAX_HEIGHT - MIN_HEIGHT)
		var bar = bars[i]

		if bar is Control:
			bar.position = Vector2(LEFT_MARGIN + i * (BAR_WIDTH + BAR_GAP), TOP_MARGIN)
			bar.size = Vector2(BAR_WIDTH, h)
