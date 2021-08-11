//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

extension API.Lists {

    /**
    List recent activity

    Get up to the previous 180 days of daily detailed aggregated activity stats for a list, not including Automation activity.
    */
    public enum GetListsIdActivity {

        public static let service = APIService<Response>(id: "getListsIdActivity", tag: "lists", method: "GET", path: "/lists/{list_id}/activity", hasBody: false, securityRequirements: [SecurityRequirement(type: "basicAuth", scopes: [])])

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. */
                public var fields: [String]?

                /** A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. */
                public var excludeFields: [String]?

                /** The unique ID for the list. */
                public var listId: String

                public init(fields: [String]? = nil, excludeFields: [String]? = nil, listId: String) {
                    self.fields = fields
                    self.excludeFields = excludeFields
                    self.listId = listId
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: GetListsIdActivity.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(fields: [String]? = nil, excludeFields: [String]? = nil, listId: String) {
                let options = Options(fields: fields, excludeFields: excludeFields, listId: listId)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "list_id" + "}", with: "\(self.options.listId)")
            }

            public override var queryParameters: [String: Any] {
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

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {

            /** Up to the previous 180 days of daily detailed aggregated activity stats for a specific list. Does not include AutoResponder or Automation activity. */
            public class Status200: APIModel {

                /** A list of link types and descriptions for the API schema documents. */
                public var links: [Links]?

                /** Recent list activity. */
                public var activity: [Activity]?

                /** The unique id for the list. */
                public var listId: String?

                /** The total number of items matching the query regardless of pagination. */
                public var totalItems: Int?

                /** This object represents a link from the resource where it is found to another resource or action that may be performed. */
                public class Links: APIModel {

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

                    public required init(from decoder: Decoder) throws {
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

                    public func isEqual(to object: Any?) -> Bool {
                      guard let object = object as? Links else { return false }
                      guard self.href == object.href else { return false }
                      guard self.method == object.method else { return false }
                      guard self.rel == object.rel else { return false }
                      guard self.schema == object.schema else { return false }
                      guard self.targetSchema == object.targetSchema else { return false }
                      return true
                    }

                    public static func == (lhs: Links, rhs: Links) -> Bool {
                        return lhs.isEqual(to: rhs)
                    }
                }

                /** One day's worth of list activity. Doesn't include Automation activity. */
                public class Activity: APIModel {

                    /** A list of link types and descriptions for the API schema documents. */
                    public var links: [Links]?

                    /** The date for the activity summary. */
                    public var day: String?

                    /** The total number of emails sent on the date for the activity summary. */
                    public var emailsSent: Int?

                    /** The number of hard bounces. */
                    public var hardBounce: Int?

                    /** The number of subscribers who may have been added outside of the [double opt-in process](https://mailchimp.com/help/about-double-opt-in/), such as imports or API activity. */
                    public var otherAdds: Int?

                    /** The number of subscribers who may have been removed outside of unsubscribing or reporting an email as spam (for example, deleted subscribers). */
                    public var otherRemoves: Int?

                    /** The number of clicks. */
                    public var recipientClicks: Int?

                    /** The number of soft bounces */
                    public var softBounce: Int?

                    /** The number of subscribes. */
                    public var subs: Int?

                    /** The number of unique opens. */
                    public var uniqueOpens: Int?

                    /** The number of unsubscribes. */
                    public var unsubs: Int?

                    /** This object represents a link from the resource where it is found to another resource or action that may be performed. */
                    public class Links: APIModel {

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

                        public required init(from decoder: Decoder) throws {
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

                        public func isEqual(to object: Any?) -> Bool {
                          guard let object = object as? Links else { return false }
                          guard self.href == object.href else { return false }
                          guard self.method == object.method else { return false }
                          guard self.rel == object.rel else { return false }
                          guard self.schema == object.schema else { return false }
                          guard self.targetSchema == object.targetSchema else { return false }
                          return true
                        }

                        public static func == (lhs: Links, rhs: Links) -> Bool {
                            return lhs.isEqual(to: rhs)
                        }
                    }

                    public init(links: [Links]? = nil, day: String? = nil, emailsSent: Int? = nil, hardBounce: Int? = nil, otherAdds: Int? = nil, otherRemoves: Int? = nil, recipientClicks: Int? = nil, softBounce: Int? = nil, subs: Int? = nil, uniqueOpens: Int? = nil, unsubs: Int? = nil) {
                        self.links = links
                        self.day = day
                        self.emailsSent = emailsSent
                        self.hardBounce = hardBounce
                        self.otherAdds = otherAdds
                        self.otherRemoves = otherRemoves
                        self.recipientClicks = recipientClicks
                        self.softBounce = softBounce
                        self.subs = subs
                        self.uniqueOpens = uniqueOpens
                        self.unsubs = unsubs
                    }

                    public required init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: StringCodingKey.self)

                        links = try container.decodeArrayIfPresent("_links")
                        day = try container.decodeIfPresent("day")
                        emailsSent = try container.decodeIfPresent("emails_sent")
                        hardBounce = try container.decodeIfPresent("hard_bounce")
                        otherAdds = try container.decodeIfPresent("other_adds")
                        otherRemoves = try container.decodeIfPresent("other_removes")
                        recipientClicks = try container.decodeIfPresent("recipient_clicks")
                        softBounce = try container.decodeIfPresent("soft_bounce")
                        subs = try container.decodeIfPresent("subs")
                        uniqueOpens = try container.decodeIfPresent("unique_opens")
                        unsubs = try container.decodeIfPresent("unsubs")
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: StringCodingKey.self)

                        try container.encodeIfPresent(links, forKey: "_links")
                        try container.encodeIfPresent(day, forKey: "day")
                        try container.encodeIfPresent(emailsSent, forKey: "emails_sent")
                        try container.encodeIfPresent(hardBounce, forKey: "hard_bounce")
                        try container.encodeIfPresent(otherAdds, forKey: "other_adds")
                        try container.encodeIfPresent(otherRemoves, forKey: "other_removes")
                        try container.encodeIfPresent(recipientClicks, forKey: "recipient_clicks")
                        try container.encodeIfPresent(softBounce, forKey: "soft_bounce")
                        try container.encodeIfPresent(subs, forKey: "subs")
                        try container.encodeIfPresent(uniqueOpens, forKey: "unique_opens")
                        try container.encodeIfPresent(unsubs, forKey: "unsubs")
                    }

                    public func isEqual(to object: Any?) -> Bool {
                      guard let object = object as? Activity else { return false }
                      guard self.links == object.links else { return false }
                      guard self.day == object.day else { return false }
                      guard self.emailsSent == object.emailsSent else { return false }
                      guard self.hardBounce == object.hardBounce else { return false }
                      guard self.otherAdds == object.otherAdds else { return false }
                      guard self.otherRemoves == object.otherRemoves else { return false }
                      guard self.recipientClicks == object.recipientClicks else { return false }
                      guard self.softBounce == object.softBounce else { return false }
                      guard self.subs == object.subs else { return false }
                      guard self.uniqueOpens == object.uniqueOpens else { return false }
                      guard self.unsubs == object.unsubs else { return false }
                      return true
                    }

                    public static func == (lhs: Activity, rhs: Activity) -> Bool {
                        return lhs.isEqual(to: rhs)
                    }
                }

                public init(links: [Links]? = nil, activity: [Activity]? = nil, listId: String? = nil, totalItems: Int? = nil) {
                    self.links = links
                    self.activity = activity
                    self.listId = listId
                    self.totalItems = totalItems
                }

                public required init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: StringCodingKey.self)

                    links = try container.decodeArrayIfPresent("_links")
                    activity = try container.decodeArrayIfPresent("activity")
                    listId = try container.decodeIfPresent("list_id")
                    totalItems = try container.decodeIfPresent("total_items")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: StringCodingKey.self)

                    try container.encodeIfPresent(links, forKey: "_links")
                    try container.encodeIfPresent(activity, forKey: "activity")
                    try container.encodeIfPresent(listId, forKey: "list_id")
                    try container.encodeIfPresent(totalItems, forKey: "total_items")
                }

                public func isEqual(to object: Any?) -> Bool {
                  guard let object = object as? Status200 else { return false }
                  guard self.links == object.links else { return false }
                  guard self.activity == object.activity else { return false }
                  guard self.listId == object.listId else { return false }
                  guard self.totalItems == object.totalItems else { return false }
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
