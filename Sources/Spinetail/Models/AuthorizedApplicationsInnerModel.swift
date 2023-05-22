import Foundation

import PrchModel
/** An authorized app. */
public struct AuthorizedApplicationsInnerModel: Codable, Equatable, Content {
  /** A list of link types and descriptions for the API schema documents. */
  public var links: [ResourceLinkModel]?

  /** A short description of the application. */
  public var description: String?

  /** The ID for the application. */
  public var id: Int?

  /** The name of the application. */
  public var name: String?

  /** An array of usernames for users who have linked the app. */
  public var users: [String]?

  public init(links: [ResourceLinkModel]? = nil, description: String? = nil, id: Int? = nil, name: String? = nil, users: [String]? = nil) {
    self.links = links
    self.description = description
    self.id = id
    self.name = name
    self.users = users
  }

  public enum CodingKeys: String, CodingKey {
    case links = "_links"
    case description
    case id
    case name
    case users
  }
}
