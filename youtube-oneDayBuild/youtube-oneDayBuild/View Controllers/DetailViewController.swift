//
//  DetailViewController.swift
//  youtube-oneDayBuild
//
//  Created by Wilmer Mendoza on 2/3/22.
//

import UIKit

import WebKit


class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var DateLabel: UILabel!
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBOutlet weak var TextView: UITextView!

    var video:Video?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Clear the fields
        
        titleLabel.text = ""
        DateLabel.text = ""
        TextView.text = ""
        
        
        
        // chequeamos que haya un video
        
        guard video != nil else{
            return
        }
        
        //create the embed URL
        
        let embedUrlString = Constants.YT_EMBED_URL + video!.videoId
        
        //Load it into the webview
        
        let url = URL(string: embedUrlString)
        let request = URLRequest(url: url!)
        webView.load(request)
        // set the title
        
        titleLabel.text = video?.title
        
        // set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        DateLabel.text = df.string(from: video!.published)

        
        // set the description
        
        TextView.text = video!.description
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
