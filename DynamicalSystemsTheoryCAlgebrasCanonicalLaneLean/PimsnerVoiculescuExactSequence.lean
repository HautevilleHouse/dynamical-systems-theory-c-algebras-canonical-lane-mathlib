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

structure PimsnerVoiculescuExactSequencePackage {A : CStarDynamicalSystem} where
  mappingTorus : Type w
  toepAlgebra : Type x
  exactSequence : Prop
  sixTermExactSequence : Prop
  indexMap : Prop
  exponentialMap : Prop

structure PimsnerVoiculescuExactSequenceEvidence {A : CStarDynamicalSystem}
    (P : PimsnerVoiculescuExactSequencePackage A) where
  exactSequenceClosed : P.exactSequence
  sixTermExactSequenceClosed : P.sixTermExactSequence
  indexMapClosed : P.indexMap
  exponentialMapClosed : P.exponentialMap

def PimsnerVoiculescuExactSequenceClosed {A : CStarDynamicalSystem}
    (P : PimsnerVoiculescuExactSequencePackage A) : Prop :=
  P.exactSequence ∧ P.sixTermExactSequence ∧ P.indexMap ∧ P.exponentialMap

theorem pimsner_voiculescu_exact_sequence_closed_from_evidence
    {A : CStarDynamicalSystem} (P : PimsnerVoiculescuExactSequencePackage A)
    (E : PimsnerVoiculescuExactSequenceEvidence P) :
    PimsnerVoiculescuExactSequenceClosed P := by
  exact And.intro E.exactSequenceClosed
    (And.intro E.sixTermExactSequenceClosed
      (And.intro E.indexMapClosed E.exponentialMapClosed))

end DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean
end HautevilleHouse