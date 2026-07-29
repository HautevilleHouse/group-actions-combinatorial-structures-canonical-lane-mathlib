import HautevilleHouse.GroupActionsCombinatorialStructuresCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.GroupTheory.GroupAction.Basic

namespace HautevilleHouse
namespace GroupActionsCombinatorialStructuresCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure GroupActionSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure GroupActionAdmittedObject where
  space : GroupActionSpace
  group : Type
  groupMul : Mul group
  groupInv : Inv group
  groupOne : One group
  groupAssoc : ∀ (a b c : group), a * (b * c) = (a * b) * c
  action : group → group → group
  actionOne : ∀ (x : group), action 1 x = x
  actionCompat : ∀ (g h : group) (x : group), action (g * h) x = action g (action h x)
  orbit : Type
  stabilizer : Type
  orbitStabilizerTheorem : Prop
  conclusion : orbitStabilizerTheorem

structure GroupActionEndgameState where
  object : GroupActionAdmittedObject

def GroupActionWitnessClosed (O : GroupActionAdmittedObject) : Prop :=
  O.orbitStabilizerTheorem

end GroupActionsCombinatorialStructuresCanonicalLaneLean
end HautevilleHouse
