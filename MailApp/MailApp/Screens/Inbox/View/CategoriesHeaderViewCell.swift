//
//  CategoriesHeaderViewCell.swift
//  MailApp
//
//  Created by Irina Zakhvatkina on 13/10/24.
//
import UIKit

class CategoriesHeaderViewCell: UICollectionViewCell {
    // MARK: - Custom UICollectionViewCell
    let titleLabel = UILabel()
    let iconImageView = UIImageView()
    var isExpanded = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        
        contentView.backgroundColor = .systemGray6
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
        
        titleLabel.isHidden = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        iconImageView.contentMode = .scaleAspectFit
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
      
        
        iconImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(10)
            make.width.height.equalTo(24)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(iconImageView.snp.trailing).offset(8)
            make.centerY.equalToSuperview()
        }
        
       
    }
    
    func configure(with title: String, imageName: String, isExpanded: Bool) {
        self.isExpanded = isExpanded
        titleLabel.text = title
        iconImageView.image = UIImage(systemName: imageName)
        
        titleLabel.isHidden = !isExpanded
      
       
    }
    func tonggleText() {
        isExpanded.toggle()
        titleLabel.isHidden.toggle()

    }

}
