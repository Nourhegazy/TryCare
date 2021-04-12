//
//  String + Localization.swift
//  Iraq
//
//  Created by UPS Apple on 7/26/20.
//  Copyright © 2020 UPSKWT. All rights reserved.
//

import Foundation

extension String {

    var localized: String {
       return NSLocalizedString(self, comment: "")
   }
    
    func dateInArabic () -> String {
        
        let formatter = DateFormatter()
        var outputDate = ""
        formatter.dateFormat = "yyyy-MM-dd "
        
        if let date = formatter.date(from: self) {
            formatter.locale = Locale(identifier: "ar")
            formatter.dateFormat = "d MMMM yyyy"
            outputDate = formatter.string(from: date)
        }
        
        return outputDate
    }
    func dateInEnglish () -> String {
        
        let formatter = DateFormatter()
        var outputDate = ""
        formatter.dateFormat = "yyyy-MM-dd "
        
        if let date = formatter.date(from: self) {
            formatter.locale = Locale(identifier: "en")
            formatter.dateFormat = " d MMMM yyyy"
            outputDate = formatter.string(from: date)
        }
        
        return outputDate
    }
    
}
