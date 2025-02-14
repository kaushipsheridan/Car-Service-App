//
//  ViewController.swift
//  Priyanshu_Midterm
//
//  Created by Priyanshu Kaushik on 2025-02-12.
//

import UIKit
import AVFoundation;

class ViewController: UIViewController {
    
    var soundPlayer : AVAudioPlayer?;
    let mainDeligatesong = UIApplication.shared.delegate as! AppDelegate
    
    //Handling back button functionality
    @IBAction func unwindNow(sender: UIStoryboardSegue) {
        
        if((mainDeligatesong.soundPlayer) != nil){
            mainDeligatesong.soundPlayer?.stop()
        }
        
        let soundURL = Bundle.main.path(forResource: "SongA", ofType: "mp3");
        
        let url = URL(fileURLWithPath: soundURL!)
        
        mainDeligatesong.soundPlayer = try! AVAudioPlayer.init(contentsOf: url);
        mainDeligatesong.soundPlayer?.currentTime = 30;
        mainDeligatesong.soundPlayer?.numberOfLoops = -1;
        mainDeligatesong.soundPlayer?.play();
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if((mainDeligatesong.soundPlayer) != nil){
            mainDeligatesong.soundPlayer?.stop()
        }
        
        let soundURL = Bundle.main.path(forResource: "SongA", ofType: "mp3");
        
        let url = URL(fileURLWithPath: soundURL!)
        
        mainDeligatesong.soundPlayer = try! AVAudioPlayer.init(contentsOf:url);
        mainDeligatesong.soundPlayer?.currentTime = 30;
        mainDeligatesong.soundPlayer?.numberOfLoops = -1;
        mainDeligatesong.soundPlayer?.play();

            
        
        
        // Do any additional setup after loading the view.
    }


}

