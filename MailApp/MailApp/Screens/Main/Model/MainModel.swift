//
//  MainModel.swift
//  MailApp
//
//  Created by Irina Zakhvatkina on 16/10/24.
//

import UIKit

class MainModel{
//    MARK: - Data Layer
    let sections: [Section] = [.inbox, .general]
    var expandedSections: [Bool] = [true, false]

    
//    MARK: - Data Source
    func numberOfSections() -> Int {
        sections.count
    }
    
    func numberOfRowInSection(_ section: Int) -> Int {
        expandedSections[section] ? sections[section].items.count : 0
    }
    
    func cellForRowAt(indexPath: IndexPath) -> SectionItem{
        let content = sections[indexPath.section].items[indexPath.row]
        return content
    }
    
   

//    MARK: - Delegate

    func didSelectRowAt(indexPath:IndexPath) -> SectionItem{
        let section = sections[indexPath.section]
        let item = section.items[indexPath.section]
        return item
    }

}
