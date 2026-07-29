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

structure CStarCrossedProductPackage (A : CStarDynamicalSystem) where
  crossedProductAlgebra : Type w
  crossedProductStructure : CStarRing crossedProductAlgebra
  universalProperty : Prop
  reducedVersion : Prop
  fullVersion : Prop
  nuclearity : Prop

structure CStarCrossedProductEvidence {A : CStarDynamicalSystem}
    (P : CStarCrossedProductPackage A) where
  universalPropertyClosed : P.universalProperty
  reducedVersionClosed : P.reducedVersion
  fullVersionClosed : P.fullVersion
  nuclearityClosed : P.nuclearity

def CStarCrossedProductClosed {A : CStarDynamicalSystem}
    (P : CStarCrossedProductPackage A) : Prop :=
  P.universalProperty ∧ P.reducedVersion ∧ P.fullVersion ∧ P.nuclearity

theorem cstar_crossed_product_closed_from_evidence
    {A : CStarDynamicalSystem} (P : CStarCrossedProductPackage A)
    (E : CStarCrossedProductEvidence P) : CStarCrossedProductClosed P := by
  exact And.intro E.universalPropertyClosed
    (And.intro E.reducedVersionClosed
      (And.intro E.fullVersionClosed E.nuclearityClosed))

end DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean
end HautevilleHouse