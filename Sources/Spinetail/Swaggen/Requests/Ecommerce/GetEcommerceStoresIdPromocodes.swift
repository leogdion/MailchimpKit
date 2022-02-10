import Foundation
import Prch
#if !os(watchOS)
  public extension Ecommerce {
    /**
     List promo codes

     Get information about a store's promo codes.
     */
    enum GetEcommerceStoresIdPromocodes {
      public static let service = Service<Response>(id: "getEcommerceStoresIdPromocodes", tag: "ecommerce", method: "GET", path: "/ecommerce/stores/{store_id}/promo-rules/{promo_rule_id}/promo-codes", hasBody: false, securityRequirements: [SecurityRequirement(type: "basicAuth", scopes: [])])

      public final class Request: Prch.Request<Response, MailchimpAPI> {
        public struct Options {
          /** A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. */
          public var fields: [String]?

          /** A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. */
          public var excludeFields: [String]?

          /** The number of records to return. Default value is 10. Maximum value is 1000 */
          public var count: Int?

          /** Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. */
          public var offset: Int?

          /** The id for the promo rule of a store. */
          public var promoRuleId: String

          /** The store id. */
          public var storeId: String

          public init(fields: [String]? = nil, excludeFields: [String]? = nil, count: Int? = nil, offset: Int? = nil, promoRuleId: String, storeId: String) {
            self.fields = fields
            self.excludeFields = excludeFields
            self.count = count
            self.offset = offset
            self.promoRuleId = promoRuleId
            self.storeId = storeId
          }
        }

        public var options: Options

        public init(options: Options) {
          self.options = options
          super.init(service: GetEcommerceStoresIdPromocodes.service)
        }

        /// convenience initialiser so an Option doesn't have to be created
        public convenience init(fields: [String]? = nil, excludeFields: [String]? = nil, count: Int? = nil, offset: Int? = nil, promoRuleId: String, storeId: String) {
          let options = Options(fields: fields, excludeFields: excludeFields, count: count, offset: offset, promoRuleId: promoRuleId, storeId: storeId)
          self.init(options: options)
        }

        override public var path: String {
          super.path.replacingOccurrences(of: "{" + "promo_rule_id" + "}", with: "\(self.options.promoRuleId)").replacingOccurrences(of: "{" + "store_id" + "}", with: "\(self.options.storeId)")
        }

        override public var queryParameters: [String: Any] {
          var params: [String: Any] = [:]
          if let fields = options.fields?.joined(separator: ",") {
            params["fields"] = fields
          }
          if let excludeFields = options.excludeFields?.joined(separator: ",") {
            params["exclude_fields"] = excludeFields
          }
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
        /** A collection of the store's promo codes. */
        public struct Status200: Model {
          /** A list of link types and descriptions for the API schema documents. */
          public var links: [Links]?

          /** An array of objects, each representing promo codes defined for a store. */
          public var promoCodes: [PromoCodes]?

          /** The store id. */
          public var storeId: String?

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

          /** Information about an Ecommerce Store's specific Promo Code */
          public struct PromoCodes: Model {
            /** A list of link types and descriptions for the API schema documents. */
            public var links: [Links]?

            /** The discount code. Restricted to UTF-8 characters with max length 50. */
            public var code: String?

            /** The date and time the promotion was created in ISO 8601 format. */
            public var createdAtForeign: Date?

            /** Whether the promo code is currently enabled. */
            public var enabled: Bool?

            /** A unique identifier for the promo Code. */
            public var id: String?

            /** The url that should be used in the promotion campaign restricted to UTF-8 characters with max length 2000. */
            public var redemptionURL: String?

            /** The date and time the promotion was updated in ISO 8601 format. */
            public var updatedAtForeign: Date?

            /** Number of times promo code has been used. */
            public var usageCount: Int?

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

            public init(links: [Links]? = nil, code: String? = nil, createdAtForeign: Date? = nil, enabled: Bool? = nil, id: String? = nil, redemptionURL: String? = nil, updatedAtForeign: Date? = nil, usageCount: Int? = nil) {
              self.links = links
              self.code = code
              self.createdAtForeign = createdAtForeign
              self.enabled = enabled
              self.id = id
              self.redemptionURL = redemptionURL
              self.updatedAtForeign = updatedAtForeign
              self.usageCount = usageCount
            }

            public init(from decoder: Decoder) throws {
              let container = try decoder.container(keyedBy: StringCodingKey.self)

              links = try container.decodeArrayIfPresent("_links")
              code = try container.decodeIfPresent("code")
              createdAtForeign = try container.decodeIfPresent("created_at_foreign")
              enabled = try container.decodeIfPresent("enabled")
              id = try container.decodeIfPresent("id")
              redemptionURL = try container.decodeIfPresent("redemption_url")
              updatedAtForeign = try container.decodeIfPresent("updated_at_foreign")
              usageCount = try container.decodeIfPresent("usage_count")
            }

            public func encode(to encoder: Encoder) throws {
              var container = encoder.container(keyedBy: StringCodingKey.self)

              try container.encodeIfPresent(links, forKey: "_links")
              try container.encodeIfPresent(code, forKey: "code")
              try container.encodeIfPresent(createdAtForeign, forKey: "created_at_foreign")
              try container.encodeIfPresent(enabled, forKey: "enabled")
              try container.encodeIfPresent(id, forKey: "id")
              try container.encodeIfPresent(redemptionURL, forKey: "redemption_url")
              try container.encodeIfPresent(updatedAtForeign, forKey: "updated_at_foreign")
              try container.encodeIfPresent(usageCount, forKey: "usage_count")
            }
          }

          public init(links: [Links]? = nil, promoCodes: [PromoCodes]? = nil, storeId: String? = nil, totalItems: Int? = nil) {
            self.links = links
            self.promoCodes = promoCodes
            self.storeId = storeId
            self.totalItems = totalItems
          }

          public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: StringCodingKey.self)

            links = try container.decodeArrayIfPresent("_links")
            promoCodes = try container.decodeArrayIfPresent("promo_codes")
            storeId = try container.decodeIfPresent("store_id")
            totalItems = try container.decodeIfPresent("total_items")
          }

          public func encode(to encoder: Encoder) throws {
            var container = encoder.container(keyedBy: StringCodingKey.self)

            try container.encodeIfPresent(links, forKey: "_links")
            try container.encodeIfPresent(promoCodes, forKey: "promo_codes")
            try container.encodeIfPresent(storeId, forKey: "store_id")
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
