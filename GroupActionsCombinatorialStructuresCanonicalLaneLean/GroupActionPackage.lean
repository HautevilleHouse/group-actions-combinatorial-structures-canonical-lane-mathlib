import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsCombinatorialStructuresCanonicalLaneLean

structure GroupActionPackage where
  groupCarrier : Type
  actionSet : Type
  actionMap : groupCarrier → actionSet → actionSet
  identityAction : ∀ x : actionSet, actionMap 1 x = x
  compatibility : ∀ g h : groupCarrier, ∀ x : actionSet, actionMap (g * h) x = actionMap g (actionMap h x)

def GroupActionPackageClosed (G : GroupActionPackage) : Prop :=
  (∀ x : G.actionSet, G.actionMap 1 x = x) ∧
  (∀ g h : G.groupCarrier, ∀ x : G.actionSet, G.actionMap (g * h) x = G.actionMap g (G.actionMap h x))

theorem group_action_package_closed (G : GroupActionPackage) : GroupActionPackageClosed G := by
  exact And.intro G.identityAction G.compatibility

end GroupActionsCombinatorialStructuresCanonicalLaneLean
end HautevilleHouse