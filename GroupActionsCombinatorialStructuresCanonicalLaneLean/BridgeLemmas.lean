import canonicalLaneMathlib.AdmissibleClass
import GroupActionsCombinatorialStructures.GroupActionAdmissibleClass

namespace HautevilleHouse
namespace GroupActionsCombinatorialStructures

def bridgeClosed (A : AdmissibleGroupAction) : Prop :=
  A.object.orbitStructure ∧ A.object.stabilizerStructure

theorem bridge_from_admissible_class (A : AdmissibleGroupAction) : bridgeClosed A := by
  exact A.object.conclusion

end GroupActionsCombinatorialStructures
end HautevilleHouse
