import Foundation

import PrchModel
/** Information about a specific cart. */
public struct ECommerceCart2Model: Codable, Equatable, Content {
  /** A string that uniquely identifies the campaign associated with a cart. */
  public var campaignId: String?

  /** The URL for the cart. This parameter is required for [Abandoned Cart](https://mailchimp.com/help/create-an-abandoned-cart-email/) automations. */
  public var checkoutURL: String?

  /** The three-letter ISO 4217 code for the currency that the cart uses. */
  public var currencyCode: String?

  public var customer: ECommerceCustomer2Model?

  /** An array of the cart's line items. */
  public var lines: [ECommerceCartLineItem2Model]?

  /** The order total for the cart. */
  public var orderTotal: Double?

  /** The total tax for the cart. */
  public var taxTotal: Double?

  public init(campaignId: String? = nil, checkoutURL: String? = nil, currencyCode: String? = nil, customer: ECommerceCustomer2Model? = nil, lines: [ECommerceCartLineItem2Model]? = nil, orderTotal: Double? = nil, taxTotal: Double? = nil) {
    self.campaignId = campaignId
    self.checkoutURL = checkoutURL
    self.currencyCode = currencyCode
    self.customer = customer
    self.lines = lines
    self.orderTotal = orderTotal
    self.taxTotal = taxTotal
  }

  public enum CodingKeys: String, CodingKey {
    case campaignId = "campaign_id"
    case checkoutURL = "checkout_url"
    case currencyCode = "currency_code"
    case customer
    case lines
    case orderTotal = "order_total"
    case taxTotal = "tax_total"
  }
}
