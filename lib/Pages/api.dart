import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

Future<void> cricketMatches() async {
  const String url = 'https://cricket-live-data.p.rapidapi.com/fixtures';
  Map<String, String> headers = {
    'X-RapidAPI-Key': 'f4120967dcmsh79914ebbc314f67p177772jsnc978e7c0cdfc',
    'X-RapidAPI-Host': 'cricbuzz-cricket.p.rapidapi.com'
  };

  try {
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      json.decode(response.body);
    } else {
      log('Request failed with status: ${response.statusCode}');
    }
  } catch (error) {
    log('Error: $error');
  }
}
