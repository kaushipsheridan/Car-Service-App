//
//  AnimationViewController.swift
//  Priyanshu_Midterm
//
//  Created by Priyanshu Kaushik on 2025-02-12.
//

import UIKit
import AVFoundation



class AnimationViewController: UIViewController {
    
    var soundPlayer: AVAudioPlayer?
    
    @IBOutlet var animgView: UIImageView!
    

    //layer for fading
    var fadeLayer:CALayer?
    var spinLayer:CALayer?

    
    func animateImage()
    {
        let im1=UIImage(named: "carimg1.png")!
        let im2=UIImage(named:"carimg2.png")!
        let im3=UIImage(named:"carimg3.png")!
        let im4=UIImage(named:"carimg4.png")!
        let im5=UIImage(named:"carimg5.png")!

        //putting it in array
        let arImg=[im1,im2,im3,im4,im5]

        animgView.animationImages=arImg;
        animgView.animationDuration=2.0;
        animgView.animationRepeatCount=0;
        animgView.startAnimating();

    }
    
    func fadeImage(){
       
        
        
        
    }
    
    func spinImage(){
        
        
        let fadeImg = UIImage(named:"carimg12.png");
        fadeLayer = .init();
        fadeLayer?.contents = fadeImg?.cgImage;
        fadeLayer?.bounds=CGRect(x: 0, y: 0, width: 150, height: 150);
        fadeLayer?.position=CGPoint(x: 200, y: 200);
        
        view.layer.addSublayer(fadeLayer!);
        
        //setting fade animation now
        let fadeAnimation = CABasicAnimation(keyPath: "opacity");
        fadeAnimation.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut);
        fadeAnimation.fromValue = NSNumber.init(value:1.0);
        fadeAnimation.toValue = NSNumber.init(value: 0.0);
        fadeAnimation.isRemovedOnCompletion=false;
        
        //animation duration - total time to be faded away
        fadeAnimation.duration=3.0;
        //this means start fading after 1st second
        fadeAnimation.beginTime=1.0
        fadeAnimation.isAdditive=false;
        
        //now making sure that after fading out, it fades back in
        fadeAnimation.autoreverses=true;
        
       fadeAnimation.fillMode = .both
        fadeAnimation.repeatCount = .infinity;
        fadeLayer?.add(fadeAnimation,forKey: nil);
        
        //setting rotationa as well in the same layer
        
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.timingFunction=CAMediaTimingFunction(name:.easeInEaseOut);
        rotateAnimation.fromValue=0;
        rotateAnimation.toValue=2*Double.pi;
        rotateAnimation.isRemovedOnCompletion=false;
        rotateAnimation.duration=1.0;
        rotateAnimation.repeatCount = .infinity;
        
        fadeLayer?.add(rotateAnimation, forKey: nil);

    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
        let mainDeligatesong = UIApplication.shared.delegate as! AppDelegate


        if((mainDeligatesong.soundPlayer) != nil){
            mainDeligatesong.soundPlayer?.stop()
        }
        
        let soundURL = Bundle.main.path(forResource: "SongD", ofType: "mp3");
        
        let url = URL(fileURLWithPath: soundURL!)
        
        mainDeligatesong.soundPlayer = try! AVAudioPlayer.init(contentsOf: url);
        mainDeligatesong.soundPlayer?.currentTime = 30;
        mainDeligatesong.soundPlayer?.numberOfLoops = -1;
        mainDeligatesong.soundPlayer?.play();
        
        
        //calling to animate the images
        animateImage()
        
        
        
        //calling spin image
        spinImage();
        
        //calling to fade the image
        fadeImage()

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
