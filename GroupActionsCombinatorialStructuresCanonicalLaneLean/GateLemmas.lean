import GroupActionsCombinatorialStructures.BridgeLemmas

namespace HautevilleHouse
namespace GroupActionsCombinatorialStructures

def gateClosed (A : AdmissibleGroupAction) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleGroupAction) : gateClosed A := by
  exact A.gateWitness

end GroupActionsCombinatorialStructures
end HautevilleHouse
