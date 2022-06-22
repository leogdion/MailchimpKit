import Foundation
import Prch

public extension Campaigns {
  /**
   Pause rss campaign

   Pause an RSS-Driven campaign.
   */
  enum PostCampaignsIdActionsPause {
    public static let service = Service<Response>(id: "postCampaignsIdActionsPause", tag: "campaigns", method: "POST", path: "/campaigns/{campaign_id}/actions/pause", hasBody: false, securityRequirements: [SecurityRequirement(type: "basicAuth", scopes: [])])

    public struct Request: ServiceRequest {
      public struct Options {
        /** The unique id for the campaign. */
        public var campaignId: String

        public init(campaignId: String) {
          self.campaignId = campaignId
        }
      }

      public var options: Options

      public init(options: Options) {
        self.options = options
      }

      public typealias ResponseType = Response

      public var service: Service<Response> {
        PostCampaignsIdActionsPause.service
      }

      /// convenience initialiser so an Option doesn't have to be created
      public init(campaignId: String) {
        let options = Options(campaignId: campaignId)
        self.init(options: options)
      }

      public var path: String {
        service.path.replacingOccurrences(of: "{" + "campaign_id" + "}", with: "\(options.campaignId)")
      }
    }

    public enum Response: Prch.Response {
      public var response: ClientResult<Void, DefaultResponse> {
        switch self {
        case let .defaultResponse(statusCode: statusCode, response):
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

      public var statusCode: Int {
        switch self {
        case .status204: return 204
        case let .defaultResponse(statusCode, _): return statusCode
        }
      }

      public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
        switch statusCode {
        case 204: self = .status204
        default: self = try .defaultResponse(statusCode: statusCode, decoder.decode(DefaultResponse.self, from: data))
        }
      }
    }
  }
}
