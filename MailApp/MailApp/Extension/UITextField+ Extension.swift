//
//  Extension.swift
//  MailApp
//
//  Created by Irina Zakhvatkina on 14/10/24.
//

import UIKit

extension UITextField {
    func setLeftIcon(_ text: String) {
        let label = UILabel()
        label.text = text
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .lightGray
        leftView = label
        leftViewMode = .always
    }

    func setRightIcon(_ image: UIImage) {
        let iconView = UIImageView(frame:
                                    CGRect(x: -10, y: 8, width: 25, height: 15))
        iconView.tintColor = .lightGray
        iconView.image = image
        let iconContainerView: UIView = UIView(frame:
                                                CGRect(x: 20, y: 5, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        rightView = iconContainerView
        rightViewMode = .always
    }
}
