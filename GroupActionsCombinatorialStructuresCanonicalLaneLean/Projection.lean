import HautevilleHouse.GroupActionsCombinatorialStructuresCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsCombinatorialStructuresCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def groupActionProjection : Projection GroupActionEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem group_action_projection_idempotent (x : GroupActionEndgameState) :
    groupActionProjection.toFun (groupActionProjection.toFun x) = groupActionProjection.toFun x := by
  exact groupActionProjection.idempotent x

end GroupActionsCombinatorialStructuresCanonicalLaneLean
end HautevilleHouse
