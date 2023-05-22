import Foundation

import PrchModel
public struct PromosInnerModel: Codable, Equatable, Content {
  /** Type of discount. For free shipping set type to fixed */
  public enum `Type`: String, Codable, Equatable, CaseIterable {
    case fixed
    case percentage
  }

  /** The amount of discount applied on the total price. For example if the total cost was $100 and the customer paid $95.5, amount_discounted will be 4.5 For free shipping set amount_discounted to 0 */
  public var amountDiscounted: Double?

  /** The Promo Code */
  public var code: String?

  /** Type of discount. For free shipping set type to fixed */
  public var type: `Type`?

  public init(amountDiscounted: Double? = nil, code: String? = nil, type: Type? = nil) {
    self.amountDiscounted = amountDiscounted
    self.code = code
    self.type = type
  }

  public enum CodingKeys: String, CodingKey {
    case amountDiscounted = "amount_discounted"
    case code
    case type
  }
}
