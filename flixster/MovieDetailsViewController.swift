//
//  MovieDetailsViewController.swift
//  flixster
//
//  Created by alisha.sunuwar on 2/15/21.
//

import UIKit
import AlamofireImage
class MovieDetailsViewController: UIViewController {
    
    
    
    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var synopsisLable: UILabel!
    
    
    
    var movie:[String :Any]!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        titleLable.text = movie["title"]as?
         String
        
        synopsisLable.text = movie["overview"] as?
         String
        synopsisLable.sizeToFit()
        
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string:baseUrl + posterPath)      //URL validat correct form not in string
        posterView.af_setImage(withURL: posterUrl!)
        
        let backdropBaseURL = "https://image.tmdb.org/t/p/w780"
        let backdropPath = movie["backdrop_path"] as! String
        let backdropUrl = URL(string: backdropBaseURL + backdropPath)
        backdropView.af.setImage(withURL: backdropUrl!)
        
        
        
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


    }
}
