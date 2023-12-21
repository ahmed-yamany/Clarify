//
//  UIImage+featch.swift
//  Clarity
//
//  Created by Ahmed Yamany on 21/12/2023.
//

import UIKit

enum ImageError: Error, LocalizedError {
    case imageDataMissing, invalidURL
}

extension UIImage {
    static func featch(from url: URL?) async throws -> UIImage {
        guard let url else {
            throw ImageError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200,
              let image = UIImage(data: data) else {
            throw ImageError.imageDataMissing
        }
        return image
    }
}
