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

structure TopologicalEntropyPackage {A : CStarDynamicalSystem} where
  entropyDef : Prop
  variationalPrinciple : Prop
  subadditivity : Prop
  upperSemicontinuity : Prop
  independenceFromGenerator : Prop

structure TopologicalEntropyEvidence {A : CStarDynamicalSystem}
    (P : TopologicalEntropyPackage A) where
  entropyDefClosed : P.entropyDef
  variationalPrincipleClosed : P.variationalPrinciple
  subadditivityClosed : P.subadditivity
  upperSemicontinuityClosed : P.upperSemicontinuity
  independenceFromGeneratorClosed : P.independenceFromGenerator

def TopologicalEntropyClosed {A : CStarDynamicalSystem}
    (P : TopologicalEntropyPackage A) : Prop :=
  P.entropyDef ∧ P.variationalPrinciple ∧ P.subadditivity ∧ P.upperSemicontinuity ∧ P.independenceFromGenerator

theorem topological_entropy_closed_from_evidence
    {A : CStarDynamicalSystem} (P : TopologicalEntropyPackage A)
    (E : TopologicalEntropyEvidence P) : TopologicalEntropyClosed P := by
  exact And.intro E.entropyDefClosed
    (And.intro E.variationalPrincipleClosed
      (And.intro E.subadditivityClosed
        (And.intro E.upperSemicontinuityClosed E.independenceFromGeneratorClosed)))

end DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean
end HautevilleHouse