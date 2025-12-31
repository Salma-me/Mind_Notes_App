# 📝 MindNotesApp

[![Flutter](https://img.shields.io/badge/flutter-3.9-blue?logo=flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/dart-3.9-blue?logo=dart&logoColor=white)](https://dart.dev/)
[![License](https://img.shields.io/badge/license-MIT-green)](LICENSE)

<table>
<tr>
<td width="150">
  <img src="media/logo/logo.png" width="120" style="border-radius: 8px;">
</td>
<td>
  <p>
    <strong>MindNotesApp</strong> is a Flutter notes-taking application that allows users to quickly create, edit, delete, search, pin, and organize notes with a smooth & intuitive experience.<br>
    The app features a clean UI, offline storage using Hive, and state management using Bloc.
  </p>
</td>
</tr>
</table>

## Table of Contents
- [Features](#features)
- [Demo](#demo)
- [Tech Stack](#tech-stack)
- [Installation](#installation)
- [Future Updates](#future-updates)
- [Acknowledgements](#acknowledgements)
- [License](#license)


## Features

✔ Create and save notes  
✔ Edit existing notes  
✔ Delete notes with swipe (Dismissible)  
✔ Undo deletion to restore notes  
✔ Pin & unpin important notes  
✔ Search notes by title or content  
✔ Search results prioritize pinned notes  
✔ Smooth & responsive UI  
✔ Offline storage using Hive   


## Demo

### 🟡 Home Screen

<div align="center">
  <img src="media/screenshots/home_no_notes.png" width="200" style="border-radius: 5%;" />  <img src="media/screenshots/home_notes.png" width="200" style="border-radius: 5%;" /> <img src="media\demo_videos\home_view.gif" width="200" style="border-radius: 5%;" />
</div>

### 💡 Create & Edit Notes

<div align="center">
  
  | Create a Note | Edit a Note | Pin Notes |
  |---------------|-----------|-----------|
  |<img src="media\demo_videos\add_a_note1.gif" width="200" style="border-radius: 5%;" /> | <img src="media\demo_videos\edit_note.gif" width="200" style="border-radius: 5%;" />| <img src="media\demo_videos\pin_note.gif" width="200" style="border-radius: 5%;" />|
</div>

### 🔍 Search Feature

<div align="center">
  <img src="media\demo_videos\search.gif" width="200" style="border-radius: 5%;" />
</div>

### 🗑 Swipe to Delete + Undo

<div align="center">
  <img src="media\demo_videos\delete_note.gif" width="200" style="border-radius: 5%;" />
</div>


## Tech Stack

- **Flutter & Dart** – UI & app logic  
- **Bloc / flutter_bloc** – State management
- **Hive & hive_flutter** – Local offline storage
- **Dismissible** – Swipe to delete
- **intl** – Date formatting
- **Custom Fonts & Icons** – Poppins + Cupertino Icons
- **Launcher Icons** – flutter_launcher_icons


## Installation


```bash
git clone https://github.com/YOUR_USERNAME/MindNotes.git
cd MindNotesApp
flutter pub get
flutter run
```

## Future Updates

- Categorize notes with tags  
- Note color customization  
- Dark / Light theme  
- Reminders & notifications  
- Cloud sync  
- Multi-language support  


## Acknowledgements

- [Eng.Tharwat Samy](https://github.com/tharwatsamy) – for their excellent course on Flutter development that guided me through building MindNotesApp 
- Flutter community & Bloc documentation
- Hive documentation
- UI inspiration from modern note-taking apps

## License

This project is licensed under the MIT License - view the [LICENSE](LICENSE) file for details.
