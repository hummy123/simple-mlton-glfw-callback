structure Glfw =
struct
  type window = Word32.word

  (* GLFW functions. *)
  val init = _import "init" public : unit -> unit;
  val createWindow =
    _import "createWindow" public : int * int * string -> window;
  val terminate = _import "terminate" public : unit -> unit;
  val makeContextCurrent = _import "makeContextCurrent" public : window -> unit;
  val windowShouldClose = _import "windowShouldClose" public : window -> bool;
  val pollEvents = _import "pollEvents" public : unit -> unit;
  val swapBuffers = _import "swapBuffers" public : window -> unit;

  (* Below code is importing/exporting callback in C. *)
  (** Export a function to C. *)
  val export = _export "printFromMLton" public : (unit -> unit) -> unit;
  val _ = export (fn () => print "hello from mlton")

  (** Import function to set a callback. *)
  val setKeyCallback = _import "setKeyCallback" public reentrant : window -> unit;
end
