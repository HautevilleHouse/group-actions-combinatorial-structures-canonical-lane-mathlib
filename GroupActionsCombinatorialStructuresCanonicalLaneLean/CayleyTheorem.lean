import GroupActionsCombinatorialStructures.GroupActionAdmissibleClass

namespace HautevilleHouse
namespace GroupActionsCombinatorialStructures

structure CayleyTheoremPackage (A : AdmissibleGroupAction) where
  regularAction : A.object.groupType → A.object.groupType → A.object.groupType
  permutationRepresentation : Prop
  faithfulAction : Prop

structure CayleyTheoremEvidence (A : AdmissibleGroupAction)
    (C : CayleyTheoremPackage A) where
  permutationRepresentationClosed : C.permutationRepresentation
  faithfulActionClosed : C.faithfulAction

def CayleyTheoremClosed (A : AdmissibleGroupAction)
    (C : CayleyTheoremPackage A) : Prop :=
  C.permutationRepresentation ∧ C.faithfulAction

theorem cayley_theorem_closed_from_evidence (A : AdmissibleGroupAction)
    (C : CayleyTheoremPackage A) (E : CayleyTheoremEvidence A C) :
    CayleyTheoremClosed A C := by
  exact And.intro E.permutationRepresentationClosed E.faithfulActionClosed

end GroupActionsCombinatorialStructures
end HautevilleHouse
