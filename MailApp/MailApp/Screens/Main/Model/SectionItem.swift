//
//  SectionItem.swift
//  MailApp
//
//  Created by Irina Zakhvatkina on 21/10/24.
//

import Foundation
import UIKit

enum SectionItem {
    case inbox
    case VIP
    case draft
    case sent
    case spam
    case trash
    case all
    case gmail
    case drafts
    
    var systemImageName: String {
        switch self{
        case .inbox: return "tray"
        case .VIP: return "star"
        case .draft: return "doc"
        case .sent: return "paperplane"
        case .spam: return "xmark.bin"
        case .trash: return "trash"
        case .all: return "archivebox"
        case .gmail, .drafts: return "folder"
        }
    }
    
    var title: String{
        switch self {
        case .inbox: return "Inbox"
        case .VIP: return "VIP"
        case .draft: return "Draft"
        case .sent: return "Sent"
        case .spam: return "Spam"
        case .trash: return "Trash"
        case .all: return "All"
        case .gmail: return "[Gmail]"
        case .drafts: return "Drafts"
        }
    }
    
    var systemImageColor: UIColor {
        switch self{
        case .VIP: return .systemYellow
        case .gmail: return .lightGray
        default: return .systemBlue
        }
    }
    
    var titleColor: UIColor {
        switch self{
        case .gmail: return .darkGray
        default: return .black
        }
    }
    
    var totalRecords: String{
        switch self{
        case .inbox: return "927"
        case .draft: return "7"
        case .all: return "858"
        default: return ""
        }
    }
    
    var totalRecordsColor: UIColor{
        return .darkGray
    }
}
