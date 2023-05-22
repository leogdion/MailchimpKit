import Foundation

import PrchModel
/** Details of abuse complaints for a specific list. An abuse complaint occurs when your recipient clicks to 'report spam' in their email program. */
public struct AbuseComplaint1Model: Codable, Equatable, Content {
  /** A list of link types and descriptions for the API schema documents. */
  public var links: [ResourceLinkModel]?

  /** The campaign id for the abuse report */
  public var campaignId: String?

  /** Date for the abuse report */
  public var date: DateTime?

  /** Email address for a subscriber. */
  public var emailAddress: String?

  /** The MD5 hash of the lowercase version of the list member's email address. */
  public var emailId: String?

  /** The id for the abuse report */
  public var id: Int?

  /** The unique id of the list for the abuse report. */
  public var listId: String?

  /** The status of the list used, namely if it's deleted or disabled. */
  public var listIsActive: Bool?

  /** A dictionary of merge fields where the keys are the merge tags. See the [Merge Fields documentation](https://mailchimp.com/developer/marketing/docs/merge-fields/#structure) for more about the structure. */
  public var mergeFields: [String: String]?

  /** [VIP status](https://mailchimp.com/help/designate-and-send-to-vip-contacts/) for subscriber. */
  public var vip: Bool?

  public init(links: [ResourceLinkModel]? = nil, campaignId: String? = nil, date: DateTime? = nil, emailAddress: String? = nil, emailId: String? = nil, id: Int? = nil, listId: String? = nil, listIsActive: Bool? = nil, mergeFields: [String: String]? = nil, vip: Bool? = nil) {
    self.links = links
    self.campaignId = campaignId
    self.date = date
    self.emailAddress = emailAddress
    self.emailId = emailId
    self.id = id
    self.listId = listId
    self.listIsActive = listIsActive
    self.mergeFields = mergeFields
    self.vip = vip
  }

  public enum CodingKeys: String, CodingKey {
    case links = "_links"
    case campaignId = "campaign_id"
    case date
    case emailAddress = "email_address"
    case emailId = "email_id"
    case id
    case listId = "list_id"
    case listIsActive = "list_is_active"
    case mergeFields = "merge_fields"
    case vip
  }
}
