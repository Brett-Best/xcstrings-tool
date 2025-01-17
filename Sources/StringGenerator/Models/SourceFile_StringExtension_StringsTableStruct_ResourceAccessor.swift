import StringResource
import SwiftSyntax

extension SourceFile.StringExtension.StringsTableStruct {
    struct ResourceAccessor {
        let sourceFile: SourceFile
        let resource: Resource

        var hasArguments: Bool {
            !resource.arguments.isEmpty
        }

        var name: TokenSyntax {
            .identifier(resource.identifier)
        }

        var type: TokenSyntax {
            sourceFile.stringExtension.stringsTableStruct.type
        }

        var headerDocumentation: String {
            var docComponents: [String] = []

            if let comment = resource.comment {
                docComponents.append(comment)
            }

            docComponents.append("""
            ### Source Localization

            ```
            \(resource.sourceLocalization)
            ```
            """)

            return docComponents.joined(separator: "\n\n")
        }
    }
}
