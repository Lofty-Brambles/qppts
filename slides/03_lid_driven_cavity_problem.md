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

# Lid-driven cavity flow

<!--
  Lid-driven cavity flow - Poiseuille equation
  Physics NN - Quantum Computing Applications - reduce input size
  =========================================================================
  Activation energy calculation - DFT
  =========================================================================
-->

---

# Base case geometry and boundary conditions

- A square cavity (WLOG, $A = [0,1] \times [0,1]$) filled with incompressible, laminar Newtonian fluid.
- Boundary conditions [assuming u, v are velocity components]:
    - Top wall: $u = U_0, v = 0$
    - Other walls: $u = v = 0$ (no-slip)
- Control Paremeters [Primary]:
    - Velocity, $U_0$
    - Reynolds number, $Re = \frac{U_0 D}{\nu}$
- Governing equations: Incompressible Navier-Stokes equations

$$
\frac{\partial \mathbf{u}}{\partial t} + (\mathbf{u} \cdot \nabla) \mathbf{u} = -\frac{1}{\rho} \nabla p + \nu \nabla^2 \mathbf{u}
$$

- What do we want? Steady-state velocity and pressure fields inside the cavity.

---

# Steam function and Vorticity

For incompressible 2D flow, we can define a stream function $\psi$ such that:
$$u = \frac{\partial \psi}{\partial y}, \quad v = -\frac{\partial \psi}{\partial x}$$
The vorticity $\omega$ is defined as:
$$\omega = \frac{\partial v}{\partial x} - \frac{\partial u}{\partial y}$$
Using these definitions, we can rewrite the Navier-Stokes equations in terms of $\psi$ and $\omega$:
$$\frac{\partial \omega}{\partial t} + u \frac{\partial \omega}{\partial x} + v \frac{\partial \omega}{\partial y} = \nu \nabla^2 \omega$$
$$\nabla^2 \psi = -\omega$$

---

# Traditional numerical methods (1)

Both methods rely on discretizing the domain into a grid and solving the governing equations.

- Liebmann's method
- Finite Difference Discretization

## Discretization

- Divide the cavity into a grid of points. Let $\phi_{i,j}$ represent the stream function at grid point $(i,j)$.
- To find the steam function, we substitute $\nabla^2 \psi$ with its finite difference approximation:
$$\frac{\partial^2 \psi}{\partial x^2} + \frac{\partial^2 \psi}{\partial y^2} \approx \frac{\psi_{i+1,j} - 2\psi_{i,j} + \psi_{i-1,j}}{\Delta x^2} + \frac{\psi_{i,j+1} - 2\psi_{i,j} + \psi_{i,j-1}}{\Delta y^2}$$
- This gives us the expression for the stream function at each grid point in terms of its neighbors.
$$\psi_{i,j} = \frac{1}{4} (\psi_{i+1,j} + \psi_{i-1,j} + \psi_{i,j+1} + \psi_{i,j-1} + h^2\omega_{i,j})$$
where $h = \Delta x = \Delta y$ is the grid spacing.

---

# Traditional numerical methods (2)

- Now that we have the expression for the stream function, we can also find the velocity components at each grid point using finite difference approximations:
$$u_{i,j} = \frac{\psi_{i,j+1} - \psi_{i,j-1}}{2\Delta y}, \quad v_{i,j} = -\frac{\psi_{i+1,j} - \psi_{i-1,j}}{2\Delta x}$$
- For the vorticity transport equation, we can use an explicit finite difference scheme to update the vorticity at each grid point.
$$\omega_{i,j}^{n+1} = \omega_{i,j}^n - \Delta t \left( u_{i,j}\frac{\partial \psi}{\partial x} + v_{i,j}\frac{\partial \psi}{\partial y} \right) + \nu\Delta t\nabla^2\omega_{i,j}$$
- We apply the boundary cnditions for the grid points on the walls of the cavity, and find these values iteratively until convergence.

---

# Using HHL (1)

- HHL has a few requirements:
  - The system of equations must be sparse.
  - The matrix must be swell-conditioned.
  - Matrix must be Hermitian, RHS must be quantum-encodable.
