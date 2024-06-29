/*
    Concurrency is the ability to perform asynchronous operations
    Asynchronous code can be suspended and resumed later, although only one piece of program executes at a time

    Parallel code means that multiple pieces of code run simultaneously
*/

/*
    An asynchronous function or asynchronous method is a special kind of function or method
    that can be suspended while it's partway through execution
    To mark an asynchronous function, write the async key word after it's parameters
*/

func listPhotos(inGallery name: String) async -> String {
    let result = "Gotcha 😂😂"

    return result
}

//You can explicitly insert a suspension point by calling the Task.yield() method

func generateSlideShow(forGallery gallery: String) async {
    let photos = await listPhotos(inGallery: gallery)
    for _ in photos {
        //render a few seconds of video for this photo
        await Task.yield()
    }
}

func listBetterPhotos(inGallery name: String) async throws -> [String] {
    try await Task.sleep(for: .seconds(2))
    return ["IMG001", "IMG99", "IMG0404"]
}

let photos = try await listBetterPhotos(inGallery: "A rainy weekend")

//Calling asynchronous functions  in parallel
/*
    let firstPhoto = await downloadPhoto(named: photoNames[0])
    let secondPhoto = await downloadPhoto(named: photoNames[1])

    let photos = [firstPhoto, secondPhoto]
    show(photos)

    these run one by one 
*/

/*
    async let firstPhoto = downloadPhoto(named: photoNames[0])
    async let secondPhoto = downloadPhoto(named: photoNames[1])
    async let thirdPhoto = downloadPhoto(named: photoNames[2])

    let photos = await [firstPhoto, secondPhoto, thirdPhoto]
    show(photos)

    these run in parallel
*/

/*
    Tasks and Task Groups
    A task is a unit of work that can be run asynchronously as part of your program
    All asynchronous code runs as part of some task.
    A task itself does only one thing at a time

    You can also create a task group (an instance of Task Group) and add child tasks
    to that group. This gives you more control over priority and cancellation,
    and lets you create a dynamic number of tasks
*/

/*
    await withTaskGroup(of: Data.self) { group in

        let photoNames = await listPhotos(inGallery: "Summer Vacation")

        for name in photoNames {
            group.addTask {
                return await downloadPhoto(named: name)
            }
        }

        for await photo in group {
            show(photo)
        }

    }
*/

/*
    let photos = await withTaskGroup(of: Optional<Data>.self) { group in

        let photoNames = await listPhotos(inGallery: "Summer Vacation")

        for name in photoNames {
            let added = group.addTaskUnlessCancelled {
                guard !Task.isCancelled else { return nil }
                return await downloadPhoto(named: name)
            }

            guard added else { break }
        }

        var results: Data = []

        for await photo in group {
            if let photo { results.append(photo) }
        }

        return results

    }
*/

//If you need immediate notification of cancellation

/*
    let task = await Task.withTaskCancellationHandler {
    // ....
    } onCancel: {
    print("Cancelled!")
    
    }

*/

//Unstructured concurrency
/*let handle = Task {
    return await add(newPhoto, toGalleryNamed: "Spring Adventures")
}

let result = await handle.value
*/

//Actors
actor TemperatureLogger {
    let label: String
    var measurements: [Int]
    private(set) var max: Int

    init(label: String, measurement: Int) {
        self.label = label
        self.measurements = [measurement]
        self.max = measurement
    }
}

//Sendable Types
struct TemperatureReading: Sendable {
    var measurement: Int
}

extension TemperatureLogger {
    func addReading(from reading: TemperatureReading) {
        measurements.append(reading.measurement)
    }
}

let logger = TemperatureLogger(label: "Tea kettle", measurement: 85)
let reading = TemperatureReading(measurement: 45)
await logger.addReading(from: reading)