import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupActionsCombinatorialStructuresCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsCombinatorialStructuresCanonicalLaneLean

structure OrbitStabilizerPackage (A : AdmissibleClass) where
  orbit : Type
  stabilizer : Type
  orbitSize : ℕ
  stabilizerSize : ℕ
  orbitStabilizerTheorem : Prop
  actionTransitive : Prop
  actionFaithful : Prop

structure OrbitStabilizerEvidence {A : AdmissibleClass} (P : OrbitStabilizerPackage A) where
  orbitStabilizerTheoremClosed : P.orbitStabilizerTheorem
  actionTransitiveClosed : P.actionTransitive
  actionFaithfulClosed : P.actionFaithful

def OrbitStabilizerClosed {A : AdmissibleClass} (P : OrbitStabilizerPackage A) : Prop :=
  P.orbitStabilizerTheorem ∧ P.actionTransitive ∧ P.actionFaithful

theorem orbit_stabilizer_closed_from_evidence {A : AdmissibleClass} (P : OrbitStabilizerPackage A) (E : OrbitStabilizerEvidence P) : OrbitStabilizerClosed P := by
  exact And.intro E.orbitStabilizerTheoremClosed (And.intro E.actionTransitiveClosed E.actionFaithfulClosed)

def bridgeClosed (A : AdmissibleClass) : Prop := A.bridgeClosed

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  trivial

end GroupActionsCombinatorialStructuresCanonicalLaneLean
end HautevilleHouse