//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

extension API.Ecommerce {

    /**
    Get customer info

    Get information about a specific customer.
    */
    public enum GetEcommerceStoresIdCustomersId {

        public static let service = APIService<Response>(id: "getEcommerceStoresIdCustomersId", tag: "ecommerce", method: "GET", path: "/ecommerce/stores/{store_id}/customers/{customer_id}", hasBody: false, securityRequirements: [SecurityRequirement(type: "basicAuth", scopes: [])])

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. */
                public var fields: [String]?

                /** A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. */
                public var excludeFields: [String]?

                /** The store id. */
                public var storeId: String

                /** The id for the customer of a store. */
                public var customerId: String

                public init(fields: [String]? = nil, excludeFields: [String]? = nil, storeId: String, customerId: String) {
                    self.fields = fields
                    self.excludeFields = excludeFields
                    self.storeId = storeId
                    self.customerId = customerId
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: GetEcommerceStoresIdCustomersId.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(fields: [String]? = nil, excludeFields: [String]? = nil, storeId: String, customerId: String) {
                let options = Options(fields: fields, excludeFields: excludeFields, storeId: storeId, customerId: customerId)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "store_id" + "}", with: "\(self.options.storeId)").replacingOccurrences(of: "{" + "customer_id" + "}", with: "\(self.options.customerId)")
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

            /** Information about a specific customer. */
            public class Status200: APIModel {

                /** A list of link types and descriptions for the API schema documents. */
                public var links: [Links]?

                /** The customer's address. */
                public var address: Address?

                /** The customer's company. */
                public var company: String?

                /** The date and time the customer was created in ISO 8601 format. */
                public var createdAt: DateTime?

                /** The customer's email address. */
                public var emailAddress: String?

                /** The customer's first name. */
                public var firstName: String?

                /** A unique identifier for the customer. */
                public var id: String?

                /** The customer's last name. */
                public var lastName: String?

                /** The customer's opt-in status. This value will never overwrite the opt-in status of a pre-existing Mailchimp list member, but will apply to list members that are added through the e-commerce API endpoints. Customers who don't opt in to your Mailchimp list [will be added as `Transactional` members](https://mailchimp.com/developer/marketing/docs/e-commerce/#customers). */
                public var optInStatus: Bool?

                /** The customer's total order count. */
                public var ordersCount: Int?

                /** The total amount the customer has spent. */
                public var totalSpent: Double?

                /** The date and time the customer was last updated in ISO 8601 format. */
                public var updatedAt: DateTime?

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

                /** The customer's address. */
                public class Address: APIModel {

                    /** The mailing address of the customer. */
                    public var address1: String?

                    /** An additional field for the customer's mailing address. */
                    public var address2: String?

                    /** The city the customer is located in. */
                    public var city: String?

                    /** The customer's country. */
                    public var country: String?

                    /** The two-letter code for the customer's country. */
                    public var countryCode: String?

                    /** The customer's postal or zip code. */
                    public var postalCode: String?

                    /** The customer's state name or normalized province. */
                    public var province: String?

                    /** The two-letter code for the customer's province or state. */
                    public var provinceCode: String?

                    public init(address1: String? = nil, address2: String? = nil, city: String? = nil, country: String? = nil, countryCode: String? = nil, postalCode: String? = nil, province: String? = nil, provinceCode: String? = nil) {
                        self.address1 = address1
                        self.address2 = address2
                        self.city = city
                        self.country = country
                        self.countryCode = countryCode
                        self.postalCode = postalCode
                        self.province = province
                        self.provinceCode = provinceCode
                    }

                    public required init(from decoder: Decoder) throws {
                        let container = try decoder.container(keyedBy: StringCodingKey.self)

                        address1 = try container.decodeIfPresent("address1")
                        address2 = try container.decodeIfPresent("address2")
                        city = try container.decodeIfPresent("city")
                        country = try container.decodeIfPresent("country")
                        countryCode = try container.decodeIfPresent("country_code")
                        postalCode = try container.decodeIfPresent("postal_code")
                        province = try container.decodeIfPresent("province")
                        provinceCode = try container.decodeIfPresent("province_code")
                    }

                    public func encode(to encoder: Encoder) throws {
                        var container = encoder.container(keyedBy: StringCodingKey.self)

                        try container.encodeIfPresent(address1, forKey: "address1")
                        try container.encodeIfPresent(address2, forKey: "address2")
                        try container.encodeIfPresent(city, forKey: "city")
                        try container.encodeIfPresent(country, forKey: "country")
                        try container.encodeIfPresent(countryCode, forKey: "country_code")
                        try container.encodeIfPresent(postalCode, forKey: "postal_code")
                        try container.encodeIfPresent(province, forKey: "province")
                        try container.encodeIfPresent(provinceCode, forKey: "province_code")
                    }

                    public func isEqual(to object: Any?) -> Bool {
                      guard let object = object as? Address else { return false }
                      guard self.address1 == object.address1 else { return false }
                      guard self.address2 == object.address2 else { return false }
                      guard self.city == object.city else { return false }
                      guard self.country == object.country else { return false }
                      guard self.countryCode == object.countryCode else { return false }
                      guard self.postalCode == object.postalCode else { return false }
                      guard self.province == object.province else { return false }
                      guard self.provinceCode == object.provinceCode else { return false }
                      return true
                    }

                    public static func == (lhs: Address, rhs: Address) -> Bool {
                        return lhs.isEqual(to: rhs)
                    }
                }

                public init(links: [Links]? = nil, address: Address? = nil, company: String? = nil, createdAt: DateTime? = nil, emailAddress: String? = nil, firstName: String? = nil, id: String? = nil, lastName: String? = nil, optInStatus: Bool? = nil, ordersCount: Int? = nil, totalSpent: Double? = nil, updatedAt: DateTime? = nil) {
                    self.links = links
                    self.address = address
                    self.company = company
                    self.createdAt = createdAt
                    self.emailAddress = emailAddress
                    self.firstName = firstName
                    self.id = id
                    self.lastName = lastName
                    self.optInStatus = optInStatus
                    self.ordersCount = ordersCount
                    self.totalSpent = totalSpent
                    self.updatedAt = updatedAt
                }

                public required init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: StringCodingKey.self)

                    links = try container.decodeArrayIfPresent("_links")
                    address = try container.decodeIfPresent("address")
                    company = try container.decodeIfPresent("company")
                    createdAt = try container.decodeIfPresent("created_at")
                    emailAddress = try container.decodeIfPresent("email_address")
                    firstName = try container.decodeIfPresent("first_name")
                    id = try container.decodeIfPresent("id")
                    lastName = try container.decodeIfPresent("last_name")
                    optInStatus = try container.decodeIfPresent("opt_in_status")
                    ordersCount = try container.decodeIfPresent("orders_count")
                    totalSpent = try container.decodeIfPresent("total_spent")
                    updatedAt = try container.decodeIfPresent("updated_at")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: StringCodingKey.self)

