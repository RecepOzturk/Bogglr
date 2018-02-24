//
//  Board.swift
//  Bogglr
//
//  Created by Thomas Forzaglia on 2/23/18.
//  Copyright © 2018 Thomas Forzaglia. All rights reserved.
//

/// The Boggle board consisting of rows and columns with a tile at each (row, column) combination
final class Board {
    /// Total number of rows in the Boggle board
    let numberOfRows: Int

    /// Total number of coulumns in the Boggle board
    let numberOfColumns: Int

    /// Array of each tile that makes up the Boggle board
    private(set) var tiles = [BoardTile]()

    init(letters: [[Character]]) {
        self.numberOfRows = letters.count
        self.numberOfColumns = letters[0].count

        // construct `BoardTile` objects with the row, column, and letter value from the provided letters matrix
        for (rowIndex, row) in letters.enumerated() {
            for (colIndex, letter) in row.enumerated() {
                tiles.append(BoardTile(row: rowIndex, column: colIndex, letter: letter))
            }
        }
    }


    /// Get the `BoardTitle` object at the provided row and column
    ///
    /// - Parameters:
    ///   - row: the row of the tile we're looking for
    ///   - column: the column of the tile we're looking for
    /// - Returns: A `BoardTitle` object that has been initialized with the provided row and column
    ///            Returns nil if there is no BoardTile present with the provided row and column numbers
    func tileAtPosition(row: Int, column: Int) -> BoardTile? {
        for tile in tiles where tile.row == row && tile.column == column {
            return tile
        }
        return nil
    }
}