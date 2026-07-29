import canonicalLaneMathlib.AdmissibleClass

/-!
# Kishimoto–Rohlin Type Theorem for Automorphisms Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean

structure KishimotoRohlinPackage where
  cstarAlgebra : Type u
  automorphism : Type v
  rohlinProperty : Prop
  strongOuterness : Prop
  approximateConjugacy : Prop

structure KishimotoRohlinEvidence
    (P : KishimotoRohlinPackage) where
  rohlinPropertyClosed : P.rohlinProperty
  strongOuternessClosed : P.strongOuterness
  approximateConjugacyClosed : P.approximateConjugacy

def KishimotoRohlinClosed (P : KishimotoRohlinPackage) : Prop :=
  P.rohlinProperty ∧ P.strongOuterness ∧ P.approximateConjugacy

theorem kishimoto_rohlin_closed_from_evidence
    (P : KishimotoRohlinPackage)
    (E : KishimotoRohlinEvidence P) :
    KishimotoRohlinClosed P := by
  exact And.intro E.rohlinPropertyClosed
    (And.intro E.strongOuternessClosed E.approximateConjugacyClosed)

end DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean
end HautevilleHouse