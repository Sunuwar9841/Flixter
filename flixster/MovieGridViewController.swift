//
//  MovieGridViewController.swift
//  flixster
//
//  Created by alisha.sunuwar on 2/17/21.
//

import UIKit
import AlamofireImage

class MovieGridViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    var movies = [[String : Any]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let layout = collectionView.collectionViewLayout as!UICollectionViewFlowLayout
         layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        let width = (view.frame.size.width - (layout.minimumInteritemSpacing * 2) - 20  )/3
        layout.itemSize = CGSize(width:width, height: width * 1.5)

        
        let url = URL(string:"https://api.themoviedb.org/3/movie/297762/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&language=en-US&page=1" )!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, reszponse, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
            // dataDIc holds the data
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]

              // TODO: Get the array of movies
              // TODO: Store the movies in a property to use elsewhere
              // TODO: Reload your table view data
            //print(dataDictionary)
            
            self.movies = dataDictionary["results"] as! [[String:Any]]
            self.collectionView.reloadData()
            print(self.movies)
            
           
           
           }
        }
        task.resume()
    
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCell", for :indexPath) as! MovieGridCell
        
        let movie = movies[indexPath.item]
        let baseUrl = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterUrl = URL(string:baseUrl + posterPath)      //URL validat correct form not in string
        
        cell.posterView.af_setImage(withURL: posterUrl!)
        
        return cell
    }
    
    

}
