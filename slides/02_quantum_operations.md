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

# Quantum Operations

---

# Notations and Preliminaries

- A qubit can be written as a complex vector in 2D space, as: $\ket{\psi} = \begin{pmatrix} \alpha \\ \beta \end{pmatrix} = \alpha \ket{0} + \beta \ket{1}$ where $|\alpha|^2 + |\beta|^2 = 1$. $\ket{\alpha}$ and $\ket{\beta}$ are called complex probability amplitudes. This is also called the bra-ket notation. The $\bra{\psi}$ is the conjugate transpose of $\ket{\psi}$.

- When a measurement is done, the qubit collapses to either $\ket{0}$ or $\ket{1}$ with probabilities $|\alpha|^2$ and $|\beta|^2$ respectively. This is the function of the measurement gate.

- Quantum operations have two properties: linearity and unitarity. They are basically reversible linear transformations of the state vectors called qubits.

- Hermitian conjugate of a matrix is obtained by taking the transpose and then taking the complex conjugate of each element.

- A matrix $U$ is unitary if $U^{\dagger} U = U U^{\dagger} = I$ where $U^{\dagger}$ is the Hermitian conjugate of $U$ and $I$ is the identity matrix.

---
transition: slide-left
layout: figure-side
figureUrl: /02_quantum_operations/blochs_sphere.png
---

# Bloch's Sphere & Matrix Representation

The Bloch sphere is a geometrical representation of a qubit. Any point on the surface can be described by the angles $\theta$ and $\phi$:

$$
\ket{\psi} = \cos\left(\frac{\theta}{2}\right)\ket{0} + e^{i\phi}\sin\left(\frac{\theta}{2}\right)\ket{1}
$$

The braket representation of a qubit $\ket{\psi} = \alpha\ket{0} + \beta\ket{1}$ can be represented in the form of a Bloch vector:

$$
\vec{r} = \begin{pmatrix} x \\ y \\ z \end{pmatrix} =
\begin{pmatrix} 2\text{Re}(\alpha\beta^*) \\ 2\text{Im}(\alpha\beta^*) \\ |\alpha|^2 - |\beta|^2 \end{pmatrix} =
\begin{pmatrix} \sin\theta \cos\phi \\ \sin\theta \sin\phi \\ \cos\theta \end{pmatrix}
$$

---

# One-qubit Operations: Pauli's Operators

$$
I = \begin{pmatrix} 1 & 0 \\ 0 & 1 \end{pmatrix} \quad X = \begin{pmatrix} 0 & 1 \\ 1 & 0 \end{pmatrix} \quad Y = \begin{pmatrix} 0 & -i \\ i & 0 \end{pmatrix} \quad Z = \begin{pmatrix} 1 & 0 \\ 0 & -1 \end{pmatrix}
$$

As some of the most known one-qubit quantum operations, these are a good first example. Gates can be visualized as operations on the Bloch sphere.

For example, the X gate represents a rotation of $\pi$ radians around the X-axis, effectively flipping the qubit state between $\ket{0}$ and $\ket{1}$. It acts similar to the classical NOT gate.

The Z gate flips the phase of the $\ket{1}$ state, leaving the $\ket{0}$ state unchanged. It represents a rotation of $\pi$ radians around the Z-axis.

The Y gate combines both bit and phase flips, representing a rotation of $\pi$ radians around the Y-axis.

$$
X\ket{0} = \ket{1} \quad X\ket{1} = \ket{0} \\
Z\ket{0} = \ket{0} \quad Z\ket{1} = -\ket{1} \\
Y\ket{0} = i\ket{1} \quad Y\ket{1} = -i\ket{0}
$$

---

# Inner Product and Outer Product

- The inner product of two qubits $\ket{\psi_1} = \begin{pmatrix} \alpha_1 \\ \beta_1 \end{pmatrix}$ and $\ket{\psi_2} = \begin{pmatrix} \alpha_2 \\ \beta_2 \end{pmatrix}$ is defined as:
    $$
    \langle \psi_1 | \psi_2 \rangle = \alpha_1^* \alpha_2 + \beta_1^* \beta_2
    $$

- The outer product of two qubits is defined as:
    $$
    \ket{\psi_1} \bra{\psi_2} = \begin{pmatrix} \alpha_1 \\ \beta_1 \end{pmatrix} \begin{pmatrix} \alpha_2^* & \beta_2^* \end{pmatrix} = \begin{pmatrix} \alpha_1 \alpha_2^* & \alpha_1 \beta_2^* \\ \beta_1 \alpha_2^* & \beta_1 \beta_2^* \end{pmatrix}
    $$

- Thus we can represent scalar outputs using inner products and matrix outputs using outer products. Thus we can represent the Pauli's operators as outer products as well, for an example:
    $$
    I = \ket{0}\bra{0} + \ket{1}\bra{1} \\
    X = \ket{0}\bra{1} + \ket{1}\bra{0} \\
    Y = i\ket{1}\bra{0} - i\ket{0}\bra{1} \\
    Z = \ket{0}\bra{0} - \ket{1}\bra{1}
    $$

---

# The Hadamard Gate

The Hadamard gate is another important one-qubit quantum operation represented by the matrix:

$$
H = \frac{1}{\sqrt{2}} \begin{pmatrix} 1 & 1 \\ 1 & -1 \end{pmatrix}
$$

