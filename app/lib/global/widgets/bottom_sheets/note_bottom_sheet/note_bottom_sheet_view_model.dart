import 'package:flutter/material.dart';
import 'package:quran_companion/global/setup/local_storage_setup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NoteBottomSheetViewModel extends BaseViewModel {
  NoteBottomSheetViewModel({
    required this.ayatNumber,
    required this.completer,
  });

  final int ayatNumber;
  final void Function(SheetResponse<void>) completer;
  final SharedPreferences _preferences = LocalStorage.preferences!;
  final TextEditingController _controller = TextEditingController();

  TextEditingController get controller => _controller;

  late String _text;

  bool _isTextDifferent = false;
  bool get isTextDifferent => _isTextDifferent;
  void _setIsTextDifferent(bool val) {
    _isTextDifferent = val;
    rebuildUi();
  }

  bool _isSavingNote = false;
  bool get isSavingNote => _isSavingNote;
  void _setIsSavingNote(bool val) {
    _isSavingNote = val;
    rebuildUi();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  void init() {
    _text = _fetchNoteText(ayatNumber);
    _controller.text = _text;
  }

  String _fetchNoteText(int ayatNumber) {
    return _preferences.getString('QC-$ayatNumber') ?? '';
  }

  void onTextChange(String val) {
    if (val.trim() != _text) {
      _setIsTextDifferent(true);
    } else {
      _setIsTextDifferent(false);
    }
  }

  Future<void> onSavePressed() async {
    _setIsSavingNote(true);
    bool confirmed = await _saveNote();
    completer(SheetResponse(confirmed: confirmed));
  }

  Future<bool> _saveNote() async {
    return _preferences.setString('QC-$ayatNumber', _controller.text);
  }
}
