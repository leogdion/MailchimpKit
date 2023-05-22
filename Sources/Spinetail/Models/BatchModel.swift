import Foundation

import PrchModel
/** The status of a batch request */
public struct BatchModel: Codable, Equatable, Content {
  /** The status of the batch call. [Learn more](https://mailchimp.com/developer/marketing/guides/run-async-requests-batch-endpoint/#check-the-status-of-a-batch-operation) about the batch operation status. */
  public enum Status: String, Codable, Equatable, CaseIterable {
    case pending
    case preprocessing
    case started
    case finalizing
    case finished
  }

  /** A list of link types and descriptions for the API schema documents. */
  public var links: [ResourceLinkModel]?

  /** The date and time when all operations in the batch request completed in ISO 8601 format. */
  public var completedAt: DateTime?

  /** The number of completed operations that returned an error. */
  public var erroredOperations: Int?

  /** The number of completed operations. This includes operations that returned an error. */
  public var finishedOperations: Int?

  /** A string that uniquely identifies this batch request. */
  public var id: String?

  /** The URL of the gzipped archive of the results of all the operations. */
  public var responseBodyURL: String?

  /** The status of the batch call. [Learn more](https://mailchimp.com/developer/marketing/guides/run-async-requests-batch-endpoint/#check-the-status-of-a-batch-operation) about the batch operation status. */
  public var status: Status?

  /** The date and time when the server received the batch request in ISO 8601 format. */
  public var submittedAt: DateTime?

  /** The total number of operations to complete as part of this batch request. For GET requests requiring pagination, each page counts as a separate operation. */
  public var totalOperations: Int?

  public init(links: [ResourceLinkModel]? = nil, completedAt: DateTime? = nil, erroredOperations: Int? = nil, finishedOperations: Int? = nil, id: String? = nil, responseBodyURL: String? = nil, status: Status? = nil, submittedAt: DateTime? = nil, totalOperations: Int? = nil) {
    self.links = links
    self.completedAt = completedAt
    self.erroredOperations = erroredOperations
    self.finishedOperations = finishedOperations
    self.id = id
    self.responseBodyURL = responseBodyURL
    self.status = status
    self.submittedAt = submittedAt
    self.totalOperations = totalOperations
  }

  public enum CodingKeys: String, CodingKey {
    case links = "_links"
    case completedAt = "completed_at"
    case erroredOperations = "errored_operations"
    case finishedOperations = "finished_operations"
    case id
    case responseBodyURL = "response_body_url"
    case status
    case submittedAt = "submitted_at"
    case totalOperations = "total_operations"
  }
}
