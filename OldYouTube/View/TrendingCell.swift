//
//  TrendingCell.swift
//  OldYouTube
//
//  Created by Cory Kim on 01/01/2019.
//  Copyright © 2019 CoryKim. All rights reserved.
//

import UIKit

class TrendingCell: FeedCell {
    override func fetchVideos() {
        ApiService.sharedInstance.fetchTrendingFeed { (videos) in
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
}
