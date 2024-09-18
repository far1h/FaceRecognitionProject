//
//  ViewController.swift
//  FaceRecognitionProject
//
//  Created by Farih Muhammad on 18/09/2024.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {

    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInClicked(_ sender: UIButton) {
        let authContext = LAContext()
        
        var error:NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it you?") { success, error in
                DispatchQueue.main.async {
                    if success == true {
                            self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                            
                        } else {
                            self.myLabel.text = "Error!"
                        }
                    }
            }
        }
    }
    
}

