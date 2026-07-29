import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsCombinatorialStructures

structure GroupActionAdmittedObject where
  groupType : Type u
  actionSet : Type v
  groupAction : groupType → actionSet → actionSet
  orbitStructure : Prop
  stabilizerStructure : Prop
  conclusion : orbitStructure ∧ stabilizerStructure

structure AdmissibleGroupAction where
  object : GroupActionAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedGroupActionClosure (A : AdmissibleGroupAction) : Prop :=
  (A.object.orbitStructure ∧ A.object.stabilizerStructure) ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end GroupActionsCombinatorialStructures
end HautevilleHouse
