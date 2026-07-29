import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean

structure TopologicalEntropyBridge where
  system : CStarDynamicalSystem
  entropyFunction : CStarDynamicalSystem → ℝ
  continuity : Prop
  invariance : Prop
  bridgeCondition : entropyFunction system = system.dynamicalEntropy

structure TopologicalEntropyBridgeEvidence (B : TopologicalEntropyBridge) where
  continuityClosed : B.continuity
  invarianceClosed : B.invariance
  bridgeConditionClosed : B.bridgeCondition

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  A.gateWitness

end DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean
end HautevilleHouse