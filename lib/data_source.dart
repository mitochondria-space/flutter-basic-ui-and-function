class DataSource {
  static List<Map<String, dynamic>> allData = [
    {
      "id": 1,
      "name": "FC Copenhagen",
      "founded": 1992,
      "imagePath": "https://via.placeholder.com/150"
    },
    {
      "id": 2,
      "name": "FC Barcelona",
      "founded": 1899,
      "imagePath": "https://via.placeholder.com/150"
    }
  ];

  Map<String, dynamic>? getDetailTeam(int id) {
    switch (id) {
      case 1:
        return {
          "id": 1,
          "name": "FC Copenhagen",
          "founded": 1992,
          "country": "Denmark",
          "venue": "Parken"
        };
      case 2:
        return {
          "id": 2,
          "name": "FC Barcelona",
          "founded": 1899,
          "country": "Spain",
          "venue": "Camp Nou"
        };
      default:
        return null;
    }
  }
}
