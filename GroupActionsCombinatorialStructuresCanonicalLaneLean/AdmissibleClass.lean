import HautevilleHouse.GroupActionsCombinatorialStructuresCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace GroupActionsCombinatorialStructuresCanonicalLaneLean

structure AdmissibleClass where
  object : GroupActionAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  GroupActionWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end GroupActionsCombinatorialStructuresCanonicalLaneLean
end HautevilleHouse
