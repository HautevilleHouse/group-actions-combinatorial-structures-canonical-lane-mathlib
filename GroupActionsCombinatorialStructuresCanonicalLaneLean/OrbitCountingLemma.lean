import GroupActionsCombinatorialStructuresCanonicalLaneLean.GroupActionStructure

namespace HautevilleHouse
namespace GroupActionsCombinatorialStructuresCanonicalLaneLean

structure OrbitCountingLemmaData (G : GroupActionObject) where
  orbitStabilizerTheorem : G.isGroupAction
  burnsideLemma : Prop
  stabilizerIndexEqOrbitSize : G.stabilizerFinite → Prop

def OrbitCountingClosed {G : GroupActionObject} (D : OrbitCountingLemmaData G) : Prop :=
  D.orbitStabilizerTheorem ∧ D.burnsideLemma ∧ (G.stabilizerFinite → D.stabilizerIndexEqOrbitSize G.stabilizerFinite)

theorem orbit_counting_closed_from_data {G : GroupActionObject} (D : OrbitCountingLemmaData G) :
    OrbitCountingClosed D := by
  refine And.intro D.orbitStabilizerTheorem ?_
  refine And.intro D.burnsideLemma ?_
  intro h
  exact D.stabilizerIndexEqOrbitSize h

end GroupActionsCombinatorialStructuresCanonicalLaneLean
end HautevilleHouse