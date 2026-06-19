# Papers and Code Alongside

- [ ] Hybrid QPINN on Burgers, spring, Poissons. **Tf Benchmarks** on layers, qubits, etc. _Trahan, C.; Loveland, M.; Dent, S. Quantum Physics-Informed Neural Networks. Entropy 2024, 26, 649. https://doi.org/10.3390/e26080649_
    - [ ] [Code](https://github.com/trahancj/QPINNs.git) (only spring and burgers)
- [ ] Trainable Embedding **QPINN** on NSE, small circuit for good results. Not sure how they got these numbers. Might have to run code to understand. _Berger, S., Hosters, N. & Möller, M. Trainable embedding quantum physics informed neural networks for solving nonlinear PDEs. Sci Rep 15, 18823 (2025). https://doi.org/10.1038/s41598-025-02959-z_
    - [ ] [Code](https://git.rwth-aachen.de/berger.st.11.11/te-qpinns/-/blob/main/PDE-Example/LidDrivenCavity/lid_driven_cavity_stream_QPINN.py?ref_type=heads)
- [ ] DQC based QPINN on Convergent-Divergent Nozzle. Not in depth on the example part. _Kyriienko, O., Paine, A. E., & Elfving, V. E. (2021). Solving nonlinear differential equations with differentiable quantum circuits. Phys. Rev. A, 103(5), 052416. https://doi.org/10.1103/PhysRevA.103.052416_
- [ ] Both Continuous and Discrete Variable QPINN are benchmarked for Helmholtz, 2D lid cav and wave equations. _Afrah Farea et al 2025 Mach. Learn.: Sci. Technol. 6 045053. https://doi.org/10.1088/2632-2153/ae1c91_
    - [ ] [Code](https://github.com/afrah/QCPINN/blob/main/src/nn/CVQuantumLayer.py) [Check the discrete layer circuits]
- [ ] Hybrid QPINN for a cylinder flow/Y-shaped mixture flow. _Alexandr Sedykh et al 2024 Mach. Learn.: Sci. Technol. 5 025045. https://doi.org/10.1088/2632-2153/ad43b2_
- [ ] Base maths, gate basics for Quantum circuit in QPINN. _Dehaghani, N. B., Aguiar, A. P., & Wisniewski, R. (2024). A Hybrid Quantum-Classical Physics-Informed Neural Network Architecture for Solving Quantum Optimal Control Problems. https://arxiv.org/abs/2404.15015_
- [ ] QPINN for 1D Cylinder wake flow. _M. Raissi, P. Perdikaris, G.E. Karniadakis, Physics-informed neural networks: A deep learning framework for solving forward and inverse problems involving nonlinear partial differential equations, Journal of Computational Physics, Volume 378, 2019, Pages 686-707, ISSN 0021-9991, https://doi.org/10.1016/j.jcp.2018.10.045._
    - [ ] [Code](https://github.com/GeetRakala/QPINN/blob/main/qpinn.ipynb)
- [ ] Transfer Learning in QPINNs - what kind of networks may exist. _Mari, A., Bromley, T. R., Izaac, J., Schuld, M., & Killoran, N. (2020). Transfer learning in hybrid classical-quantum neural networks. Quantum, 4, 340. https://doi.org/10.22331/q-2020-10-09-340_
- [ ] Transfer Learning in PINNs with LoRA. _Wang, Y., Bai, J., Eshaghi, M. S., Anitescu, C., Zhuang, X., Rabczuk, T., & Liu, Y. (2025). Transfer Learning in Physics-Informed Neural Networks: Full Fine-Tuning, Lightweight Fine-Tuning, and Low-Rank Adaptation. https://arxiv.org/abs/2502.00782_
    - [ ] [Code](https://github.com/yizheng-wang/Research-on-Solving-Partial-Differential-Equations-of-Solid-Mechanics-Based-on-PINN) Check the Taylor Green part
- [ ] Summary of QPINNs and papers till 2026. _Amaral, C.A., Oliveira, V.L., Salazar, J.P.L.C. et al. A Review of Quantum Machine Learning and Quantum-inspired Applied Methods to Computational Fluid Dynamics. Braz J Phys 56, 39 (2026). https://doi.org/10.1007/s13538-025-01959-8_
    - [ ] [Code](https://github.com/cammaral/quantum_and_cfd/)
- PFET (LoRA) in PINNS:
    - [ ] Basic LoRA impl in PyTorch: *https://sahaj.ai/exploring-lora-part-2-analyzing-lora-through-its-implementation-on-an-mlp/*
    - [ ] List of Adapters as per HuggingFace documentation of PFET: *https://huggingface.co/docs/peft/en/conceptual_guides/adapter* [Citation as below]
    - [ ] HuggingFace library citation: _Mangrulkar, S., Gugger, S., Debut, L., Belkada, Y., Paul, S., Bossan, B., & Tietz, M. (2022). PEFT: State-of-the-art Parameter-Efficient Fine-Tuning methods. https://github.com/huggingface/peft_

## PINN

- [ ] Summary of PgNN, PiNN, PeNN, and NO, what they achieve. _Faroughi, S. A., Pawar, N. M., Fernandes, C., Raissi, M., Das, S., Kalantari, N. K., and Kourosh Mahjour, S. (January 29, 2024). "Physics-Guided, Physics-Informed, and Physics-Encoded Neural Networks and Operators in Scientific Computing: Fluid and Solid Mechanics." ASME. J. Comput. Inf. Sci. Eng. April 2024; 24(4): 040802. https://doi.org/10.1115/1.4064449_
- [x] Summary of NN in CFD. Read challenges section. Points 1-4. _Chi Zhao, Feifei Zhang, Wenqiang Lou, Xi Wang, Jianyong Yang; A comprehensive review of advances in physics-informed neural networks and their applications in complex fluid dynamics. Physics of Fluids 1 October 2024; 36 (10): 101301. https://doi.org/10.1063/5.0226562_
- [x] Deals with building predictions with incomplete BCs and using data to fill gaps, or forward, both. _Zhiping Mao, Ameya D. Jagtap, George Em Karniadakis, Physics-informed neural networks for high-speed flows, Computer Methods in Applied Mechanics and Engineering, Volume 360, 2020, 112789, ISSN 0045-7825, https://doi.org/10.1016/j.cma.2019.112789._
- [ ] FBPINN - divide like in FEM, then use PINN in each subdomain. _Moseley, B., Markham, A. & Nissen-Meyer, T. Finite basis physics-informed neural networks (FBPINNs): a scalable domain decomposition approach for solving differential equations. Adv Comput Math 49, 62 (2023). https://doi.org/10.1007/s10444-023-10065-9_
- [ ] APINN - divide after a common NN, into subnetworks, using a single PDE. Computationally should be more expensive. _Zheyuan Hu, Ameya D. Jagtap, George Em Karniadakis, Kenji Kawaguchi, Augmented Physics-Informed Neural Networks (APINNs): A gating network-based soft domain decomposition methodology, Engineering Applications of Artificial Intelligence, Volume 126, Part B, 2023, 107183, ISSN 0952-1976, https://doi.org/10.1016/j.engappai.2023.107183._
- [x] CD-nozzle problem, with modified activation functions for a better solution. _Ge Jin, Deyou Wang, Pengfei Si, Jiao Liu, Shipeng Li, Ningfei Wang; Improve neural representations with general exponential activation function for high-speed flows. Physics of Fluids 1 December 2024; 36 (12): 126117. https://doi.org/10.1063/5.0239889_
- [x] PINNs in hyperbolic PDEs, with weights and hard constraints. Good summary. _Ghoreishi M.S. & Naderan H. Physics-informed neural network with weighted loss and hard constraints for hyperbolic conservation laws. Sci Rep (2026). https://doi.org/10.1038/s41598-025-34263-1_
- [x] PINNs in CD-nozzle problem, with weights and hard constraints. _Liang, H., Song, Z., Zhao, C. et al. Continuous and discontinuous compressible flows in a converging–diverging channel solved by physics-informed neural networks without exogenous data. Sci Rep 14, 3822 (2024). https://doi.org/10.1038/s41598-024-53680-2_
- [ ] ID-PINNs, similar to what I did for domain decomposition, no CD-nozzle impl, basically enforces interface conditions _Chenhao Si, Ming Yan, Initialization-enhanced physics-informed neural network with domain decomposition (IDPINN), Journal of Computational Physics, Volume 530, 2025, 113914, ISSN 0021-9991, https://doi.org/10.1016/j.jcp.2025.113914._
- [x] Structure for paper on a specific problem, implementing a solution. _Aslam, M.N., Shaukat, N., Riaz, A. et al. Nano-fluid flow predictions in convergent/divergent channels using ANN-BLMT and physics-informed neural networks. J Therm Anal Calorim 150, 7029–7047 (2025). https://doi.org/10.1007/s10973-024-13628-0_
- [ ] Benchmarking classical approaches to PINNs. _Wenbo Cao, Jiahao Song, Weiwei Zhang; A solver for subsonic flow around airfoils based on physics-informed neural networks and mesh transformation. Physics of Fluids 1 February 2024; 36 (2): 027134. https://doi.org/10.1063/5.0188665_

## Gists

While domain-decomposed PINNs outperform vanilla PINNs on multi-scale or high-frequency problems
Dolean2023, challenges remain:

- Interface conditions between subdomains can introduce errors or require careful loss design
- Training costs remain high for large-scale or highly discontinuous problems.
- Most nozzle-specific studies focus on one-dimensional or simplified geometries; full three-dimensional turbulent flows remain less explored.
- While some studies demonstrate mesh-free advantages over traditional CFD solvers—especially regarding parametric studies or inverse design—the overall maturity of these methods is still developing compared to established finite volume/element approaches
- Transfer learning to speed up training in PINNs, especially across ADD-PINNs.
