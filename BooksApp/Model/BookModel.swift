//
//  BookModel.swift
//  BooksApp
//
//  Created by Sonun on 22/2/24.
//

import Foundation

struct Books: Codable {
    let kind: String
    let totalItems: Int
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let kind, id, etag: String?
    let selfLink: String?
    let volumeInfo: VolumeInfo
    let saleInfo: SaleInfo
    let accessInfo: AccessInfo
}

// MARK: - AccessInfo
struct AccessInfo: Codable {
    let country, viewability: String?
    let embeddable, publicDomain: Bool?
    let textToSpeechPermission: String?
    let epub, pdf: Epub
    let webReaderLink: String?
    let accessViewStatus: String?
    let quoteSharingAllowed: Bool?
}

// MARK: - Epub
struct Epub: Codable {
    let isAvailable: Bool?
    let acsTokenLink: String?
}

// MARK: - SaleInfo
struct SaleInfo: Codable {
    let country, saleability: String?
    let isEbook: Bool
}

// MARK: - VolumeInfo
struct VolumeInfo: Codable {
    let title, subtitle, description: String?
    let authors: [String]?
    let publishedDate: String?
    let industryIdentifiers: [IndustryIdentifier]
    let readingModes: ReadingModes
    let printType, maturityRating: String?
    let allowAnonLogging: Bool?
    let contentVersion, language: String?
    let previewLink, infoLink: String?
    let canonicalVolumeLink: String?
    let imageLinks: ImageLinks?
}

// MARK: - IndustryIdentifier
struct IndustryIdentifier: Codable {
    let type, identifier: String?
}

// MARK: - ReadingModes
struct ReadingModes: Codable {
    let text, image: Bool
}

struct ImageLinks: Codable {
    let smallThumbnail, thumbnail: String?
}
