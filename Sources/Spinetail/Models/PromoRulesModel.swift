import Foundation

import PrchModel
/** A collection of the store's promo rules. */
public struct PromoRulesModel: Codable, Equatable, Content {
  /** A list of link types and descriptions for the API schema documents. */
  public var links: [ResourceLinkModel]?

  /** An array of objects, each representing promo rules defined for a store. */
  public var promoRules: [ECommercePromoRuleModel]?

  /** The store id. */
  public var storeId: String?

  /** The total number of items matching the query regardless of pagination. */
  public var totalItems: Int?

  public init(links: [ResourceLinkModel]? = nil, promoRules: [ECommercePromoRuleModel]? = nil, storeId: String? = nil, totalItems: Int? = nil) {
    self.links = links
    self.promoRules = promoRules
    self.storeId = storeId
    self.totalItems = totalItems
  }

  public enum CodingKeys: String, CodingKey {
    case links = "_links"
    case promoRules = "promo_rules"
    case storeId = "store_id"
    case totalItems = "total_items"
  }
}
