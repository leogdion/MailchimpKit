import Foundation

import PrchModel
/** A single marketing permission a subscriber has either opted-in to or opted-out of. */
public struct MarketingPermission1Model: Codable, Equatable, Content {
  /** If the subscriber has opted-in to the marketing permission. */
  public var enabled: Bool?

  /** The id for the marketing permission on the list */
  public var marketingPermissionId: String?

  public init(enabled: Bool? = nil, marketingPermissionId: String? = nil) {
    self.enabled = enabled
    self.marketingPermissionId = marketingPermissionId
  }

  public enum CodingKeys: String, CodingKey {
    case enabled
    case marketingPermissionId = "marketing_permission_id"
  }
}
