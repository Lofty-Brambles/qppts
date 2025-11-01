---
theme: academic
layout: cover
title: What is Quantum Computing, essentially?
drawings:
    persist: true
transition: slide-left
mdc: true
coverAuthor: Prantik
---

# What is Quantum Computing, essentially?

---
transition: slide-left
---

# The Prerequisites

1.  ### Qubits

    Classically, we use **bits**. Now, we use ***qu*bits**. Unlike bits with 0 and 1s, qubits can store either and be in superposition.

1.  ### Superposition

    With the help of agents like microwave pulses, qubits exists in both states till infered. This state allows for simultaneous calculations via parallelism (since every state is operated on at once).<sup>1</sup>

1.  ### Entanglement

    Qubits can interlink with others' states allowing faster computation without space concerns.

1.  ### Quantum Interference<sup>2</sup>
    Essentially the usage of wave-like interference of probabilities from superimposed paths to propagate desired paths for refining results of algorithms from output states.

<Footnotes>
    <Footnote :number="1">Why force unitary (thus invertible) operations? (inner product preservation?)</Footnote>
    <Footnote :number="2">Decoherence is a problem - deal if only it comes up it?</Footnote>
</Footnotes>

---
transiton: slide-left
---

# The Definition

Quantum computing, in principle, leverages the parallel processing power of superposition and coordination of entaglement to outperform calculations of classical computers, provided a few restrictions on the type if operations.

Two key things to consider when under applications of it would be:

1. ### Lack of worry about dimensionality

    Classical practices worry about dimensions and have to apply dimensionality reduction to negoatiate a lack of computing power. However, parallelism enables a vast output space, so more accurate and quicker results can be obtained.

1. ### Parallel updates to space
    Every gridpoint can be iteratively updated with data - which can be found on every timestep on a dynamic problem. Streaming operations can speed up analysis of data at miniscule intervals.

---
transition: slide-left
---

# Quantum Gates

Since quantum operations need to be unitary, gates that lose state like AND or OR become unusable. However, take the NOT gate for example:

$$
\begin{aligned}
\text{Take general state, } \ket{\psi} = \alpha\ket{0} + \beta\ket{1}
\end{aligned} \\
\begin{aligned}
U_{NOT}\ket{\psi} = \begin{pmatrix} 0 & 1 \\ 1 & 0 \end{pmatrix}
                    \begin{pmatrix} \alpha \\ \beta \end{pmatrix} =
                    \begin{pmatrix} \beta \\ \alpha \end{pmatrix} =
                    \alpha\ket{1} + \beta\ket{0}
\end{aligned} \\
\begin{aligned}
UU^\intercal = \begin{pmatrix} 1 & 0 \\ 0 & 1 \end{pmatrix} = I
\end{aligned}
$$

Similarly, multiple such gates of operations can be crafted, with multiple qubits, like the XNOR or SWAP gates. Yet another notable mention is the Toffoli's gate - a 3-qubit gate that provides behaviour similar to the classical AND gate, while storing the output state in the third qubit, making the whole process invertible.

Also of note is the Hadamard gate - a single qubit gate that turns a read, singular state into a superposition for operation.

---
transition: slide-left
---

# In Implementation

These gates come together to implement quantum circuits. Building on top of these gates gives us the models of computation to implement various algorithms. At a higher level, we use these gates and circuits in our software. There are two questions here: about service providers, and SDKs.

| Framework | Paradigm            | Hardware             | Limitations               | Use-case            |
| --------- | ------------------- | -------------------- | ------------------------- | ------------------- |
| Qiskit    | OO-Pythonic         | IBM Hardware         | Vendor-locking            | Hardware prototying |
| Cirq      | Procedural-Pythonic | [Google Sycamore]    | Small low-level community | NISQ                |
| Q#        | Own-.NET like       | Microsoft Azure      | Full language             | Hybrid approaches   |
| Quipper   | Functional-Haskell  | University of Oxford | Bad support               | Compiers, CT        |

---
transition: slide-left
---

# Services provided

