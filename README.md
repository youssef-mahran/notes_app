# Flutter Notes App

A modern and simple Notes application built with Flutter.  
The app allows users to create, edit, and delete notes with a clean user interface and efficient local storage.

---

## Features

- Add new notes
- Edit existing notes
- Delete notes
- Assign a color to each note
- Store data locally using Hive
- State management using BLoC (Cubit)
- Responsive and clean UI

---

## Tech Stack

- Flutter
- Dart
- flutter_bloc (BLoC)
- Hive (Local Database)

---

## Project Structure


lib/
│
├── cubits/
│ ├── notes_cubit/
│ └── add_note_cubit/
│
├── models/
│ └── note_model.dart
│
├── views/
│ ├── home_view.dart
│ └── edit_view_items.dart
│
├── components/
│ ├── reusable widgets
│ └── UI components
│
└── main.dart


---

## How It Works

- Notes are stored locally using Hive
- State is managed using Cubit (BLoC)
- UI updates automatically when notes are added, edited, or deleted
- BottomSheet is used to provide a smooth note creation experience

---

## Screenshots

Add screenshots of the application here (Home screen, Add note, Edit note)

---

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/your-username/flutter-notes-app-bloc-hive.git
