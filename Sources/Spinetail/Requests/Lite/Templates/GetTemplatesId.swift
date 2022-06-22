import Foundation
import Prch

public extension Templates {
  /**
   Get template info

   Get information about a specific template.
   */
  enum GetTemplatesId {
    public static let service = Service<Response>(id: "getTemplatesId", tag: "templates", method: "GET", path: "/templates/{template_id}", hasBody: false, securityRequirements: [SecurityRequirement(type: "basicAuth", scopes: [])])

    public struct Request: ServiceRequest {
      public struct Options {
        /** A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. */
        public var fields: [String]?

        /** A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. */
        public var excludeFields: [String]?

        /** The unique id for the template. */
        public var templateId: String

        public init(fields: [String]? = nil, excludeFields: [String]? = nil, templateId: String) {
          self.fields = fields
          self.excludeFields = excludeFields
          self.templateId = templateId
        }
      }

      public var options: Options

      public init(options: Options) {
        self.options = options
      }

      public typealias ResponseType = Response

      public var service: Service<Response> {
        GetTemplatesId.service
      }

      /// convenience initialiser so an Option doesn't have to be created
      public init(fields: [String]? = nil, excludeFields: [String]? = nil, templateId: String) {
        let options = Options(fields: fields, excludeFields: excludeFields, templateId: templateId)
        self.init(options: options)
      }

      public var path: String {
        service.path.replacingOccurrences(of: "{" + "template_id" + "}", with: "\(options.templateId)")
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

    public enum Response: Prch.Response {
      public var response: ClientResult<Status200, DefaultResponse> {
        switch self {
        case let .defaultResponse(statusCode: statusCode, response):
          return .defaultResponse(statusCode, response)

        case let .status200(response):
          return .success(response)
        }
      }

      public typealias APIType = Mailchimp.API
      /** Information about a specific template. */
      public struct Status200: Model {
        /** A list of link types and descriptions for the API schema documents. */
        public var links: [Links]?

        /** User templates are not 'deleted,' but rather marked as 'inactive.' Returns whether the template is still active. */
        public var active: Bool?

        /** If available, the category the template is listed in. */
        public var category: String?

        /** The login name for template's creator. */
        public var createdBy: String?

        /** The date and time the template was created in ISO 8601 format. */
        public var dateCreated: Date?

        /** The date and time the template was edited in ISO 8601 format. */
        public var dateEdited: Date?

        /** Whether the template uses the drag and drop editor. */
        public var dragAndDrop: Bool?

        /** The login name who last edited the template. */
        public var editedBy: String?

        /** The id of the folder the template is currently in. */
        public var folderId: String?

        /** The individual id for the template. */
        public var id: Int?

        /** The name of the template. */
        public var name: String?

        /** Whether the template contains media queries to make it responsive. */
        public var responsive: Bool?

        /** The URL used for [template sharing](https://mailchimp.com/help/share-a-template/). */
        public var shareURL: String?

        /** If available, the URL for a thumbnail of the template. */
        public var thumbnail: String?

        /** The type of template (user, base, or gallery). */
        public var type: String?

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

        public init(links: [Links]? = nil, active: Bool? = nil, category: String? = nil, createdBy: String? = nil, dateCreated: Date? = nil, dateEdited: Date? = nil, dragAndDrop: Bool? = nil, editedBy: String? = nil, folderId: String? = nil, id: Int? = nil, name: String? = nil, responsive: Bool? = nil, shareURL: String? = nil, thumbnail: String? = nil, type: String? = nil) {
          self.links = links
          self.active = active
          self.category = category
          self.createdBy = createdBy
          self.dateCreated = dateCreated
          self.dateEdited = dateEdited
          self.dragAndDrop = dragAndDrop
          self.editedBy = editedBy
          self.folderId = folderId
          self.id = id
          self.name = name
          self.responsive = responsive
          self.shareURL = shareURL
          self.thumbnail = thumbnail
          self.type = type
        }

        public init(from decoder: Decoder) throws {
          let container = try decoder.container(keyedBy: StringCodingKey.self)

          links = try container.decodeArrayIfPresent("_links")
          active = try container.decodeIfPresent("active")
          category = try container.decodeIfPresent("category")
          createdBy = try container.decodeIfPresent("created_by")
          dateCreated = try container.decodeIfPresent("date_created")
          dateEdited = try container.decodeIfPresent("date_edited")
          dragAndDrop = try container.decodeIfPresent("drag_and_drop")
          editedBy = try container.decodeIfPresent("edited_by")
          folderId = try container.decodeIfPresent("folder_id")
          id = try container.decodeIfPresent("id")
          name = try container.decodeIfPresent("name")
          responsive = try container.decodeIfPresent("responsive")
          shareURL = try container.decodeIfPresent("share_url")
          thumbnail = try container.decodeIfPresent("thumbnail")
          type = try container.decodeIfPresent("type")
        }

        public func encode(to encoder: Encoder) throws {
          var container = encoder.container(keyedBy: StringCodingKey.self)

          try container.encodeIfPresent(links, forKey: "_links")
          try container.encodeIfPresent(active, forKey: "active")
          try container.encodeIfPresent(category, forKey: "category")
          try container.encodeIfPresent(createdBy, forKey: "created_by")
          try container.encodeIfPresent(dateCreated, forKey: "date_created")
          try container.encodeIfPresent(dateEdited, forKey: "date_edited")
          try container.encodeIfPresent(dragAndDrop, forKey: "drag_and_drop")
          try container.encodeIfPresent(editedBy, forKey: "edited_by")
          try container.encodeIfPresent(folderId, forKey: "folder_id")
          try container.encodeIfPresent(id, forKey: "id")
          try container.encodeIfPresent(name, forKey: "name")
          try container.encodeIfPresent(responsive, forKey: "responsive")
          try container.encodeIfPresent(shareURL, forKey: "share_url")
          try container.encodeIfPresent(thumbnail, forKey: "thumbnail")
          try container.encodeIfPresent(type, forKey: "type")
        }
      }

      /** An error generated by the Mailchimp API. Conforms to IETF draft 'draft-nottingham-http-problem-06'. */

      public typealias SuccessType = Status200
      public typealias FailureType = DefaultResponse
      case status200(Status200)

      /** An error generated by the Mailchimp API. */
      case defaultResponse(statusCode: Int, DefaultResponse)

      public var statusCode: Int {
        switch self {
        case .status200: return 200
        case let .defaultResponse(statusCode, _): return statusCode
        }
      }

      public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
        switch statusCode {
        case 200: self = try .status200(decoder.decode(Status200.self, from: data))
        default: self = try .defaultResponse(statusCode: statusCode, decoder.decode(DefaultResponse.self, from: data))
        }
      }
    }
  }
}
