//
//  SubListViewController.swift
//  Menu
//
//  Created by Zohra on 02.09.25.
//
import UIKit

final class SubListViewController: UIViewController {
    private let menuModel: MenuModel
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: makeSubLayout())
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .systemBackground
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MenuListCell.self, forCellWithReuseIdentifier: MenuListCell.reuseID)
        return collectionView
    }()
    
    init(menuModel: MenuModel) {
        self.menuModel = menuModel
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = menuModel.title
        view.backgroundColor = .systemBackground
        setupCollectionViewConstraints()
    }
    
    private func makeSubLayout() -> UICollectionViewCompositionalLayout {
        let section = AppLayouts.shared.makeDetailListSection()
        return UICollectionViewCompositionalLayout(section: section)
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
extension SubListViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuModel.subCategories?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: MenuListCell.reuseID,
            for: indexPath
        ) as! MenuListCell
        
        if let menu = menuModel.subCategories?[indexPath.item] {
            cell.configure(title: menu.title, showsChevron: !(menu.hasSubCategories))
        }
        return cell
    }
}

// MARK: - Delegate
extension SubListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let menu = menuModel.subCategories?[indexPath.item] else { return }
        
        if let subMenus = menu.subCategories, !subMenus.isEmpty {
            let vc = SubListViewController(menuModel: menu)
            navigationController?.pushViewController(vc, animated: true)
        } else {
            let alert = UIAlertController(title: menu.title, message: "\(menu.title) yeyə bilməzsiniz!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .destructive))
            present(alert, animated: true)
        }
    }
}
