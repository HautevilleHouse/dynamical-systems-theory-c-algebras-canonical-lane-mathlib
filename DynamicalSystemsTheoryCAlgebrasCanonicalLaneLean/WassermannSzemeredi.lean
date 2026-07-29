import canonicalLaneMathlib.AdmissibleClass

/-!
# Wassermann–Szemerédi Phenomenon Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean

structure WassermannSzemerediPackage where
  vonNeumannAlgebra : Type u
  automorphismGroup : Type v
  factorType : Prop
  subgroupGrowth : Prop
  entropyVanishes : Prop

structure WassermannSzemerediEvidence
    (P : WassermannSzemerediPackage) where
  factorTypeClosed : P.factorType
  subgroupGrowthClosed : P.subgroupGrowth
  entropyVanishesClosed : P.entropyVanishes

def WassermannSzemerediClosed (P : WassermannSzemerediPackage) : Prop :=
  P.factorType ∧ P.subgroupGrowth ∧ P.entropyVanishes

theorem wassermann_szemeredi_closed_from_evidence
    (P : WassermannSzemerediPackage)
    (E : WassermannSzemerediEvidence P) :
    WassermannSzemerediClosed P := by
  exact And.intro E.factorTypeClosed
    (And.intro E.subgroupGrowthClosed E.entropyVanishesClosed)

end DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean
end HautevilleHouse