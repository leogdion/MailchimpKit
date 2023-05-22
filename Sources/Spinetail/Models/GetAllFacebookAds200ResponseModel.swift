import Foundation

import PrchModel
/** Contains an array of facebook ads. */
public struct GetAllFacebookAds200ResponseModel: Codable, Equatable, Content {
  /** A list of link types and descriptions for the API schema documents. */
  public var links: [ResourceLinkModel]?

  public var facebookAds: [GetAllFacebookAds200ResponseFacebookAdsInnerModel]?

  /** The total number of items matching the query regardless of pagination. */
  public var totalItems: Int?

  public init(links: [ResourceLinkModel]? = nil, facebookAds: [GetAllFacebookAds200ResponseFacebookAdsInnerModel]? = nil, totalItems: Int? = nil) {
    self.links = links
    self.facebookAds = facebookAds
    self.totalItems = totalItems
  }

  public enum CodingKeys: String, CodingKey {
    case links = "_links"
    case facebookAds = "facebook_ads"
    case totalItems = "total_items"
  }
}
