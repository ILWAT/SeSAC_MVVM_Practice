//
//  PhotoModel.swift
//  SeSAC_MVVM_Practice
//
//  Created by 문정호 on 2023/09/19.
//

import Foundation

// MARK: - UnsplashRandomImageModel
struct PhotoResult: Codable, Hashable {
    let id, slug: String
    let urls: Urls

}


// MARK: - Urls
struct Urls: Codable, Hashable {
    let raw, full, regular, small: String
    let thumb, smallS3: String

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}
