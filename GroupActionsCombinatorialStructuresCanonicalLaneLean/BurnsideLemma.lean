import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsCombinatorialStructuresCanonicalLaneLean

structure BurnsideLemmaPackage (G : Type u) (X : Type v) [DecidableEq X] (A : GroupActionStructure G X) where
  fixedPoints : G → Set X
  fixedPointsDef : ∀ g : G, fixedPoints g = {x : X | A.action g x = x}
  numberOfOrbits : ℕ
  burnsideFormula : numberOfOrbits = (∑ g in Finset.univ : Finset.G, card (fixedPoints g)) / card G

def burnsideLemmaClosed {G : Type u} {X : Type v} [DecidableEq X] {A : GroupActionStructure G X} (B : BurnsideLemmaPackage G X A) : Prop :=
  (∀ g : G, B.fixedPoints g = {x : X | A.action g x = x}) ∧
  (B.numberOfOrbits = (∑ g in Finset.univ : Finset.G, card (B.fixedPoints g)) / card G)

structure BurnsideLemmaEvidence {G : Type u} {X : Type v} [DecidableEq X] {A : GroupActionStructure G X} (B : BurnsideLemmaPackage G X A) where
  fixedPointsDefClosed : ∀ g : G, B.fixedPoints g = {x : X | A.action g x = x}
  burnsideFormulaClosed : B.numberOfOrbits = (∑ g in Finset.univ : Finset.G, card (B.fixedPoints g)) / card G

theorem burnside_lemma_closed_from_evidence
    {G : Type u} {X : Type v} [DecidableEq X] {A : GroupActionStructure G X} (B : BurnsideLemmaPackage G X A) 
    (E : BurnsideLemmaEvidence B) : burnsideLemmaClosed B := by
  exact And.intro E.fixedPointsDefClosed E.burnsideFormulaClosed

end GroupActionsCombinatorialStructuresCanonicalLaneLean
end HautevilleHouse
