import Foundation

import PrchModel
/** A summary of an individual Automation workflow's settings and content. */
public struct AutomationWorkflow1Model: Codable, Equatable, Content {
  public var recipients: List1Model

  public var triggerSettings: AutomationTrigger1Model

  public var settings: AutomationCampaignSettings1Model?

  public init(recipients: List1Model, triggerSettings: AutomationTrigger1Model, settings: AutomationCampaignSettings1Model? = nil) {
    self.recipients = recipients
    self.triggerSettings = triggerSettings
    self.settings = settings
  }

  public enum CodingKeys: String, CodingKey {
    case recipients
    case triggerSettings = "trigger_settings"
    case settings
  }
}
