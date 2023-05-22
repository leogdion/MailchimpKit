import Foundation

import PrchModel
/** Information about a specific cart. */
public struct ECommerceCartModel: Codable, Equatable, Content {
  /** A list of link types and descriptions for the API schema documents. */
  public var links: [ResourceLinkModel]?

  /** A string that uniquely identifies the campaign associated with a cart. */
  public var campaignId: String?

  /** The URL for the cart. This parameter is required for [Abandoned Cart](https://mailchimp.com/help/create-an-abandoned-cart-email/) automations. */
  public var checkoutURL: String?

  /** The date and time the cart was created in ISO 8601 format. */
  public var createdAt: DateTime?

  /** The three-letter ISO 4217 code for the currency that the cart uses. */
  public var currencyCode: String?

  public var customer: ECommerceCustomerModel?

  /** A unique identifier for the cart. */
  public var id: String?

  /** An array of the cart's line items. */
  public var lines: [ECommerceCartLineItemModel]?

  /** The order total for the cart. */
  public var orderTotal: Double?

  /** The total tax for the cart. */
  public var taxTotal: Double?

  /** The date and time the cart was last updated in ISO 8601 format. */
  public var updatedAt: DateTime?

  public init(links: [ResourceLinkModel]? = nil, campaignId: String? = nil, checkoutURL: String? = nil, createdAt: DateTime? = nil, currencyCode: String? = nil, customer: ECommerceCustomerModel? = nil, id: String? = nil, lines: [ECommerceCartLineItemModel]? = nil, orderTotal: Double? = nil, taxTotal: Double? = nil, updatedAt: DateTime? = nil) {
    self.links = links
    self.campaignId = campaignId
    self.checkoutURL = checkoutURL
    self.createdAt = createdAt
    self.currencyCode = currencyCode
    self.customer = customer
    self.id = id
    self.lines = lines
    self.orderTotal = orderTotal
    self.taxTotal = taxTotal
    self.updatedAt = updatedAt
  }

  public enum CodingKeys: String, CodingKey {
    case links = "_links"
    case campaignId = "campaign_id"
    case checkoutURL = "checkout_url"
    case createdAt = "created_at"
    case currencyCode = "currency_code"
    case customer
    case id
    case lines
    case orderTotal = "order_total"
    case taxTotal = "tax_total"
    case updatedAt = "updated_at"
  }
}
