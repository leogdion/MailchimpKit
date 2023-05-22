import Foundation

import PrchModel
/** An individual store in an account. */
public struct ECommerceStore2Model: Codable, Equatable, Content {
  public var address: Address1Model?

  /** The three-letter ISO 4217 code for the currency that the store accepts. */
  public var currencyCode: String?

  /** The store domain. */
  public var domain: String?

  /** The email address for the store. */
  public var emailAddress: String?

  /** Whether to disable automations because the store is currently [syncing](https://mailchimp.com/developer/marketing/docs/e-commerce/#pausing-store-automations). */
  public var isSyncing: Bool?

  /** The currency format for the store. For example: `$`, `£`, etc. */
  public var moneyFormat: String?

  /** The name of the store. */
  public var name: String?

  /** The store phone number. */
  public var phone: String?

  /** The e-commerce platform of the store. */
  public var platform: String?

  /** The primary locale for the store. For example: `en`, `de`, etc. */
  public var primaryLocale: String?

  /** The timezone for the store. */
  public var timezone: String?

  public init(address: Address1Model? = nil, currencyCode: String? = nil, domain: String? = nil, emailAddress: String? = nil, isSyncing: Bool? = nil, moneyFormat: String? = nil, name: String? = nil, phone: String? = nil, platform: String? = nil, primaryLocale: String? = nil, timezone: String? = nil) {
    self.address = address
    self.currencyCode = currencyCode
    self.domain = domain
    self.emailAddress = emailAddress
    self.isSyncing = isSyncing
    self.moneyFormat = moneyFormat
    self.name = name
    self.phone = phone
    self.platform = platform
    self.primaryLocale = primaryLocale
    self.timezone = timezone
  }

  public enum CodingKeys: String, CodingKey {
    case address
    case currencyCode = "currency_code"
    case domain
    case emailAddress = "email_address"
    case isSyncing = "is_syncing"
    case moneyFormat = "money_format"
    case name
    case phone
    case platform
    case primaryLocale = "primary_locale"
    case timezone
  }
}
