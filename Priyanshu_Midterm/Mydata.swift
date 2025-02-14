//
//  Mydata.swift
//  Priyanshu_Midterm
//
//  Created by Priyanshu Kaushik on 2025-02-13.
//

import Foundation
import UIKit

class MyData: NSObject {
    
    //declaring objects
    var savedMake:String?
    var savedModel:String?
    var savedYear:String?
    var savedColor:String?
    var savedKMS:String?
    
    
    //constructor
    func initWithData(theMake:String, theModel:String, theYear:String, theColour:String, theKMS:String){
        savedMake=theMake
        savedModel=theModel
        savedYear=theYear
        savedColor=theColour
        savedKMS=theKMS
        
    }
    
    

}
