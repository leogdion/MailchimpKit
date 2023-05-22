import Foundation

import PrchModel
/** Top open locations for a specific campaign. */
public struct OpenLocationsModel: Codable, Equatable, Content {
  /** A list of link types and descriptions for the API schema documents. */
  public var links: [ResourceLinkModel]?

  /** The campaign id. */
  public var campaignId: String?

  /** An array of objects, each representing a top location for opens. */
  public var locations: [ListsInnerModel]?

  /** The total number of items matching the query regardless of pagination. */
  public var totalItems: Int?

  public init(links: [ResourceLinkModel]? = nil, campaignId: String? = nil, locations: [ListsInnerModel]? = nil, totalItems: Int? = nil) {
    self.links = links
    self.campaignId = campaignId
    self.locations = locations
    self.totalItems = totalItems
  }

  public enum CodingKeys: String, CodingKey {
    case links = "_links"
    case campaignId = "campaign_id"
    case locations
    case totalItems = "total_items"
  }
}
