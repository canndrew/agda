
{-# OPTIONS --copatterns #-}

open import Common.Size

record R (i : Size) : Set where
  inductive
  constructor delay
  field
    force : (j : Size< i) → R j
open R

inh : (i : Size) → R i
force (inh i) j = inh j

-- Should give termination error

data ⊥ : Set where

elim : R ∞ → ⊥
elim (delay f) = elim (f ∞)

-- Gives termination error, as expected.
