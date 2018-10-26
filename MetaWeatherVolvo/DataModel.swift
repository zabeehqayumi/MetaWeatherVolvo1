//
//  DataModel.swift
//  MetaWeatherVolvo
//
//  Created by Zabeehullah Qayumi on 10/26/18.
//  Copyright © 2018 Zabeehullah Qayumi. All rights reserved.
//

import Foundation
import SwiftyJSON

class DataModel{
    
    var title : String = ""
    
    
    
    init() {
        
    }
    
    init(json: JSON) {
        title = json["title"].stringValue
    }
    
}
