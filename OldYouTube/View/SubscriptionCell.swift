//
//  SubscriptionCell.swift
//  OldYouTube
//
//  Created by Cory Kim on 01/01/2019.
//  Copyright © 2019 CoryKim. All rights reserved.
//

import UIKit

class SubscriptionCell: FeedCell {
    override func fetchVideos() {
        ApiService.sharedInstance.fetchSubscriptionFeed { (videos) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
}
