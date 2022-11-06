import nimibook

var nimWikiBook = newBookFromToc("nim-wiki", "nimwiki"):
  section("Getting started", "Home"):
    entry("Install", "Install.nim")
    entry("Docs", "Docs.nim")
    entry("Curated Packages", "Curated_packages.nim")
    entry("Editor Support", "Editor_Support.nim")
    entry("Unofficial FAQ", "Unofficial_FAQ.nim")
    entry("Nim for C programmers", "Nim_for_C_programmers.nim")
    entry("Nim for Python programmers", "Nim_for_Python_Programmers.nim")
    entry("Nim for Python programmers (Spanish)", "Nim_for_Python_Programmers_ES.nim")
    entry("Nim for TypeScript programmers", "Nim_for_TypeScript_Programmers.nim")
    entry("Nim for D programmers", "Nim_for_D_Programmers.nim")
    entry("Nim for Java programmers", "Nim_for_Java_programmers.nim")
    entry("Nim for Haskell programmers", "Nim_for_Haskell_Programmers.nim")
  section("Developing", "Build"):
    entry("Build", "Build.nim")
    entry("Contribute", "Contribute.nim")
    entry("Creating a release", "Creating_a_release.nim")
    entry("Compiler module reference", "Compiler_module_reference.nim")
    entry("Consts_defined_by_the_compiler", "Consts_defined_by_the_compiler.nim")
    entry("Debugging the compiler", "Debugging_the_compiler.nim")
  section("Misc", "Organizations using Nim"):
    entry("Organizations using Nim", "Organizations_using_Nim.nim")
    entry("Feature suggestions", "Feature_suggestions.nim")
    entry("Common Criticisms", "Common_criticisms.nim")
    entry("Tips and Tricks", "Tips_and_tricks.nim")
    entry("Community Projects", "Community_projects.nim")
    entry("IRC guidelines", "IRC_guidelines.nim")
    entry("Lesser known Nim features", "Lesser_known_Nim_features.nim")
    entry("Aprende Nim en 5 Minutos (Spanish)", "Aprende_Nim_en_5_Minutos.nim")

# access to nimibook cli which will allow to build the book
nimibookCli(nimWikiBook)
