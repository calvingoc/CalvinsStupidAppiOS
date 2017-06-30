//
//  ViewController.swift
//  CalvinsStupidApp
//
//  Created by Application Development on 6/30/17.
//  Copyright © 2017 ETC. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var nickImage: UIButton!
    var i = 0
    var n = 0
    var player: AVPlayer?
    var playerLayer: AVPlayerLayer?
    var resetButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func playVideo(_ sender: UIButton){
        var videoURL: URL?
        n = Int(arc4random_uniform(6) + 1)
        if (n==5){
            videoURL = Bundle.main.url(forResource: "silentnight", withExtension: "mp4")
        } else if (i==1){
            videoURL = Bundle.main.url(forResource: "imalady", withExtension: "mp4")
        } else if (i==2){
            videoURL = Bundle.main.url(forResource: "peeingmyself", withExtension: "mp4")
        } else if (i==3){
            videoURL = Bundle.main.url(forResource: "scream", withExtension: "mp4")
        } else if (i==0){
            videoURL = Bundle.main.url(forResource: "donteatme", withExtension: "mp4")
        }
        
        
        player = AVPlayer(url: videoURL!)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.videoGravity = AVLayerVideoGravityResize
        playerLayer?.frame = self.view.bounds
        
        NotificationCenter.default.addObserver(self, selector:#selector(self.playerDidFinishPlaying(note:)),name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: player?.currentItem)
        self.view.layer.addSublayer(playerLayer!)
        player?.play()
        resetButton = UIButton(frame: self.view.bounds)
        resetButton.addTarget(self, action: #selector(goBack(sender:)), for: .touchUpInside)
        resetButton.backgroundColor = UIColor.clear
        self.view.addSubview(resetButton)
        
    }
    func playerDidFinishPlaying(note: NSNotification){
        goBack()
    }
    func goBack(sender: UIButton!){
        goBack()
    }
    func goBack(){
        if (n != 5) { i = i + 1 }
        player?.pause()
        playerLayer?.removeFromSuperlayer()
        resetButton.removeFromSuperview()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if ((player?.rate != 0) && (player?.error == nil)){
            goBack()
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

