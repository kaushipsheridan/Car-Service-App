//
//  YourCarViewController.swift
//  Priyanshu_Midterm
//
//  Created by Priyanshu Kaushik on 2025-02-12.
//

import UIKit
import AVFoundation

class YourCarViewController: UIViewController {
    
    //creating variables
    @IBOutlet  var tfMake2: UILabel!
    @IBOutlet  var tfModel2: UILabel!
    @IBOutlet  var tfYear2: UILabel!
    @IBOutlet  var tfColour2: UILabel!
    @IBOutlet  var tfKMS2: UILabel!
    
    var soundPlayer : AVAudioPlayer?;
    let mainDeligatesong = UIApplication.shared.delegate as! AppDelegate
    
    
    //Handling back button functionality
    @IBAction func unwindNow(sender: UIStoryboardSegue) {
        if((mainDeligatesong.soundPlayer) != nil){
            mainDeligatesong.soundPlayer?.stop()
        }
        
        let soundURL = Bundle.main.path(forResource: "SongC", ofType: "mp3");
        
        let url = URL(fileURLWithPath: soundURL!)
        
        mainDeligatesong.soundPlayer = try! AVAudioPlayer.init(contentsOf: url);
        mainDeligatesong.soundPlayer?.currentTime = 30;
        mainDeligatesong.soundPlayer?.numberOfLoops = -1;
        mainDeligatesong.soundPlayer?.play();

        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let mainDeligate = UIApplication.shared.delegate as! AppDelegate
        
        tfMake2.text = mainDeligate.data.savedMake;
        tfModel2.text = mainDeligate.data.savedModel;
        tfYear2.text = mainDeligate.data.savedYear;
        tfColour2.text = mainDeligate.data.savedColor;
        tfKMS2.text = mainDeligate.data.savedKMS;
        
        


        if((mainDeligatesong.soundPlayer) != nil){
            mainDeligatesong.soundPlayer?.stop()
        }
        
        let soundURL = Bundle.main.path(forResource: "SongC", ofType: "mp3");
        
        let url = URL(fileURLWithPath: soundURL!)
        
        mainDeligatesong.soundPlayer = try! AVAudioPlayer.init(contentsOf: url);
        mainDeligatesong.soundPlayer?.currentTime = 30;
        mainDeligatesong.soundPlayer?.numberOfLoops = -1;
        mainDeligatesong.soundPlayer?.play();


        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
