import Foundation

import PrchModel
/** An array of objects, each representing an account export. */
public struct GetAccountExports200ResponseModel: Codable, Equatable, Content {
  /** A list of link types and descriptions for the API schema documents. */
  public var links: [ResourceLinkModel]?

  /** An array of objects, each representing an account export. */
  public var exports: [AccountExportsInnerModel]?

  /** The total number of items matching the query regardless of pagination. */
  public var totalItems: Int?

  public init(links: [ResourceLinkModel]? = nil, exports: [AccountExportsInnerModel]? = nil, totalItems: Int? = nil) {
    self.links = links
    self.exports = exports
    self.totalItems = totalItems
  }

  public enum CodingKeys: String, CodingKey {
    case links = "_links"
    case exports
    case totalItems = "total_items"
  }
}
