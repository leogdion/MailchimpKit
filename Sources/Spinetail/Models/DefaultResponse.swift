import Prch

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
