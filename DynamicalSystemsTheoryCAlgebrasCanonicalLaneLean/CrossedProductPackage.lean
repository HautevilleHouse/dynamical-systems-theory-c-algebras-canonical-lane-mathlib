import DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean.CovariantSystemPackage

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean

structure CrossedProductPackage {D : DynamicalSystemPackage} {C : CStarAlgebraPackage} (S : CovariantSystemPackage D C) where
  crossedProductAlgebra : Type u
  norm : crossedProductAlgebra → ℝ
  productStructure : Prop
  completion : Prop

structure CrossedProductEvidence {D : DynamicalSystemPackage} {C : CStarAlgebraPackage} {S : CovariantSystemPackage D C} (P : CrossedProductPackage S) where
  productStructureClosed : P.productStructure
  completionClosed : P.completion

def CrossedProductClosed {D : DynamicalSystemPackage} {C : CStarAlgebraPackage} {S : CovariantSystemPackage D C} (P : CrossedProductPackage S) : Prop :=
  P.productStructure ∧ P.completion

theorem crossed_product_closed_from_evidence {D : DynamicalSystemPackage} {C : CStarAlgebraPackage} {S : CovariantSystemPackage D C} (P : CrossedProductPackage S) (E : CrossedProductEvidence P) : CrossedProductClosed P := by
  exact And.intro E.productStructureClosed E.completionClosed

end DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean
end HautevilleHouse