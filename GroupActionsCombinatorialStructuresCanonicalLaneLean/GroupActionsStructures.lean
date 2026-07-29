import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace GroupActionsCombinatorialStructuresCanonicalLaneLean

structure GroupActionStructure (G : Type u) (X : Type v) where
  action : G → X → X
  identityAction : ∀ x : X, action (1 : G) x = x
  compatibility : ∀ (g h : G) (x : X), action (g * h) x = action g (action h x)

def groupActionStructureClosed {G : Type u} {X : Type v} (A : GroupActionStructure G X) : Prop :=
  (∀ x : X, A.action (1 : G) x = x) ∧ (∀ (g h : G) (x : X), A.action (g * h) x = A.action g (A.action h x))

structure GroupActionStructureEvidence {G : Type u} {X : Type v} (A : GroupActionStructure G X) where
  identityActionClosed : ∀ x : X, A.action (1 : G) x = x
  compatibilityClosed : ∀ (g h : G) (x : X), A.action (g * h) x = A.action g (A.action h x)

theorem group_action_structure_closed_from_evidence
    {G : Type u} {X : Type v} (A : GroupActionStructure G X) (E : GroupActionStructureEvidence A) :
    groupActionStructureClosed A := by
  exact And.intro E.identityActionClosed E.compatibilityClosed

end GroupActionsCombinatorialStructuresCanonicalLaneLean
end HautevilleHouse
