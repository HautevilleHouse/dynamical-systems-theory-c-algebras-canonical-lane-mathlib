import canonicalLaneMathlib.AdmissibleClass

/-!
# C*-Algebra Crossed Product Dynamics Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean

structure CStarCrossedProductDynamicsPackage where
  groupAction : Type u
  group : Type v
  cstarAlgebra : Type w
  crossedProduct : Type x
  actionIsContinuous : Prop
  crossedProductStructure : Prop
  dynamicsPreserving : Prop

structure CStarCrossedProductDynamicsEvidence
    (P : CStarCrossedProductDynamicsPackage) where
  actionIsContinuousClosed : P.actionIsContinuous
  crossedProductStructureClosed : P.crossedProductStructure
  dynamicsPreservingClosed : P.dynamicsPreserving

def CStarCrossedProductDynamicsClosed (P : CStarCrossedProductDynamicsPackage) : Prop :=
  P.actionIsContinuous ∧ P.crossedProductStructure ∧ P.dynamicsPreserving

theorem cstar_crossed_product_dynamics_closed_from_evidence
    (P : CStarCrossedProductDynamicsPackage)
    (E : CStarCrossedProductDynamicsEvidence P) :
    CStarCrossedProductDynamicsClosed P := by
  exact And.intro E.actionIsContinuousClosed
    (And.intro E.crossedProductStructureClosed E.dynamicsPreservingClosed)

end DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean
end HautevilleHouse