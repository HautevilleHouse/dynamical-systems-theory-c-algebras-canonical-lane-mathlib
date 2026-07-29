import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean

structure CrossedProduct {D : CStarDynamicalSystem} where
  group : Type u
  groupAction : group → D.A → D.A
  crossedProductAlgebra : Type v
  norm : crossedProductAlgebra → ℝ
  mul : crossedProductAlgebra → crossedProductAlgebra → crossedProductAlgebra
  star : crossedProductAlgebra → crossedProductAlgebra
  one : crossedProductAlgebra
  normedAlgebra : NormedAlgebra ℝ crossedProductAlgebra
  CStarNorm : ∀ x : crossedProductAlgebra, ‖star x * x‖ = ‖x‖^2

theorem crossedProductClosed {D : CStarDynamicalSystem} (C : CrossedProduct D) :
  ∀ x : C.crossedProductAlgebra, ‖C.star x * x‖ = ‖x‖^2 := by
  intro x
  exact C.CStarNorm x

end DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean
end HautevilleHouse