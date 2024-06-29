/*
    Determines a value's runtime type and give it more specific type information

    Type casting is a way to check the type of an instance, or treat it as a different subclass
    Type casting is implemented with the is and as operators
*/

class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}

class Movie: MediaItem {
    var director: String

    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}

class Song: MediaItem {
    var artist: String

    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}

let library = [
    Movie(name: "Casablanca", director: "Michael Curtiz"),
    Song(name: "Blue Suede Shoes", artist: "Elvis Presley"),
    Movie(name: "Citizen Kane", director: "Orson Welles"),
    Song(name: "The One and Only", artist: "Chesney Hawkes"),
    Song(name: "Never Gonna Give You Up", artist: "Rick Astley")
]

var movieCount = 0
var songCount = 0

for item in library {
    if item is Movie {
        movieCount += 1
    }else if item is Song {
        songCount += 1
    }
}

print("Media Library contains \(movieCount) movies and \(songCount) songs")

//Down casting
for item in library {
    if let movie = item as? Movie {
        print("Movie: \(movie.name), dir. \(movie.director)")
    }else if let song = item as? Song {
        print("Song: \(song.name), by \(song.artist)")
    }
}

//Any and AnyObject

var things: [Any] = []

things.append(0)
things.append(0.0)
things.append(42)

print(things)