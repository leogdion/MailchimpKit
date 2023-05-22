import Foundation

import PrchModel
/** A collection of stores in the account. */
public struct ECommerceStoresModel: Codable, Equatable, Content {
  /** A list of link types and descriptions for the API schema documents. */
  public var links: [ResourceLinkModel]?

  /** An array of objects, each representing a store. */
  public var stores: [ECommerceStoreModel]?

  /** The total number of items matching the query regardless of pagination. */
  public var totalItems: Int?

  public init(links: [ResourceLinkModel]? = nil, stores: [ECommerceStoreModel]? = nil, totalItems: Int? = nil) {
    self.links = links
    self.stores = stores
    self.totalItems = totalItems
  }

  public enum CodingKeys: String, CodingKey {
    case links = "_links"
    case stores
    case totalItems = "total_items"
  }
}
