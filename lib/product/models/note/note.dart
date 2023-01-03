// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Note {
  String? id;
  String? authorId;
  String? noteTitle;
  String? noteContent;
  DateTime? creationDate;
  DateTime? reminderDate;
  DateTime? updateDate;
  bool? isActive;
  Note({
    this.id,
    this.authorId,
    this.noteTitle,
    this.noteContent,
    this.creationDate,
    this.reminderDate,
    this.updateDate,
    this.isActive,
  });

  Note copyWith({
    String? id,
    String? authorId,
    String? noteTitle,
    String? noteContent,
    DateTime? creationDate,
    DateTime? reminderDate,
    DateTime? updateDate,
    bool? isActive,
  }) {
    return Note(
      id: id ?? this.id,
      authorId: authorId ?? this.authorId,
      noteTitle: noteTitle ?? this.noteTitle,
      noteContent: noteContent ?? this.noteContent,
      creationDate: creationDate ?? this.creationDate,
      reminderDate: reminderDate ?? this.reminderDate,
      updateDate: updateDate ?? this.updateDate,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'authorId': authorId,
      'noteTitle': noteTitle,
      'noteContent': noteContent,
      'creationDate': creationDate?.millisecondsSinceEpoch,
      'reminderDate': reminderDate?.millisecondsSinceEpoch,
      'updateDate': updateDate?.millisecondsSinceEpoch,
      'isActive': isActive,
    };
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'] != null ? map['id'] as String : null,
      authorId: map['authorId'] != null ? map['authorId'] as String : null,
      noteTitle: map['noteTitle'] != null ? map['noteTitle'] as String : null,
      noteContent:
          map['noteContent'] != null ? map['noteContent'] as String : null,
      creationDate: map['creationDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['creationDate'] as int)
          : null,
      reminderDate: map['reminderDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['reminderDate'] as int)
          : null,
      updateDate: map['updateDate'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['updateDate'] as int)
          : null,
      isActive: map['isActive'] != null ? map['isActive'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) =>
      Note.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Note(id: $id, authorId: $authorId, noteTitle: $noteTitle, noteContent: $noteContent, creationDate: $creationDate, reminderDate: $reminderDate, updateDate: $updateDate, isActive: $isActive)';
  }

  @override
  bool operator ==(covariant Note other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.authorId == authorId &&
        other.noteTitle == noteTitle &&
        other.noteContent == noteContent &&
        other.creationDate == creationDate &&
        other.reminderDate == reminderDate &&
        other.updateDate == updateDate &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        authorId.hashCode ^
        noteTitle.hashCode ^
        noteContent.hashCode ^
        creationDate.hashCode ^
        reminderDate.hashCode ^
        updateDate.hashCode ^
        isActive.hashCode;
  }
}
