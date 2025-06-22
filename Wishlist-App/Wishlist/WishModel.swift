//
//  WishModel.swift
//  Wishlist
//
//  Created by Oğuzhan Cnr on 18.02.2025.
//

import Foundation
import SwiftData

@Model
class Wish{
    var title: String
    
    init(title: String){
        self.title = title
    }
}
