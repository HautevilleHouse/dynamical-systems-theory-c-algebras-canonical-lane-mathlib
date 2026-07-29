import canonicalLaneMathlib.AdmissibleClass

/-!
# Topological Entropy for C*-Dynamical Systems Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean

structure TopologicalEntropyCStarPackage where
  automorphism : Type u
  cstarAlgebra : Type v
  entropyFunction : Type w
  entropyDefined : Prop
  variationalPrinciple : Prop
  positivity : Prop

structure TopologicalEntropyCStarEvidence
    (P : TopologicalEntropyCStarPackage) where
  entropyDefinedClosed : P.entropyDefined
  variationalPrincipleClosed : P.variationalPrinciple
  positivityClosed : P.positivity

def TopologicalEntropyCStarClosed (P : TopologicalEntropyCStarPackage) : Prop :=
  P.entropyDefined ∧ P.variationalPrinciple ∧ P.positivity

theorem topological_entropy_cstar_closed_from_evidence
    (P : TopologicalEntropyCStarPackage)
    (E : TopologicalEntropyCStarEvidence P) :
    TopologicalEntropyCStarClosed P := by
  exact And.intro E.entropyDefinedClosed
    (And.intro E.variationalPrincipleClosed E.positivityClosed)

end DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean
end HautevilleHouse