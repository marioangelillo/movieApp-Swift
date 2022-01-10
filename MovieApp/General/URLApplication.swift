//
//  URLApplication.swift
//  MovieApp
//
//  Created by Mario Angelillo on 29/12/2021.
//

import Foundation

struct URLApplication {
    
    static private var baseURL: String { "https://api.themoviedb.org/3/movie/" }
    
    struct Movie {
        
        static var imageURL: String { "https://image.tmdb.org/t/p/w500" }
        
        static func getPopularMoviesURL(page: String = "1") -> URL {
            URL(string: URLApplication.baseURL + "popular?api_key=c77900d7c08d5ae239e205a41d88c2cd&language=en-US&page=" + page)!
        }
        
        static func getMovieDetailsURL(id: String) -> URL {
            URL(string: URLApplication.baseURL + id + "?api_key=c77900d7c08d5ae239e205a41d88c2cd&language=en-US")!
        }
    }
        
}



