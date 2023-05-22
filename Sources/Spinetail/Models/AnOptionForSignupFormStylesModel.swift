import Foundation

import PrchModel
/** An option for Signup Form Styles. */
public struct AnOptionForSignupFormStylesModel: Codable, Equatable, Content {
  /** A string that identifies the property. */
  public var property: String?

  /** A string that identifies value of the property. */
  public var value: String?

  public init(property: String? = nil, value: String? = nil) {
    self.property = property
    self.value = value
  }

  public enum CodingKeys: String, CodingKey {
    case property
    case value
  }
}
