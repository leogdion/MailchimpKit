import Foundation

public extension Mailchimp.VerifiedDomains {
  /**
   Verify domain

   Verify a domain for sending.
   */
  enum VerifyDomain {
    public static let service = APIService<Response>(id: "verifyDomain", tag: "verifiedDomains", method: "POST", path: "/verified-domains/{domain_name}/actions/verify", hasBody: true, securityRequirements: [SecurityRequirement(type: "basicAuth", scopes: [])])

    public final class Request: APIRequest<Response> {
      /** Submit a response to the verification challenge and verify a domain for sending. */
      public struct Body: MailchimpModel {
        /** The code that was sent to the email address provided when adding a new domain to verify. */
        public var code: String

        public init(code: String) {
          self.code = code
        }

        public init(from decoder: Decoder) throws {
          let container = try decoder.container(keyedBy: StringCodingKey.self)

          code = try container.decode("code")
        }

        public func encode(to encoder: Encoder) throws {
          var container = encoder.container(keyedBy: StringCodingKey.self)

          try container.encode(code, forKey: "code")
        }
      }

      public struct Options {
        /** The domain name. */
        public var domainName: String

        public init(domainName: String) {
          self.domainName = domainName
        }
      }

      public var options: Options

      public var body: Body

      public init(body: Body, options: Options, encoder: RequestEncoder? = nil) {
        self.body = body
        self.options = options
        super.init(service: VerifyDomain.service) { defaultEncoder in
          try (encoder ?? defaultEncoder).encode(body)
        }
      }

      /// convenience initialiser so an Option doesn't have to be created
      public convenience init(domainName: String, body: Body) {
        let options = Options(domainName: domainName)
        self.init(body: body, options: options)
      }

      override public var path: String {
        super.path.replacingOccurrences(of: "{" + "domain_name" + "}", with: "\(options.domainName)")
      }
    }

    public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
      /** The verified domains currently on the account. */
      public struct Status200: MailchimpModel {
        /** Whether domain authentication is enabled for this domain. */
        public var authenticated: Bool?

        /** The name of this domain. */
        public var domain: String?

        /** The e-mail address receiving the two-factor challenge for this domain. */
        public var verificationEmail: String?

        /** The date/time that the two-factor challenge was sent to the verification email. */
        public var verificationSent: DateTime?

        /** Whether the domain has been verified for sending. */
        public var verified: Bool?

        public init(authenticated: Bool? = nil, domain: String? = nil, verificationEmail: String? = nil, verificationSent: DateTime? = nil, verified: Bool? = nil) {
          self.authenticated = authenticated
          self.domain = domain
          self.verificationEmail = verificationEmail
          self.verificationSent = verificationSent
          self.verified = verified
        }

        public init(from decoder: Decoder) throws {
          let container = try decoder.container(keyedBy: StringCodingKey.self)

          authenticated = try container.decodeIfPresent("authenticated")
          domain = try container.decodeIfPresent("domain")
          verificationEmail = try container.decodeIfPresent("verification_email")
          verificationSent = try container.decodeIfPresent("verification_sent")
          verified = try container.decodeIfPresent("verified")
        }

        public func encode(to encoder: Encoder) throws {
          var container = encoder.container(keyedBy: StringCodingKey.self)

          try container.encodeIfPresent(authenticated, forKey: "authenticated")
          try container.encodeIfPresent(domain, forKey: "domain")
          try container.encodeIfPresent(verificationEmail, forKey: "verification_email")
          try container.encodeIfPresent(verificationSent, forKey: "verification_sent")
          try container.encodeIfPresent(verified, forKey: "verified")
        }
      }

      /** An error generated by the Mailchimp API. Conforms to IETF draft 'draft-nottingham-http-problem-06'. */
      public struct DefaultResponse: MailchimpModel {
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

      public typealias SuccessType = Status200

      /** The domain being verified for sending. */
      case status200(Status200)

      /** An error generated by the Mailchimp API. */
      case defaultResponse(statusCode: Int, DefaultResponse)

      public var success: Status200? {
        switch self {
        case let .status200(response): return response
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
      public var responseResult: APIResponseResult<Status200, DefaultResponse> {
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
        case let .status200(response): return response
        case let .defaultResponse(_, response): return response
        }
      }

      public var statusCode: Int {
        switch self {
        case .status200: return 200
        case let .defaultResponse(statusCode, _): return statusCode
        }
      }

      public var successful: Bool {
        switch self {
        case .status200: return true
        case .defaultResponse: return false
        }
      }

      public init(statusCode: Int, data: Data, decoder: ResponseDecoder) throws {
        switch statusCode {
        case 200: self = try .status200(decoder.decode(Status200.self, from: data))
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
