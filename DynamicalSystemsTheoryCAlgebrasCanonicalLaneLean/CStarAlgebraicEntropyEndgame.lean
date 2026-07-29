import canonicalLaneMathlib.AdmissibleClass
import DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean.TopologicalEntropyBridge
import DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean.KMSStateClassification
import DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean.PimsnerVoiculescuExactSequence

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean

def ConstrainedDynamicalClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_dynamical_endgame (A : AdmissibleClass) : ConstrainedDynamicalClosure A :=
  by
    exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean
end HautevilleHouse