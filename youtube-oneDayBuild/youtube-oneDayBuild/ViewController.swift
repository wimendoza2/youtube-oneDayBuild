//
//  ViewController.swift
//  youtube-oneDayBuild
//
//  Created by Wilmer Mendoza on 1/2/22.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        model.getVideos()
    }


}
// esto

