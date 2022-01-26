//
//  Helper.swift
//  MovieApp
//
//  Created by Mario Angelillo on 19/01/2022.
//

import Foundation

class Helper {
    
    func getFavoriteMovies(completionHandler: @escaping MoviesHandler) {
          if let favoriteMovies = UserDefaults.standard.value(forKey: "favorite_movies") as? Data {
             let decoder = JSONDecoder()
             if let favMoviesDecoded = try? decoder.decode(Array.self, from: favoriteMovies) as [Movie] {
                return completionHandler(favMoviesDecoded)
             } else {
                return completionHandler([Movie]())
             }
          } else {
             return completionHandler([Movie]())
          }
    }
    
    func saveFavoriteMovies(movies: [Movie]) {
          let encoder = JSONEncoder()
          if let encoded = try? encoder.encode(movies) {
             UserDefaults.standard.set(encoded, forKey: "favorite_movies")
          }
     }
    
}
