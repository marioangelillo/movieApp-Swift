//
//  APIEndPoints.swift
//  MovieApp
//
//  Created by Mario Angelillo on 29/12/2021.
//

import Foundation

final class MovieServices {
    
    func getPopularMovies(completionHandler: @escaping (PageMovieDTO?) -> Void) {
        
        URLSession.shared.dataTask(with: URLApplication.Movie.getPopularMoviesURL()) { data, response, error in
            
//            print("Data: \(String(describing: data))")
//            print("Response: \(String(describing: response))")
//            print("Error: \(String(describing: error))")
            
            if let data = data {
                do {
                    let movies = try? JSONDecoder().decode(PageMovieDTO.self, from: data)
                    completionHandler(movies)
                }
            }
        }.resume()
    }
    
    func getMovieDetails(id: String, completionHandler: @escaping ResultDetailsMovieHandler, errorHandler: @escaping ErrorHandler) {
        
        URLSession.shared.dataTask(with: URLApplication.Movie.getMovieDetailsURL(id: id)) { data, response, error in
            
            if let error = error {
                errorHandler(error.localizedDescription)
                return
            }
            
            guard let movieDetails = data?.toDTO(MovieDetailsDTO.self) else {
                errorHandler(Messages.Error.parse)
                return
            }
            
            completionHandler(movieDetails)
            
        }.resume()
    }
    
}