                    try container.encodeIfPresent(links, forKey: "_links")
                    try container.encodeIfPresent(address, forKey: "address")
                    try container.encodeIfPresent(company, forKey: "company")
                    try container.encodeIfPresent(createdAt, forKey: "created_at")
                    try container.encodeIfPresent(emailAddress, forKey: "email_address")
                    try container.encodeIfPresent(firstName, forKey: "first_name")
                    try container.encodeIfPresent(id, forKey: "id")
                    try container.encodeIfPresent(lastName, forKey: "last_name")
                    try container.encodeIfPresent(optInStatus, forKey: "opt_in_status")
                    try container.encodeIfPresent(ordersCount, forKey: "orders_count")
                    try container.encodeIfPresent(totalSpent, forKey: "total_spent")
                    try container.encodeIfPresent(updatedAt, forKey: "updated_at")
                }

                public func isEqual(to object: Any?) -> Bool {
                  guard let object = object as? Status200 else { return false }
                  guard self.links == object.links else { return false }
                  guard self.address == object.address else { return false }
                  guard self.company == object.company else { return false }
                  guard self.createdAt == object.createdAt else { return false }
                  guard self.emailAddress == object.emailAddress else { return false }
                  guard self.firstName == object.firstName else { return false }
                  guard self.id == object.id else { return false }
                  guard self.lastName == object.lastName else { return false }
                  guard self.optInStatus == object.optInStatus else { return false }
                  guard self.ordersCount == object.ordersCount else { return false }
                  guard self.totalSpent == object.totalSpent else { return false }
                  guard self.updatedAt == object.updatedAt else { return false }
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
