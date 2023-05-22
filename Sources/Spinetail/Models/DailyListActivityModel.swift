import Foundation

import PrchModel
/** One day's worth of list activity. Doesn't include Automation activity. */
public struct DailyListActivityModel: Codable, Equatable, Content {
  /** A list of link types and descriptions for the API schema documents. */
  public var links: [ResourceLinkModel]?

  /** The date for the activity summary. */
  public var day: String?

  /** The total number of emails sent on the date for the activity summary. */
  public var emailsSent: Int?

  /** The number of hard bounces. */
  public var hardBounce: Int?

  /** The number of subscribers who may have been added outside of the [double opt-in process](https://mailchimp.com/help/about-double-opt-in/), such as imports or API activity. */
  public var otherAdds: Int?

  /** The number of subscribers who may have been removed outside of unsubscribing or reporting an email as spam (for example, deleted subscribers). */
  public var otherRemoves: Int?

  /** The number of clicks. */
  public var recipientClicks: Int?

  /** The number of soft bounces */
  public var softBounce: Int?

  /** The number of subscribes. */
  public var subs: Int?

  /** The number of unique opens. */
  public var uniqueOpens: Int?

  /** The number of unsubscribes. */
  public var unsubs: Int?

  public init(links: [ResourceLinkModel]? = nil, day: String? = nil, emailsSent: Int? = nil, hardBounce: Int? = nil, otherAdds: Int? = nil, otherRemoves: Int? = nil, recipientClicks: Int? = nil, softBounce: Int? = nil, subs: Int? = nil, uniqueOpens: Int? = nil, unsubs: Int? = nil) {
    self.links = links
    self.day = day
    self.emailsSent = emailsSent
    self.hardBounce = hardBounce
    self.otherAdds = otherAdds
    self.otherRemoves = otherRemoves
    self.recipientClicks = recipientClicks
    self.softBounce = softBounce
    self.subs = subs
    self.uniqueOpens = uniqueOpens
    self.unsubs = unsubs
  }

  public enum CodingKeys: String, CodingKey {
    case links = "_links"
    case day
    case emailsSent = "emails_sent"
    case hardBounce = "hard_bounce"
    case otherAdds = "other_adds"
    case otherRemoves = "other_removes"
    case recipientClicks = "recipient_clicks"
    case softBounce = "soft_bounce"
    case subs
    case uniqueOpens = "unique_opens"
    case unsubs
  }
}
