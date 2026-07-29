import HautevilleHouse.GroupActionsCombinatorialStructuresCanonicalLaneLean.CombinatorialStructures

/-!
# Invariant Theory Package
-/

namespace HautevilleHouse
namespace GroupActionsCombinatorialStructuresCanonicalLaneLean

structure InvariantTheoryPackage {G : GroupActionSpace} {P : GroupActionPackage G}
    (C : CombinatorialStructuresPackage P) where
  invariantRing : Type
  polynomialInvariants : Prop
  generatingSet : Prop
  degreeBound : Prop
  HilbertSeries : Prop

structure InvariantTheoryEvidence {G : GroupActionSpace} {P : GroupActionPackage G}
    {C : CombinatorialStructuresPackage P} (I : InvariantTheoryPackage C) where
  polynomialInvariantsClosed : I.polynomialInvariants
  generatingSetClosed : I.generatingSet
  degreeBoundClosed : I.degreeBound
  HilbertSeriesClosed : I.HilbertSeries

def InvariantTheoryClosed {G : GroupActionSpace} {P : GroupActionPackage G}
    {C : CombinatorialStructuresPackage P} (I : InvariantTheoryPackage C) : Prop :=
  I.polynomialInvariants ∧ I.generatingSet ∧ I.degreeBound ∧ I.HilbertSeries

theorem invariant_theory_closed_from_evidence
    {G : GroupActionSpace} {P : GroupActionPackage G}
    {C : CombinatorialStructuresPackage P} (I : InvariantTheoryPackage C)
    (E : InvariantTheoryEvidence I) : InvariantTheoryClosed I := by
  exact And.intro E.polynomialInvariantsClosed
    (And.intro E.generatingSetClosed
      (And.intro E.degreeBoundClosed E.HilbertSeriesClosed))

end GroupActionsCombinatorialStructuresCanonicalLaneLean
end HautevilleHouse
