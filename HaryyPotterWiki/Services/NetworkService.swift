//
//  NetworkService.swift
//  HaryyPotterWiki
//
//  Created by Filipe Marques on 26/04/25.
//

import Foundation

/// A utility service responsible for performing network requests and decoding JSON responses.
///
/// `NetworkService` provides a simple and reusable way to fetch and decode data from APIs,
/// ensuring error handling for HTTP responses and decoding failures.
enum NetworkService {

    /// Fetches and decodes JSON data from a given URL.
    ///
    /// - Parameters:
    ///   - url: The URL to fetch data from.
    ///   - type: The type conforming to `Decodable` to decode.
    /// - Returns: A decoded instance of the requested type.
    /// - Throws: `URLError` if the response is invalid or decoding fails.
    static func fetch<T: Decodable>(_ url: URL, type: T.Type) async throws -> T {
        let (data, response) = try await URLSession.shared.data(from: url)

        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }

        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        return try decoder.decode(T.self, from: data)
    }
}
