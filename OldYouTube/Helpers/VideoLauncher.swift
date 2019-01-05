//
//  VideoLauncher.swift
//  OldYouTube
//
//  Created by Cory Kim on 06/01/2019.
//  Copyright © 2019 CoryKim. All rights reserved.
//

import UIKit

class VideoPlayerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .black
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class VideoLauncher: NSObject {
    
    func showVideoPlayer() {
        print("Show Video Player Animation...")
        
        if let keyWindow = UIApplication.shared.keyWindow {
            let view = UIView(frame: keyWindow.frame)
            view.backgroundColor = UIColor.white
            
            view.frame = CGRect(x: keyWindow.frame.width - 30, y: keyWindow.frame.height - 30, width: 30, height: 30)
            
            keyWindow.addSubview(view)
            
            let statusBarHeight: CGFloat = 40
            let statusBarBackgroundView = UIView()
            statusBarBackgroundView.backgroundColor = .black
            statusBarBackgroundView.frame = CGRect(x: 0, y: 0, width: keyWindow.frame.width, height: statusBarHeight)
            view.addSubview(statusBarBackgroundView)
            
            // 16 : 9 is the aspect ratio of all HD videos
            let height = keyWindow.frame.width / 16 * 9
            let videoPlayerFrame = CGRect(x: 0, y: statusBarHeight, width: keyWindow.frame.width, height: height)
            let videoPlayerView = VideoPlayerView(frame: videoPlayerFrame)
            
            view.addSubview(videoPlayerView)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                
                view.frame = CGRect(x: 0, y: 0, width: keyWindow.frame.width, height: keyWindow.frame.height)
                
            }) { (completedAnimation) in
                // Hide Status Bar
//                let statusBar: UIView = UIApplication.shared.value(forKey: "statusBar") as! UIView
//                statusBar.isHidden = true
            }
        }
    }
}
