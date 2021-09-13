import 'package:gsheets/gsheets.dart';

import 'creds.dart';

/// creds.dart is a confidential file
/// for the safety of our users and me (lol) this file is
///confidential so no one can access/alter our database

class SheetsBackend {
  static final _gSheets = GSheets(credentials);
  static Worksheet? emailList;

  static Future init() async {
    final spreadsheet = await _gSheets.spreadsheet(spreadSheetId);
    emailList = await getWorksheet(spreadsheet, title: "Email List");
    return true;
  }

  static Future<Worksheet> getWorksheet(
    Spreadsheet spreadsheet, {
    required String title,
  }) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (emailList == null) return;
    try {
      emailList!.values.map.appendRows(rowList);
    } catch (e) {
      print(e);
    }
  }
}
