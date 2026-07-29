import canonicalLaneMathlib.AdmissibleClass

/-!
# KMS States and Equilibrium Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean

structure KMSStatesEquilibriumPackage where
  algebra : Type u
  timeEvolution : Type v
  inverseTemperature : ℝ
  kmsCondition : Prop
  equilibriumStates : Prop
  uniqueness : Prop

structure KMSStatesEquilibriumEvidence
    (P : KMSStatesEquilibriumPackage) where
  kmsConditionClosed : P.kmsCondition
  equilibriumStatesClosed : P.equilibriumStates
  uniquenessClosed : P.uniqueness

def KMSStatesEquilibriumClosed (P : KMSStatesEquilibriumPackage) : Prop :=
  P.kmsCondition ∧ P.equilibriumStates ∧ P.uniqueness

theorem kms_states_equilibrium_closed_from_evidence
    (P : KMSStatesEquilibriumPackage)
    (E : KMSStatesEquilibriumEvidence P) :
    KMSStatesEquilibriumClosed P := by
  exact And.intro E.kmsConditionClosed
    (And.intro E.equilibriumStatesClosed E.uniquenessClosed)

end DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean
end HautevilleHouse