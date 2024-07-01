structure Shell =
struct
  fun loop (window) =
    if not (Glfw.windowShouldClose window) then
      let
        val _ = Glfw.pollEvents ()
        val _ = Glfw.swapBuffers window
      in
        loop (window)
      end
    else
      Glfw.terminate ()

  fun main () =
    let
      (* Set up GLFW. *)
      val _ = Glfw.init ()
      val window = Glfw.createWindow (500, 500, "mlton test")
      val _ = Glfw.makeContextCurrent window
      val _ = Glfw.setKeyCallback window
    in
      loop (window)
    end
end

val _ = Shell.main ()
