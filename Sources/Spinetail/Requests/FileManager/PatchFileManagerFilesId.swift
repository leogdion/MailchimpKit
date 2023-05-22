import Foundation
import PrchModel

public extension FileManager {
  /**
   Update file

   Update a file in the File Manager.
   */
  struct PatchFileManagerFilesId: ServiceCall {
    public static var requiresCredentials: Bool {
      false
    }

    public typealias ServiceAPI = SpinetailAPI

    public static let pathTemplate = "/file-manager/files/{file_id}"

    public var path: String {
      Self.pathTemplate.replacingOccurrences(of: "{" + "file_id" + "}", with: "\(fileId)")
    }

    public var method: RequestMethod {
      .PATCH
    }

    /** The unique id for the File Manager file. */
    public var fileId: String

    public var parameters: [String: String] { [:] }

    public var headers: [String: String] { [:] }

    // public static let service = APIService<Response>(id: "patchFileManagerFilesId", tag: "fileManager", method: "PATCH", path: "/file-manager/files/{file_id}", hasBody: true, securityRequirements: [SecurityRequirement(type: "basicAuth", scopes: [])])

    public typealias SuccessType = GalleryFileModel
    public typealias BodyType = GalleryFile2Model

    public let body: GalleryFile2Model
  }
}
