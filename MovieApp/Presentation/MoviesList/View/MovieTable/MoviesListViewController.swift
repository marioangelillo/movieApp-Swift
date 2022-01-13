//
//  MovieListViewController.swift
//  MovieApp
//
//  Created by Mario Angelillo on 26/12/2021.
//

import UIKit

class MoviesListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let movieListViewModel: MovieListViewModel = MovieListViewModel()
    let movieDetailsViewModel: MovieDetailsViewModel = MovieDetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTable()
        self.configureView()
        self.bind()
    }

    private func configureTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorColor = UIColor.blue
    }
    
    private func configureView() {
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        movieListViewModel.getPopularMovies()
    }
    
    private func bind() {
        movieListViewModel.refreshData = { [weak self] () in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.activityIndicator.isHidden = true
                self?.activityIndicator.stopAnimating()
            }
        }
    }

}


extension MoviesListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieListViewModel.popularMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return MovieTableViewCell().configureCell(tableView, indexPath: indexPath, for: movieListViewModel.popularMovies[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieDetailsVC = MovieDetailsViewController(nibName: "MovieDetailsViewController", bundle: nil)
        movieDetailsVC.id = String(movieListViewModel.popularMovies[indexPath.row].id)
        movieDetailsVC.modalPresentationStyle = .fullScreen
        self.present(movieDetailsVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, -500, 500, -500)
        cell.layer.transform = rotationTransform
        cell.alpha = 0.75
        
        UIView.animate(withDuration: 0.75) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1.0
        }
    }
    
}
