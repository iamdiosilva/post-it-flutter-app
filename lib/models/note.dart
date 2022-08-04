import 'package:sqlflite_crud_notes/models/notes_fields.dart';

class Note {
  final int? id;
  final bool isImportant;
  final int number;
  final String title;
  final String description;
  final DateTime createdTime;

  const Note({
    this.id,
    required this.isImportant,
    required this.number,
    required this.title,
    required this.description,
    required this.createdTime,
  });

  Map<String, Object?> toJson() => {
        NotesFields.id: id,
        NotesFields.title: title,
        NotesFields.isImportant: isImportant ? 1 : 0,
        NotesFields.number: number,
        NotesFields.description: description,
        NotesFields.time: createdTime.toIso8601String(),
      };

  static Note fromJson(Map<String, Object?> json) => Note(
        id: json[NotesFields.id] as int?,
        isImportant: json[NotesFields.isImportant] == 1,
        number: json[NotesFields.number] as int,
        title: json[NotesFields.title] as String,
        description: json[NotesFields.description] as String,
        createdTime: DateTime.parse(json[NotesFields.time] as String),
      );

  Note copyWith({
    int? id,
    bool? isImportant,
    int? number,
    String? title,
    String? description,
    DateTime? createdTime,
  }) =>
      Note(
        id: id ?? this.id,
        isImportant: isImportant ?? this.isImportant,
        number: number ?? this.number,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
      );
}
