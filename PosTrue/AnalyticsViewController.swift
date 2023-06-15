//
//  AnalyticsViewController.swift
//  PosTrue
//
//  Created by Asiyah Awais on 5/29/23.
//

import UIKit
import SwiftUI
import SnapKit


class AnalyticsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

        // Do any additional setup after loading the view.
        
    }
    func setupView() {
        let controller = UIHostingController(rootView: ChartView())
        guard let chartView = controller.view else {
            return
        }
        view.addSubview(chartView)
        chartView.snp.makeConstraints { make in
            //make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(15)
            make.trailing.equalToSuperview().inset(15)
            make.height.equalTo(600)
        }
    }
    
    
    @IBAction func back(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "main_vc") as? ViewController else {
            return
        }
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
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
