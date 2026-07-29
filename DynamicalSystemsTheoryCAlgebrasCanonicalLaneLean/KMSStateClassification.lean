import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean

structure KMSStateClassification where
  system : CStarDynamicalSystem
  inverseTemperature : ℝ
  kmsStates : Set (State system.crossedProduct)
  simplexStructure : Prop
  extremalDecomposition : Prop
  phaseTransition : Prop

structure KMSStateEvidence (K : KMSStateClassification) where
  simplexClosed : K.simplexStructure
  extremalDecompositionClosed : K.extremalDecomposition
  phaseTransitionClosed : K.phaseTransition

def KMSStateClosed (K : KMSStateClassification) : Prop :=
  K.simplexStructure ∧ K.extremalDecomposition ∧ K.phaseTransition

theorem kms_state_closed_from_evidence (K : KMSStateClassification) (E : KMSStateEvidence K) : KMSStateClosed K :=
  by
    exact And.intro E.simplexClosed (And.intro E.extremalDecompositionClosed E.phaseTransitionClosed)

end DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean
end HautevilleHouse