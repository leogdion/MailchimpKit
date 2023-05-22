import Foundation

import PrchModel
/** Information about a specific product. */
public struct ECommerceProductModel: Codable, Equatable, Content {
  /** A list of link types and descriptions for the API schema documents. */
  public var links: [ResourceLinkModel]?

  /** The currency code */
  public var currencyCode: String?

  /** The description of a product. */
  public var description: String?

  /** The handle of a product. */
  public var handle: String?

  /** A unique identifier for the product. */
  public var id: String?

  /** The image URL for a product. */
  public var imageURL: String?

  /** An array of the product's images. */
  public var images: [ECommerceProductImageModel]?

  /** The date and time the product was published in ISO 8601 format. */
  public var publishedAtForeign: DateTime?

  /** The title of a product. */
  public var title: String?

  /** The type of product. */
  public var type: String?

  /** The URL for a product. */
  public var url: String?

  /** Returns up to 50 of the product's variants. To retrieve all variants use [Product Variants](https://mailchimp.com/developer/marketing/api/ecommerce-product-variants/). */
  public var variants: [ECommerceProductVariantModel]?

  /** The vendor for a product. */
  public var vendor: String?

  public init(links: [ResourceLinkModel]? = nil, currencyCode: String? = nil, description: String? = nil, handle: String? = nil, id: String? = nil, imageURL: String? = nil, images: [ECommerceProductImageModel]? = nil, publishedAtForeign: DateTime? = nil, title: String? = nil, type: String? = nil, url: String? = nil, variants: [ECommerceProductVariantModel]? = nil, vendor: String? = nil) {
    self.links = links
    self.currencyCode = currencyCode
    self.description = description
    self.handle = handle
    self.id = id
    self.imageURL = imageURL
    self.images = images
    self.publishedAtForeign = publishedAtForeign
    self.title = title
    self.type = type
    self.url = url
    self.variants = variants
    self.vendor = vendor
  }

  public enum CodingKeys: String, CodingKey {
    case links = "_links"
    case currencyCode = "currency_code"
    case description
    case handle
    case id
    case imageURL = "image_url"
    case images
    case publishedAtForeign = "published_at_foreign"
    case title
    case type
    case url
    case variants
    case vendor
  }
}
