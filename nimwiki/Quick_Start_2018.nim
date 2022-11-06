import nimib, nimibook

nbInit(theme = useNimibook)

nbText:"""
The Essential Docs, to get started quickly.

1) Here's what you'll need to deploy your program. 
Choose a target platform:
[Windows] [Linux] [Mac] [Android] [iPhone] [Web] [Web+Wasm] [Haiku] [Genode] [Nintendo Switch]

Note: Instructions for cross compilation are here.
(only these combinations work: ...)

2) Set up your environment, our recommendation. Please choose the OS you develop on: 
...

3) Interacting with the compiler, basic command line usage (+ nim.cfg, what happens: compiler steps in general, the c cache, -d:flags)

4) Writing a basic library, source control, unit tests, and IDE tips

5) Getting a skeleton program up and running, and using that library.
Please choose the kind of program you're developing: 
(Links provide libraries you'll need, and guide you to a deployable skeleton app)
- A command line tool.
- A portable GUI desktop app
- a GUI app for a specific platform
- A 2D Game
- A Web application or website
- An android mobile app
- An iPhone mobile app
- A cross platform library
- Embedded usage: call nim from your c/c++ code.
- Other? leave feedback to let us know what we're missing.

5.5) Recommended workflows, ways to avoid complexity, and general advice for efficient development process from veteran Nim users. (IDEAL!)

6) Language basics. 
- These are wonderful tutorials/slides: ... links...

7) Language at a glance, Nim from the mainstream language you know:
- Nim for the python programmer
- Nim for the C programmer
- Nim for the C# programmer
- Nim for the Javascript cowboy
- ... add more at our leisure.

Related: Also explain support for different paradigms in Nim. (procedural, OOP, functional)

8) Use Cases: How to do X in Nim? (by topic)
- Show Nim packages and std lib, Maybe in reference to other language capabilities, or even compared to their samples.
- Be honest if there are some holes, chance to show interop with python and nimgen+c2nim.

9) To learn more about Nim's features and how to use them, please refer to the official tutorial Part1, Part2, and the Manual."""
nbSave()
