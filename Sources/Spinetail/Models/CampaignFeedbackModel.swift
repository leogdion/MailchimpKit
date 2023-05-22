import Foundation

import PrchModel
/** A specific feedback message from a specific campaign. */
public struct CampaignFeedbackModel: Codable, Equatable, Content {
  /** The source of the feedback. */
  public enum Source: String, Codable, Equatable, CaseIterable {
    case api
    case email
    case sms
    case web
    case ios
    case android
  }

  /** The content of the feedback. */
  public var message: String

  /** A list of link types and descriptions for the API schema documents. */
  public var links: [ResourceLinkModel]?

  /** The block id for the editable block that the feedback addresses. */
  public var blockId: Int?

  /** The unique id for the campaign. */
  public var campaignId: String?

  /** The date and time the feedback item was created in ISO 8601 format. */
  public var createdAt: DateTime?

  /** The login name of the user who created the feedback. */
  public var createdBy: String?

  /** The individual id for the feedback item. */
  public var feedbackId: Int?

  /** The status of feedback. */
  public var isComplete: Bool?

  /** If a reply, the id of the parent feedback item. */
  public var parentId: Int?

  /** The source of the feedback. */
  public var source: Source?

  /** The date and time the feedback was last updated in ISO 8601 format. */
  public var updatedAt: DateTime?

  public init(message: String, links: [ResourceLinkModel]? = nil, blockId: Int? = nil, campaignId: String? = nil, createdAt: DateTime? = nil, createdBy: String? = nil, feedbackId: Int? = nil, isComplete: Bool? = nil, parentId: Int? = nil, source: Source? = nil, updatedAt: DateTime? = nil) {
    self.message = message
    self.links = links
    self.blockId = blockId
    self.campaignId = campaignId
    self.createdAt = createdAt
    self.createdBy = createdBy
    self.feedbackId = feedbackId
    self.isComplete = isComplete
    self.parentId = parentId
    self.source = source
    self.updatedAt = updatedAt
  }

  public enum CodingKeys: String, CodingKey {
    case message
    case links = "_links"
    case blockId = "block_id"
    case campaignId = "campaign_id"
    case createdAt = "created_at"
    case createdBy = "created_by"
    case feedbackId = "feedback_id"
    case isComplete = "is_complete"
    case parentId = "parent_id"
    case source
    case updatedAt = "updated_at"
  }
}
