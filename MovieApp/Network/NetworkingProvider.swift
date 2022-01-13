//
//  APIEndPoints.swift
//  MovieApp
//
//  Created by Mario Angelillo on 29/12/2021.
//

import Foundation

final class MovieServices {
    
    func getPopularMovies(completionHandler: @escaping ResultMoviesHandler, errorHandler: @escaping ErrorHandler) {
        
        URLSession.shared.dataTask(with: URLApplication.Movie.getPopularMoviesURL()) { data, response, error in
            
            if let error = error {
                errorHandler(error.localizedDescription)
                return
            }
            
            guard let movies = data?.toDTO(PageMovieDTO.self) else {
                errorHandler(Messages.Error.parse)
                return
            }
            
            completionHandler(movies)
            
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
