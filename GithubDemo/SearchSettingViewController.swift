//
//  SearchSettingViewController.swift
//  GithubDemo
//
//  Created by Ekko Lin on 3/2/17.
//  Copyright © 2017 codepath. All rights reserved.
//

import UIKit

class SearchSettingViewController: UIViewController {
    weak var delegate: SettingPresentViewControllerDelegate?
    var settings: GithubRepoSearchSettings!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        starLabel.text = String(settings.minStars)
        slider.value = Float (settings.minStars)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Save all the changes
    @IBAction func onSaveButton(_ sender: UIBarButtonItem) {
        settings.minStars = Int (slider.value)
        
        //print(slider.value)
        self.delegate?.didSaveSetting(settings: settings)
        dismiss(animated: true, completion: nil)
    }
    
    // Cancel all the changes
    @IBAction func onCancelButton(_ sender: UIBarButtonItem) {
        self.delegate?.didCancelSetting()
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sliderChange(_ sender: UISlider) {
        starLabel.text = String(Int(slider.value))
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}

protocol SettingPresentViewControllerDelegate: class {
    func didSaveSetting(settings: GithubRepoSearchSettings)
    func didCancelSetting()
}
