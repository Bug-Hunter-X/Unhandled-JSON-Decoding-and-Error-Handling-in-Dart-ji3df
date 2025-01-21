```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      // Incorrectly assuming JSON response, leading to potential errors
      final jsonData = jsonDecode(response.body) as Map<String, dynamic>; 
      // ... process jsonData ...
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
    // Missing proper error handling and reporting
  }
}
```