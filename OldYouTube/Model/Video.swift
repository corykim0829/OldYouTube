//
//  Video.swift
//  OldYouTube
//
//  Created by Cory Kim on 16/12/2018.
//  Copyright © 2018 CoryKim. All rights reserved.
//

import UIKit

struct Video: Decodable {
    var thumbnail_image_name: String?
    var title: String?
    var number_of_views: Int?
    var uploadDate: Date?
    var duration: Int?
    var number_of_likes: Int?
    
    var channel: Channel?
}

struct Channel: Decodable {
    var name: String?
    var profile_image_name: String?
}

//class Video: NSObject{
//
//    var title: String?
//    var number_of_views: NSNumber?
//    var thumbnail_image_name: String?
//    var uploadDate: NSDate?
//    var duration: NSNumber?
//
//    var channel: Channel?
//}
//
//class Channel: NSObject {
//    var name: String?
//    var profile_image_name: String?
//
//}
