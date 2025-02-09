BeginPackage["CoffeeLiqueur`Extensions`ApexCharts`", {
    "CoffeeLiqueur`Extensions`FrontendObject`", 
    "CoffeeLiqueur`Extensions`Boxes`"
}]

(* Public context *)

ApexCharts::usage = "ApexCharts[a_Association] constructor"

Begin["`Private`"]

nonAssocHeadQ[_] = True
nonAssocHeadQ[_Association] = False

ApexCharts::notassoc = "Input is not an association"
ApexCharts[_?nonAssocHeadQ ] := (Message[ApexCharts::notassoc]; $Failed)

(* Output forms *)

MakeBoxes[a: ApexCharts[_Association], StandardForm ] := With[{},
    ViewBox[a, a]
]

MakeBoxes[a: ApexCharts[_Association], StandardForm ] := With[{o = CreateFrontEndObject[a]},
    ViewBox[a, o]
] /; ByteCount[a] > 1024*4 (* Compress to FrontEndObject if too large *)


(* Form for slides and WLX cells *)

MakeBoxes[a: ApexCharts[_Association], form: WLXForm ] := With[{o = CreateFrontEndObject[a]},
    MakeBoxes[o, form]
]

End[]
EndPackage[]