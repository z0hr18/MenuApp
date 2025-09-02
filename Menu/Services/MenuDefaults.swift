//
//  MenuDefaults.swift
//  Menu
//
//  Created by Zohra on 02.09.25.
//

import Foundation

enum MenuDefaults {
    static var initial: [MenuModel] {
        return [
            MenuModel(id: "food", title: "Yeməklər", icon: nil, subCategories: [
                MenuModel(id: "hot", title: "İsti yeməklər", icon: nil, subCategories: [
                    MenuModel(id: "plov", title: "Plov", icon: nil, subCategories: nil),
                    MenuModel(id: "dolma", title: "Dolma", icon: nil, subCategories: nil),
                    MenuModel(id: "kabab", title: "Kabab", icon: nil, subCategories: nil)
                ]),
                MenuModel(id: "saj", title: "Sac yeməkləri", icon: nil, subCategories: [
                    MenuModel(id: "saj_chicken", title: "Sac Toyuq", icon: nil, subCategories: nil),
                    MenuModel(id: "saj_meat", title: "Sac Ət", icon: nil, subCategories: nil)
                ]),
                MenuModel(id: "snacks", title: "Qəlyanaltılar", icon: nil, subCategories: [
                    MenuModel(id: "fries", title: "Kartof fri", icon: nil, subCategories: nil),
                    MenuModel(id: "bruschetta", title: "Bruşetta", icon: nil, subCategories: nil)
                ]),
                MenuModel(id: "soups", title: "Şorəbalar", icon: nil, subCategories: [
                    MenuModel(id: "dovga", title: "Dovğa", icon: nil, subCategories: nil),
                    MenuModel(id: "piti", title: "Piti", icon: nil, subCategories: nil)
                ])
            ]),
            MenuModel(id: "drinks", title: "İçkilər", icon: nil, subCategories: [
                MenuModel(id: "non_alc", title: "Alkoqolsuz içkilər", icon: nil, subCategories: [
                    MenuModel(id: "tea", title: "Çay", icon: nil, subCategories: nil),
                    MenuModel(id: "coffee", title: "Qəhvə", icon: nil, subCategories: nil),
                    MenuModel(id: "lemonade", title: "Limonad", icon: nil, subCategories: nil)
                ]),
                MenuModel(id: "alc", title: "Alkoqollu içkilər", icon: nil, subCategories: [
                    MenuModel(id: "whisky", title: "Viskilər", icon: nil, subCategories: [
                        MenuModel(id: "jack", title: "Jack Daniel's", icon: nil, subCategories: nil),
                        MenuModel(id: "chivas", title: "Chivas Regal", icon: nil, subCategories: nil)
                    ]),
                    MenuModel(id: "vodka", title: "Araqlar", icon: nil, subCategories: [
                        MenuModel(id: "absolut", title: "Absolut", icon: nil, subCategories: nil),
                        MenuModel(id: "smirnoff", title: "Smirnoff", icon: nil, subCategories: nil)
                    ]),
                    MenuModel(id: "wine", title: "Şərablar", icon: nil, subCategories: [
                        MenuModel(id: "red", title: "Qırmızı şərab", icon: nil, subCategories: nil),
                        MenuModel(id: "white", title: "Ağ şərab", icon: nil, subCategories: nil)
                    ])
                ])
            ]),
            MenuModel(id: "desserts", title: "Desertlər", icon: nil, subCategories: [
                MenuModel(id: "cake", title: "Tort", icon: nil, subCategories: nil),
                MenuModel(id: "baklava", title: "Paxlava", icon: nil, subCategories: nil),
                MenuModel(id: "icecream", title: "Dondurma", icon: nil, subCategories: nil)
            ]),
            MenuModel(id: "other", title: "Digər", icon: nil, subCategories: [
                MenuModel(id: "sauces", title: "Souslar", icon: nil, subCategories: nil),
                MenuModel(id: "salads", title: "Salatlar", icon: nil, subCategories: nil)
            ])
        ]
    }
}
