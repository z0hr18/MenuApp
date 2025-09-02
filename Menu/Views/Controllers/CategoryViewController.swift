//
//  CategoryViewController.swift
//  Menu
//
//  Created by Zohra on 02.09.25.
//

import UIKit

final class CategoryViewController: UIViewController {
    private let viewModel = CategoryViewModel()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CategoryChipCell.self, forCellWithReuseIdentifier: CategoryChipCell.reuseID)
        collectionView.register(MenuListCell.self, forCellWithReuseIdentifier: MenuListCell.reuseID)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Menyu"
        view.backgroundColor = .systemBackground
        
        viewModel.load()
        
        setupCollectionViewConstraints()
        collectionView.reloadData()
    }
    
    private func makeLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in
            if sectionIndex == 0 {
                return AppLayouts.shared.makeCategoryHeaderSection()
            } else {
                return AppLayouts.shared.makeSubcategoryListSection()
            }
        }
    }
    
    private func setupCollectionViewConstraints() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}

// MARK: - DataSource
extension CategoryViewController: UICollectionViewDataSource {
    func numberOfSections(in _: UICollectionView) -> Int { 2 } /// 0: header, 1: list
    
    func collectionView(_ cv: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        section == 0 ? viewModel.numberOfMainCategories() : viewModel.numberOfSubcategories()
    }
    
    func collectionView(_ cv: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = cv.dequeueReusableCell(withReuseIdentifier: CategoryChipCell.reuseID, for: indexPath) as! CategoryChipCell
            if let cat = viewModel.mainCategory(at: indexPath.item) {
                cell.configure(title: cat.title, selected: indexPath.item == viewModel.selectedMainIndex)
            }
            return cell
        } else {
            let cell = cv.dequeueReusableCell(withReuseIdentifier: MenuListCell.reuseID, for: indexPath) as! MenuListCell
            if let sub = viewModel.subCategory(at: indexPath.item) {
                cell.configure(title: sub.title, showsChevron: !sub.hasSubCategories)
            }
            return cell
        }
    }
}

// MARK: - Delegate
extension CategoryViewController: UICollectionViewDelegate {
    func collectionView(_ cv: UICollectionView, didSelectItemAt ip: IndexPath) {
        if ip.section == 0 {
            viewModel.selectMainCategory(ip.item)
            cv.reloadSections(IndexSet(integer: 1))
            cv.reloadSections(IndexSet(integer: 0))
        } else if let menu = viewModel.subCategory(at: ip.item) {
            if let subs = menu.subCategories, !subs.isEmpty {
                let vc = SubListViewController(menuModel: menu)
                navigationController?.pushViewController(vc, animated: true)
            } else {
                let alert = UIAlertController(title: menu.title, message: "\(menu.title) yeyə bilməzsiniz!", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .destructive))
                present(alert, animated: true)
            }
        }
    }
}
