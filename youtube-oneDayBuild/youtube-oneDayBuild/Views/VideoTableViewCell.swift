//
//  VideoTableViewCell.swift
//  youtube-oneDayBuild
//
//  Created by Wilmer Mendoza on 1/3/22.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
   
    @IBOutlet weak var thumbnailImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var video:Video?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(_ v:Video){
        self.video = v
        
        // nos aseguramos que el objeto video no sea NIL
        guard self.video != nil else{
            return
        }
        //set the title
        
        self.titleLabel.text = video?.title
        
        //Set the date
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: video!.published)

        // nos aseguramos que exista el thumbnail y no sea nil
        
        guard self.video!.thumbnail != "" else{
            return
        }
        // check cache
        
        if let cacheData = CacheManager.getVideoCache(self.video!.thumbnail){
            //set the thumbnail
            
            self.thumbnailImageView.image = UIImage(data: cacheData)
            return
        }
        //set the thumnails
        
        
        let url = URL(string: self.video!.thumbnail)
        
        // get the shared URL Session Object
        
        let session = URLSession.shared
        
        //ccreamo el data task
        
        let datatask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                //salvamos en la memoria cache
                CacheManager.setVideoCache(url!.absoluteString, data)
                
                //comprobamos que la url descargada coincida con la miniatura del video que se muestra en celda actualmente
                
                if url!.absoluteString != self.video?.thumbnail{
                    // la miniatura de la celda ha sido reciclada para otro video y ya no coincide con la miniatura descargada
                    
                    return
                    
                }
                
                //create the image object
                
                let image = UIImage(data: data!)
                
                //set the imageview
                
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
                    
                }
            }
        }
        
        //start el dataTask
        datatask.resume()
    }
    


}
