//
//  View.swift
//  iOSDiffableDataSource
//
//  Created by Ghazi Tozri on 9/1/2021.
//

import UIKit
import Combine

class MainView: UIViewController
{
    var cancellables: Set<AnyCancellable> = []

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = ViewModel()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        setupObservers()
    }
}

//MARK: - Observers
extension MainView
{
    func setupObservers()
    {
        searchBar.searchTextField.text.publisher
            .receive(on: RunLoop.main)
            .sink { (keyWordValue) in
                self.viewModel.keyWordSearch = self.searchBar.searchTextField.text ?? ""
        }.store(in: &cancellables)
    }
}


