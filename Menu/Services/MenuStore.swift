//
//  MenuStore.swift
//  Menu
//
//  Created by Zohra on 02.09.25.
//
import Foundation

enum MenuStore {
    private static let key = "menu.store.v1"
    private static let enc = JSONEncoder()
    private static let dec = JSONDecoder()

    static func load() -> [MenuModel] {
        guard let data = UserDefaults.standard.data(forKey: key),
              let list = try? dec.decode([MenuModel].self, from: data) else { return [] }
        return list
    }

    static func save(_ list: [MenuModel]) {
        guard let data = try? enc.encode(list) else { return }
        UserDefaults.standard.set(data, forKey: key)
    }
}



