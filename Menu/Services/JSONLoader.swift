//
//  File.swift
//  Menu
//
//  Created by Zohra on 02.09.25.
//

import Foundation

enum JSONLoadError: Error {
    case fileNotFound
    case decodeFailed
}

final class JSONLoader {
    static func loadMenu() throws -> [MenuModel] {
        guard let url = Bundle.main.url(forResource: "menu", withExtension: "json") else {
            throw JSONLoadError.fileNotFound
        }
        let data = try Data(contentsOf: url)
        do {
            return try JSONDecoder().decode([MenuModel].self, from: data)
        } catch {
            throw JSONLoadError.decodeFailed
        }
    }
}
