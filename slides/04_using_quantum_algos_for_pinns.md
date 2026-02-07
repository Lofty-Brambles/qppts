---
theme: academic
layout: cover
title: Quantum operations
drawings:
    persist: true
transition: slide-left
mdc: true
coverAuthor: Prantik
---

# Applications of Quantum Neural Networks in Fluid Dynamics

---

# QNNs in multiple ways

We have a standard problem (usually a PDE) and a standard PINN to help predict solutions. It embeds known physics to modulate the loss function and guide the training process.

Here we can integrate quantum computing in a few ways:
- A Hybrid quantum-classical neural network method
- Using Continuous Variable Quantum Neural Networks (CVQNN) emulate classical neural networks (same thing, but uses a lot more of continuous variable algorithms)

---

# Using a PINN on a quantum computer

Quantum PINN solvers are fundamentally variational quantum circuit solvers with an additional classical residual network to provide a cost function for the optimization step.

\section*{Core Definition}

A Variational Quantum Algorithm (VQA) solves an optimization problem of the form
$$
\min_{\boldsymbol{\theta}} \; C(\boldsymbol{\theta})
= \langle \psi(\boldsymbol{\theta}) | \hat{H} | \psi(\boldsymbol{\theta}) \rangle ,
$$
where
$$
|\psi(\boldsymbol{\theta})\rangle = U(\boldsymbol{\theta}) |0\rangle .
$$

Here, $U(\boldsymbol{\theta})$ is a parameterized quantum circuit,
$\boldsymbol{\theta}$ are classical variational parameters, and
$\hat{H}$ is an observable defining the cost function.

We keep repeating till the value of quantum state converges.

- https://www.frontiersin.org/journals/applied-mathematics-and-statistics/articles/10.3389/fams.2022.1036711/full

---

# Hybrid QPINN method

In this method we simply have a generic PINN that is being fed the same user input through the input layer and intermediate classical layers. However, a quantum layer is added before the output layer, anywhere in the network.

This provides a speed up in the more expensive part of the network, while the inputs may be modified by the classical layers to be more friendly to loading.

Another method adds a Multiplative or Additive Coupling. (Look into this @ https://arxiv.org/pdf/2511.07216)

- https://arxiv.org/pdf/2511.07216

---

# Continuous Variable Quantum Neural Networks (CVQNN)

Any continuous variable has a conjugate which is yet another continuous variable. In the case of the coordinate $x$ the conjugate quantity is the x component of momentum $p_x$ (Take the Heisenberg uncertainty principle). Overall, the term continuous variable is loosely used to refer to a physical quantity that can accept any value in an interval - in contrast to discrete variables which can accept only distinct values.

Instead of dealing with discrete qubits, CVQNNs operate on continuous variables. This allows them to naturally represent and process continuous data.

This has advantages. Mainly, it allows for easier storing of information, like the residuals of a PDE - which are continuous here.

- https://arxiv.org/pdf/2107.02151

---

# Uses on multi-variable PDEs

Multiple problems like 1D Poisson's equation, Helmholtz equation, and Navier-Stokes (say as in the lid driven cavity problem) have already been explored using qPINNs.

- https://arxiv.org/html/2503.12244v2#S5
- https://arxiv.org/html/2503.16678v1#S6

---
transition: slide-left
layout: table-of-contents
---

# Table of contents

---

# More References

- Variational Quantum Algorithms for Solving Partial Differential Equations: https://dojo.qulacs.org/en/latest/notebooks/5.1_variational_quantum_eigensolver.html
- "Hybrid" PINNs: https://lofty-brambles.github.io/qppts/Quantum_Physics-Informed_Neural_Networks.pdf

