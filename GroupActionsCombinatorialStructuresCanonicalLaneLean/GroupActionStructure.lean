import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsCombinatorialStructuresCanonicalLaneLean

structure GroupActionObject where
  group : Type u
  actionSpace : Type v
  action : group → actionSpace → actionSpace
  isGroupAction : Prop
  orbitSpace : Prop

structure GroupActionAdmissibleClass where
  object : GroupActionObject
  orbitCompactness : Prop
  stabilizerFinite : Prop
  actionProperlyDiscontinuous : Prop

end GroupActionsCombinatorialStructuresCanonicalLaneLean
end HautevilleHouse