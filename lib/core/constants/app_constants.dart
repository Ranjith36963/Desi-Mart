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
  static const String storeFacebookUrl =
      'https://www.facebook.com/TheDesiMart/';

  // Food hygiene
  static const int foodHygieneRating = 5;

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

  // Brands stocked (matching prototype)
  static const List<String> brands = [
    "Haldiram's",
    'MTR',
    'Tata',
    'Everest',
    'MDH',
    'Shana',
    'TRS',
    'Pataks',
    'Tilda',
    'Gits',
    'Jabsons',
    'Kurkure',
    'Parle',
    'Maggi',
  ];

  // Offers — matching prototype exactly
  static const List<Map<String, String>> offers = [
    {
      'title': 'Maggi Noodles',
      'deal': '4 for £1',
      'tag': 'HOT',
      'color': '0xFFE53E3E',
    },
    {
      'title': 'Parle-G Biscuits',
      'deal': 'Buy 2 Get 1 Free',
      'tag': 'POPULAR',
      'color': '0xFFDD6B20',
    },
    {
      'title': 'Karachi Bakery Biscuits',
      'deal': '20% Off',
      'tag': 'NEW',
      'color': '0xFF2D7A3A',
    },
    {
      'title': 'Jabsons Peanuts',
      'deal': '£1.49 each',
      'tag': 'VALUE',
      'color': '0xFF3182CE',
    },
    {
      'title': 'Jalsa Snacks',
      'deal': '3 for £2.50',
      'tag': 'DEAL',
      'color': '0xFF805AD5',
    },
    {
      'title': "Haldiram's Namkeen",
      'deal': '15% Off All Packs',
      'tag': 'SALE',
      'color': '0xFFE53E3E',
    },
  ];

  // Loyalty
  static const int totalStamps = 10;
  static const double stampThreshold = 5.0; // £5 per stamp
  static const String memberId = 'DM-2024-0847';

  // Quick actions
  static const List<Map<String, String>> quickActions = [
    {'emoji': '📞', 'label': 'Call Store', 'sub': '01707 257328'},
    {'emoji': '📍', 'label': 'Directions', 'sub': 'Hatfield Town Centre'},
    {'emoji': '📧', 'label': 'Email Us', 'sub': 'Quick enquiry'},
    {'emoji': '🕐', 'label': 'Store Hours', 'sub': 'Mon-Sat 9-7'},
  ];

  // Auth
  static const int minPasswordLength = 8;
}
