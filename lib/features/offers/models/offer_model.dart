import 'package:flutter/material.dart';

class Offer {
  const Offer({
    required this.id,
    required this.title,
    required this.tag,
    this.deal = '',
    this.tagColor = 0xFFE8722A,
    this.active = true,
    this.validUntil,
  });

  final String id;
  final String title;
  final String deal;
  final String tag;
  final int tagColor;
  final bool active;
  final DateTime? validUntil;

  Color get tagColorValue => Color(tagColor);

  factory Offer.fromMap(Map<String, dynamic> map, String id) {
    return Offer(
      id: id,
      title: map['title'] as String? ?? '',
      deal: map['deal'] as String? ?? '',
      tag: map['tag'] as String? ?? '',
      tagColor: int.tryParse(map['color'] as String? ?? '') ?? 0xFFE8722A,
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
      'color': '0x${tagColor.toRadixString(16).toUpperCase()}',
      'active': active,
      'validUntil': validUntil?.toIso8601String(),
    };
  }
}
