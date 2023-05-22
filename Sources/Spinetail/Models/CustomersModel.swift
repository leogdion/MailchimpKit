import Foundation

import PrchModel
/** A collection of the store's customers. */
public struct CustomersModel: Codable, Equatable, Content {
  /** A list of link types and descriptions for the API schema documents. */
  public var links: [ResourceLinkModel]?

  /** An array of objects, each representing a customer of a store. */
  public var customers: [ECommerceCustomerModel]?

  /** The store id. */
  public var storeId: String?

  /** The total number of items matching the query regardless of pagination. */
  public var totalItems: Int?

  public init(links: [ResourceLinkModel]? = nil, customers: [ECommerceCustomerModel]? = nil, storeId: String? = nil, totalItems: Int? = nil) {
    self.links = links
    self.customers = customers
    self.storeId = storeId
    self.totalItems = totalItems
  }

  public enum CodingKeys: String, CodingKey {
    case links = "_links"
    case customers
    case storeId = "store_id"
    case totalItems = "total_items"
  }
}
