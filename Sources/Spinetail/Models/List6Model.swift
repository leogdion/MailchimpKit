import Foundation

import PrchModel
/** List settings for the campaign. */
public struct List6Model: Codable, Equatable, Content {
  /** The unique list id. */
  public var listId: String

  /** The name of the list. */
  public var listName: String?

  /** Count of the recipients on the associated list. Formatted as an integer. */
  public var recipientCount: Int?

  public var segmentOpts: SegmentOptions1Model?

  /** A description of the [segment](https://mailchimp.com/help/save-and-manage-segments/) used for the campaign. Formatted as a string marked up with HTML. */
  public var segmentText: String?

  public init(listId: String, listName: String? = nil, recipientCount: Int? = nil, segmentOpts: SegmentOptions1Model? = nil, segmentText: String? = nil) {
    self.listId = listId
    self.listName = listName
    self.recipientCount = recipientCount
    self.segmentOpts = segmentOpts
    self.segmentText = segmentText
  }

  public enum CodingKeys: String, CodingKey {
    case listId = "list_id"
    case listName = "list_name"
    case recipientCount = "recipient_count"
    case segmentOpts = "segment_opts"
    case segmentText = "segment_text"
  }
}
