//
//  MessageTableViewCell.swift
//  MailApp
//
//  Created by Irina Zakhvatkina on 10/10/24.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    
//    MARK: - UI
    let titleLabel  = UILabel()
    let subtitleLabel  = UILabel()
    let letterLabel  = UILabel()
    let iconImageView = UIImageView()
    let categoryIconImageView = UIImageView()
    let timeLabel = UILabel()
    let arrowButton = UIButton()
    let isReadIcon = UIImageView()

//    MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        configureisReadIcon()
        configureIconImageView()
        configureTitleLabel()
        configureSubtitleLabe()
        configureLetterLabel()
        configureTimeLable()
        configureArrowButton()
        configureCategoryIconImageView()
       
        
        setNeedsUpdateConstraints()
    }
    
    required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
    
//  MARK: - Lifecycle
    func addSubviews() {
        contentView.addSubview(isReadIcon)
        contentView.addSubview(iconImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(letterLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(arrowButton)
        contentView.addSubview(categoryIconImageView)
    }
    
    func configureisReadIcon(){
        isReadIcon.image = UIImage(systemName: "circle.fill")
    }
    
    func configureIconImageView(){
        iconImageView.image = UIImage(systemName: "message.circle.fill")
    }
    
    func configureTitleLabel(){
        titleLabel.text = "Name"
        titleLabel.font = .systemFont(ofSize: 17, weight: .bold)
        titleLabel.textColor = .black
    }
    
    func configureSubtitleLabe(){
        subtitleLabel.text = "Theme"
        subtitleLabel.font = .systemFont(ofSize: 13, weight: .bold)
        subtitleLabel.textColor = .black
    }
    
    func configureLetterLabel(){
        letterLabel.text = "Letter"
        letterLabel.font = .systemFont(ofSize: 13, weight: .light)
        letterLabel.textColor = .gray
        letterLabel.numberOfLines = 2
    }
    
    func configureTimeLable(){
        timeLabel.text = "9:27 AM"
        timeLabel.font = .systemFont(ofSize: 12, weight: .light)
        timeLabel.textColor = .gray
    }
    
    func configureArrowButton(){
        arrowButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        arrowButton.contentMode = .scaleAspectFit
    }
    
    func configureCategoryIconImageView(){
        categoryIconImageView.image = UIImage(systemName: "tray")
    }
    
    // MARK: - Data Layer
    func updateCell(content: Message){
        iconImageView.image = UIImage(systemName: content.iconName)
        titleLabel.text = content.title
        subtitleLabel.text = content.subtitle
        letterLabel.text = content.letter
        timeLabel.text = content.time
        
        // Установка прочитанных сообщений
        isReadIcon.isHidden = content.isRead
        
        // Устанавливаем иконку в зависимости от категории
        switch content.category {
        case .primary:
            categoryIconImageView.image = nil
        case .promo:
            categoryIconImageView.image = UIImage(systemName: "cart")
        case .news:
            categoryIconImageView.image = UIImage(systemName: "message")
        case .announcement:
            categoryIconImageView.image = UIImage(systemName: "bell") 
        }
                
        setNeedsUpdateConstraints()
    }
    
    //  MARK: - Constraints
    override func updateConstraints() {
        isReadIcon.snp.updateConstraints(){make in
            make.centerY.equalTo(iconImageView.snp.centerY)
            make.trailing.equalTo(iconImageView.snp.leading).inset(-2)
            make.width.height.equalTo(10)
        }
        
        iconImageView.snp.updateConstraints(){make in
            make.verticalEdges.equalToSuperview().inset(12)
            make.leading.equalToSuperview().inset(16)
            make.width.height.equalTo(70)
        }
        
        titleLabel.snp.updateConstraints(){make in
            make.top.equalToSuperview().inset(15)
            make.leading.equalTo(iconImageView.snp.trailing).offset(16)
        }
        
        subtitleLabel.snp.updateConstraints(){make in
            make.top.equalTo(titleLabel.snp.bottom).offset(3)
            make.leading.equalTo(iconImageView.snp.trailing).offset(16)
        }
        
        letterLabel.snp.updateConstraints(){make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(5)
            make.leading.equalTo(iconImageView.snp.trailing).offset(16)
            make.trailing.equalToSuperview().inset(16)
        }
        
        arrowButton.snp.updateConstraints(){make in
            make.top.equalToSuperview().inset(15)
            make.trailing.equalToSuperview().inset(16)
            make.width.height.equalTo(15)
        }
        
        timeLabel.snp.updateConstraints(){make in
            make.centerY.equalTo(arrowButton.snp.centerY)
            make.trailing.equalTo(arrowButton.snp.leading).offset(-10)
        }
        
        categoryIconImageView.snp.updateConstraints(){make in
            make.centerY.equalTo(subtitleLabel.snp.centerY)
            make.centerX.equalTo(arrowButton.snp.centerX)
            make.width.height.equalTo(15)

        }
        
        super.updateConstraints()
    }


}
