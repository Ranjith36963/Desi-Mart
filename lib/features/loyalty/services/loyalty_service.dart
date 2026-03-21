// TODO: Implement loyalty card service
//
// This service will handle:
// - Adding stamps to a user's account (via Cloud Function or direct Firestore write)
// - Fetching stamp history from stamp_log collection
// - Redeeming rewards (decrement stamps, log redemption)
// - Checking loyalty tier thresholds
//
// Firestore collections used:
// - users/{uid}.stamps — current stamp count
// - users/{uid}.totalRedeemed — lifetime redeemed count
// - stamp_log/{logId} — individual stamp events (userId, timestamp, staffId, type)
//
// Security: stamp additions should be validated server-side via Cloud Functions
// to prevent client-side manipulation.
