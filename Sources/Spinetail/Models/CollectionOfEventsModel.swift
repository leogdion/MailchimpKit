import Foundation

import PrchModel
/** A collection of events for a given contact */
public struct CollectionOfEventsModel: Codable, Equatable, Content {
  /** A list of link types and descriptions for the API schema documents. */
  public var links: [ResourceLinkModel]?

  /** An array of objects, each representing an event. */
  public var events: [EventModel]?

  /** The total number of items matching the query regardless of pagination. */
  public var totalItems: Int?

  public init(links: [ResourceLinkModel]? = nil, events: [EventModel]? = nil, totalItems: Int? = nil) {
    self.links = links
    self.events = events
    self.totalItems = totalItems
  }

  public enum CodingKeys: String, CodingKey {
    case links = "_links"
    case events
    case totalItems = "total_items"
  }
}
