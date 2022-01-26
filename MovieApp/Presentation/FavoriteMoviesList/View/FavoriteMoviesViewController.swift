//
//  FavoriteMoviesViewController.swift
//  MovieApp
//
//  Created by Mario Angelillo on 17/01/2022.
//

import UIKit

class FavoriteMoviesViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let favMovieListViewModel: FavoriteMoviesViewModel = FavoriteMoviesViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favorites"
        
        self.configureTable()
        self.configureView()
        self.bind()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.configureView()
    }

    private func configureTable() {
        tableView.delegate = self
        tableView.dataSource  = self
        tableView.register(UINib(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "MovieTableViewCell")
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
    }

    private func configureView() {
        print("confView VC")
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        favMovieListViewModel.getFavMovies()
    }
    
    private func bind() {
        print("bind Vc")
        favMovieListViewModel.refreshData = { [weak self] () in
            print("bind1 refresh Vc")
            DispatchQueue.main.async {
                self?.tableView.reloadData()
                self?.activityIndicator.isHidden = true
                self?.activityIndicator.stopAnimating()
            }
        }
    }

}


extension FavoriteMoviesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favMovieListViewModel.favoriteMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return MovieTableViewCell().configureCell(tableView, indexPath: indexPath, for: favMovieListViewModel.favoriteMovies[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movieDetailsVC = MovieDetailsViewController(nibName: "MovieDetailsViewController", bundle: nil)
        movieDetailsVC.id = String(favMovieListViewModel.favoriteMovies[indexPath.row].id)
        movieDetailsVC.modalPresentationStyle = .fullScreen
        self.present(movieDetailsVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let rotationTransform = CATransform3DTranslate(CATransform3DIdentity, 0, 50, 0)
        cell.layer.transform = rotationTransform
        cell.alpha = 0.75
        
        UIView.animate(withDuration: 1.0) {
            cell.layer.transform = CATransform3DIdentity
            cell.alpha = 1.0
        }
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let favoriteAction = UIContextualAction(style: .normal, title:  "Remove to favorites", handler: { (ac:UIContextualAction, view:UIView, success:(Bool) -> Void) in
            
            self.favMovieListViewModel.removeMovie(index: indexPath.row)
            success(true)
        })
        favoriteAction.backgroundColor = .red

        return UISwipeActionsConfiguration(actions: [favoriteAction])
    }
}