- The discretized equations for the lid-driven cavity problem can be represented as a sparse matrix equation.
- These matrices can be read by a sparse matrix oracle. (basically, a way to algorithmically access matrix elements from indices, given the sparsity) (might be faster than QRAM?)
$$
\begin{bmatrix}
-2 & 1 & 0 & 0\\
1 & -2 & 1 & 0\\
-2 & 1 & -2 & 1\\
0 & 0 & 1 & -2\\
\end{bmatrix} vs 
\ket{i,k} = \begin{cases}
{j = i - 1, A_{ij} = 1} & \text{if } k = 0\\
{j = i, A_{ij} = -2} & \text{if } k = 1\\
{j = i + 1, A_{ij} = 1} & \text{if } k = 2
\end{cases}
$$

---

# Using HHL (2)

- The right-hand side (RHS) of the equations can be encoded into a quantum state via normalisation.
- This yields us the equation for HHL, whose speed-up depends on the condition number (since a lot of sparsity is assured by the discretization itself).
$$A \ket{x} = \ket{b}$$
- This gives us the values of $\ket{x}$, which correspond to the stream function values at each grid point, with relative probabilities.
- The measurement gates for HHL can probably be optimized to give the velocity components directly as well.

---

# Using VQE (1)

- The space discretization bit remains the same as before. But here, we simplyfy the derivatives into a cost function, and optimize it using VQE.
- A VQE essentially consists of:
  - The Hamiltonian - we basically find the eigenvectors of the minimum eigenvalue of this Hamiltonian, after encoding our properties into it.
  - A cost function based on the Hamiltonian.
  - An ansatz (approach) circuit (quantum circuit)
  - A classical optimizer to minimize the cost function.
- We can directly encode the 2D grid into qubits. For an N x N grid, we can take $\log_2(N^2) = 2\log_2(N)$ qubits, since:
  - Each qubit can represent 2 states (0 and 1).
  - With k qubits, we can represent $2^k$ states.
  - So, with $2\log_2(N)$ qubits, we can represent $N^2$ states (grid points).

---

# Using VQE (2)

- Thus each grid element becomes encoded into:
$$\ket{u(\theta)} = \sum_{i=0}^{N_x-1} \sum_{j=0}^{N_y-1} u_{i,j}(\theta) \ket{i}_x \ket{j}_y$$
- The Hamiltonian can be constructed from the values in this 2D grid, getting the stream function coefficients at each grid point.
- The cost function can be defined as the sum of squared residuals of the discretized Navier-Stokes equations at each grid point.
$$C(\theta) = \sum_{i,j} \left( NSE_{i,j}(\theta) \right)^2$$
- A suitable ansatz circuit needs to be found.

---

# Summary of comparisons

| FDS Approach                     | HHL Approach                          | VQE Approach                         |
|----------------------------------|--------------------------------------|-------------------------------------|
| Classically solves the discretized PDEs | Quantum linear system solving from discretization | Optimizes cost function from discretization |
| Deterministic convergence        | Probabilistic, depends on sparsity and condition number | Probabilistic, depends on ansatz and optimizer |
| $O(n^2)$ space for N x N grid       | $O(k log^3(k) log(N))$ qubits for N x N grid   | Dependent on implementation  |

---
transition: slide-left
layout: table-of-contents
---

# Table of contents

---

# References

- Detailed [FSD](https://www.youtube.com/watch?v=Gd53_TdkmSU) and [Liebmann's method](https://www.youtube.com/watch?v=fKGhVCWJ4jg) to solve a generic elliptic PDE
- [Lid-driven cavity flow - using a multi grid method - data](http://www.msaidi.ir/upload/Ghia1982.pdf?i=1)
- [*Using* HHL to solve for Hele-Shaw flow](https://arxiv.org/html/2409.10857v1)
- [*Enhanced* HHL to negate the effects of high carditinality](https://arxiv.org/html/2404.10103v3)
- [Resources on VQE - fundamentals](https://quantum.cloud.ibm.com/learning/en/courses/quantum-diagonalization-algorithms/vqe)
- [Collection of algorithms to look up for use](https://quantumalgorithmzoo.org)