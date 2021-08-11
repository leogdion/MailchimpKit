//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation

extension API.Ecommerce {

    /**
    List order line items

    Get information about an order's line items.
    */
    public enum GetEcommerceStoresIdOrdersIdLines {

        public static let service = APIService<Response>(id: "getEcommerceStoresIdOrdersIdLines", tag: "ecommerce", method: "GET", path: "/ecommerce/stores/{store_id}/orders/{order_id}/lines", hasBody: false, securityRequirements: [SecurityRequirement(type: "basicAuth", scopes: [])])

        public final class Request: APIRequest<Response> {

            public struct Options {

                /** A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. */
                public var fields: [String]?

                /** A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. */
                public var excludeFields: [String]?

                /** The number of records to return. Default value is 10. Maximum value is 1000 */
                public var count: Int?

                /** Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. */
                public var offset: Int?

                /** The store id. */
                public var storeId: String

                /** The id for the order in a store. */
                public var orderId: String

                public init(fields: [String]? = nil, excludeFields: [String]? = nil, count: Int? = nil, offset: Int? = nil, storeId: String, orderId: String) {
                    self.fields = fields
                    self.excludeFields = excludeFields
                    self.count = count
                    self.offset = offset
                    self.storeId = storeId
                    self.orderId = orderId
                }
            }

            public var options: Options

            public init(options: Options) {
                self.options = options
                super.init(service: GetEcommerceStoresIdOrdersIdLines.service)
            }

            /// convenience initialiser so an Option doesn't have to be created
            public convenience init(fields: [String]? = nil, excludeFields: [String]? = nil, count: Int? = nil, offset: Int? = nil, storeId: String, orderId: String) {
                let options = Options(fields: fields, excludeFields: excludeFields, count: count, offset: offset, storeId: storeId, orderId: orderId)
                self.init(options: options)
            }

            public override var path: String {
                return super.path.replacingOccurrences(of: "{" + "store_id" + "}", with: "\(self.options.storeId)").replacingOccurrences(of: "{" + "order_id" + "}", with: "\(self.options.orderId)")
            }

            public override var queryParameters: [String: Any] {
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

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {

            /** A collection of an order's line items. */
            public class Status200: APIModel {

                /** A list of link types and descriptions for the API schema documents. */
                public var links: [Links]?

                /** An array of objects, each representing an order's line item. */
                public var lines: [Lines]?

                /** The order id. */
                public var orderId: String?

                /** The store id. */
                public var storeId: String?

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

                /** Information about a specific order line. */
                public class Lines: APIModel {

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

                    public required init(from decoder: Decoder) throws {
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

                    public func isEqual(to object: Any?) -> Bool {
                      guard let object = object as? Lines else { return false }
                      guard self.links == object.links else { return false }
                      guard self.discount == object.discount else { return false }
                      guard self.id == object.id else { return false }
                      guard self.imageURL == object.imageURL else { return false }
                      guard self.price == object.price else { return false }
                      guard self.productId == object.productId else { return false }
                      guard self.productTitle == object.productTitle else { return false }
                      guard self.productVariantId == object.productVariantId else { return false }
                      guard self.productVariantTitle == object.productVariantTitle else { return false }
                      guard self.quantity == object.quantity else { return false }
                      return true
                    }

                    public static func == (lhs: Lines, rhs: Lines) -> Bool {
                        return lhs.isEqual(to: rhs)
                    }
                }

                public init(links: [Links]? = nil, lines: [Lines]? = nil, orderId: String? = nil, storeId: String? = nil, totalItems: Int? = nil) {
                    self.links = links
                    self.lines = lines
                    self.orderId = orderId
                    self.storeId = storeId
                    self.totalItems = totalItems
                }

                public required init(from decoder: Decoder) throws {
                    let container = try decoder.container(keyedBy: StringCodingKey.self)

                    links = try container.decodeArrayIfPresent("_links")
                    lines = try container.decodeArrayIfPresent("lines")
                    orderId = try container.decodeIfPresent("order_id")
                    storeId = try container.decodeIfPresent("store_id")
                    totalItems = try container.decodeIfPresent("total_items")
                }

                public func encode(to encoder: Encoder) throws {
                    var container = encoder.container(keyedBy: StringCodingKey.self)

                    try container.encodeIfPresent(links, forKey: "_links")
                    try container.encodeIfPresent(lines, forKey: "lines")
                    try container.encodeIfPresent(orderId, forKey: "order_id")
                    try container.encodeIfPresent(storeId, forKey: "store_id")
                    try container.encodeIfPresent(totalItems, forKey: "total_items")
                }

                public func isEqual(to object: Any?) -> Bool {
                  guard let object = object as? Status200 else { return false }
                  guard self.links == object.links else { return false }
                  guard self.lines == object.lines else { return false }
                  guard self.orderId == object.orderId else { return false }
                  guard self.storeId == object.storeId else { return false }
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
