import 'dart:convert';

import 'package:azkaar_flutter/app/Model/azkar_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

final getDataFuture =
    ChangeNotifierProvider<GetDataFromApi>((ref) => GetDataFromApi());

class GetDataFromApi extends ChangeNotifier {
  List<Content> listDataModel = [];

  GetDataFromApi() {
    getData();
  }

  Future getData() async {
    listDataModel = [];
    try {
      http.Response response = await http.get(Uri.parse(
          "https://ahegazy.github.io/muslimKit/json/azkar_sabah.json"));

      var data = jsonDecode(response.body);
      var rest = data["content"] as List;
      for (int i = 0; i < rest.length; i++) {
        listDataModel.add(Content.fromMap(rest[i]));
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }

    notifyListeners();
  }

  void onClick(int count) {
    if (count > 0) {
      count--;
    }
    notifyListeners();
  }
}
