//
//  restaurant.swift
//  saveData
//
//  Created by student on 5/20/16.
//  Copyright © 2016 student. All rights reserved.
//

import Foundation

class restaurant : NSObject, NSCoding{
    
    
    var restaurantName: String
    var restaurantAddress: String
    var restaurantRating: Int
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("restaurants")
    
    struct PropertyKey {
        static let nameKey = "restaurantName"
        static let addressKey = "restaurantAddress"
        static let ratingKey = "restaurantRating"
    }
    
    
    init?(restaurantName: String,restaurantAddress: String , restaurantRating: Int) {
        // Initialize stored properties.
        self.restaurantName = restaurantName
        self.restaurantAddress = restaurantAddress
        self.restaurantRating = restaurantRating
        
        super.init()
        
        // Initialization should fail if there is no name or if the rating is negative.
        if restaurantName.isEmpty || restaurantRating < 0 {
            return nil
        }
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(restaurantName, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(restaurantAddress, forKey: PropertyKey.addressKey)
        aCoder.encodeInteger(restaurantRating, forKey: PropertyKey.ratingKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let restaurantName = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        
        // Because photo is an optional property of Meal, use conditional cast.
        let restaurantAddress = aDecoder.decodeObjectForKey(PropertyKey.addressKey) as? String
        
        let restaurantRating = aDecoder.decodeIntegerForKey(PropertyKey.ratingKey)
        
        // Must call designated initializer.
        self.init(restaurantName : restaurantName, restaurantAddress: restaurantAddress!, restaurantRating :restaurantRating)
    }
    
    
    
    
    
    
}
