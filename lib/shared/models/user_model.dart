class UserModel {
  const UserModel({
    required this.uid,
    required this.name,
    required this.email,
    this.stamps = 0,
    this.totalRedeemed = 0,
    this.lastVisit,
    this.createdAt,
    this.role = 'customer',
  });

  final String uid;
  final String name;
  final String email;
  final int stamps;
  final int totalRedeemed;
  final DateTime? lastVisit;
  final DateTime? createdAt;
  final String role;

  factory UserModel.fromMap(Map<String, dynamic> map, String uid) {
    return UserModel(
      uid: uid,
      name: map['name'] as String? ?? '',
      email: map['email'] as String? ?? '',
      stamps: map['stamps'] as int? ?? 0,
      totalRedeemed: map['totalRedeemed'] as int? ?? 0,
      lastVisit: map['lastVisit'] != null
          ? DateTime.tryParse(map['lastVisit'] as String)
          : null,
      createdAt: map['createdAt'] != null
          ? DateTime.tryParse(map['createdAt'] as String)
          : null,
      role: map['role'] as String? ?? 'customer',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'stamps': stamps,
      'totalRedeemed': totalRedeemed,
      'lastVisit': lastVisit?.toIso8601String(),
      'createdAt': createdAt?.toIso8601String(),
      'role': role,
    };
  }

  UserModel copyWith({
    String? name,
    String? email,
    int? stamps,
    int? totalRedeemed,
    DateTime? lastVisit,
    DateTime? createdAt,
    String? role,
  }) {
    return UserModel(
      uid: uid,
      name: name ?? this.name,
      email: email ?? this.email,
      stamps: stamps ?? this.stamps,
      totalRedeemed: totalRedeemed ?? this.totalRedeemed,
      lastVisit: lastVisit ?? this.lastVisit,
      createdAt: createdAt ?? this.createdAt,
      role: role ?? this.role,
    );
  }
}
