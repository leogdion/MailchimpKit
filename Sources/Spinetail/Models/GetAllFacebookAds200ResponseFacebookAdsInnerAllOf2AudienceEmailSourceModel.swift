import Foundation

import PrchModel
public struct GetAllFacebookAds200ResponseFacebookAdsInnerAllOf2AudienceEmailSourceModel: Codable, Equatable, Content {
  /** Is the source reference a segment */
  public var isSegment: Bool?

  /** Associated list name to the source */
  public var listName: String?

  /** Email source name */
  public var name: String?

  /** Segment type if this source is tied to a segment */
  public var segmentType: String?

  /** Type of the email source */
  public var type: String?

  public init(isSegment: Bool? = nil, listName: String? = nil, name: String? = nil, segmentType: String? = nil, type: String? = nil) {
    self.isSegment = isSegment
    self.listName = listName
    self.name = name
    self.segmentType = segmentType
    self.type = type
  }

  public enum CodingKeys: String, CodingKey {
    case isSegment = "is_segment"
    case listName = "list_name"
    case name
    case segmentType = "segment_type"
    case type
  }
}
