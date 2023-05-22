import Foundation

import PrchModel
/** Batch add/remove List members to/from static segment */
public struct BatchAddRemoveListMembersToFromStaticSegmentModel: Codable, Equatable, Content {
  /** A list of link types and descriptions for the API schema documents. */
  public var links: [ResourceLinkModel]?

  /** The total number of items matching the query, irrespective of pagination. */
  public var errorCount: Int?

  /** An array of objects, each representing an array of email addresses that could not be added to the segment or removed and an error message providing more details. */
  public var errors: [ErrorsInner1Model]?

  /** An array of objects, each representing a new member that was added to the static segment. */
  public var membersAdded: [ListMembersModel]?

  /** An array of objects, each representing an existing list member that got deleted from the static segment. */
  public var membersRemoved: [ListMembersModel]?

  /** The total number of items matching the query, irrespective of pagination. */
  public var totalAdded: Int?

  /** The total number of items matching the query, irrespective of pagination. */
  public var totalRemoved: Int?

  public init(links: [ResourceLinkModel]? = nil, errorCount: Int? = nil, errors: [ErrorsInner1Model]? = nil, membersAdded: [ListMembersModel]? = nil, membersRemoved: [ListMembersModel]? = nil, totalAdded: Int? = nil, totalRemoved: Int? = nil) {
    self.links = links
    self.errorCount = errorCount
    self.errors = errors
    self.membersAdded = membersAdded
    self.membersRemoved = membersRemoved
    self.totalAdded = totalAdded
    self.totalRemoved = totalRemoved
  }

  public enum CodingKeys: String, CodingKey {
    case links = "_links"
    case errorCount = "error_count"
    case errors
    case membersAdded = "members_added"
    case membersRemoved = "members_removed"
    case totalAdded = "total_added"
    case totalRemoved = "total_removed"
  }
}