Of all the service providers, a few narrowed down, provide popular services. Honourable mentions include [Google Quantum AI](https://quantumai.google/cirq) and D-Wave<sup>1</sup>

| Company                     | Student / Academic Plan                                                                                                            | Key Use Cases                                                   | Core Features                                                        |
| --------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------- | -------------------------------------------------------------------- |
| **IBM Quantum**             | [IBM Quantum Learning](https://quantum.ibm.com/learning): Qiskit, free simulators, and classroom modules.                          | Algorithm prototyping, quantum chemistry, CFD.                  | 20+ quantum systems • Qiskit Runtime APIs • Costing variety          |
| **Amazon Braket (AWS)**     | [AWS Braket for Education](https://aws.amazon.com/braket/quantum-computing-research/): Credits for students & educators.           | Hybrid CFD modeling, supply optimization, AI-driven simulation. | Hybrid EC2 services • Pay-per-use sandboxes • Multi-hardware access. |
| **Microsoft Azure Quantum** | [Azure Quantum for Educators](https://azure.microsoft.com/en-us/solutions/quantum-computing/educators/): credits & Q# integration. | Optimization, hybrid solvers, quantum algorithm learning.       | Hardware-agnostic QDK • Does academic partnerships.                  |

<Footnotes>
    <Footnote :number="1">Look into Quantum annealing and if its use of optimisation helps</Footnote>
</Footnotes>

---
transition: slide-left
layout: figure-side
figureUrl: /final_stack.png
---

# Overall Decisions

- Of all the SDKs provided, Qiskit stands out for it's community support. Being integrated into python also helps over Q#, which is a separate DSL itself.

- As for services, there's IBM which leads with its runtime access and community, while on the other hand Amazon's services are between Braket and Azure, the former being more of an user facing vendor while the latter provides more Q# based support for Amazon hardware.

<style>
    h1 {
        padding-bottom: 40px;
    }
</style>

---
transition: slide-left
layout: figure-side
figureUrl: /what_is_quantum_computing/combined_vertical_chart.png
figureCaption: Algorithm results for an ideal noiseless simulator (top) and a real quantum computer (bottom).
---

# Comparing operations (Linear systems)

Classically, methods like Gaussian Elimination and Conjugate Gradient are popular. They tend to run on time complexities of $O(n^3)$. On the other hand, a quantum algorithm like HHL runs on polynomial time.

Compared to the process of Gaussian Elimintation however, HHL has some pre-requisites and systems to extract output. This includes preparation of state, eigendecomposition of $\ket{b}$ (given $\ket{A}x = \ket{b}$), amplitude encoding to get the output vector and reading the solution.

A general implementation however yields a lot of noise on non-ideal hardware, as shown.

---
transition: slide-left
---

# Comparing operations (ODEs / PDEs)

ODEs and PDEs are the main crux that we face. Broadly, there are no general algorithms that can apply to every kind of ODE or PDE. However, the general workflow remains very similar. First, the problem is discretised within its intial and boundary conditions, followed by state preparation steps like normalisation. Then the quantum circuit is utilised for calculating a solution and a final measurement is taken.

Multiple types and kinds of quantum algorithms can be used. This includes both general and specific use algorithms. Pade approximation, VLQS, and more can be embedded into specific use cases like the Quantum Lattice Boltzmann Method and other hybrid Quantum-Classical CFD solvers, using the quantum primitives as necessary.

---
transition: slide-left
layout: table-of-contents
---

# Table of contents

---
transition: slide-left
---

# References used

1. [What is Quantum computing?](https://en.wikipedia.org/wiki/Quantum_computing)
1. [Brief on popular Quantum-as-a-service offers.](https://www.spinquanta.com/news-detail/top-quantum-as-a-service-companies-to-watch)
1. [Quick overview on Quantum computing terms.](https://www.spinquanta.com/news-detail/what-is-quantum-computing-and-how-does-it-work-expert-explained)
1. [IBM's draft path on creating headways into fault-tolerance](https://www.ibm.com/quantum/blog/large-scale-ftqc)
1. [Solving linear systems using HHL with Qiskit](https://arxiv.org/pdf/2509.16640)
1. [Evaluating incompressible NSE on noisy quantum hardware](https://github.com/comp-physics/NISQ-Quantum-CFD)
1. [ODEs using Pade approximation.](https://quantum-journal.org/papers/q-2025-06-17-1770/pdf/)
1. [Implemented HHL in Qiskit, evaluating PDEs](https://github.com/comp-physics/qce23-qpde-tutorial)
1. [PDEs using Quantum computing.](https://www.frontiersin.org/journals/mechanical-engineering/articles/10.3389/fmech.2022.914241/full)
1. [Quick rundown of a simulated 32-qubit CPU service (Blue-Qubit)](app.bluequbit.io/docs)
