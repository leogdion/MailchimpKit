//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

extension API.Ecommerce {

    /**
    Delete store

    Delete a store. Deleting a store will also delete any associated subresources, including Customers, Orders, Products, and Carts.
    */
    public enum DeleteEcommerceStoresId {

        public static let service = APIService<Response>(id: "deleteEcommerceStoresId", tag: "ecommerce", method: "DELETE", path: "/ecommerce/stores/{store_id}", hasBody: false, securityRequirements: [SecurityRequirement(type: "basicAuth", scopes: [])])

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** The store id. */
                public var storeId: String

                public init(storeId: String) {
                    self.storeId = storeId
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: DeleteEcommerceStoresId.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(storeId: String) {
                let options = Options(storeId: storeId)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "store_id" + "}", with: "\(self.options.storeId)")
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {

            /** An error generated by the Mailchimp API. Conforms to IETF draft 'draft-nottingham-http-problem-06'. */
            public class DefaultResponse: APIModel {

                /** A human-readable explanation specific to this occurrence of the problem. [Learn more about errors](/developer/guides/get-started-with-mailchimp-api-3/#Errors). */
                public var detail: String

                /** A string that identifies this specific occurrence of the problem. Please provide this ID when contacting support. */
                public var instance: String

                /** The HTTP status code (RFC2616, Section 6) generated by the origin server for this occurrence of the problem. */
                public var status: Int

                /** A short, human-readable summary of the problem type. It shouldn't change based on the occurrence of the problem, except for purposes of localization. */
                public var title: String

                /** An absolute URI that identifies the problem type. When dereferenced, it should provide human-readable documentation for the problem type. */
                public var type: String

                public init(detail: String, instance: String, status: Int, title: String, type: String) {
                    self.detail = detail
                    self.instance = instance
                    self.status = status
                    self.title = title
                    self.type = type
                }

                public required init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: StringCodingKey.self)

                    detail = try container.decode("detail")
                    instance = try container.decode("instance")
                    status = try container.decode("status")
                    title = try container.decode("title")
                    type = try container.decode("type")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: StringCodingKey.self)

                    try container.encode(detail, forKey: "detail")
                    try container.encode(instance, forKey: "instance")
                    try container.encode(status, forKey: "status")
                    try container.encode(title, forKey: "title")
                    try container.encode(type, forKey: "type")
                }

                public func isEqual(to object: Any?) -> Bool {
                  guard let object = object as? DefaultResponse else { return false }
                  guard self.detail == object.detail else { return false }
                  guard self.instance == object.instance else { return false }
                  guard self.status == object.status else { return false }
                  guard self.title == object.title else { return false }
                  guard self.type == object.type else { return false }
                  return true
                }

                public static func == (lhs: DefaultResponse, rhs: DefaultResponse) -> Bool {
                    return lhs.isEqual(to: rhs)
                }
            }
            public typealias SuccessType = [String: Any]

            /** Empty Response */
            case status204([String: Any])

            /** An error generated by the Mailchimp API. */
            case defaultResponse(statusCode: Int, DefaultResponse)

            public var success: [String: Any]? {
                switch self {
                case .status204(let response): return response
                default: return nil
                }
            }

            public var failure: DefaultResponse? {
                switch self {
                case .defaultResponse(_, let response): return response
                default: return nil
                }
            }

            /// either success or failure value. Success is anything in the 200..<300 status code range
            public var responseResult: APIResponseResult<[String: Any], DefaultResponse> {
                if let successValue = success {
                    return .success(successValue)
                } else if let failureValue = failure {
                    return .failure(failureValue)
                } else {
                    fatalError("Response does not have success or failure response")
                }
            }

            public var response: Any {
                switch self {
                case .status204(let response): return response
                case .defaultResponse(_, let response): return response
                }
            }

            public var statusCode: Int {
                switch self {
                case .status204: return 204
                case .defaultResponse(let statusCode, _): return statusCode
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
                case 204: self = try .status204(decoder.decodeAny([String: Any].self, from: data))
                default: self = try .defaultResponse(statusCode: statusCode, decoder.decode(DefaultResponse.self, from: data))
                }
            }

            public var description: String {
                return "\(statusCode) \(successful ? "success" : "failure")"
            }

            public var debugDescription: String {
                var string = description
                let responseString = "\(response)"
                if responseString != "()" {
                    string += "\n\(responseString)"
                }
                return string
            }
        }
    }
}
