//
//  MainViewTableViewCell.swift
//  MailApp
//
//  Created by Irina Zakhvatkina on 04/10/24.
//

import UIKit
import SnapKit

class MainViewTableViewCell: UITableViewCell {
//    MARK: - UI
    let iconImageView = UIImageView()
    let titleLabel  = UILabel()
    let totalRecords  = UILabel()


//    MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        configureIconImageView()
        configureTitleLabel()
        configureTotalRecords()
        setAccessoryType()
        
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
    
//  MARK: - Lifecycle
    func addSubviews() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(totalRecords)

    }
    
    func configureIconImageView(){
        iconImageView.image = UIImage(systemName: "tray")
    }
    
    func configureTitleLabel(){
        titleLabel.text = "New mail"
    }
    
    func configureTotalRecords(){
        totalRecords.text = "977"
    }
    func setAccessoryType(){
        accessoryType = .disclosureIndicator
    }
    
    // MARK: - Data Layer
    func updateCell(content: SectionItem){
        iconImageView.image = UIImage(systemName: content.systemImageName)
        iconImageView.tintColor = content.systemImageColor
        titleLabel.text = content.title
        titleLabel.textColor = content.titleColor
        totalRecords.text = content.totalRecords
        totalRecords.textColor = content.totalRecordsColor
        setNeedsUpdateConstraints()
    }
    
    //  MARK: - Constraints
    override func updateConstraints() {
        iconImageView.snp.updateConstraints(){make in
            make.verticalEdges.equalToSuperview().inset(12)
            make.leading.equalToSuperview().inset(16)
        }
        
        titleLabel.snp.updateConstraints(){make in
            make.centerY.equalTo(iconImageView.snp.centerY)
            make.leading.equalTo(iconImageView.snp.trailing).offset(16)
        }
        
        totalRecords.snp.updateConstraints(){make in
            make.trailing.equalToSuperview().inset(16)
            make.centerY.equalTo(iconImageView.snp.centerY)
        }
        super.updateConstraints()
    }
    
}
