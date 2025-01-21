```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>?> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200 && response.headers['content-type']?.contains('application/json') == true) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception('Failed to load data: Status code ${response.statusCode}, Content-Type: ${response.headers['content-type']}');
    }
  } catch (e) {
    print('Error fetching data: $e');
    // Consider more sophisticated logging here (e.g., using a logging library)
    return null; // or throw the exception, depending on your needs
  }
}
```