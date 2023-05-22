import Foundation

import PrchModel
/** Report details about a sent campaign. */
public struct CampaignReportModel: Codable, Equatable, Content {
  /** A list of link types and descriptions for the API schema documents. */
  public var links: [ResourceLinkModel]?

  public var abSplit: ABSplitStatsModel?

  /** The number of abuse reports generated for this campaign. */
  public var abuseReports: Int?

  public var bounces: BouncesModel?

  /** The title of the campaign. */
  public var campaignTitle: String?

  public var clicks: ClicksModel?

  public var deliveryStatus: CampaignDeliveryStatusModel?

  public var ecommerce: ECommerceReport1Model?

  /** The total number of emails sent for this campaign. */
  public var emailsSent: Int?

  public var facebookLikes: FacebookLikesModel?

  public var forwards: ForwardsModel?

  /** A string that uniquely identifies this campaign. */
  public var id: String?

  public var industryStats: IndustryStats1Model?

  /** The unique list id. */
  public var listId: String?

  /** The status of the list used, namely if it's deleted or disabled. */
  public var listIsActive: Bool?

  /** The name of the list. */
  public var listName: String?

  public var listStats: ListStatsModel?

  public var opens: OpensModel?

  /** The preview text for the campaign. */
  public var previewText: String?

  /** For RSS campaigns, the date and time of the last send in ISO 8601 format. */
  public var rssLastSend: DateTime?

  /** The date and time a campaign was sent in ISO 8601 format. */
  public var sendTime: DateTime?

  public var shareReport: ShareReportModel?

  /** The subject line for the campaign. */
  public var subjectLine: String?

  /** An hourly breakdown of the performance of the campaign over the first 24 hours. */
  public var timeseries: [TimeseriesInnerModel]?

  /** An hourly breakdown of sends, opens, and clicks if a campaign is sent using timewarp. */
  public var timewarp: [TimewarpStatsInnerModel]?

  /** The type of campaign (regular, plain-text, ab_split, rss, automation, variate, or auto). */
  public var type: String?

  /** The total number of unsubscribed members for this campaign. */
  public var unsubscribed: Int?

  public init(links: [ResourceLinkModel]? = nil, abSplit: ABSplitStatsModel? = nil, abuseReports: Int? = nil, bounces: BouncesModel? = nil, campaignTitle: String? = nil, clicks: ClicksModel? = nil, deliveryStatus: CampaignDeliveryStatusModel? = nil, ecommerce: ECommerceReport1Model? = nil, emailsSent: Int? = nil, facebookLikes: FacebookLikesModel? = nil, forwards: ForwardsModel? = nil, id: String? = nil, industryStats: IndustryStats1Model? = nil, listId: String? = nil, listIsActive: Bool? = nil, listName: String? = nil, listStats: ListStatsModel? = nil, opens: OpensModel? = nil, previewText: String? = nil, rssLastSend: DateTime? = nil, sendTime: DateTime? = nil, shareReport: ShareReportModel? = nil, subjectLine: String? = nil, timeseries: [TimeseriesInnerModel]? = nil, timewarp: [TimewarpStatsInnerModel]? = nil, type: String? = nil, unsubscribed: Int? = nil) {
    self.links = links
    self.abSplit = abSplit
    self.abuseReports = abuseReports
    self.bounces = bounces
    self.campaignTitle = campaignTitle
    self.clicks = clicks
    self.deliveryStatus = deliveryStatus
    self.ecommerce = ecommerce
    self.emailsSent = emailsSent
    self.facebookLikes = facebookLikes
    self.forwards = forwards
    self.id = id
    self.industryStats = industryStats
    self.listId = listId
    self.listIsActive = listIsActive
    self.listName = listName
    self.listStats = listStats
    self.opens = opens
    self.previewText = previewText
    self.rssLastSend = rssLastSend
    self.sendTime = sendTime
    self.shareReport = shareReport
    self.subjectLine = subjectLine
    self.timeseries = timeseries
    self.timewarp = timewarp
    self.type = type
    self.unsubscribed = unsubscribed
  }

  public enum CodingKeys: String, CodingKey {
    case links = "_links"
    case abSplit = "ab_split"
    case abuseReports = "abuse_reports"
    case bounces
    case campaignTitle = "campaign_title"
    case clicks
    case deliveryStatus = "delivery_status"
    case ecommerce
    case emailsSent = "emails_sent"
    case facebookLikes = "facebook_likes"
    case forwards
    case id
    case industryStats = "industry_stats"
    case listId = "list_id"
    case listIsActive = "list_is_active"
    case listName = "list_name"
    case listStats = "list_stats"
    case opens
    case previewText = "preview_text"
    case rssLastSend = "rss_last_send"
    case sendTime = "send_time"
    case shareReport = "share_report"
    case subjectLine = "subject_line"
    case timeseries
    case timewarp
    case type
    case unsubscribed
  }
}
