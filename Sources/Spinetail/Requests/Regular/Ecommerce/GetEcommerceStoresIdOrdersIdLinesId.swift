import Foundation
import Prch

#if !os(watchOS)
  #if !os(watchOS)
    public extension Ecommerce {
      /**
       Get order line item

       Get information about a specific order line item.
       */
      enum GetEcommerceStoresIdOrdersIdLinesId {
        public static let service = Service<Response>(id: "getEcommerceStoresIdOrdersIdLinesId", tag: "ecommerce", method: "GET", path: "/ecommerce/stores/{store_id}/orders/{order_id}/lines/{line_id}", hasBody: false, securityRequirements: [SecurityRequirement(type: "basicAuth", scopes: [])])

        public struct Request: ServiceRequest {
          public struct Options {
            /** A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. */
            public var fields: [String]?

            /** A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. */
            public var excludeFields: [String]?

            /** The store id. */
            public var storeId: String

            /** The id for the order in a store. */
            public var orderId: String

            /** The id for the line item of an order. */
            public var lineId: String

            public init(fields: [String]? = nil, excludeFields: [String]? = nil, storeId: String, orderId: String, lineId: String) {
              self.fields = fields
              self.excludeFields = excludeFields
              self.storeId = storeId
              self.orderId = orderId
              self.lineId = lineId
            }
          }

          public var options: Options

          public init(options: Options) {
            self.options = options
          }

          public typealias ResponseType = Response

          public var service: Service<Response> {
            GetEcommerceStoresIdOrdersIdLinesId.service
          }

          /// convenience initialiser so an Option doesn't have to be created
          public init(fields: [String]? = nil, excludeFields: [String]? = nil, storeId: String, orderId: String, lineId: String) {
            let options = Options(fields: fields, excludeFields: excludeFields, storeId: storeId, orderId: orderId, lineId: lineId)
            self.init(options: options)
          }

          public var path: String {
            service.path.replacingOccurrences(of: "{" + "store_id" + "}", with: "\(options.storeId)").replacingOccurrences(of: "{" + "order_id" + "}", with: "\(options.orderId)").replacingOccurrences(of: "{" + "line_id" + "}", with: "\(options.lineId)")
          }

          public var queryParameters: [String: Any] {
            var params: [String: Any] = [:]
            if let fields = options.fields?.joined(separator: ",") {
              params["fields"] = fields
            }
            if let excludeFields = options.excludeFields?.joined(separator: ",") {
              params["exclude_fields"] = excludeFields
            }
            return params
          }
        }

        public enum Response: DeprecatedResponse, CustomStringConvertible, CustomDebugStringConvertible {
          public typealias APIType = MailchimpAPI
          /** Information about a specific order line. */
          public struct Status200: Model {
            /** A list of link types and descriptions for the API schema documents. */
            public var links: [Links]?

            /** The total discount amount applied to a line item. */
            public var discount: Double?

            /** A unique identifier for an order line item. */
            public var id: String?

            /** The image URL for a product. */
            public var imageURL: String?

            /** The order line item price. */
            public var price: Double?

            /** A unique identifier for the product associated with an order line item. */
            public var productId: String?

            /** The name of the product for an order line item. */
            public var productTitle: String?

            /** A unique identifier for the product variant associated with an order line item. */
            public var productVariantId: String?

            /** The name of the product variant for an order line item. */
            public var productVariantTitle: String?

            /** The order line item quantity. */
            public var quantity: Int?

            /** This object represents a link from the resource where it is found to another resource or action that may be performed. */
            public struct Links: Model {
              /** The HTTP method that should be used when accessing the URL defined in 'href'. */
              public enum Method: String, Codable, Equatable, CaseIterable {
                case get = "GET"
                case post = "POST"
                case put = "PUT"
                case patch = "PATCH"
                case delete = "DELETE"
                case options = "OPTIONS"
                case head = "HEAD"
              }

              /** This property contains a fully-qualified URL that can be called to retrieve the linked resource or perform the linked action. */
              public var href: String?

              /** The HTTP method that should be used when accessing the URL defined in 'href'. */
              public var method: Method?

              /** As with an HTML 'rel' attribute, this describes the type of link. */
              public var rel: String?

              /** For HTTP methods that can receive bodies (POST and PUT), this is a URL representing the schema that the body should conform to. */
              public var schema: String?

              /** For GETs, this is a URL representing the schema that the response should conform to. */
              public var targetSchema: String?

              public init(href: String? = nil, method: Method? = nil, rel: String? = nil, schema: String? = nil, targetSchema: String? = nil) {
                self.href = href
                self.method = method
                self.rel = rel
                self.schema = schema
                self.targetSchema = targetSchema
              }

              public init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: StringCodingKey.self)

                href = try container.decodeIfPresent("href")
                method = try container.decodeIfPresent("method")
                rel = try container.decodeIfPresent("rel")
                schema = try container.decodeIfPresent("schema")
                targetSchema = try container.decodeIfPresent("targetSchema")
              }

              public func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: StringCodingKey.self)

                try container.encodeIfPresent(href, forKey: "href")
                try container.encodeIfPresent(method, forKey: "method")
                try container.encodeIfPresent(rel, forKey: "rel")
                try container.encodeIfPresent(schema, forKey: "schema")
                try container.encodeIfPresent(targetSchema, forKey: "targetSchema")
              }
            }

            public init(links: [Links]? = nil, discount: Double? = nil, id: String? = nil, imageURL: String? = nil, price: Double? = nil, productId: String? = nil, productTitle: String? = nil, productVariantId: String? = nil, productVariantTitle: String? = nil, quantity: Int? = nil) {
              self.links = links
              self.discount = discount
              self.id = id
              self.imageURL = imageURL
              self.price = price
              self.productId = productId
              self.productTitle = productTitle
              self.productVariantId = productVariantId
              self.productVariantTitle = productVariantTitle
              self.quantity = quantity
            }

            public init(from decoder: Decoder) throws {
              let container = try decoder.container(keyedBy: StringCodingKey.self)

              links = try container.decodeArrayIfPresent("_links")
              discount = try container.decodeIfPresent("discount")
              id = try container.decodeIfPresent("id")
              imageURL = try container.decodeIfPresent("image_url")
              price = try container.decodeIfPresent("price")
              productId = try container.decodeIfPresent("product_id")
              productTitle = try container.decodeIfPresent("product_title")
              productVariantId = try container.decodeIfPresent("product_variant_id")
              productVariantTitle = try container.decodeIfPresent("product_variant_title")
              quantity = try container.decodeIfPresent("quantity")
            }

            public func encode(to encoder: Encoder) throws {
              var container = encoder.container(keyedBy: StringCodingKey.self)

              try container.encodeIfPresent(links, forKey: "_links")
              try container.encodeIfPresent(discount, forKey: "discount")
              try container.encodeIfPresent(id, forKey: "id")
              try container.encodeIfPresent(imageURL, forKey: "image_url")
              try container.encodeIfPresent(price, forKey: "price")
              try container.encodeIfPresent(productId, forKey: "product_id")
              try container.encodeIfPresent(productTitle, forKey: "product_title")
              try container.encodeIfPresent(productVariantId, forKey: "product_variant_id")
              try container.encodeIfPresent(productVariantTitle, forKey: "product_variant_title")
              try container.encodeIfPresent(quantity, forKey: "quantity")
            }
          }

          public typealias SuccessType = Status200
          public typealias FailureType = DefaultResponse
          case status200(Status200)

          /** An error generated by the Mailchimp API. */
          case defaultResponse(statusCode: Int, DefaultResponse)

          public var success: Status200? {
            switch self {
            case let .status200(response): return response
            default: return nil
            }
          }

          public var failure: DefaultResponse? {
            switch self {
            case let .defaultResponse(_, response): return response
            default: return nil
            }
          }

          /// either success or failure value. Success is anything in the 200..<300 status code range
          @available(*, unavailable)
          public var _obsolete_responseResult: DeprecatedResponseResult<Status200, DefaultResponse> {
            if let successValue = success {
              return .success(successValue)
            } else if let failureValue = failure {
              return .failure(failureValue)
            } else {
              fatalError("Response does not have success or failure response")
            }
          }

          public var anyResponse: Any {
            switch self {
            case let .status200(response): return response
            case let .defaultResponse(_, response): return response
            }
          }

          public var statusCode: Int {
            switch self {
            case .status200: return 200
            case let .defaultResponse(statusCode, _): return statusCode
            }
          }

          public var successful: Bool {
            switch self {
            case .status200: return true
            case .defaultResponse: return false
            }
          }

          public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
            switch statusCode {
            case 200: self = try .status200(decoder.decode(Status200.self, from: data))
            default: self = try .defaultResponse(statusCode: statusCode, decoder.decode(DefaultResponse.self, from: data))
            }
          }

          public var description: String {
            "\(statusCode) \(successful ? "success" : "failure")"
          }

          public var debugDescription: String {
            var string = description
            let responseString = "\(anyResponse)"
            if responseString != "()" {
              string += "\n\(responseString)"
            }
            return string
          }
        }
      }
    }
  #endif
#endif
