abstract final class AppConstants {
  // Store info
  static const String storeName = 'Desi Mart';
  static const String storeTagline =
      'Your one stop shop for Indian foods and fresh vegetables';
  static const String storeAddress =
      '11 Town Centre, Hatfield, Hertfordshire, AL10 0NY';
  static const String storePhone = '01707 257328';
  static const String storeEmail = 'sales@desi-mart.co.uk';
  static const String storeWebsite = 'https://www.desi-mart.co.uk';
  static const double storeLat = 51.7636;
  static const double storeLng = -0.2283;
  static const String storeLogoUrl =
      'https://www.desi-mart.co.uk/ws/media-library/913205c8f5fb413a9f7bbf180006b476/desi-mart-logo.jpg';

  // Opening hours: {day: [openHour, openMin, closeHour, closeMin]}
  static const Map<int, List<int>> storeHours = {
    DateTime.monday: [9, 0, 19, 0],
    DateTime.tuesday: [9, 0, 19, 0],
    DateTime.wednesday: [9, 0, 19, 0],
    DateTime.thursday: [9, 0, 19, 0],
    DateTime.friday: [9, 0, 19, 0],
    DateTime.saturday: [9, 0, 19, 0],
    DateTime.sunday: [10, 0, 16, 0],
  };

  static const Map<int, String> dayNames = {
    DateTime.monday: 'Monday',
    DateTime.tuesday: 'Tuesday',
    DateTime.wednesday: 'Wednesday',
    DateTime.thursday: 'Thursday',
    DateTime.friday: 'Friday',
    DateTime.saturday: 'Saturday',
    DateTime.sunday: 'Sunday',
  };

  static const Map<int, String> storeHoursDisplay = {
    DateTime.monday: '9:00 AM – 7:00 PM',
    DateTime.tuesday: '9:00 AM – 7:00 PM',
    DateTime.wednesday: '9:00 AM – 7:00 PM',
    DateTime.thursday: '9:00 AM – 7:00 PM',
    DateTime.friday: '9:00 AM – 7:00 PM',
    DateTime.saturday: '9:00 AM – 7:00 PM',
    DateTime.sunday: '10:00 AM – 4:00 PM',
  };

  // Product categories
  static const List<Map<String, String>> categories = [
    {'emoji': '🌶️', 'name': 'Spices', 'count': '50+'},
    {'emoji': '🍚', 'name': 'Rice & Atta', 'count': '30+'},
    {'emoji': '🫘', 'name': 'Lentils', 'count': '25+'},
    {'emoji': '🍿', 'name': 'Snacks', 'count': '80+'},
    {'emoji': '🧊', 'name': 'Frozen', 'count': '40+'},
    {'emoji': '🥬', 'name': 'Fresh Veg', 'count': 'Daily'},
    {'emoji': '🫙', 'name': 'Pickles', 'count': '20+'},
    {'emoji': '🍰', 'name': 'Sweets', 'count': '15+'},
  ];

  // Brands stocked
  static const List<String> brands = [
    "Haldiram's",
    'Ramdev',
    'Jaimin',
    'Shankar',
    'Top-Up',
    'Telugu Foods',
    'Tayyabah',
    'Euro',
    'Rasoi Magic',
    'Jabsons',
    'Jalpur',
    'Everest',
    'Garvi Gujarat',
    'Gits',
    'Jalsa',
    'Kurkure',
    'Pillsbury',
    'MTR',
    'Real Bites',
    'Saras',
    'Shana',
    'Shayona',
    'Shazan',
    'Tilda',
  ];

  // Offers
  static const List<Map<String, String>> offers = [
    {
      'title': 'Karachi Bakery Biscuits',
      'deal': '',
      'tag': 'NEW',
      'imageUrl':
          'https://www.desi-mart.co.uk/ws/media-library/b7c9d688074a4e77b501fe6b54556820/karachi-bisc-offer.jpg',
    },
    {
      'title': 'Parle-G Biscuits',
      'deal': '',
      'tag': 'POPULAR',
      'imageUrl':
          'https://www.desi-mart.co.uk/ws/media-library/37a97ba3e9094e189fc3d4c341eecaa3/parle-g.jpg',
    },
    {
      'title': 'Maggi Noodles',
      'deal': '4 for £1',
      'tag': 'HOT',
      'imageUrl':
          'https://www.desi-mart.co.uk/ws/media-library/f65e4c21b82c4040b235527dfb6aa156/maggi-4-for-ps1.jpg',
    },
    {
      'title': 'Jabsons',
      'deal': '',
      'tag': 'VALUE',
      'imageUrl':
          'https://www.desi-mart.co.uk/ws/media-library/4bd997e93f164edf88595b7442463ccb/jabsons.jpg',
    },
    {
      'title': 'Jalsa',
      'deal': '',
      'tag': 'DEAL',
      'imageUrl':
          'https://www.desi-mart.co.uk/ws/media-library/6cca187d5b0f4b16b931ef4fd54e3fbc/jalsa.jpg',
    },
  ];

  // Auth
  static const int minPasswordLength = 8;
}
