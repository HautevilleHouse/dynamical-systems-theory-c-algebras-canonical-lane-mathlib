import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean

structure DynamicalSystemObject where
  carrier : Type u
  algebra : Type v
  automorphism : Type w
  invariantStates : Prop
  entropyProperties : Prop
  cstarConditions : Prop
  conclusion : cstarConditions

structure AdmissibleClass where
  object : DynamicalSystemObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.conclusion ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean
end HautevilleHouse