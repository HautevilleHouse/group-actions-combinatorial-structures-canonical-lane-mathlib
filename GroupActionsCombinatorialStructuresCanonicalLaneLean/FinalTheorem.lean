import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.GroupActionsCombinatorialStructuresCanonicalLaneLean.OrbitStabilizerBridge
import HautevilleHouse.GroupActionsCombinatorialStructuresCanonicalLaneLean.CayleyGraphStructure

namespace HautevilleHouse
namespace GroupActionsCombinatorialStructuresCanonicalLaneLean

def ConstrainedGroupActionsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_group_actions_endgame (A : AdmissibleClass) : ConstrainedGroupActionsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end GroupActionsCombinatorialStructuresCanonicalLaneLean
end HautevilleHouse