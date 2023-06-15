//
//  SessionViewController.swift
//  PosTrue
//
//  Created by Asiyah Awais on 5/26/23.
//

import UIKit


class SessionViewController: UIViewController {
    
    @IBOutlet weak var min_count: UILabel!
    @IBOutlet weak var zero: UIImageView!
    @IBOutlet weak var ten: UIImageView!
    @IBOutlet weak var twenty: UIImageView!
    @IBOutlet weak var thirty: UIImageView!
    @IBOutlet weak var forty: UIImageView!
    @IBOutlet weak var fifty: UIImageView!
    
    @IBOutlet weak var avg: UILabel!
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        min_count.text = "Let's Begin!"
        avg.text = "Session Average: --"
        zero.image = nil
        ten.image = nil
        twenty.image = nil
        thirty.image = nil
        forty.image = nil
        fifty.image = nil
        
    }
    

    @IBAction func backHome(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "main_vc") as? ViewController else {
            return
        }
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
            
    }
    
    var greenArr = [UIImage(imageLiteralResourceName: "green0"), UIImage(imageLiteralResourceName: "green10"), UIImage(imageLiteralResourceName: "green20"), UIImage(imageLiteralResourceName: "green30"), UIImage(imageLiteralResourceName: "green40"), UIImage(imageLiteralResourceName: "green50")]
    var redArr = [UIImage(imageLiteralResourceName: "red0"), UIImage(imageLiteralResourceName: "red10"), UIImage(imageLiteralResourceName: "red20"), UIImage(imageLiteralResourceName: "red30"), UIImage(imageLiteralResourceName: "red40"), UIImage(imageLiteralResourceName: "red50")]
    var yellowArr = [UIImage(imageLiteralResourceName: "yellow0"), UIImage(imageLiteralResourceName: "yellow10"), UIImage(imageLiteralResourceName: "yellow20"), UIImage(imageLiteralResourceName: "yellow30"), UIImage(imageLiteralResourceName: "yellow40"), UIImage(imageLiteralResourceName: "yellow50")]
    
    let avc = AnalyticsViewController()
    //let pvc = PopupViewController()
    
    var curr = 0
    var sesRes = [Int]()
    var popups = 0
    @IBAction func next(_ sender: Any) {
        let stiffness = Int.random(in: 1...10)
        if curr == 0 {
            if stiffness <= 5 {
                zero.image = greenArr[curr]
            } else if stiffness <= 7 {
                zero.image = yellowArr[curr]
            } else {
                zero.image = redArr[curr]
            }
        } else if curr == 1 {
            if stiffness <= 5 {
                ten.image = greenArr[curr]
            } else if stiffness <= 7 {
                ten.image = yellowArr[curr]
            } else {
                ten.image = redArr[curr]
            }
        } else if curr == 2 {
            if stiffness <= 5 {
                twenty.image = greenArr[curr]
            } else if stiffness <= 7 {
                twenty.image = yellowArr[curr]
            } else {
                twenty.image = redArr[curr]
            }
        } else if curr == 3 {
            if stiffness <= 5 {
                thirty.image = greenArr[curr]
            } else if stiffness <= 7 {
                thirty.image = yellowArr[curr]
            } else {
                thirty.image = redArr[curr]
            }
        } else if curr == 4 {
            if stiffness <= 5 {
                forty.image = greenArr[curr]
            } else if stiffness <= 7 {
                forty.image = yellowArr[curr]
            } else {
                forty.image = redArr[curr]
            }
        } else if curr == 5 {
            if stiffness <= 5 {
                fifty.image = greenArr[curr]
            } else if stiffness <= 7 {
                fifty.image = yellowArr[curr]
            } else {
                fifty.image = redArr[curr]
            }
        }
        
        var avgStiff = 0.0
        if curr < 6 {
            if stiffness > 7 {
                guard let pvc = storyboard?.instantiateViewController(withIdentifier: "popup_vc") as? PopupViewController else {
                    return
                }
                present(pvc, animated: true)
                popups += 1
            }
            curr += 1
            min_count.text = "\(curr)/6 Done!"
            sesRes.append(stiffness)
            let sumArray = sesRes.reduce(0, +)
            avgStiff = Double(sumArray) / Double(sesRes.count)
            avg.text = String(format: "Session Average: %.2f", avgStiff)
        } else if curr == 6 {
            min_count.text = "Finished!"
            
        }
    }
}
