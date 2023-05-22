import Foundation
import PrchModel

public extension Templates {
  /**
   Update template

   Update the name, HTML, or `folder_id` of an existing template.
   */
  struct PatchTemplatesId: ServiceCall {
    public static var requiresCredentials: Bool {
      false
    }

    public typealias ServiceAPI = SpinetailAPI

    public static let pathTemplate = "/templates/{template_id}"

    public var path: String {
      Self.pathTemplate.replacingOccurrences(of: "{" + "template_id" + "}", with: "\(templateId)")
    }

    public var method: RequestMethod {
      .PATCH
    }

    /** The unique id for the template. */
    public var templateId: String

    public var parameters: [String: String] { [:] }

    public var headers: [String: String] { [:] }

    // public static let service = APIService<Response>(id: "patchTemplatesId", tag: "templates", method: "PATCH", path: "/templates/{template_id}", hasBody: true, securityRequirements: [SecurityRequirement(type: "basicAuth", scopes: [])])

    public typealias SuccessType = TemplateInstanceModel
    public typealias BodyType = TemplateInstance1Model

    public let body: TemplateInstance1Model
  }
}
