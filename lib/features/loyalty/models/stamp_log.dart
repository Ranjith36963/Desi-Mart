// TODO: Implement stamp log model
//
// StampLog model for tracking individual stamp events:
//
// Fields:
// - id: String (document ID)
// - userId: String (reference to users/{uid})
// - type: String ('earned' | 'redeemed')
// - count: int (number of stamps in this event)
// - staffId: String? (staff who awarded the stamp)
// - notes: String? (e.g., "Purchase over £20")
// - createdAt: DateTime
//
// Methods:
// - fromMap(Map<String, dynamic>, String id) — factory constructor from Firestore doc
// - toMap() — serialize for Firestore write
