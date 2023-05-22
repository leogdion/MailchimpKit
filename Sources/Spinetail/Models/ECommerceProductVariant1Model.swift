import Foundation

import PrchModel
/** Information about a specific product variant. */
public struct ECommerceProductVariant1Model: Codable, Equatable, Content {
  /** A unique identifier for the product variant. */
  public var id: String

  /** The title of a product variant. */
  public var title: String

  /** The backorders of a product variant. */
  public var backorders: String?

  /** The image URL for a product variant. */
  public var imageURL: String?

  /** The inventory quantity of a product variant. */
  public var inventoryQuantity: Int?

  /** The price of a product variant. */
  public var price: Double?

  /** The stock keeping unit (SKU) of a product variant. */
  public var sku: String?

  /** The URL for a product variant. */
  public var url: String?

  /** The visibility of a product variant. */
  public var visibility: String?

  public init(id: String, title: String, backorders: String? = nil, imageURL: String? = nil, inventoryQuantity: Int? = nil, price: Double? = nil, sku: String? = nil, url: String? = nil, visibility: String? = nil) {
    self.id = id
    self.title = title
    self.backorders = backorders
    self.imageURL = imageURL
    self.inventoryQuantity = inventoryQuantity
    self.price = price
    self.sku = sku
    self.url = url
    self.visibility = visibility
  }

  public enum CodingKeys: String, CodingKey {
    case id
    case title
    case backorders
    case imageURL = "image_url"
    case inventoryQuantity = "inventory_quantity"
    case price
    case sku
    case url
    case visibility
  }
}
