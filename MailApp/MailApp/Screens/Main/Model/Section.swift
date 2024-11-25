//
//  Section.swift
//  MailApp
//
//  Created by Irina Zakhvatkina on 02/10/24.
//
import UIKit

enum Section {
    case inbox
    case general
    
    var items: [SectionItem]{
        switch self{
        case .inbox: return [.inbox, .VIP]
        case . general: return [.draft, .sent, .spam, .trash, .all, .gmail, .drafts]
        }
    }
}

