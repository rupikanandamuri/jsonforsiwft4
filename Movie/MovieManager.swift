//
//  GetUrl.swift
//  Movie
//
//  Created by Rupika on 2019-12-27.
//  Copyright © 2019 Rupika. All rights reserved.
//

import UIKit
protocol movieManagerDelegate {
    func moviesDownloadComplete()
}

class MovieManager: NSObject {

    var movies : [Movie]?
    var moviesDelegate : movieManagerDelegate?
    func fetchMovies(){
        let link =  "https://api.androidhive.info/json/movies.json"
        if let url = URL(string: link){
            URLSession.shared.dataTask(with:  url) { (data, response, error) in
            if error != nil {
                     print("error")
            }else{
                   do{
                      let decoder = JSONDecoder()
                      self.movies = try decoder.decode([Movie].self, from: data!)
                      self.moviesDelegate?.moviesDownloadComplete()
                   }catch{
                      print("some error occured")
                }
             }
        
            }.resume()
        }
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
