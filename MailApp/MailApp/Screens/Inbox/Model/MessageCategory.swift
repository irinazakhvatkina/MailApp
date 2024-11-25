//
//  MessageCategory.swift
//  MailApp
//
//  Created by Irina Zakhvatkina on 21/10/24.
//

import Foundation
import UIKit

enum MessageCategory {
    case primary
    case promo
    case news
    case announcement
   
    var categoryColors: UIColor {
        switch self{
        case .primary: return .systemMint
        case .promo: return .systemGreen
        case .news: return .systemRed
        case .announcement: return .systemOrange
        }
    }
    
    var titleCategory: String{
        switch self{
        case .primary: return "primary"
        case .promo: return "promo"
        case .news: return "news"
        case .announcement: return "announcement"
        }
    }
    
    var icon: String {
        switch self {
        case .primary: return "star"
        case .promo: return "cart"
        case .news: return "message"
        case .announcement: return "bell"
        }
    }
    
    static var allCategories: [MessageCategory] {
        return [.primary, .promo, .news, .announcement]
    }
    
}
