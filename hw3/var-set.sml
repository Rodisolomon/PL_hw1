structure VarSet :> sig

  type set

  val empty : set
  val mem   : string * set -> bool
  val ins   : string * set -> set
  val rem   : string * set -> set
  val union : set * set -> set

end = struct

  type set = string lst
  val empty = []

  fun mem (str, s) = 
    case List.find (fn y => y = str) s of
        SOME _ => true
      | NONE => false;
  fun ins (str, s) = 
    if mem (str, s) then 
      s
    else 
      str::s;
  fun rem (str, s) = 
    List.filter (fn y => y <> str) s;
  fun union (s1, s2) = List.foldl insert s2 s1
				      
end
