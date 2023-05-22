import Foundation
import PrchModel

public extension Campaigns {
  /**
   Replicate campaign

   Replicate a campaign in saved or send status.
   */
  struct PostCampaignsIdActionsReplicate: ServiceCall {
    public static var requiresCredentials: Bool {
      false
    }

    public typealias ServiceAPI = SpinetailAPI

    public static let pathTemplate = "/campaigns/{campaign_id}/actions/replicate"

    public var path: String {
      Self.pathTemplate.replacingOccurrences(of: "{" + "campaign_id" + "}", with: "\(campaignId)")
    }

    public var method: RequestMethod {
      .POST
    }

    /** The unique id for the campaign. */
    public var campaignId: String

    public var parameters: [String: String] { [:] }

    public var headers: [String: String] { [:] }

    // public static let service = APIService<Response>(id: "postCampaignsIdActionsReplicate", tag: "campaigns", method: "POST", path: "/campaigns/{campaign_id}/actions/replicate", hasBody: false, securityRequirements: [SecurityRequirement(type: "basicAuth", scopes: [])])

    public typealias SuccessType = Campaign3Model
    public typealias BodyType = Empty
  }
}
