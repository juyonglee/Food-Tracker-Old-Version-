//
//  Meal.swift
//  FoodTracker
//
//  Created by LeeJuYong on 2016. 9. 5..
//  Copyright © 2016년 LeeJuYong. All rights reserved.
//

import UIKit

class Meal
{
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: Failable Initializer
    required init?(name:String, photo:UIImage?, rating:Int) {
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
        
        // Initialization should fail if there is no name or if the rating is negative.
        if name.isEmpty || rating<0{
            return nil
        }
    }
}