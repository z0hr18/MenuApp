//
//  CategoryChipCell.swift
//  Menu
//
//  Created by Zohra on 02.09.25.
//
import UIKit

final class CategoryChipCell: UICollectionViewCell {
    static let reuseID = "CategoryChipCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.layer.cornerRadius = 16
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemGray4.cgColor
        contentView.backgroundColor = .secondarySystemBackground
        setupListCellConstraints()
    }
    
    required init?(coder: NSCoder) { fatalError("init(coder:) has not been implemented") }
    
    private func setupListCellConstraints() {
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6)
        ])
    }
    
    func configure(title: String, selected: Bool) {
        titleLabel.text = title
        setSelected(selected)
    }
    
    private func setSelected(_ isSelected: Bool) {
        if isSelected {
            contentView.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.15)
            contentView.layer.borderColor = UIColor.systemBlue.cgColor
            titleLabel.textColor = .systemBlue
        } else {
            contentView.backgroundColor = .secondarySystemBackground
            contentView.layer.borderColor = UIColor.systemGray4.cgColor
            titleLabel.textColor = .label
        }
    }
}
