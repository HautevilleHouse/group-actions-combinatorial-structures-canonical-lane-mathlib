import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsCombinatorialStructuresCanonicalLaneLean

structure CayleyGraphPackage (G : Type u) [DecidableEq G] (S : Set G) where
  vertices : Set G := Set.univ
  edges : Set (G × G) := {(g, h) : G × G | ∃ s : S, h = g * s}
  vertexSetDef : vertices = Set.univ
  edgeSetDef : edges = {(g, h) : G × G | ∃ s : S, h = g * s}
  regular : ∀ (g : G), card (neighbors g) = card S

def cayleyGraphClosed {G : Type u} [DecidableEq G] (C : CayleyGraphPackage G S) : Prop :=
  C.vertexSetDef ∧ C.edgeSetDef ∧ C.regular

structure CayleyGraphEvidence {G : Type u} [DecidableEq G] (C : CayleyGraphPackage G S) where
  vertexSetDefClosed : C.vertexSetDef
  edgeSetDefClosed : C.edgeSetDef
  regularClosed : C.regular

theorem cayley_graph_closed_from_evidence
    {G : Type u} [DecidableEq G] (C : CayleyGraphPackage G S) (E : CayleyGraphEvidence C) :
    cayleyGraphClosed C := by
  exact And.intro E.vertexSetDefClosed (And.intro E.edgeSetDefClosed E.regularClosed)

end GroupActionsCombinatorialStructuresCanonicalLaneLean
end HautevilleHouse
