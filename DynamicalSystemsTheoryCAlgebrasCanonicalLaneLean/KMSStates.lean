import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean

structure CStarDynamicalSystem where
  algebra : Type u
  algebraStructure : CStarRing algebra
  group : Type v
  groupStructure : Group group
  action : group → algebra → algebra
  actionContinuous : ∀ g : group, Continuous (action g)
  actionMultiplicative : ∀ g : group, ∀ a b : algebra, action g (a * b) = action g a * action g b
  invariantStates : Set (algebra → ℂ)

structure KMSStatesPackage {A : CStarDynamicalSystem} (β : ℝ) where
  timeEvolution : ℝ → A.algebra → A.algebra
  analyticContinuation : Prop
  kmsCondition : Prop
  groundStates : Prop
  equilibriumStates : Prop
  phaseTransition : Prop

structure KMSStatesEvidence {A : CStarDynamicalSystem} {β : ℝ}
    (P : KMSStatesPackage A β) where
  analyticContinuationClosed : P.analyticContinuation
  kmsConditionClosed : P.kmsCondition
  groundStatesClosed : P.groundStates
  equilibriumStatesClosed : P.equilibriumStates
  phaseTransitionClosed : P.phaseTransition

def KMSStatesClosed {A : CStarDynamicalSystem} {β : ℝ}
    (P : KMSStatesPackage A β) : Prop :=
  P.analyticContinuation ∧ P.kmsCondition ∧ P.groundStates ∧ P.equilibriumStates ∧ P.phaseTransition

theorem kms_states_closed_from_evidence
    {A : CStarDynamicalSystem} {β : ℝ} (P : KMSStatesPackage A β)
    (E : KMSStatesEvidence P) : KMSStatesClosed P := by
  exact And.intro E.analyticContinuationClosed
    (And.intro E.kmsConditionClosed
      (And.intro E.groundStatesClosed
        (And.intro E.equilibriumStatesClosed E.phaseTransitionClosed)))

end DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean
end HautevilleHouse