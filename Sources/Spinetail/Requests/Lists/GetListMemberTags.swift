import Foundation
import PrchModel

public extension Lists {
  /**
   List member tags

   Get the tags on a list member.
   */
  struct GetListMemberTags: ServiceCall {
    public static var requiresCredentials: Bool {
      false
    }

    public typealias ServiceAPI = SpinetailAPI

    public static let pathTemplate = "/lists/{list_id}/members/{subscriber_hash}/tags"

    public var path: String {
      Self.pathTemplate.replacingOccurrences(of: "{" + "list_id" + "}", with: "\(listId)").replacingOccurrences(of: "{" + "subscriber_hash" + "}", with: "\(subscriberHash)")
    }

    public var method: RequestMethod {
      .GET
    }

    /** The unique ID for the list. */
    public var listId: String

    /** The MD5 hash of the lowercase version of the list member's email address. This endpoint also accepts a list member's email address or contact_id. */
    public var subscriberHash: String

    /** A comma-separated list of fields to return. Reference parameters of sub-objects with dot notation. */
    public var fields: [String]?

    /** A comma-separated list of fields to exclude. Reference parameters of sub-objects with dot notation. */
    public var excludeFields: [String]?

    /** The number of records to return. Default value is 10. Maximum value is 1000 */
    public var count: Int?

    /** Used for [pagination](https://mailchimp.com/developer/marketing/docs/methods-parameters/#pagination), this it the number of records from a collection to skip. Default value is 0. */
    public var offset: Int?

    public var parameters: [String: String] {
      var params: [String: String] = [:]
      if let fields = self.fields?.joined(separator: ",") {
        params["fields"] = String(describing: fields)
      }
      if let excludeFields = self.excludeFields?.joined(separator: ",") {
        params["exclude_fields"] = String(describing: excludeFields)
      }
      if let count = self.count {
        params["count"] = String(describing: count)
      }
      if let offset = self.offset {
        params["offset"] = String(describing: offset)
      }
      return params
    }

    public var headers: [String: String] { [:] }

    // public static let service = APIService<Response>(id: "getListMemberTags", tag: "lists", method: "GET", path: "/lists/{list_id}/members/{subscriber_hash}/tags", hasBody: false, securityRequirements: [SecurityRequirement(type: "basicAuth", scopes: [])])

    public typealias SuccessType = CollectionOfTagsModel
    public typealias BodyType = Empty
  }
}
