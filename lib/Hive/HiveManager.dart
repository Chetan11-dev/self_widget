import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveManager {
  Box _currentlyOpendBox;

  Future instantiate([String toBeOpendBox]) async {
    final appDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(
      appDocumentDir.path,
    );
    if (toBeOpendBox != null) {
      await openNewBox(toBeOpendBox);
    }
  }

  Future openNewBox(String toBeOpendBox) async {
    if (_currentlyOpendBox != null) {
      _currentlyOpendBox.close();
    } //MEANS YOU ARE OPENING SECOND BOX SO CLOSE FIRST ONE

    _currentlyOpendBox = await Hive.openBox(toBeOpendBox);
  }

  dynamic getValue(dynamic key, {dynamic defaultvalue}) {
    print(_currentlyOpendBox);
    return _currentlyOpendBox.get(key, defaultValue: defaultvalue);
  }

  Future put(dynamic key, dynamic value) => _currentlyOpendBox.put(key, value);

  Future putAll(Map entries) => _currentlyOpendBox.putAll(entries);

  Future<void> close() => Hive.close();
}
