// TODO: Implement loyalty card state management
//
// This provider will manage:
// - Current stamp count for the authenticated user
// - Stamp history / activity log
// - Reward redemption state
// - Loyalty tier status
//
// Expected providers:
// - loyaltyStampsProvider: StreamProvider watching user's stamp count from Firestore
// - stampHistoryProvider: FutureProvider fetching stamp_log collection
// - redeemRewardProvider: StateNotifier for handling reward redemption flow
