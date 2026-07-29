import DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean

structure DSSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure DSAdmittedObject where
  space : DSSpace
  dynamicalSystem : Prop
  cStarAlgebra : Prop
  spectrumCondition : Prop
  conclusion : spectrumCondition

def DSWitnessClosed (O : DSAdmittedObject) : Prop :=
  O.spectrumCondition

end DynamicalSystemsTheoryCAlgebrasCanonicalLaneLean
end HautevilleHouse