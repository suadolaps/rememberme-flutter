class ProfileRepository {
  String _data;

  Future<void> fetchData() async {
    // simulate real data fetching
    await Future.delayed(Duration(milliseconds: 600));
    // store dummy data
    _data = 'Sumayya Abdullahi';
  }

  String get data => _data;
}