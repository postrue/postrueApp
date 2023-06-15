//
//  PopupViewController.swift
//  PosTrue
//
//  Created by Asiyah Awais on 5/23/23.
//

import UIKit

class PopupViewController: UIViewController {
    @IBOutlet weak var text: UILabel!
    @IBOutlet weak var exercise: UIImageView!
    let exArr = [UIImage(imageLiteralResourceName: "calf"), UIImage(imageLiteralResourceName: "glute"), UIImage(imageLiteralResourceName: "hip_quad"),UIImage(imageLiteralResourceName: "lateral"),UIImage(imageLiteralResourceName: "low_back"),UIImage(imageLiteralResourceName: "posterior"),UIImage(imageLiteralResourceName: "shoulder"),UIImage(imageLiteralResourceName: "thoracic"),UIImage(imageLiteralResourceName: "tricep"),UIImage(imageLiteralResourceName: "upper_trap")]
    override func viewDidLoad() {
        super.viewDidLoad()
        exercise.image = exArr.randomElement()
        text.textColor = .black
        // Do any additional setup after loading the view.
    }
    
    @IBAction func exDismiss(_ sender: Any) {
        dismiss(animated: true)
    }
    var totExercise = 0
    @IBAction func exDone(_ sender: Any) {
        totExercise += 1
        dismiss(animated: true)
    }
    
}
