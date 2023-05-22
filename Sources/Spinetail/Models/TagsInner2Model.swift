import Foundation

import PrchModel
public struct TagsInner2Model: Codable, Equatable, Content {
  /** The date and time the tag was added to the list member in ISO 8601 format. */
  public var dateAdded: DateTime?

  /** The unique id for the tag. */
  public var id: Int?

  /** The name of the tag. */
  public var name: String?

  public init(dateAdded: DateTime? = nil, id: Int? = nil, name: String? = nil) {
    self.dateAdded = dateAdded
    self.id = id
    self.name = name
  }

  public enum CodingKeys: String, CodingKey {
    case dateAdded = "date_added"
    case id
    case name
  }
}
