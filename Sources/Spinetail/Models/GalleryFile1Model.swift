import Foundation

import PrchModel
/** An individual file listed in the File Manager. */
public struct GalleryFile1Model: Codable, Equatable, Content {
  /** The base64-encoded contents of the file. */
  public var fileData: String

  /** The name of the file. */
  public var name: String

  /** The id of the folder. */
  public var folderId: Int?

  public init(fileData: String, name: String, folderId: Int? = nil) {
    self.fileData = fileData
    self.name = name
    self.folderId = folderId
  }

  public enum CodingKeys: String, CodingKey {
    case fileData = "file_data"
    case name
    case folderId = "folder_id"
  }
}
