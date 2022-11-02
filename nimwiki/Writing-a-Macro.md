Macros are complex and powerful, allowing you to build the AST imperatively. So how does one build AST? It's not as hard as it sounds.

I'm going to go over the process I used to write the marshaling macro used in keineSchweine (github/fowlmouth/keineSchweine/dependencies/genpacket) 

Okay, so I have described a packet as a object type holding the information needed, for example a packet that gets sent out to clients when a new client connects might look like this:
```nimrod
type TClientJoined = object
  playerID: int
  alias: string
```

To make this useful, I'd like to build the TClientJoined with the information needed and write it a stream, and have a function that takes a stream and reads from it into a TClientJoined
```nimrod
# writeBE and readBE are reading/writing functions that will read/write in big endian 
proc write (packet: var TClientJoined; stream: PStream) =
  writeBE stream, packet.playerID
  writeBE stream, packet.alias
proc readClientJoined (stream: PStream): TClientJoined = 
  readBE stream, result.playerID
  readBE stream, result.alias
```
As you can see, this will result in a specialized function for reading/writing a certain type of packet 

to be continued

