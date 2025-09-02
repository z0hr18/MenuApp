//
//  MenuListCell.swift
//  Menu
//
//  Created by Zohra on 02.09.25.
//

import UIKit

final class MenuListCell: UICollectionViewCell {
    static let reuseID = "MenuListCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let chevron: UIImageView = {
        let iv = UIImageView(image: UIImage(systemName: "chevron.right"))
        iv.tintColor = .tertiaryLabel
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .secondarySystemBackground
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        setupListCellConstraints()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setupListCellConstraints() {
        contentView.addSubview(titleLabel)
        contentView.addSubview(chevron)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            chevron.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            chevron.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    func configure(title: String, showsChevron: Bool) {
        titleLabel.text = title
        chevron.isHidden = !showsChevron
    }
}
