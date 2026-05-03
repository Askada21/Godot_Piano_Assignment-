# Interactive Piano Visualizer

# Description
This project is an interactive digital piano built using Godot.
Users can play musical notes using the keyboard or mouse, while a colorful visualizer reacts in real time.
The project combines audio playback, user input, UI controls, and visual feedback to simulate a simple musical instrument.

# Features
- Piano:
  Play notes using mouse
  Click on-screen piano keys
  
- Sound:
  Each key plays a different audio sample

- Audio Controls:
  Volume slider (controls loudness)
  Pitch slider (changes frequency of sound)

- Music Visualizer:
  12 colored bars react to notes
  Bars grow and shrink smoothly
  Each note activates a specific bar

- Melody Generator:
  Plays notes sequentially
  Uses a list of notes (melody_pattern)

- Automatic Playback:
  Timer plays melody repeatedly
  Start/Stop controls

# Controls
Use the keyboard or mouse to play notes.
A  → C

W  → C#

S  → D

E  → D#

D  → E

F  → F

T  → F#

G  → G

Y  → G#

H  → A

U  → A#

J  → B

# UI 
- Volume Slider: controls volume
- Pitch Slider: changes pitch
- Play Melody Note: plays next note
- Start Melody: starts automatic playback
- Stop Melody: stops playback

# How to Run
1. Open project in Godot
2. Run main scene
3. Play piano (Use the keyboard or mouse. Try the buttons to play one note or
   the button "Start Melody" and "Stop Melody".)

# Concepts Used
- Dictionaries (note mapping)
- Arrays (melody patterns, bar data)
- Signals (buttons, timer)
- Real-time updates (_process)
- Audio manipulation (volume & pitch)
- UI systems (sliders, buttons)
- Node-based scene structure

# Summary
This project demonstrates how to build an interactive music application using Godot, combining sound, UI, and visuals into a single system.

# Future Improvements
- Recording
- Upload pictures of the playback system
  
# Demo Video
https://youtu.be/E1ZOBZkwkXY
