import Foundation
import Prch
#if !os(watchOS)
  public extension ActivityFeed {
    /**
     Get latest chimp chatter

     Return the Chimp Chatter for this account ordered by most recent.
     */
    enum GetActivityFeedChimpChatter {
      public static let service = Service<Response>(id: "getActivityFeedChimpChatter", tag: "activityFeed", method: "GET", path: "/activity-feed/chimp-chatter", hasBody: false, securityRequirements: [SecurityRequirement(type: "basicAuth", scopes: [])])

      public final class Request: Prch.Request<Response, MailchimpAPI> {
        public struct Options {
          /** The number of records to return. Default value is 10. Maximum value is 1000 */
          public var count: Int?

          /** Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. */
          public var offset: Int?

          public init(count: Int? = nil, offset: Int? = nil) {
            self.count = count
            self.offset = offset
          }
        }

        public var options: Options

        public init(options: Options) {
          self.options = options
          super.init(service: GetActivityFeedChimpChatter.service)
        }

        /// convenience initialiser so an Option doesn't have to be created
        public convenience init(count: Int? = nil, offset: Int? = nil) {
          let options = Options(count: count, offset: offset)
          self.init(options: options)
        }

        override public var queryParameters: [String: Any] {
          var params: [String: Any] = [:]
          if let count = options.count {
            params["count"] = count
          }
          if let offset = options.offset {
            params["offset"] = offset
          }
          return params
        }
      }

      public enum Response: Prch.Response, CustomStringConvertible, CustomDebugStringConvertible {
        public typealias APIType = MailchimpAPI
        /** An array of Chimp Chatter messages. There's a maximum of 200 messages present for an account. */
        public struct Status200: Model {
          /** A list of link types and descriptions for the API schema documents. */
          public var links: [Links]?

          /** An array of Chimp Chatter messages. There's a maximum of 200 messages present for an account. */
          public var chimpChatter: [ChimpChatter]?

          /** The total number of items matching the query regardless of pagination. */
          public var totalItems: Int?

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

          /** A Chimp Chatter message */
          public struct ChimpChatter: Model {
            /** The type of activity */
            public enum `Type`: String, Codable, Equatable, CaseIterable {
              case listsnewSubscriber = "lists:new-subscriber"
              case listsunsubscribes = "lists:unsubscribes"
              case listsprofileUpdates = "lists:profile-updates"
              case campaignsfacebookLikes = "campaigns:facebook-likes"
              case campaignsforwardToFriend = "campaigns:forward-to-friend"
              case listsimports = "lists:imports"
            }

            /** If it exists, campaign ID for the associated campaign */
            public var campaignId: String?

            /** If it exists, list ID for the associated list */
            public var listId: String?

            public var message: String?

            public var title: String?

            /** The type of activity */
            public var type: `Type`?

            /** The date and time this activity was updated. */
            public var updateTime: Date?

            /** URL to a report that includes this activity */
            public var url: String?

            public init(campaignId: String? = nil, listId: String? = nil, message: String? = nil, title: String? = nil, type: Type? = nil, updateTime: Date? = nil, url: String? = nil) {
              self.campaignId = campaignId
              self.listId = listId
              self.message = message
              self.title = title
              self.type = type
              self.updateTime = updateTime
              self.url = url
            }

            public init(from decoder: Decoder) throws {
              let container = try decoder.container(keyedBy: StringCodingKey.self)

              campaignId = try container.decodeIfPresent("campaign_id")
              listId = try container.decodeIfPresent("list_id")
              message = try container.decodeIfPresent("message")
              title = try container.decodeIfPresent("title")
              type = try container.decodeIfPresent("type")
              updateTime = try container.decodeIfPresent("update_time")
              url = try container.decodeIfPresent("url")
            }

            public func encode(to encoder: Encoder) throws {
              var container = encoder.container(keyedBy: StringCodingKey.self)

              try container.encodeIfPresent(campaignId, forKey: "campaign_id")
              try container.encodeIfPresent(listId, forKey: "list_id")
              try container.encodeIfPresent(message, forKey: "message")
              try container.encodeIfPresent(title, forKey: "title")
              try container.encodeIfPresent(type, forKey: "type")
              try container.encodeIfPresent(updateTime, forKey: "update_time")
              try container.encodeIfPresent(url, forKey: "url")
            }
          }

          public init(links: [Links]? = nil, chimpChatter: [ChimpChatter]? = nil, totalItems: Int? = nil) {
            self.links = links
            self.chimpChatter = chimpChatter
            self.totalItems = totalItems
          }

          public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: StringCodingKey.self)

            links = try container.decodeArrayIfPresent("_links")
            chimpChatter = try container.decodeArrayIfPresent("chimp_chatter")
            totalItems = try container.decodeIfPresent("total_items")
          }

          public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: StringCodingKey.self)

            try container.encodeIfPresent(links, forKey: "_links")
            try container.encodeIfPresent(chimpChatter, forKey: "chimp_chatter")
            try container.encodeIfPresent(totalItems, forKey: "total_items")
          }
        }

        /** An error generated by the Mailchimp API. Conforms to IETF draft 'draft-nottingham-http-problem-06'. */
        public struct DefaultResponse: Model {
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

          public init(from decoder: Decoder) throws {
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
        }

        public typealias SuccessType = Status200
        public typealias FailureType = DefaultResponse

        /** ChimpChatter Collection */
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
