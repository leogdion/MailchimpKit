import Foundation

import PrchModel
/** A list of available images and files stored in the File Manager for the account. */
public struct FileManagerModel: Codable, Equatable, Content {
  /** A list of link types and descriptions for the API schema documents. */
  public var links: [ResourceLinkModel]?

  /**  A list of files and images in an account. */
  public var files: [GalleryFileModel]?

  /** The total size of all File Manager files in bytes. */
  public var totalFileSize: Double?

  /** The total number of items matching the query regardless of pagination. */
  public var totalItems: Int?

  public init(links: [ResourceLinkModel]? = nil, files: [GalleryFileModel]? = nil, totalFileSize: Double? = nil, totalItems: Int? = nil) {
    self.links = links
    self.files = files
    self.totalFileSize = totalFileSize
    self.totalItems = totalItems
  }

  public enum CodingKeys: String, CodingKey {
    case links = "_links"
    case files
    case totalFileSize = "total_file_size"
    case totalItems = "total_items"
  }
}
