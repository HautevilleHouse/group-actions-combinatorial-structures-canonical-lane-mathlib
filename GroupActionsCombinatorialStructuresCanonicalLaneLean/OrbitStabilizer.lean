import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsCombinatorialStructuresCanonicalLaneLean

structure OrbitStabilizerPackage (G : Type u) (X : Type v) [DecidableEq X] where
  action : G → X → X
  orbit : X → Set X
  stabilizer : X → Set G
  orbitDef : ∀ x : X, orbit x = {y : X | ∃ g : G, action g x = y}
  stabilizerDef : ∀ x : X, stabilizer x = {g : G | action g x = x}
  orbitStabilizerTheorem : ∀ x : X, card (orbit x) * card (stabilizer x) = card G

def orbitStabilizerClosed {G : Type u} {X : Type v} [DecidableEq X] (O : OrbitStabilizerPackage G X) : Prop :=
  (∀ x : X, O.orbit x = {y : X | ∃ g : G, O.action g x = y}) ∧
  (∀ x : X, O.stabilizer x = {g : G | O.action g x = x}) ∧
  (∀ x : X, card (O.orbit x) * card (O.stabilizer x) = card G)

structure OrbitStabilizerEvidence {G : Type u} {X : Type v} [DecidableEq X] (O : OrbitStabilizerPackage G X) where
  orbitDefClosed : ∀ x : X, O.orbit x = {y : X | ∃ g : G, O.action g x = y}
  stabilizerDefClosed : ∀ x : X, O.stabilizer x = {g : G | O.action g x = x}
  orbitStabilizerTheoremClosed : ∀ x : X, card (O.orbit x) * card (O.stabilizer x) = card G

theorem orbit_stabilizer_closed_from_evidence
    {G : Type u} {X : Type v} [DecidableEq X] (O : OrbitStabilizerPackage G X) (E : OrbitStabilizerEvidence O) :
    orbitStabilizerClosed O := by
  exact And.intro E.orbitDefClosed (And.intro E.stabilizerDefClosed E.orbitStabilizerTheoremClosed)

end GroupActionsCombinatorialStructuresCanonicalLaneLean
end HautevilleHouse
