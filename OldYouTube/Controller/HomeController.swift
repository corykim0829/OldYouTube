//
//  ViewController.swift
//  OldYouTube
//
//  Created by Cory Kim on 12/12/2018.
//  Copyright © 2018 CoryKim. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var videos: [Video] = {
        var darkTVChannel = Channel()
        darkTVChannel.name = "DarkTV"
        darkTVChannel.profileImageName = "Dark"
        
        var afreecaTVChannel = Channel()
        afreecaTVChannel.name = "afreeca TV esports"
        afreecaTVChannel.profileImageName = "afreecaTV"
        
        var sc2Video = Video()
        sc2Video.title = "Starcraft 2 Dark(Z) highlight"
        sc2Video.thumbnailImageName = "starcraft-2-zerg"
        sc2Video.numberOfViews = 17217212
        sc2Video.channel = darkTVChannel
        
        var sktProLeagueVideo = Video()
        sktProLeagueVideo.title = "[SKT Pro League 2016] Dark(Z) vs aLive(T)"
        sktProLeagueVideo.thumbnailImageName = "dark_vs_alive"
        sktProLeagueVideo.numberOfViews = 265248271
        sktProLeagueVideo.channel = afreecaTVChannel
        
        return [sc2Video, sktProLeagueVideo]
    }()
    
    func fetchVideo() {
        guard let url = URL(string: "https://s3-us-west-2.amazonaws.com/youtubeassets/home.json") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if error != nil {
                print(error)
                return
            }
            
            let str = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("*********************************** \n lets : ")
            print(str)
            
        }.resume()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchVideo()
        
        navigationItem.title = "Home"
        navigationController?.navigationBar.isTranslucent = false
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        collectionView.backgroundColor = UIColor.white
        
        collectionView.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView.contentInset = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        
        setupMenuBar()
        setupNavBarButtons()
    }
    
    func setupNavBarButtons() {
        let searchImage = UIImage(named: "search_icon")?.withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        let moreImage = UIImage(named: "more_icon")?.withRenderingMode(.alwaysOriginal)
        let moreButton = UIBarButtonItem(image: moreImage, style: .plain, target: self, action: #selector(handleMore))
        
        navigationItem.rightBarButtonItems = [moreButton, searchBarButtonItem]
    }
    
    @objc func handleMore() {
        
    }
    
    @objc func handleSearch() {
        print(123)
    }
    
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
    }()
    
    private func setupMenuBar() {
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:|[v0(50)]", views: menuBar)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! VideoCell
        cell.video = videos[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (view.frame.width - 16 - 16) * 9 / 16
        return CGSize(width: view.frame.width, height: height + 16 + 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


