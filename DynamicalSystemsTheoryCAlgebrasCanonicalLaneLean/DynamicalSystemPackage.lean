import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean

structure DynamicalSystemPackage where
  stateSpace : Type u
  dynamics : Type v
  timeDomain : Type w
  flowMap : dynamics → timeDomain → stateSpace → stateSpace
  continuity : Prop
  groupAction : Prop

structure DynamicalSystemEvidence (D : DynamicalSystemPackage) where
  continuityClosed : D.continuity
  groupActionClosed : D.groupAction

def DynamicalSystemClosed (D : DynamicalSystemPackage) : Prop :=
  D.continuity ∧ D.groupAction

theorem dynamical_system_closed_from_evidence (D : DynamicalSystemPackage) (E : DynamicalSystemEvidence D) : DynamicalSystemClosed D := by
  exact And.intro E.continuityClosed E.groupActionClosed

end DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean
end HautevilleHouse