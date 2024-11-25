//
//  InboxModel.swift
//  MailApp
//
//  Created by Irina Zakhvatkina on 18/10/24.
//

import UIKit

class InboxModel{
    
//    MARK: - Property
    var messages: [Message] = [
        Message(title: "Darla Davidson", subtitle: "Tickets for tonight", letter: "Hey! Attaching your tickets here in case we end up going at different times. Can't wait!", iconName: "person.circle.fill", isRead: false, time: "9:27 AM", category: .primary),
        Message(title: "United Airlines", subtitle: "Quick reminders", letter: "Here’s your very own checklist with what you’ll need to do before your flight.", iconName: "person.crop.square.fill", isRead: false, time: "9:10 AM", category: .promo),
        Message(title: "Liz, Kristina & Melody", subtitle: "Friday dinner", letter: "Wow, I love the formality of this invite. Should we dress up?", iconName: "books.vertical", isRead: true, time: "8:58 AM", category: .primary),
        Message(title: "Jeni's Ice Creams", subtitle: "Your order is out for delivery!", letter: "Rich, your order is almost here. The final stretch.", iconName: "message.circle.fill", isRead: false, time: "8:42 AM", category: .promo),
        Message(title: "Disney+", subtitle: "Your one-time passcode", letter: "This passcode can only be used once and will expire in 15 min.", iconName: "star.bubble", isRead: false, time: "8:05 AM", category: .news),
        Message(title: "Graham McBride", subtitle: "Tell us if you can make it", letter: "Reminder to RSVP and reserve your seat at the table.", iconName: "bus.doubledecker", isRead: false, time: "7:17 AM", category: .announcement)
    ]
    
//    MARK: - Public
    func numberOfRowsInSectiont(_section: Int) -> Int{
        messages.count
    }
    
    func cellForRowAt(indexPath: IndexPath) -> Message{
        messages[indexPath.row]
    }
    
//

   
}
