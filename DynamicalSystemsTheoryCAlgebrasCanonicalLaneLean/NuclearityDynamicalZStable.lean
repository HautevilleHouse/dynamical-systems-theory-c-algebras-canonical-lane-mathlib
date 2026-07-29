import canonicalLaneMathlib.AdmissibleClass

/-!
# Nuclearity and Dynamical Z-Stability Package
-/

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean

structure NuclearityDynamicalZStablePackage where
  cstarAlgebra : Type u
  automorphism : Type v
  nuclear : Prop
  zStable : Prop
  dynamicalZStable : Prop
  equivalence : Prop

structure NuclearityDynamicalZStableEvidence
    (P : NuclearityDynamicalZStablePackage) where
  nuclearClosed : P.nuclear
  zStableClosed : P.zStable
  dynamicalZStableClosed : P.dynamicalZStable
  equivalenceClosed : P.equivalence

def NuclearityDynamicalZStableClosed
    (P : NuclearityDynamicalZStablePackage) : Prop :=
  P.nuclear ∧ P.zStable ∧ P.dynamicalZStable ∧ P.equivalence

theorem nuclearity_dynamical_zstable_closed_from_evidence
    (P : NuclearityDynamicalZStablePackage)
    (E : NuclearityDynamicalZStableEvidence P) :
    NuclearityDynamicalZStableClosed P := by
  exact And.intro E.nuclearClosed
    (And.intro E.zStableClosed
      (And.intro E.dynamicalZStableClosed E.equivalenceClosed))

end DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean
end HautevilleHouse