import Foundation

import PrchModel
/** The last 50 Goal events for a member on a specific list. */
public struct CollectionOfMemberActivityEventsModel: Codable, Equatable, Content {
  /** A list of link types and descriptions for the API schema documents. */
  public var links: [ResourceLinkModel]?

  /** The MD5 hash of the lowercase version of the list member's email address. */
  public var emailId: String?

  /** The last 50 Goal events triggered by a member. */
  public var goals: [GoalModel]?

  /** The list id. */
  public var listId: String?

  /** The total number of items matching the query regardless of pagination. */
  public var totalItems: Int?

  public init(links: [ResourceLinkModel]? = nil, emailId: String? = nil, goals: [GoalModel]? = nil, listId: String? = nil, totalItems: Int? = nil) {
    self.links = links
    self.emailId = emailId
    self.goals = goals
    self.listId = listId
    self.totalItems = totalItems
  }

  public enum CodingKeys: String, CodingKey {
    case links = "_links"
    case emailId = "email_id"
    case goals
    case listId = "list_id"
    case totalItems = "total_items"
  }
}
