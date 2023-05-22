//
//  Extension+String.swift
//  FitPetSample
//
//  Created by 크림버드공주 on 2023/05/20.
//

import Foundation

extension String
{
    func toDate() -> Date?
    {
        let dateFormatter = DateFormatter.init()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone.init(identifier: "UTC")
        
        if let date = dateFormatter.date(from: self)
        {
            return date
        }
        else
        {
            return nil
        }
    }
}
