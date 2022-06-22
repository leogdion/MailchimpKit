import Foundation
import Prch

#if !os(watchOS)
  public extension Reports {
    /**
     Get opened campaign subscriber

     Get information about a specific subscriber who opened a campaign.
     */
    enum GetReportsIdOpenDetailsIdMembersId {
      public static let service = Service<Response>(id: "getReportsIdOpenDetailsIdMembersId", tag: "reports", method: "GET", path: "/reports/{campaign_id}/open-details/{subscriber_hash}", hasBody: false, securityRequirements: [SecurityRequirement(type: "basicAuth", scopes: [])])

      public struct Request: ServiceRequest {
        public struct Options {
          /** A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. */
          public var fields: [String]?

          /** A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. */
          public var excludeFields: [String]?

          /** The unique id for the campaign. */
          public var campaignId: String

          /** The MD5 hash of the lowercase version of the list member's email address. */
          public var subscriberHash: String

          public init(fields: [String]? = nil, excludeFields: [String]? = nil, campaignId: String, subscriberHash: String) {
            self.fields = fields
            self.excludeFields = excludeFields
            self.campaignId = campaignId
            self.subscriberHash = subscriberHash
          }
        }

        public var options: Options

        public init(options: Options) {
          self.options = options
        }

        public typealias ResponseType = Response

        public var service: Service<Response> {
          GetReportsIdOpenDetailsIdMembersId.service
        }

        /// convenience initialiser so an Option doesn't have to be created
        public init(fields: [String]? = nil, excludeFields: [String]? = nil, campaignId: String, subscriberHash: String) {
          let options = Options(fields: fields, excludeFields: excludeFields, campaignId: campaignId, subscriberHash: subscriberHash)
          self.init(options: options)
        }

        public var path: String {
          service.path.replacingOccurrences(of: "{" + "campaign_id" + "}", with: "\(options.campaignId)").replacingOccurrences(of: "{" + "subscriber_hash" + "}", with: "\(options.subscriberHash)")
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

      public enum Response: Prch.Response, CustomStringConvertible, CustomDebugStringConvertible {
public var response: ClientResult<Status200, DefaultResponse> {
        switch self {
        case .defaultResponse(statusCode: let statusCode, let response):
          return .defaultResponse(statusCode, response)
        case .status200(let response):
          return .success(response)
        }
      }
        public typealias APIType = Mailchimp.API
        /** A list of a member's opens activity in a specific campaign. */
        public struct Status200: Model {
          /** A list of link types and descriptions for the API schema documents. */
          public var links: [Links]?

          /** The unique id for the campaign. */
          public var campaignId: String?

          /** The status of the member, namely if they are subscribed, unsubscribed, deleted, non-subscribed, transactional, pending, or need reconfirmation. */
          public var contactStatus: String?

          /** Email address for a subscriber. */
          public var emailAddress: String?

          /** The MD5 hash of the lowercase version of the list member's email address. */
          public var emailId: String?

          /** The unique id for the list. */
          public var listId: String?

          /** The status of the list used, namely if it's deleted or disabled. */
          public var listIsActive: Bool?

          /** A dictionary of merge fields ([audience fields](https://mailchimp.com/help/getting-started-with-merge-tags/)) where the keys are the merge tags. For example, {"FNAME":"Freddie"} */
          public var mergeFields: [String: AnyCodable]?

          /** An array of timestamps for each time a list member opened the campaign. If a list member opens an email multiple times, this will return a separate timestamp for each open event. */
          public var opens: [Opens]?

          /** The total number of times the this campaign was opened by the list member. */
          public var opensCount: Int?

          /** [VIP status](https://mailchimp.com/help/designate-and-send-to-vip-contacts/) for subscriber. */
          public var vip: Bool?

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

          /** A summary of the interaction with the campaign. */
          public struct Opens: Model {
            /** The date and time recorded for the action in ISO 8601 format. */
            public var timestamp: Date?

            public init(timestamp: Date? = nil) {
              self.timestamp = timestamp
            }

            public init(from decoder: Decoder) throws {
              let container = try decoder.container(keyedBy: StringCodingKey.self)

              timestamp = try container.decodeIfPresent("timestamp")
            }

            public func encode(to encoder: Encoder) throws {
              var container = encoder.container(keyedBy: StringCodingKey.self)

              try container.encodeIfPresent(timestamp, forKey: "timestamp")
            }
          }

          public init(links: [Links]? = nil, campaignId: String? = nil, contactStatus: String? = nil, emailAddress: String? = nil, emailId: String? = nil, listId: String? = nil, listIsActive: Bool? = nil, mergeFields: [String: AnyCodable]? = nil, opens: [Opens]? = nil, opensCount: Int? = nil, vip: Bool? = nil) {
            self.links = links
            self.campaignId = campaignId
            self.contactStatus = contactStatus
            self.emailAddress = emailAddress
            self.emailId = emailId
            self.listId = listId
            self.listIsActive = listIsActive
            self.mergeFields = mergeFields
            self.opens = opens
            self.opensCount = opensCount
            self.vip = vip
          }

          public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: StringCodingKey.self)

            links = try container.decodeArrayIfPresent("_links")
            campaignId = try container.decodeIfPresent("campaign_id")
            contactStatus = try container.decodeIfPresent("contact_status")
            emailAddress = try container.decodeIfPresent("email_address")
            emailId = try container.decodeIfPresent("email_id")
            listId = try container.decodeIfPresent("list_id")
            listIsActive = try container.decodeIfPresent("list_is_active")
            mergeFields = try container.decodeAnyCodableDictionary("merge_fields")
            opens = try container.decodeArrayIfPresent("opens")
            opensCount = try container.decodeIfPresent("opens_count")
            vip = try container.decodeIfPresent("vip")
          }

          public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: StringCodingKey.self)

            try container.encodeIfPresent(links, forKey: "_links")
            try container.encodeIfPresent(campaignId, forKey: "campaign_id")
            try container.encodeIfPresent(contactStatus, forKey: "contact_status")
            try container.encodeIfPresent(emailAddress, forKey: "email_address")
            try container.encodeIfPresent(emailId, forKey: "email_id")
            try container.encodeIfPresent(listId, forKey: "list_id")
            try container.encodeIfPresent(listIsActive, forKey: "list_is_active")
            try container.encodeAnyIfPresent(mergeFields, forKey: "merge_fields")
            try container.encodeIfPresent(opens, forKey: "opens")
            try container.encodeIfPresent(opensCount, forKey: "opens_count")
            try container.encodeIfPresent(vip, forKey: "vip")
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
