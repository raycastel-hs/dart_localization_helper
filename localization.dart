import 'dart:io';
// for step 3:
import 'dart:async';
import 'dart:convert';

const String directory = 'lang';

main() async {
  try {
    // Load File
    File file = new File("localization.tsv");
    List<String> fileAsListString = await file.readAsLines();
    List<LocalizedFileObject> localizedObjectList = [];

    List<String> languages = fileAsListString[0].splitStringByTab;

    // Read each row of the file starting from index of 1
    for (int row = 1; row < fileAsListString.length; row++) {
      String slugLocalizations = fileAsListString[row];
      List<String> slugLocalizationsList = slugLocalizations.splitStringByTab;
      String slug = slugLocalizationsList[0];
      for (int localizedTerm = 1;
          localizedTerm < slugLocalizationsList.length;
          localizedTerm++) {
        localizedObjectList.addContent(
          fileName: languages[localizedTerm].toLowerCase(),
          slug: slug,
          localization: slugLocalizationsList[localizedTerm],
        );
      }
    }

    for (var fileObject in localizedObjectList) {
      await fileObject.writeFile();
    }

    // End the app successfully
    print('Localization successful.\nFiles stored in "$directory" folder.');
    return;
  } catch (e) {
    print('Error occured:\n');
    print(e.toString());
    print('\n\nLocalization unsuccessful.');
    print('Exited.');
    // End the app unsuccessfully
    return;
  }
}

extension on String {
  List<String> get splitStringByTab => this.split('\t');
}

// Object used to store file name and content for JSON
class LocalizedFileObject {
  LocalizedFileObject({
    required this.fileName,
    required this.content,
  });
  final String fileName;
  Map<String, String> content;

  Future writeFile() async {
    // await File('lang').create(recursive: true);
    String newFileName = "$directory\\$fileName.json";
    try {
      File file = await File(newFileName).create(recursive: true);
      await file.writeAsString(jsonEncode(content));
      return;
    } catch (e) {}
  }
}

extension on List<LocalizedFileObject> {
  int? getIndex(String fileName) {
    for (int x = 0; x < this.length; x++) {
      if (this[x].fileName == fileName.toLowerCase()) {
        return x;
      }
    }
    return null;
  }

  addContent({
    required String fileName,
    required String slug,
    required String localization,
  }) {
    int? index = this.getIndex(fileName);
    if (index == null) {
      this.add(LocalizedFileObject(
        fileName: fileName,
        content: {slug: localization},
      ));
    } else {
      this[index].content[slug] = localization;
    }
  }
}
