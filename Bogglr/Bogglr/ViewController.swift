//
//  ViewController.swift
//  Bogglr
//
//  Created by Thomas Forzaglia on 2/23/18.
//  Copyright © 2018 Thomas Forzaglia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tree = TrieTree(dictionary: AppEnvironment.shared.dictionary)
        let board = Board(letters: AppEnvironment.shared.lettersMatrix)
        let solver = BoggleSolver(board: board, tree: tree)
        let validWords = solver.findValidWords()
        
        print("Here are the valid Boggle words in the board")
        print("********************************************")
        validWords.forEach { print($0) }
        print("number of valid words = \(validWords.count)")
        print("********************************************")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

