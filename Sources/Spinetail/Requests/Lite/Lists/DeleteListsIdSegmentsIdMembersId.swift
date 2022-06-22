import Foundation
import Prch

public extension Lists {
  /**
   Remove list member from segment

   Remove a member from the specified static segment.
   */
  enum DeleteListsIdSegmentsIdMembersId {
    public static let service = Service<Response>(id: "deleteListsIdSegmentsIdMembersId", tag: "lists", method: "DELETE", path: "/lists/{list_id}/segments/{segment_id}/members/{subscriber_hash}", hasBody: false, securityRequirements: [SecurityRequirement(type: "basicAuth", scopes: [])])

    public struct Request: ServiceRequest {
      public struct Options {
        /** The unique ID for the list. */
        public var listId: String

        /** The unique id for the segment. */
        public var segmentId: String

        /** The MD5 hash of the lowercase version of the list member's email address. */
        public var subscriberHash: String

        public init(listId: String, segmentId: String, subscriberHash: String) {
          self.listId = listId
          self.segmentId = segmentId
          self.subscriberHash = subscriberHash
        }
      }

      public var options: Options

      public init(options: Options) {
        self.options = options
      }

      public typealias ResponseType = Response

      public var service: Service<Response> {
        DeleteListsIdSegmentsIdMembersId.service
      }

      /// convenience initialiser so an Option doesn't have to be created
      public init(listId: String, segmentId: String, subscriberHash: String) {
        let options = Options(listId: listId, segmentId: segmentId, subscriberHash: subscriberHash)
        self.init(options: options)
      }

      public var path: String {
        service.path.replacingOccurrences(of: "{" + "list_id" + "}", with: "\(options.listId)").replacingOccurrences(of: "{" + "segment_id" + "}", with: "\(options.segmentId)").replacingOccurrences(of: "{" + "subscriber_hash" + "}", with: "\(options.subscriberHash)")
      }
    }

    public enum Response: Prch.Response, CustomStringConvertible, CustomDebugStringConvertible {
public var response: ClientResult<Void, DefaultResponse> {
        switch self {
        case .defaultResponse(statusCode: let statusCode, let response):
          return .defaultResponse(statusCode, response)
        case .status204:
          return .success(())
        }
      }
      public typealias APIType = Mailchimp.API
      /** An error generated by the Mailchimp API. Conforms to IETF draft 'draft-nottingham-http-problem-06'. */

      public typealias SuccessType = Void
      public typealias FailureType = DefaultResponse

      /** Empty Response */
      case status204

      /** An error generated by the Mailchimp API. */
      case defaultResponse(statusCode: Int, DefaultResponse)

      public var success: Void? {
        switch self {
        case .status204: return ()
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
        case let .defaultResponse(_, response): return response
        default: return ()
        }
      }

      public var statusCode: Int {
        switch self {
        case .status204: return 204
        case let .defaultResponse(statusCode, _): return statusCode
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
        case 204: self = .status204
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
