//
//  TransactionsViewController.swift
//  PlatziFinanzas
//
//  Created by Camilo Rozo on 20/07/21.
//

import UIKit

class TransactionsViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    fileprivate(set) lazy var emptyStateView: UIView = {
        guard let view = Bundle.main.loadNibNamed("EmptyState", owner: nil, options: [:])?.first as? UIView else {
            return UIView()
        }
        return view
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        
        let cell = UINib(nibName: "TransactionsCell", bundle: Bundle.main)
        tableView.register(cell, forCellReuseIdentifier: "cell")

        // Do any additional setup after loading the view.
    }
    
    
}

extension TransactionsViewController: UITableViewDelegate{
    
}

extension TransactionsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = 10
        tableView.backgroundView = count == 0 ? emptyStateView : nil
        tableView.separatorStyle = count == 0 ? .none : .singleLine
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    }
    
    
}

