structure L1Cbv =
struct

  structure A = Ast

  datatype value = Number of int | Boolean of bool | Abs of A.ident*A.expr

  fun eval_expr (e : A.expr) =
      case e of
        (A.Number(n)) => Number(n)
      | (A.Boolean(b)) => Boolean(b)
      | (A.Abs(i,b)) => Abs(i,b)
      | _ => raise Fail("expression not yet considered") (* FIXME *)



                                                         

 (* THISISFORCLOSURES
  type valenv = A.ident -> value

  datatype value = Number of int*valenv
                 | Bool of bool*valenv
                 | Abs of A.ident*A.expr*valenv
                 | Nil of valenv
                 | Cons of value*value
  datatype closure = Closure of A.expr*valenv

  fun env_update env x v =
    case env of
      valenv => (fn y => if y=x then v else (env y))
      | _ => raise Fail("Update env called on non-environment")
                           
  val empty_env = fn _ => raise Fail("Accessing an empty environment")
                           
  fun eval_clos (Closure(A.Number(n), _)) = Number(n, empty_env)
    | eval_clos (Closure(A.Boolean(b), _)) = Bool(b, empty_env)
    | eval_clos (Closure(A.UnOp(rator, e), env)) =
      let
        fun apply_unrator A.NEG e = ~e
          | apply_unrator A.NOT e = not e
          | apply_unrator A.HEAD e = hd e
          | apply_unrator A.TAIL e = tl e
          | apply_unrator _ _ = raise Fail("Not a unary operator")
      in
        case rator of
          A.NEG => Number(apply_unrator rator (eval_clos Closure(e, env)))
          | A.NOT => Bool(apply_unrator rator (eval_clos Closure(e, env)))
          | A.HEAD => raise Fail("FIXME")
          | A.TAIL => raise Fail("FIXME")
(* FIXME *)
      end
*)
  fun eval_expr e = raise Fail("")(*eval_clos e empty_env*)

  fun pgm_xfrm (A.Program(A.Assign(x,e)::[])) = e
    | pgm_xfrm (A.Program(A.Assign(x,e)::tl)) = A.App(A.Abs(x, pgm_xfrm (A.Program(tl))), e)
    | pgm_xfrm _ = raise Fail("Not a proper program")
  
  fun eval_pgm p = raise Fail("")(*eval_expr (pgm_xfrm p)*)
(* THISISFORCLOSURES
  fun values2ast (Number(n,_)) = A.Number(n)
    | values2ast (Boolean(b,_)) = A.Boolean(b)
    | values2ast (Abs(i,e,env)) = raise Fail("FIXME")(* FIXME, this needs to actually go in and read
                                 the environment and fill in values. lame. *)
    | values2ast (Nil(_)) = A.NilList
    | values2ast (Cons(v0,v1)) = A.BinOp(CONS, values2ast v0, values2ast v1)
    | values2ast _ = raise Fail("Not a proper value; can't convert to AST")
*)
end
