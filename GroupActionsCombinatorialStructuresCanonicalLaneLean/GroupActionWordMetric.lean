import GroupActionsCombinatorialStructuresCanonicalLaneLean.CayleyGraphStructure

namespace HautevilleHouse
namespace GroupActionsCombinatorialStructuresCanonicalLaneLean

structure WordMetricPackage {G : GroupActionObject} (C : CayleyGraphPackage G) where
  wordLength : G.group → ℕ
  distanceFun : G.group → G.group → ℕ
  leftInvariant : ∀ g h k : G.group, distanceFun (G.action g h) (G.action g k) = distanceFun h k
  geodesicProperty : Prop

structure WordMetricEvidence {G : GroupActionObject} {C : CayleyGraphPackage G}
    (W : WordMetricPackage C) where
  leftInvariantClosed : W.leftInvariant
  geodesicPropertyClosed : W.geodesicProperty

def WordMetricClosed {G : GroupActionObject} {C : CayleyGraphPackage G}
    (W : WordMetricPackage C) : Prop := W.leftInvariant ∧ W.geodesicProperty

theorem word_metric_closed_from_evidence {G : GroupActionObject} {C : CayleyGraphPackage G}
    (W : WordMetricPackage C) (E : WordMetricEvidence W) : WordMetricClosed W := by
  exact And.intro E.leftInvariantClosed E.geodesicPropertyClosed

end GroupActionsCombinatorialStructuresCanonicalLaneLean
end HautevilleHouse