import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupActionsCombinatorialStructuresCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsCombinatorialStructuresCanonicalLaneLean

structure CayleyGraphPackage (A : AdmissibleClass) where
  group : Type
  generatingSet : Type
  edgeRelation : Type
  graphRegular : Prop
  connected : Prop
  geodesicCompleteness : Prop

structure CayleyGraphEvidence {A : AdmissibleClass} (C : CayleyGraphPackage A) where
  graphRegularClosed : C.graphRegular
  connectedClosed : C.connected
  geodesicCompletenessClosed : C.geodesicCompleteness

def CayleyGraphClosed {A : AdmissibleClass} (C : CayleyGraphPackage A) : Prop :=
  C.graphRegular ∧ C.connected ∧ C.geodesicCompleteness

theorem cayley_graph_closed_from_evidence {A : AdmissibleClass} (C : CayleyGraphPackage A) (E : CayleyGraphEvidence C) : CayleyGraphClosed C := by
  exact And.intro E.graphRegularClosed (And.intro E.connectedClosed E.geodesicCompletenessClosed)

def gateClosed (A : AdmissibleClass) : Prop := A.gateClosed

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A := by
  exact A.gateWitness

end GroupActionsCombinatorialStructuresCanonicalLaneLean
end HautevilleHouse