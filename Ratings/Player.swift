//
//  Player.swift
//  Ratings
//
//  Created by Mohaiminul Islam on 5/14/16.
//  Copyright © 2016 infancyit. All rights reserved.
//

import Foundation
import UIKit

struct Player {
    var name: String?
    var game: String?
    var rating: Int
    
    init(name: String?, game: String? , rating: Int){
        self.name = name
        self.game = game
        self.rating = rating
    }
}