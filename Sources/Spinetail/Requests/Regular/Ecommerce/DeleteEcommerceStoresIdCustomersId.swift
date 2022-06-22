import Foundation
import Prch

#if !os(watchOS)
  #if !os(watchOS)
    public extension Ecommerce {
      /**
       Delete customer

       Delete a customer from a store.
       */
      enum DeleteEcommerceStoresIdCustomersId {
        public static let service = Service<Response>(id: "deleteEcommerceStoresIdCustomersId", tag: "ecommerce", method: "DELETE", path: "/ecommerce/stores/{store_id}/customers/{customer_id}", hasBody: false, securityRequirements: [SecurityRequirement(type: "basicAuth", scopes: [])])

        public struct Request: ServiceRequest {
          public struct Options {
            /** The store id. */
            public var storeId: String

            /** The id for the customer of a store. */
            public var customerId: String

            public init(storeId: String, customerId: String) {
              self.storeId = storeId
              self.customerId = customerId
            }
          }

          public var options: Options

          public init(options: Options) {
            self.options = options
          }

          public typealias ResponseType = Response

          public var service: Service<Response> {
            DeleteEcommerceStoresIdCustomersId.service
          }

          /// convenience initialiser so an Option doesn't have to be created
          public init(storeId: String, customerId: String) {
            let options = Options(storeId: storeId, customerId: customerId)
            self.init(options: options)
          }

          public var path: String {
            service.path.replacingOccurrences(of: "{" + "store_id" + "}", with: "\(options.storeId)").replacingOccurrences(of: "{" + "customer_id" + "}", with: "\(options.customerId)")
          }
        }

        public enum Response: Prch.Response, CustomStringConvertible, CustomDebugStringConvertible {
public var response: ClientResult<Void, DefaultResponse> {
        switch self {
        case .defaultResponse(statusCode: let statusCode, let response):
          return .defaultResponse(statusCode, response)
        case .status204:
          return .success(())
        }
      }
          public typealias APIType = Mailchimp.API

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
