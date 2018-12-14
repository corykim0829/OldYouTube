//
//  MenuBar.swift
//  OldYouTube
//
//  Created by Cory Kim on 14/12/2018.
//  Copyright © 2018 CoryKim. All rights reserved.
//

import UIKit

class MenuBar: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.rgb(red: 230, green: 32, blue: 31)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
