//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

extension API.Ping {

    /**
    Ping

    A health check for the API that won't return any account-specific information.
    */
    public enum GetPing {

        public static let service = APIService<Response>(id: "getPing", tag: "ping", method: "GET", path: "/ping", hasBody: false, securityRequirements: [SecurityRequirement(type: "basicAuth", scopes: [])])

        public final class Request: APIRequest<Response> {

            public init() {
                super.init(service: GetPing.service)
            }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {

            /** API health status. */
            public class Status200: APIModel {

                /** This will return a constant string value if the request is successful. Ex. "Everything's Chimpy!" */
                public var healthStatus: String?

                public init(healthStatus: String? = nil) {
                    self.healthStatus = healthStatus
                }

                public required init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: StringCodingKey.self)

                    healthStatus = try container.decodeIfPresent("health_status")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: StringCodingKey.self)

                    try container.encodeIfPresent(healthStatus, forKey: "health_status")
                }

                public func isEqual(to object: Any?) -> Bool {
                  guard let object = object as? Status200 else { return false }
                  guard self.healthStatus == object.healthStatus else { return false }
                  return true
                }

                public static func == (lhs: Status200, rhs: Status200) -> Bool {
                    return lhs.isEqual(to: rhs)
                }
            }

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
            public typealias SuccessType = Status200
            case status200(Status200)

            /** An error generated by the Mailchimp API. */
            case defaultResponse(statusCode: Int, DefaultResponse)

            public var success: Status200? {
                switch self {
                case .status200(let response): return response
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
            public var responseResult: APIResponseResult<Status200, DefaultResponse> {
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
                case .status200(let response): return response
                case .defaultResponse(_, let response): return response
                }
            }

            public var statusCode: Int {
                switch self {
                case .status200: return 200
                case .defaultResponse(let statusCode, _): return statusCode
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
