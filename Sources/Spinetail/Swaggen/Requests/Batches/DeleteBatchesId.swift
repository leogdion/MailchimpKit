import Foundation
import Prch

public extension Batches {
  /**
   Delete batch request

   Stops a batch request from running. Since only one batch request is run at a time, this can be used to cancel a long running request. The results of any completed operations will not be available after this call.
   */
  enum DeleteBatchesId {
    public static let service = APIService<Response>(id: "deleteBatchesId", tag: "batches", method: "DELETE", path: "/batches/{batch_id}", hasBody: false, securityRequirements: [SecurityRequirement(type: "basicAuth", scopes: [])])

    public final class Request: APIRequest<Response, MailchimpAPI> {
      public struct Options {
        /** The unique id for the batch operation. */
        public var batchId: String

        public init(batchId: String) {
          self.batchId = batchId
        }
      }

      public var options: Options

      public init(options: Options) {
        self.options = options
        super.init(service: DeleteBatchesId.service)
      }

      /// convenience initialiser so an Option doesn't have to be created
      public convenience init(batchId: String) {
        let options = Options(batchId: batchId)
        self.init(options: options)
      }

      override public var path: String {
        super.path.replacingOccurrences(of: "{" + "batch_id" + "}", with: "\(options.batchId)")
      }
    }

    public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
      public typealias APIType = MailchimpAPI
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

      public typealias SuccessType = Void

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

      /// either success or failure value. Success is anything in the 200..<300 status code range
      public var responseResult: APIResponseResult<Void, DefaultResponse> {
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
        let responseString = "\(response)"
        if responseString != "()" {
          string += "\n\(responseString)"
        }
        return string
      }
    }
  }
}
