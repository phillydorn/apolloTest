import Foundation
import ApolloCodegenLib

print("Hello, world!")


let parentFolderOfScriptFile = FileFinder.findParentFolder()
let sourceRootURL = parentFolderOfScriptFile
  .apollo.parentFolderURL() // Result: Sources folder
  .apollo.parentFolderURL() // Result: Codegen folder
  .apollo.parentFolderURL() //project folder

let cliFolderURL = sourceRootURL
  .apollo.childFolderURL(folderName: "Codegen")
  .apollo.childFolderURL(folderName: "ApolloCLI")

let endpoint = URL(string: "https://int.photogrammetry.disney.com/api/graphql")!

let output = sourceRootURL
    .apollo.childFolderURL(folderName:"ApolloTest")

let schemaDownloadOptions = ApolloSchemaOptions(endpointURL: endpoint,
                                                outputFolderURL: output)
do {
  try ApolloSchemaDownloader.run(with: cliFolderURL,
                                 options: schemaDownloadOptions)
} catch {
  exit(1)
}
