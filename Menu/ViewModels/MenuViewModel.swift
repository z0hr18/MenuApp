//
//  MenuViewModel.swift
//  Menu
//
//  Created by Zohra on 02.09.25.
//

import Foundation

final class CategoryViewModel {
    private(set) var categories: [MenuModel] = []
    private(set) var selectedMainIndex: Int = 0
    
    func load() {
        categories = MenuStore.load()
        if categories.isEmpty {
            categories = MenuDefaults.initial
            MenuStore.save(categories)
        }
    }
    
    /// Header
    func numberOfMainCategories() -> Int { categories.count }
    func mainCategory(at index: Int) -> MenuModel? {
        guard categories.indices.contains(index) else { return nil }
        return categories[index]
    }
    func selectMainCategory(_ index: Int) { selectedMainIndex = index }
    
    /// List
    func numberOfSubcategories() -> Int {
        categories.indices.contains(selectedMainIndex) ? (categories[selectedMainIndex].subCategories?.count ?? 0) : 0
    }
    
    func subCategory(at index: Int) -> MenuModel? {
        guard categories.indices.contains(selectedMainIndex),
              let subs = categories[selectedMainIndex].subCategories,
              subs.indices.contains(index) else { return nil }
        return subs[index]
    }
}
