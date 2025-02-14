//
//  DetailsViewController.swift
//  Priyanshu_Midterm
//
//  Created by Priyanshu Kaushik on 2025-02-12.
//

import UIKit
import AVFoundation

class DetailsViewController: UIViewController, UITextFieldDelegate {
    
    //creating variables
    @IBOutlet  var tfMake: UITextField!
    @IBOutlet  var tfModel: UITextField!
    @IBOutlet  var tfYear: UITextField!
    var tfColour = "BLACK";
    @IBOutlet  var tfKMS: UITextField!
    
    @IBOutlet var sgcolour:UISegmentedControl!
    
    let mainDeligatesong = UIApplication.shared.delegate as! AppDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            return textField.resignFirstResponder() // Hide the keyboard
            
        }

    
    
    
    //adding event handler for the Go button
    @IBAction func buttonConfirmation(sender:UIButton){
        //Step 1 : define alert box
        let alert=UIAlertController(title: "Confirmaion Alert!" ,message: "Did you fill everything correctly?", preferredStyle: .alert);
        
        //Step 2 : define buttons
        let noAction=UIAlertAction(title: "No", style: .cancel);
        
        let yesAction=UIAlertAction(title:"Yes", style: .default)  //this is a completion handler code- works when the function has been performed
        {
            ac in
            //calling do update
            self.segmentAnswer()
            self.mainDeligatesong.soundPlayer?.stop()
            //this yes button has to explicitly say to go away
            self.dismiss(animated: true);
            
        }
       
        //Step 3 : Join alert box and button
        alert.addAction(yesAction);
        alert.addAction(noAction);
    
        //Step 4 : display on the main screen
        present(alert,animated: true);
        

        
    }
    
    func segmentAnswer(){
        
        
        
        if(sgcolour.selectedSegmentIndex==0){
            tfColour="BLACK";
        }
        else if (sgcolour.selectedSegmentIndex==1){
            tfColour="BLUE";
        }else if (sgcolour.selectedSegmentIndex==2){
            tfColour="GREY";
        }else if (sgcolour.selectedSegmentIndex==3){
            tfColour="WHITE";
        }
        else if (sgcolour.selectedSegmentIndex==4){
            tfColour="RED";
        }
       
        doUpdate()
        
    }
    
    
    
    
    //handling to actually do the updates
func doUpdate(){
    
    let mainDeligate = UIApplication.shared.delegate as! AppDelegate
    
    //getting data from the App deligate and then setting the values
    mainDeligate.data.initWithData(theMake: tfMake.text!, theModel: tfModel.text!, theYear: tfYear.text!, theColour: self.tfColour, theKMS: tfKMS.text!)
    
    
}


    override func viewDidLoad() {
        super.viewDidLoad()
        
//        tfMake.delegate = self
//        tfModel.delegate = self
//        tfYear.delegate = self
//        tfKMS.delegate = self

        


        if((mainDeligatesong.soundPlayer) != nil){
            mainDeligatesong.soundPlayer?.stop()
        }
        
        let soundURL = Bundle.main.path(forResource: "SongB", ofType: "mp3");
        
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
