//
//  ViewController.swift
//  DesignLoginScreen
//
//  Created by Abouzar Moradian on 9/12/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var facebookLabel: UIControl! {
        didSet{
           
            facebookLabel.layer.borderWidth = 1
            facebookLabel.layer.borderColor = UIColor.gray.cgColor

            facebookLabel.layer.cornerRadius = 20
        }
    }
    
    @IBOutlet weak var googleLabel: UIControl! {
        
        didSet{
            googleLabel.layer.borderWidth = 1
            googleLabel.layer.borderColor = UIColor.gray.cgColor
            googleLabel.layer.cornerRadius = 20
        }
    }
    
    @IBOutlet weak var appleLabel: UIControl! {
        didSet{
           
            appleLabel.layer.borderWidth = 1
            appleLabel.layer.borderColor = UIColor.gray.cgColor
            appleLabel.layer.cornerRadius = 20
        }
    }
    
    @IBOutlet weak var emailLabel: UIControl! {
        didSet{
           
            emailLabel.layer.borderWidth = 1
            emailLabel.layer.borderColor = UIColor.gray.cgColor
            emailLabel.layer.cornerRadius = 20
        }
    }
    
    @IBOutlet weak var privacyLabel: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupLabel()
        
        
      

    }
    
    
    
    @IBAction func facebookButton(_ sender: Any) {
        
        print("facebook clicked")
    }
    
    
    func setupLabel() {
        let fullText = "By logging in I agree to the Terms and Conditions and Privacy Policy"
        let termsAndConditions = "Terms and Conditions "
        let and = "and "
        let privacyPolicy = "Privacy Policy"
        
        let attributedString = NSMutableAttributedString(string: fullText)
        
        // Define the ranges of clickable parts
        let termsRange = (fullText as NSString).range(of: termsAndConditions)
        let privacyPolicyRange = (fullText as NSString).range(of: privacyPolicy)
        
        // Set attributes for the clickable parts
        attributedString.addAttributes([
            .foregroundColor: UIColor.blue,
        ], range: termsRange)
        
        attributedString.addAttributes([
            .foregroundColor: UIColor.blue,
        ], range: privacyPolicyRange)
        
        // Set the attributed text to the label
        privacyLabel.attributedText = attributedString
        privacyLabel.isUserInteractionEnabled = true // Enable interaction
        
        // Add tap gesture recognizer to the label
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped(_:)))
        privacyLabel.addGestureRecognizer(tapGesture)
    }
    
    
    @objc func labelTapped(_ recognizer: UITapGestureRecognizer) {
            guard let label = recognizer.view as? UILabel else { return }

            // Find the location of the tap
            let tapLocation = recognizer.location(in: label)

            // Create a text storage to detect the clickable part
            let textStorage = NSTextStorage(attributedString: label.attributedText!)
            let layoutManager = NSLayoutManager()
            textStorage.addLayoutManager(layoutManager)

            let textContainer = NSTextContainer(size: label.bounds.size)
            textContainer.lineFragmentPadding = 0
            textContainer.maximumNumberOfLines = label.numberOfLines
            layoutManager.addTextContainer(textContainer)

            // Calculate the index of the tapped character
            let index = layoutManager.characterIndex(for: tapLocation, in: textContainer, fractionOfDistanceBetweenInsertionPoints: nil)

            // Detect if the tap is within the clickable range
            let clickableRange = (label.text! as NSString).range(of: "clickable")
            if NSLocationInRange(index, clickableRange) {
                // Handle the clickable part tap
                print("Clickable part tapped!")
                // You can perform additional actions here
            }
        }


}

