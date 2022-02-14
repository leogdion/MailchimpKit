import Foundation
import Prch

#if !os(watchOS)
  #if !os(watchOS)
    public extension Ecommerce {
      /**
       Delete product variant

       Delete a product variant.
       */
      enum DeleteEcommerceStoresIdProductsIdVariantsId {
        public static let service = Service<Response>(id: "deleteEcommerceStoresIdProductsIdVariantsId", tag: "ecommerce", method: "DELETE", path: "/ecommerce/stores/{store_id}/products/{product_id}/variants/{variant_id}", hasBody: false, securityRequirements: [SecurityRequirement(type: "basicAuth", scopes: [])])

        public struct Request: ServiceRequest {
          public struct Options {
            /** The store id. */
            public var storeId: String

            /** The id for the product of a store. */
            public var productId: String

            /** The id for the product variant. */
            public var variantId: String

            public init(storeId: String, productId: String, variantId: String) {
              self.storeId = storeId
              self.productId = productId
              self.variantId = variantId
            }
          }

          public var options: Options

          public init(options: Options) {
            self.options = options
          }

          public typealias ResponseType = Response

          public var service: Service<Response> {
            DeleteEcommerceStoresIdProductsIdVariantsId.service
          }

          /// convenience initialiser so an Option doesn't have to be created
          public init(storeId: String, productId: String, variantId: String) {
            let options = Options(storeId: storeId, productId: productId, variantId: variantId)
            self.init(options: options)
          }

          public var path: String {
            service.path.replacingOccurrences(of: "{" + "store_id" + "}", with: "\(options.storeId)").replacingOccurrences(of: "{" + "product_id" + "}", with: "\(options.productId)").replacingOccurrences(of: "{" + "variant_id" + "}", with: "\(options.variantId)")
          }
        }

        public enum Response: DeprecatedResponse, CustomStringConvertible, CustomDebugStringConvertible {
          public typealias APIType = MailchimpAPI

          public typealias SuccessType = Void
          public typealias FailureType = DefaultResponse

          /** Empty Response */
          case status204

          /** An error generated by the Mailchimp API. */
          case defaultResponse(statusCode: Int, DefaultResponse)

          public var success: Void? {
            switch self {
            case .status204: return ()
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
          public var _obsolete_responseResult: DeprecatedResponseResult<Void, DefaultResponse> {
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
            case let .defaultResponse(_, response): return response
            default: return ()
            }
          }

          public var statusCode: Int {
            switch self {
            case .status204: return 204
            case let .defaultResponse(statusCode, _): return statusCode
            }
          }

          public var successful: Bool {
            switch self {
            case .status204: return true
            case .defaultResponse: return false
            }
          }

          public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
            switch statusCode {
            case 204: self = .status204
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
