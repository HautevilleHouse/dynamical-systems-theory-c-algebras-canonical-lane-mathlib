import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean

structure CStarDynamicalSystem where
  carrier : Type u
  algebra : CStarAlgebra carrier
  groupAction : GroupAction ℤ carrier
  crossedProduct : CStarAlgebra (ℤ × carrier)
  dynamicalEntropy : ℝ

structure CStarDynamicalSystemEvidence (A : CStarDynamicalSystem) where
  algebraClosed : A.algebra.isClosed
  groupActionClosed : A.groupAction.isContinuous
  crossedProductClosed : A.crossedProduct.isNuclear
  entropyComputed : A.dynamicalEntropy ≥ 0

def CStarDynamicalSystemClosed (A : CStarDynamicalSystem) : Prop :=
  A.algebra.isClosed ∧ A.groupAction.isContinuous ∧ A.crossedProduct.isNuclear ∧ A.dynamicalEntropy ≥ 0

theorem cstar_dynamical_system_closed_from_evidence (A : CStarDynamicalSystem) (E : CStarDynamicalSystemEvidence A) : CStarDynamicalSystemClosed A :=
  by
    exact And.intro E.algebraClosed (And.intro E.groupActionClosed (And.intro E.crossedProductClosed E.entropyComputed))

end DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean
end HautevilleHouse