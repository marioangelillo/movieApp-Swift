//
//  Movie.swift
//  MovieApp
//
//  Created by Mario Angelillo on 30/12/2021.
//

import Foundation

struct Movies {
    let movies: [Movie]
}

struct Movie {
    
    let id: Int
    let title: String
    let overview: String
    let backdropPath: String
    let posterPath: String
    
    init(dto: PageMovieDTO.MovieDTO) {
        self.id = dto.id ?? 0
        self.title = dto.title ?? ""
        self.overview = dto.overview ?? ""
        self.backdropPath = dto.backdrop_path ?? ""
        self.posterPath = dto.poster_path ?? ""
    }
}
