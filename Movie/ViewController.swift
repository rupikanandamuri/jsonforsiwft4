//
//  ViewController.swift
//  Movie
//
//  Created by Rupika on 2019-12-27.
//  Copyright © 2019 Rupika. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,movieManagerDelegate {
    
    @IBOutlet var tableView : UITableView!
    let manager = MovieManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        manager.moviesDelegate = self
        manager.fetchMovies()
        print(manager.movies)
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return manager.movies?.count ?? 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Moviecell", for: indexPath) as? MovieCell{
            if let movie = manager.movies?[indexPath.section]{
                cell.movieTitle.text = movie.title
                cell.movieRating.text = "\(movie.rating ?? 0)"
                cell.releaseDate.text = "\(movie.releaseYear ?? 0)"
                cell.gener.text = movie.genre?.joined(separator: ",")
                if let url = URL(string: movie.image ?? ""){
                    cell.movieImage.downloadImage(url: url)
                }
            }
          return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 335
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func moviesDownloadComplete() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
  
}
extension UIImageView  {
    func downloadImage(url: URL){
        let task = URLSession.shared.dataTask(with: url) {(data,response,error) in
            if error != nil {
                print("error")
            }else {
                DispatchQueue.main.async {
                    self.image = UIImage(data: data!)
                }
            }
        }
        task.resume()
    }
}

