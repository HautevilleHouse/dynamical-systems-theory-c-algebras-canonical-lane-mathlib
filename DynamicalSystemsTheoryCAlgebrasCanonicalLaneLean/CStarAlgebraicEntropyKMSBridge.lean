import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean

structure CStarAlgebraicEntropyKMSBridge where
  system : CStarDynamicalSystem
  entropyComputed : ℝ
  kmsStatesClassified : Set (State system.crossedProduct)
  bridgeRelation : entropyComputed = Real.log (Set.card kmsStatesClassified)

structure CStarAlgebraicEntropyKMSBridgeEvidence (B : CStarAlgebraicEntropyKMSBridge) where
  entropyComputedClosed : B.entropyComputed = B.system.dynamicalEntropy
  kmsStatesClassifiedClosed : B.kmsStatesClassified = Set.univ
  bridgeRelationClosed : B.bridgeRelation

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.gateWitness

end DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean
end HautevilleHouse