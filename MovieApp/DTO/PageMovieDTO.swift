//
//  MovieDTO.swift
//  MovieApp
//
//  Created by Mario Angelillo on 29/12/2021.
//

import Foundation

struct MoviesDTO: Decodable {
    let results : [MovieDTO]
}

extension PageMovieDTO: {
    
    struct MovieDTO: Decodable {
        
        let title: String
    }
}
