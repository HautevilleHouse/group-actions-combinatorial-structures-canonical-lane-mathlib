import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsCombinatorialStructuresCanonicalLaneLean

structure AdmissibleObject where
  groupAction : Type
  set : Type
  action : groupAction → set → set
  actionProperties : Prop
  carriedRemainder : Prop

structure AdmissibleClass where
  object : AdmissibleObject
  bridgeClosed : Prop
  gateClosed : Prop
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.bridgeClosed ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end GroupActionsCombinatorialStructuresCanonicalLaneLean
end HautevilleHouse