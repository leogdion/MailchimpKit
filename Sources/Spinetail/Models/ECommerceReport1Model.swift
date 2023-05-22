import Foundation

import PrchModel
/** E-Commerce stats for a campaign. */
public struct ECommerceReport1Model: Codable, Equatable, Content {
  public var currencyCode: String?

  /** The total orders for a campaign. */
  public var totalOrders: Int?

  /** The total revenue for a campaign. Calculated as the sum of all order totals minus shipping and tax totals. */
  public var totalRevenue: Double?

  /** The total spent for a campaign. Calculated as the sum of all order totals with no deductions. */
  public var totalSpent: Double?

  public init(currencyCode: String? = nil, totalOrders: Int? = nil, totalRevenue: Double? = nil, totalSpent: Double? = nil) {
    self.currencyCode = currencyCode
    self.totalOrders = totalOrders
    self.totalRevenue = totalRevenue
    self.totalSpent = totalSpent
  }

  public enum CodingKeys: String, CodingKey {
    case currencyCode = "currency_code"
    case totalOrders = "total_orders"
    case totalRevenue = "total_revenue"
    case totalSpent = "total_spent"
  }
}
