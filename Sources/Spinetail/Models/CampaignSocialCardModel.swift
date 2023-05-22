import Foundation

import PrchModel
/** The preview for the campaign, rendered by social networks like Facebook and Twitter. [Learn more](https://mailchimp.com/help/enable-and-customize-social-cards/). */
public struct CampaignSocialCardModel: Codable, Equatable, Content {
  /** A short summary of the campaign to display. */
  public var description: String?

  /** The url for the header image for the card. */
  public var imageURL: String?

  /** The title for the card. Typically the subject line of the campaign. */
  public var title: String?

  public init(description: String? = nil, imageURL: String? = nil, title: String? = nil) {
    self.description = description
    self.imageURL = imageURL
    self.title = title
  }

  public enum CodingKeys: String, CodingKey {
    case description
    case imageURL = "image_url"
    case title
  }
}
