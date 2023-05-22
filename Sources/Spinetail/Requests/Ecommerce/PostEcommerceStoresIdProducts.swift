import Foundation
import PrchModel

public extension Ecommerce {
  /**
   Add product

   Add a new product to a store.
   */
  struct PostEcommerceStoresIdProducts: ServiceCall {
    public static var requiresCredentials: Bool {
      false
    }

    public typealias ServiceAPI = SpinetailAPI

    public static let pathTemplate = "/ecommerce/stores/{store_id}/products"

    public var path: String {
      Self.pathTemplate.replacingOccurrences(of: "{" + "store_id" + "}", with: "\(storeId)")
    }

    public var method: RequestMethod {
      .POST
    }

    /** The store id. */
    public var storeId: String

    public var parameters: [String: String] { [:] }

    public var headers: [String: String] { [:] }

    // public static let service = APIService<Response>(id: "postEcommerceStoresIdProducts", tag: "ecommerce", method: "POST", path: "/ecommerce/stores/{store_id}/products", hasBody: true, securityRequirements: [SecurityRequirement(type: "basicAuth", scopes: [])])

    public typealias SuccessType = ECommerceProductModel
    public typealias BodyType = ECommerceProduct1Model

    public let body: ECommerceProduct1Model
  }
}
