import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean

structure CStarAlgebraPackage where
  algebra : Type u
  norm : algebra → ℝ
  involution : algebra → algebra
  completeness : Prop
  cstarIdentity : Prop
  unit : algebra

structure CStarAlgebraEvidence (C : CStarAlgebraPackage) where
  completenessClosed : C.completeness
  cstarIdentityClosed : C.cstarIdentity

def CStarAlgebraClosed (C : CStarAlgebraPackage) : Prop :=
  C.completeness ∧ C.cstarIdentity

theorem cstar_algebra_closed_from_evidence (C : CStarAlgebraPackage) (E : CStarAlgebraEvidence C) : CStarAlgebraClosed C := by
  exact And.intro E.completenessClosed E.cstarIdentityClosed

end DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean
end HautevilleHouse