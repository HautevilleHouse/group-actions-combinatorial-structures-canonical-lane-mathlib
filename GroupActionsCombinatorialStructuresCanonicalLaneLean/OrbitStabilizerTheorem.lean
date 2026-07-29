import GroupActionsCombinatorialStructures.GroupActionAdmissibleClass

namespace HautevilleHouse
namespace GroupActionsCombinatorialStructures

structure OrbitStabilizerPackage (A : AdmissibleGroupAction) where
  orbitBijection : A.object.orbitStructure → Type u
  orbitIndex : Type v
  indexFinite : Prop
  lagrangeFactor : Prop

structure OrbitStabilizerEvidence (A : AdmissibleGroupAction)
    (O : OrbitStabilizerPackage A) where
  orbitBijectionClosed : O.orbitBijection
  indexFiniteClosed : O.indexFinite
  lagrangeFactorClosed : O.lagrangeFactor

def OrbitStabilizerClosed (A : AdmissibleGroupAction)
    (O : OrbitStabilizerPackage A) : Prop :=
  O.orbitBijection ∧ O.indexFinite ∧ O.lagrangeFactor

theorem orbit_stabilizer_closed_from_evidence (A : AdmissibleGroupAction)
    (O : OrbitStabilizerPackage A) (E : OrbitStabilizerEvidence A O) :
    OrbitStabilizerClosed A O := by
  exact And.intro E.orbitBijectionClosed (And.intro E.indexFiniteClosed E.lagrangeFactorClosed)

end GroupActionsCombinatorialStructures
end HautevilleHouse
