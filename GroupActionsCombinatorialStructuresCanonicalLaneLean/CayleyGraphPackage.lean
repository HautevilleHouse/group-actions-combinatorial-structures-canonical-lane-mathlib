import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsCombinatorialStructuresCanonicalLaneLean

structure CayleyGraphPackage {G : GroupActionPackage} (A : AdmissibleClass) where
  generatingSet : Set G.groupCarrier
  graphVertices : Type
  graphEdges : graphVertices → graphVertices → Prop
  leftInvariant : Prop
  connected : Prop
  quasiIsometricToGroup : Prop

structure CayleyGraphEvidence {G : GroupActionPackage} {A : AdmissibleClass} (C : CayleyGraphPackage G A) where
  generatingSetClosed : C.generatingSet = {g | True} -- simplified
  leftInvariantClosed : C.leftInvariant
  connectedClosed : C.connected
  quasiIsometricToGroupClosed : C.quasiIsometricToGroup

def CayleyGraphClosed {G : GroupActionPackage} {A : AdmissibleClass} (C : CayleyGraphPackage G A) : Prop :=
  C.leftInvariant ∧ C.connected ∧ C.quasiIsometricToGroup

theorem cayley_graph_closed_from_evidence {G : GroupActionPackage} {A : AdmissibleClass} (C : CayleyGraphPackage G A) (E : CayleyGraphEvidence G A C) : CayleyGraphClosed C := by
  exact And.intro E.leftInvariantClosed (And.intro E.connectedClosed E.quasiIsometricToGroupClosed)

end GroupActionsCombinatorialStructuresCanonicalLaneLean
end HautevilleHouse