(** General information about the translation *)


val set_destination : string -> unit
(** Sets the folder in which generated files should be output *)

type info = private
  {
    out         : out_channel;
    fmt         : Format.formatter;
    library     : Names.DirPath.t;
    module_path : Names.ModPath.t;
  }

(** Creates an info for given module written into given file *)
val init : Names.ModPath.t -> string -> info

(** Updates the info to match a certain label inside the current module *)
val update : info -> Names.Label.t -> info

(** Flushes out the output channel and close it *)
val close : info -> unit


(** Universes and constraints local environment.
  Contains information about:
  - locally bounded universe variables from universe polymorphism
  - local polymorphic constraints
  - template polymorphic named variables
*)
type env

val make :
  Univ.Level.t list -> Translator.cic_universe list ->
  int -> ( Univ.univ_constraint * (Dedukti.var * Dedukti.term) ) list ->
  env

val is_template_polymorphic    : env -> Univ.Level.t -> bool
val translate_template_arg     : env -> Univ.Level.t -> Translator.cic_universe
(*
val try_translate_template_arg : env -> Univ.Level.t -> Dedukti.var option
*)

val replace_template_name : env -> Univ.Level.t -> Translator.cic_universe -> env

val fetch_constraint : env -> Univ.univ_constraint -> Dedukti.var option

val pp_constraints : env Debug.printer

val dummy : env
