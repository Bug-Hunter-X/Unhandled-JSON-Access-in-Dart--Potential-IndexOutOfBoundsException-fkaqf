```dart
Future<void> fetchData() async {
  try {
    final response = await http.get(Uri.parse('https://api.example.com/data'));
    if (response.statusCode == 200) {
      final List<dynamic>? data = jsonDecode(response.body);
      if (data != null && data.isNotEmpty) {
        for (var item in data) {
          if(item is Map && item.containsKey('name')){
            final String name = item['name'];
            print('Name: $name');
          } else {
            print('Invalid data format');
          }
        }
      } else {
        print('No data received');
      }
    } else {
      throw Exception('Failed to load data. Status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
```