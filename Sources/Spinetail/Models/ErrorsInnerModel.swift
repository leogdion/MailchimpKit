import Foundation

import PrchModel
public struct ErrorsInnerModel: Codable, Equatable, Content {
  /** A unique code that identifies this specifc error. */
  public enum ErrorCode: String, Codable, Equatable, CaseIterable {
    case errorContactExists = "ERROR_CONTACT_EXISTS"
    case errorGeneric = "ERROR_GENERIC"
  }

  /** The email address that could not be added or updated. */
  public var emailAddress: String?

  /** The error message indicating why the email address could not be added or updated. */
  public var error: String?

  /** A unique code that identifies this specifc error. */
  public var errorCode: ErrorCode?

  /** If the error is field-related, information about which field is at issue. */
  public var field: String?

  /** Message indicating how to resolve a field-related error. */
  public var fieldMessage: String?

  public init(emailAddress: String? = nil, error: String? = nil, errorCode: ErrorCode? = nil, field: String? = nil, fieldMessage: String? = nil) {
    self.emailAddress = emailAddress
    self.error = error
    self.errorCode = errorCode
    self.field = field
    self.fieldMessage = fieldMessage
  }

  public enum CodingKeys: String, CodingKey {
    case emailAddress = "email_address"
    case error
    case errorCode = "error_code"
    case field
    case fieldMessage = "field_message"
  }
}
