import HautevilleHouse.GroupActionsCombinatorialStructuresCanonicalLaneLean.InvariantTheory

/-!
# Group Actions Package
-/

namespace HautevilleHouse
namespace GroupActionsCombinatorialStructuresCanonicalLaneLean

structure GroupActionPackage {G : GroupActionSpace} where
  group : Type
  action : group → group → group
  orbit : Type
  stabilizer : Type
  orbitDecomposition : Prop
  stabilizerSubgroup : Prop
  orbitStabilizerBijection : Prop

structure GroupActionEvidence {G : GroupActionSpace} (P : GroupActionPackage G) where
  orbitDecompositionClosed : P.orbitDecomposition
  stabilizerSubgroupClosed : P.stabilizerSubgroup
  orbitStabilizerBijectionClosed : P.orbitStabilizerBijection

def GroupActionClosed {G : GroupActionSpace} (P : GroupActionPackage G) : Prop :=
  P.orbitDecomposition ∧ P.stabilizerSubgroup ∧ P.orbitStabilizerBijection

theorem group_action_closed_from_evidence
    {G : GroupActionSpace} (P : GroupActionPackage G) (E : GroupActionEvidence P) :
    GroupActionClosed P := by
  exact And.intro E.orbitDecompositionClosed
    (And.intro E.stabilizerSubgroupClosed E.orbitStabilizerBijectionClosed)

end GroupActionsCombinatorialStructuresCanonicalLaneLean
end HautevilleHouse
