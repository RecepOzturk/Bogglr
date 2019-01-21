//
//  ViewController.swift
//  Bogglr
//
//  Created by Thomas Forzaglia on 2/23/18.
//  Copyright © 2018 Thomas Forzaglia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var gvalids = [String]()
    var gshow = [String]()
    
    @IBOutlet weak var searchText: UITextField!
    
    @IBAction func searchButton(_ sender: Any) {
        let find = isThere(arr: gvalids, arr2: gshow, word: searchText.text!)
        print(find)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tree = TrieTree(dictionary: AppEnvironment.shared.dictionary)
        let board = Board(letters: AppEnvironment.shared.lettersMatrix)
        let solver = BoggleSolver(board: board, tree: tree)
        let validWords = arragment(arr: solver.findValidWords())
        gvalids = validWords
        let show = showWords(arr : validWords)
        gshow = show
        
        print("Here are the valid Boggle words in the board")
        print("********************************************")
        validWords.forEach { print($0) }
        print("number of valid words = \(validWords.count)")
        print("********************************************")
        
        show.forEach { print($0) }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func arragment(arr :[String])->[String] {
        var unique = Array(Set(arr))
        unique = unique.sorted { $0.count > $1.count }
        return unique
    }
    
    func showWords(arr : [String]) -> [String] {
        var i = 5
        var words = [String]()
        
        for word in arr {
            if (word.count == 6 && i == 5){
                words.append(word)
                i -= 1
            }else if (word.count == 5 && (i == 4 || i == 5)){
                words.append(word)
                i -= 1
            }else if (word.count == 4 && (i == 3 || i == 4 || i == 5)){
                words.append(word)
                i -= 1
            }else if (word.count == 3 && i <= 3 && i > -1){
                words.append(word)
                i -= 1
            }
        }
        return words
    }
    
    func isThere(arr :[String], arr2 :[String], word: String)->Int {
        var point: Int = 0
        
        if (arr.contains(word) && arr2.contains(word)) {
            if (word.count == 6){
                point += 3
            }else if (word.count >= 4) {
                point += 2
            }else{
                point += 1
            }
        } else if(!arr2.contains(word)){
            if (word.count == 6){
                point += 10
            }else if (word.count >= 4) {
                point += 5
            }else{
                point += 2
            }
        }
       
        return point
    }

}

