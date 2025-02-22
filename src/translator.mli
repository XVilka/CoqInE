open Dedukti

(** Intermediate representation of universes *)
type cic_universe =
  | Prop (** Impredicative Prop *)
  | Set  (** Predicative   Set *)
  | GlobalSort of string
  (** Global universe "Coq.Module.index" *)
  | GlobalLevel of string
  (** Global level "Coq.Module.index" *)
  | NamedSort  of string
  (** Locally bounded polymorphic universe  *)
  | NamedLevel of string
  (** Locally bounded polymorphic level  *)
  | Local  of int
  (** Locally bounded universe polymorphic variable. *)
  | Succ   of cic_universe * int
  (** [Succ u n] = u + n
      Notes:
        Succ(u,0) = u
        Succ(Prop,1) = Axiom(Prop) = Type@{0} = Succ(Set ,1)  *)
  | Max      of cic_universe list  (** sup {u | u \in l} *)
  | Rule     of cic_universe * cic_universe
  | SInf (** Private sort representing codes *)

val mk_type : int -> cic_universe
(** [mk_type i] represents Type@{i} in the hierarchy
        Set < Type@{0} < Type@{1} < ...
    Type@{i} = Set + (i+1) = Prop + (i+1)
*)

(*
Note: in Coq cumulativity (subtyping) and axioms are not the same:
  Set  : Type_0 : Type_1 : ...
  Prop : Type_0
but
  Prop < Set < Type_0 < Type_1 < ...
! This hierarchy is supposed to change starting v8.10 !
*)


module T :
sig
  val coq_Nat : unit -> term
  (** Term representing the type of Type levels (for universe polymorphism). *)

  val coq_Sort : unit -> term
  (** Term representing the type of sorts. *)

  val coq_var_univ_name : int -> var
  (** Translates a "var" universe level's name  *)

  val coq_univ_name : string -> var
  (** Template (local) Coq universe name translation
      e.g.  Coq.Arith.0 --> Coq__Arith__0  *)

  val coq_global_univ : string -> term
  (** Global universe name translation to Dedukti variable
      e.g.  Coq.Arith.0 --> Var "U.Coq__Arith__0"  *)

  val coq_level : cic_universe -> term
  (** Translate a universe level *)

  val coq_universe : cic_universe -> term
  (** Translate a universe *)

  val coq_pattern_universe : cic_universe -> term
  (** Translate a universe level as a rule rhs pattern *)

  val coq_nat_universe : cic_universe -> term
  (** Nat level of universe *)

  val coq_U    : cic_universe -> term
  val coq_term : cic_universe -> term -> term
  val coq_sort : cic_universe -> term
  val coq_prod : cic_universe -> cic_universe -> term -> term -> term

  val coq_cast : cic_universe -> cic_universe -> term -> term -> term list -> term -> term
  (** [coq_cast s1 s2 A B [c1; ...; cn] t]
      build the cast representation of t from type A : Us1 to B : Us2
      using the given list of constraints
  *)

  val coq_lift : cic_universe -> cic_universe -> term -> term

  val coq_pcast : cic_universe -> cic_universe -> term -> term -> term -> term
  (** Private cast. Use only in inductive subtyping. *)

  val coq_coded : term -> term -> term
  (** returns [code t a]  where a : D t *)

  val coq_pattern_lifted_from_sort : term -> term -> term
  (** [coq_pattern_lifted_from_sort s t] Returns a pattern matching a term lifted from
      sort pattern [s] (for instance a variable). *)
  val coq_pattern_lifted_from_level : var -> term -> term
  (** [coq_pattern_lifted_from_level lvl t] Returns a pattern matching a term lifted from
      sort [type lvl] . *)

  val coq_proj : int -> term -> term

  val coq_cstr : Univ.constraint_type -> cic_universe -> cic_universe -> term
  val coq_I : unit -> term

  val coq_header : unit -> instruction list
  val coq_footer : unit -> instruction list
  val coq_fixpoint : int -> (term*int*term) array -> term array -> int -> term
  val coq_guarded : string -> int -> instruction
end
