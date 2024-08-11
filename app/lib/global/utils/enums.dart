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
