import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsCombinatorialStructuresCanonicalLaneLean

structure GroupActionClassificationPackage (G : Type u) (X : Type v) [DecidableEq X] where
  orbitTypes : List (Set X)
  transitivity : Prop
  primitivity : Prop
  classificationData : String

def groupActionClassificationClosed {G : Type u} {X : Type v} [DecidableEq X] (C : GroupActionClassificationPackage G X) : Prop :=
  C.transitivity ∧ C.primitivity

structure GroupActionClassificationEvidence {G : Type u} {X : Type v} [DecidableEq X] (C : GroupActionClassificationPackage G X) where
  transitivityClosed : C.transitivity
  primitivityClosed : C.primitivity

theorem group_action_classification_closed_from_evidence
    {G : Type u} {X : Type v} [DecidableEq X] (C : GroupActionClassificationPackage G X) 
    (E : GroupActionClassificationEvidence C) : groupActionClassificationClosed C := by
  exact And.intro E.transitivityClosed E.primitivityClosed

end GroupActionsCombinatorialStructuresCanonicalLaneLean
end HautevilleHouse
