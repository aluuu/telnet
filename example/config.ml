open Mirage

let main = foreign "Unikernel.Main" (console @-> stackv4 @-> job)

let stack = generic_stackv4 default_console tap0

let () =
  register "network"
    ~packages:[ "telnet" ; "notty" ]
    ~libraries:[ "telnet"; "telnet.mirage" ; "notty" ; "notty.mirage" ; "notty.unix" ]
    [
      main $ default_console $ stack
    ]
