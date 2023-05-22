import Foundation

import PrchModel
/** Information about subscribers in an Automation email queue. */
public struct SubscriberInAutomationQueue1Model: Codable, Equatable, Content {
  /** The list member's email address. */
  public var emailAddress: String

  public init(emailAddress: String) {
    self.emailAddress = emailAddress
  }

  public enum CodingKeys: String, CodingKey {
    case emailAddress = "email_address"
  }
}
