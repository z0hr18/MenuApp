//
//  File.swift
//  Menu
//
//  Created by Zohra on 02.09.25.
//

import Foundation

struct MenuModel: Codable, Hashable {
    let id: String
    let title: String
    let icon: String?
    let subCategories: [MenuModel]?

    var hasSubCategories: Bool {
        return subCategories?.isEmpty ?? true
    }
}
