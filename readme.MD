## How to use
1. The source `TSV` file should be named `localization.tsv`.
2. The source file should be in the same directory as `localization.dart`.
3. Open the terminal & navigate to the directory containing `localization.dart`.
4. Run the command `dart run localization.dart`
5. The output files should be inside the `lang` directory.

## Requirements
### Using Google Sheets or Microsoft Excel
1. Ensure that the data follows the table format

    | slug    | en    | jp | sp   |
    | ------- |:-----:|:--:|:----:|
    | one     | one   | 一 | uno  |
    | two     | two   | 二 | dos  |
    | three   | three | 三 | tres |

2. Import the file as tab-separated values with the name `localization.tsv` file.

### Using `TSV` (Tab-separated values) file directly
1. Ensure that the file is named `localization.tsv` file follows the following format:
    - first row is the slug label followed by the languages
    - the next rows are the localization keys followed by the translations with respect to the languages
```
slug    en  jp  sp
one    one  一  uno
two    two  二  dos
three    three  三  tres
```


## Notes
- Old files will be replaced after running the command.
- The output files will be in `json` format.
- JSON files are not "pretty-formatted".

## Noteworthy alternatives
- Flutter Translation Sheet - https://pub.dev/packages/flutter_translation_sheet