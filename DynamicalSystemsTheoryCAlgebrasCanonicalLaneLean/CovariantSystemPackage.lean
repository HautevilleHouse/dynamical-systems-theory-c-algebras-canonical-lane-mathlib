import DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean.DynamicalSystemPackage
import DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean.CStarAlgebraPackage

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean

structure CovariantSystemPackage (D : DynamicalSystemPackage) (C : CStarAlgebraPackage) where
  representation : D.dynamics → C.algebra → C.algebra
  covarianceCondition : Prop
  continuity : Prop

structure CovariantSystemEvidence {D : DynamicalSystemPackage} {C : CStarAlgebraPackage} (S : CovariantSystemPackage D C) where
  covarianceConditionClosed : S.covarianceCondition
  continuityClosed : S.continuity

def CovariantSystemClosed {D : DynamicalSystemPackage} {C : CStarAlgebraPackage} (S : CovariantSystemPackage D C) : Prop :=
  S.covarianceCondition ∧ S.continuity

theorem covariant_system_closed_from_evidence {D : DynamicalSystemPackage} {C : CStarAlgebraPackage} (S : CovariantSystemPackage D C) (E : CovariantSystemEvidence S) : CovariantSystemClosed S := by
  exact And.intro E.covarianceConditionClosed E.continuityClosed

end DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean
end HautevilleHouse