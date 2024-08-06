enum CustomActionButtonType { download, note }

extension CustomActionButtonExtension on CustomActionButtonType {
  String get tooltip {
    switch (this) {
      case CustomActionButtonType.note:
        return 'Make note';
      case CustomActionButtonType.download:
        return 'Download as PDF';
    }
  }
}

enum ReadingMode { surah, para }

extension ReadingModeExtension on ReadingMode {
  String get type {
    switch (this) {
      case ReadingMode.surah:
        return 'Surah';
      case ReadingMode.para:
        return 'Para';
    }
  }
}
