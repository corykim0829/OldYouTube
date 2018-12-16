//
//  Video.swift
//  OldYouTube
//
//  Created by Cory Kim on 16/12/2018.
//  Copyright © 2018 CoryKim. All rights reserved.
//

import UIKit

class Video: NSObject {
    
    var thumbnailImageName: String?
    var title: String?
    
    var channel: Channel?
    
}

class Channel: NSObject {
    var name: String?
    var profileImageName: String?
    
}