The Hadamard gate creates superposition states from basis states. It transforms the basis states as follows:

$$
H\ket{0} = \frac{1}{\sqrt{2}}(\ket{0} + \ket{1}) \\
H\ket{1} = \frac{1}{\sqrt{2}}(\ket{0} - \ket{1})
$$

The Hadamard gate is also basically a rotation of $\pi$ radians around the axis $\frac{1}{\sqrt{2}}(\hat{X}+\hat{Z})$ over the Bloch's sphere.

---

# Multiple qubits

If a state is composed of multiple qubits, the overall state can be represented using the tensor product of the individual qubit states. Overall, n qubits can be represented as a vector in a $2^n$ dimensional complex vector space.

$$
\ket{\psi} = c_00...0\ket{00...0} + c_00...1\ket{00...1} + ... + c_11...1\ket{11...1} =
\begin{pmatrix} c_00...0 \\ c_00...1 \\ ... \\ c_11...1 \end{pmatrix}
$$

Yet another tool is the tensor product of multiple qubits. It gives us the composed state from multiple individual qubits. For example, the tensor product of two qubits $\ket{\psi_1}$ and $\ket{\psi_2}$ is defined as:

$$
\ket{\psi_1} \otimes \ket{\psi_2} = \begin{pmatrix} \alpha_1 \\ \beta_1 \end{pmatrix} \otimes \begin{pmatrix} \alpha_2 \\ \beta_2 \end{pmatrix} = \begin{pmatrix} \alpha_1\alpha_2 \\ \alpha_1\beta_2 \\ \beta_1\alpha_2 \\ \beta_1\beta_2 \end{pmatrix}
$$

---

# CNOT Gate and SWAP Gate

- The C-NOT gate is a two-qubit gate. It flips one of the qubits (target) if the other is $\ket{1}$ and doesn't if the other is $\ket{0}$. The control can be either the first or the second.
    $$
    \text{CNOT}_{1\to2} = \begin{pmatrix} 1 & 0 & 0 & 0 \\ 0 & 1 & 0 & 0 \\ 0 & 0 & 0 & 1 \\ 0 & 0 & 1 & 0 \end{pmatrix} \quad
    \text{CNOT}_{2\to1} = \begin{pmatrix} 1 & 0 & 0 & 0 \\ 0 & 0 & 0 & 1 \\ 0 & 0 & 1 & 0 \\ 0 & 1 & 0 & 0 \end{pmatrix}
    $$

- The SWAP gate swaps the states of two qubits. How is this done? Say $@$ denote the operation of addition modulo 2. Then the C-NOT gate essentially does the following:
    $$
    \ket{ab} \to \ket{a~~a @ b}
    $$

    Hence, applying successive C-NOT gates, with interchanged control and target, we get:

    $$
    \ket{a~~b} \to \ket{a~~(a @ b)}  \to \ket{(a @ (a @ b))~~(a @ b)} \to \ket{b~~(a@b)} \to \ket{b~~a}
    $$

    as this operation is associative. Thus $SWAP = CNOT_{1\to2} \cdot CNOT_{2\to1} \cdot CNOT_{1\to2}$.

---

# Toffoli Gate

The Toffoli gate, also known as the CCNOT gate, is a three-qubit gate that flips the state of the third qubit (target) if the first two qubits (controls) are both in the state $\ket{1}$. If either of the control qubits is in the state $\ket{0}$, the target qubit remains unchanged.

# Universal Quantum Gates

A set of quantum gates is considered universal if any quantum operation can be expressed with those gates. From the gates thus far, we have the set $\{ H, T, CNOT \}$ as a universal set. Why?

[Solovay-Kitaev algorithm](https://en.wikipedia.org/wiki/Solovay%E2%80%93Kitaev_theorem) states that any single qubit unitary operation can be approximated to a set of finite gates, like $\{ H, T \}$. Any n-qubit unitary operation can be decomposed into a product of several 2-level unitary operations (powers of 2 number of qubits). These 2-level operations can be made from a controlled-U gate and Toffoli's gate, which in turn can be made from CNOT and single qubit gates.

---
transition: slide-left
layout: figure-side
figureUrl: /02_quantum_operations/example_circuit.png
---
# Quantum Circuit Diagrams

The left to right shows the progression of qubits/bits over time. Each horizontal line represents one, and initialized with $\ket{0}$ or $0$. 

Quantum gates are represented by boxes and vertical lines. Single qubit gates are boxes on a single line, while multi-qubit gates have vertical lines connecting the involved qubits.

A meter-like symbol mapping a qubit to a classical bit represents measurement, collapsing the qubit state to either $\ket{0}$ or $\ket{1}$.

So the circuit to the left represents:

$$
\Lambda{(X)}_{1,2}H{(1)}\ket{00}
$$

---
transition: slide-left
layout: table-of-contents
---

# Table of contents

---

# References

1. [Quantum Computation and Quantum Information](https://profmcruz.wordpress.com/wp-content/uploads/2017/08/quantum-computation-and-quantum-information-nielsen-chuang.pdf)
1. [Bra-ket Notation](https://en.wikipedia.org/wiki/Bra%E2%80%93ket_notation)
1. [Quantum Gates](https://en.wikipedia.org/wiki/Quantum_gate)
1. [Quantum Algorithm Zoo](https://quantumalgorithmzoo.org/)
