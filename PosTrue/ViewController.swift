//
//  ViewController.swift
//  PosTrue
//
//  Created by Asiyah Awais on 5/23/23.
//

import UIKit


//userDefaults.set(sessions, forKey: "sessions")



class ViewController: UIViewController {
   

    @IBOutlet weak var stiff_level: UILabel!
    @IBOutlet weak var background: UIImageView!
    @IBOutlet weak var condition: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        condition.text = "----"
        stiff_level.text = "Stiffness Level: --"
       
    }


    @IBAction func measurement(_ sender: Any) {
        let stiffness = Int.random(in: 1...10)
        stiff_level.text = "Stiffness Level: \(stiffness)"
        if stiffness <= 5 {
            //background.image = UIImage(imageLiteralResourceName: "green")
            view.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
            condition.text = "Relaxed!"
        } else {
            //background.image = UIImage(imageLiteralResourceName: "red")
            view.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
            condition.text = "Stiff!"
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "popup_vc") as? PopupViewController else {
                return
            }
            //navigationController?.pushViewController(vc, animated: true)
            present(vc, animated: true, completion: nil)
                    
        }
    }
    
    @IBAction func analytics(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "analytics_vc") as? AnalyticsViewController else {
            return
        }
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    
    @IBAction func session(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "session_vc") as? SessionViewController else {
            return
        }
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    
    
    
    
}

