class Offer {
  const Offer({
    required this.id,
    required this.title,
    required this.tag,
    required this.imageUrl,
    this.deal = '',
    this.active = true,
    this.validUntil,
  });

  final String id;
  final String title;
  final String deal;
  final String tag;
  final String imageUrl;
  final bool active;
  final DateTime? validUntil;

  factory Offer.fromMap(Map<String, dynamic> map, String id) {
    return Offer(
      id: id,
      title: map['title'] as String? ?? '',
      deal: map['deal'] as String? ?? '',
      tag: map['tag'] as String? ?? '',
      imageUrl: map['imageUrl'] as String? ?? '',
      active: map['active'] as bool? ?? true,
      validUntil: map['validUntil'] != null
          ? DateTime.tryParse(map['validUntil'] as String)
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'deal': deal,
      'tag': tag,
      'imageUrl': imageUrl,
      'active': active,
      'validUntil': validUntil?.toIso8601String(),
    };
  }
}
