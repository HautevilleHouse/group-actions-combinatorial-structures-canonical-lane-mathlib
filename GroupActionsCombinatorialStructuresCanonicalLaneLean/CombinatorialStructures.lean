import HautevilleHouse.GroupActionsCombinatorialStructuresCanonicalLaneLean.GroupActions

/-!
# Combinatorial Structures Package
-/

namespace HautevilleHouse
namespace GroupActionsCombinatorialStructuresCanonicalLaneLean

structure CombinatorialStructuresPackage {G : GroupActionSpace} (P : GroupActionPackage G) where
  space : Type
  points : Type
  blocks : Type
  incidence : Prop
  transitiveAction : Prop
  blockSystem : Prop
  primitiveAction : Prop

structure CombinatorialStructuresEvidence {G : GroupActionSpace} {P : GroupActionPackage G}
    (C : CombinatorialStructuresPackage P) where
  transitiveActionClosed : C.transitiveAction
  blockSystemClosed : C.blockSystem
  primitiveActionClosed : C.primitiveAction

def CombinatorialStructuresClosed {G : GroupActionSpace} {P : GroupActionPackage G}
    (C : CombinatorialStructuresPackage P) : Prop :=
  C.transitiveAction ∧ C.blockSystem ∧ C.primitiveAction

theorem combinatorial_structures_closed_from_evidence
    {G : GroupActionSpace} {P : GroupActionPackage G}
    (C : CombinatorialStructuresPackage P) (E : CombinatorialStructuresEvidence C) :
    CombinatorialStructuresClosed C := by
  exact And.intro E.transitiveActionClosed
    (And.intro E.blockSystemClosed E.primitiveActionClosed)

end GroupActionsCombinatorialStructuresCanonicalLaneLean
end HautevilleHouse
