//
//  ViewController.swift
//  youtube-oneDayBuild
//
//  Created by Wilmer Mendoza on 1/2/22.
//

import UIKit

class ViewController: UIViewController , UITableViewDataSource , UITableViewDelegate, ModelDelegate {
    
    

    var model = Model()
    var videos = [Video]()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //set itself as the datasource and delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        // set itself as the delegate of the model
        model.delegate = self
        
        model.getVideos()
    }
    //mark: - delegate Methods
    
    func videosFeteched(_ videos: [Video]){
        
        // set the returned videos to our video property
        
        self.videos = videos
        
        // refresh the tableview
        
        tableView.reloadData()
        
    }
    //MARK: - Table view Methods

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        //configuramos la celda con los datos
        let video = self.videos[indexPath.row]
        
        
        cell.setCell(video)
        
        // returnamos la celda
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
// esto

