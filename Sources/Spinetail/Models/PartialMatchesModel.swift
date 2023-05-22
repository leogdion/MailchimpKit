import Foundation

import PrchModel
/** Partial matches of the provided search query. */
public struct PartialMatchesModel: Codable, Equatable, Content {
  /** An array of objects, each representing a specific list member. */
  public var members: [ListMembers2Model]?

  /** The total number of items matching the query regardless of pagination. */
  public var totalItems: Int?

  public init(members: [ListMembers2Model]? = nil, totalItems: Int? = nil) {
    self.members = members
    self.totalItems = totalItems
  }

  public enum CodingKeys: String, CodingKey {
    case members
    case totalItems = "total_items"
  }
}
