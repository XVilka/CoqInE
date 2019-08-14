(**
    simpl_letins : bool;
    (** Translate let-in as simpl beta redices or not ? *)

    polymorphism_flag : bool;
    (** Is (true) polymorphism translation on ? *)

    templ_polymorphism_flag : bool;
    (** Is template polymorphism translation on ? *)

    float_univ_flag : bool;
    (** Is floating universe translation on ? *)

    constraints_flag : bool;
    (** Constraints translation ? Only has meaning when float is true. *)

    named_univ_flag : bool;
    (** Should we use universe names or value ? Only has meaning when float is false. *)

    readable_translation_flag : bool;
    (** Is (pseudo-)readable translation mode on ? *)

    cast_flag : bool;
    (** Are we allowed to use casts (for casted lambdas) ?
        Or should we turn them into lifted lambdas instead ? *)

    (*    lift_flag : bool; *)
    (** Are we allowed to use lifts (for lifted type) ?
        Or should we use casts instead ? *)

    lifted_type_pattern : string;
    (** What's the normal form of a lifted type ? To use in pattern. *)

    pred_univ_flag            : bool;
    pred_prod_flag            : bool;
    pred_lift_flag            : bool;
    pred_cast_flag            : bool;
    (** Predicate symbols ? *)

    priv_lift_flag            : bool;
    priv_cast_flag            : bool;
    priv_univ_flag            : bool;
    priv_prod_flag            : bool;
    (** Private version of symbols ? *)

    encoding_name : string;

    (* Module names *)
    system_module   : string;
    universe_module : string;

    (* Encoding's symbol names *)
    t_Sort : string;
    t_Univ : string;
    t_Term : string;

    t_axiom : string;
    t_sup   : string;
    t_rule  : string;

    t_univ : string;
    t_prod : string;
    t_lift : string;
    t_cast : string;
    t_I    : string;
    t_priv_lift   : string;
    t_priv_cast   : string;
    t_priv_univ   : string;
    t_priv_prod   : string;
    t_priv_code   : string;
    t_priv_uncode : string;

    inlined_fixpoint_flag : bool;
    (** Translate fixpoints as external body or inlined generic fixpoint operator ?
        This is a very experimental feature. *)
    t_0            : string;
    t_S            : string;
    t_SA           : string;
    t_MA           : string;
    t_fix          : string;
    t_fix_proj     : string;
    t_fix_oneline  : string;
    t_guard        : string;
    t_guarded      : string;
*)

val flag : string -> bool
val symb : string -> string

val set_param  : string -> string -> unit
val set_params : (string*string) list -> unit
(** Sets given parameter to given value *)

val is_polymorphism_on : unit -> bool
(** Is (true) polymorphism translation on ? *)

val is_templ_polymorphism_on : unit -> bool
(** Is template polymorphism translation on ? *)

val is_float_univ_on : unit -> bool
(** Is floating universe translation on ? *)

val is_constraints_on : unit -> bool
(** Constraints translation ? Only has meaning when float is true. *)

val is_named_univ_on : unit -> bool
(** Should we use universe names or value ? Only has meaning when float is false. *)

val is_readable_on : unit -> bool
(** Is (pseudo-)readable translation mode on ? *)

val is_cast_on : unit -> bool
(** Use casts or lifted lambdas ? *)

val is_letins_simpl : unit -> bool
(** Translate let-in as simpl beta redices or not ? *)

val is_fixpoint_inlined : unit -> bool
(** Translate fixpoints as external body or generic unsafe fixpoint operator ?*)
