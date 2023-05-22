import Foundation

import PrchModel
/** [RSS](https://mailchimp.com/help/share-your-blog-posts-with-mailchimp/) options, specific to an RSS campaign. */
public struct RSSOptions1Model: Codable, Equatable, Content {
  /** The frequency of the RSS Campaign. */
  public enum Frequency: String, Codable, Equatable, CaseIterable {
    case daily
    case weekly
    case monthly
  }

  /** The URL for the RSS feed. */
  public var feedURL: URL

  /** The frequency of the RSS Campaign. */
  public var frequency: Frequency

  /** Whether to add CSS to images in the RSS feed to constrain their width in campaigns. */
  public var constrainRssImg: Bool?

  public var schedule: SendingScheduleModel?

  public init(feedURL: URL, frequency: Frequency, constrainRssImg: Bool? = nil, schedule: SendingScheduleModel? = nil) {
    self.feedURL = feedURL
    self.frequency = frequency
    self.constrainRssImg = constrainRssImg
    self.schedule = schedule
  }

  public enum CodingKeys: String, CodingKey {
    case feedURL = "feed_url"
    case frequency
    case constrainRssImg = "constrain_rss_img"
    case schedule
  }
}
