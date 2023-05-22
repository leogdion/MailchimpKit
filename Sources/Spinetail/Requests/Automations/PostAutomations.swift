import Foundation
import PrchModel

public extension Automations {
  /**
   Add automation

   Create a new classic automation in your Mailchimp account.
   */
  struct PostAutomations: ServiceCall {
    public static var requiresCredentials: Bool {
      false
    }

    public typealias ServiceAPI = SpinetailAPI

    public static let pathTemplate = "/automations"

    public var path: String {
      Self.pathTemplate
    }

    public var method: RequestMethod {
      .POST
    }

    public var parameters: [String: String] { [:] }

    public var headers: [String: String] { [:] }

    // public static let service = APIService<Response>(id: "postAutomations", tag: "automations", method: "POST", path: "/automations", hasBody: true, securityRequirements: [SecurityRequirement(type: "basicAuth", scopes: [])])

    public typealias SuccessType = AutomationWorkflowModel
    public typealias BodyType = AutomationWorkflow1Model

    public let body: AutomationWorkflow1Model
  }
}
