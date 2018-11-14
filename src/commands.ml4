(*i camlp4deps: "grammar/grammar.cma" i*)

DECLARE PLUGIN "coqine_plugin"


open Libraries
open Stdarg


(** Exporting to Dedukti **)

VERNAC COMMAND EXTEND DeduktiExportLibrary CLASSIFIED AS QUERY
| [ "Dedukti" "Export" "Library" global_list(refs) ] ->
  [ List.iter translate_library refs ]
END

VERNAC COMMAND EXTEND DeduktiExportUniverses CLASSIFIED AS QUERY
| [ "Dedukti" "Export" "Universes" ] ->
  [ translate_universes () ]
END

VERNAC COMMAND EXTEND DeduktiExportAll CLASSIFIED AS QUERY
| [ "Dedukti" "Export" "All" ] ->
  [ translate_all () ]
END


(** Printing universes **)

VERNAC COMMAND EXTEND DeduktiShowUniverses CLASSIFIED AS QUERY
| [ "Dedukti" "Show" "Universes" ] ->
  [ show_universes_constraints () ]
END

VERNAC COMMAND EXTEND DeduktiShowSortedUniverses CLASSIFIED AS QUERY
| [ "Dedukti" "Show" "Sorted" "Universes" ] ->
  [ show_sorted_universes_constraints () ]
END


(** Setting parameters **)

VERNAC COMMAND EXTEND DeduktiSetDestination CLASSIFIED AS QUERY
| [ "Dedukti" "Set" "Destination" string(dest) ] ->
  [ Parameters.set_destination dest ]
END

VERNAC COMMAND EXTEND DeduktiSetDebug CLASSIFIED AS QUERY
| [ "Dedukti" "Set" "Debug" string(dest) ] ->
  [ Debug.debug_to_file dest ]
END

VERNAC COMMAND EXTEND DeduktiEnableDebug CLASSIFIED AS QUERY
| [ "Dedukti" "Enable" "Debug" ] ->
  [ Parameters.enable_debug () ]
END

VERNAC COMMAND EXTEND DeduktiDisableDebug CLASSIFIED AS QUERY
| [ "Dedukti" "Disable" "Debug" ] ->
  [ Parameters.disable_debug () ]
END

VERNAC COMMAND EXTEND DeduktiEnablePolymorphism CLASSIFIED AS QUERY
| [ "Dedukti" "Enable" "Universes" ] ->
  [ Parameters.enable_polymorphism () ]
END

VERNAC COMMAND EXTEND DeduktiDisablePolymorphism CLASSIFIED AS QUERY
| [ "Dedukti" "Disable" "Universes" ] ->
  [ Parameters.disable_polymorphism () ]
END

VERNAC COMMAND EXTEND DeduktiEnableTemplate CLASSIFIED AS QUERY
| [ "Dedukti" "Enable" "Template" ] ->
  [ Parameters.enable_templ_polymorphism () ]
END

VERNAC COMMAND EXTEND DeduktiDisableTemplate CLASSIFIED AS QUERY
| [ "Dedukti" "Disable" "Template" ] ->
  [ Parameters.disable_templ_polymorphism () ]
END

VERNAC COMMAND EXTEND DeduktiEnableConstraints CLASSIFIED AS QUERY
| [ "Dedukti" "Enable" "Constraints" ] ->
  [ Parameters.enable_constraints () ]
END

VERNAC COMMAND EXTEND DeduktiDisableConstraints CLASSIFIED AS QUERY
| [ "Dedukti" "Disable" "Constraints" ] ->
  [ Parameters.disable_constraints () ]
END

VERNAC COMMAND EXTEND DeduktiEnableFloatUniv CLASSIFIED AS QUERY
| [ "Dedukti" "Enable" "Floating" "Universes" ] ->
  [ Parameters.enable_float_univ () ]
END

VERNAC COMMAND EXTEND DeduktiDisableFloatUniv CLASSIFIED AS QUERY
| [ "Dedukti" "Disable" "Floating" "Universes" ] ->
  [ Parameters.disable_float_univ () ]
END
