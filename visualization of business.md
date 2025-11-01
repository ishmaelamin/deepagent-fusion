flowchart TD
    %% ---- User/Customer Flow ----
    C1[Customer] -->|“Order request”| D1[Device]
    D1 -->|“Send data”| H[Hardware Cluster]
    H -->|“Ingest & store”| A[AI Engine]
    A -->|“Generate personalized recommendation”| R[Recommendation Service]
    R -->|“Return to device”| D1
    D1 -->|“Show recommendation”| C1

    %% ---- Hardware & Cost ----
    H -->|$500 k upfront| U1[Server]
    U1 -->|Add 1 server per 10 k customers| H

    %% ---- Compliance & Privacy ----
    subgraph compliance
        C2[GDPR/CCPA] -.->|Data‑resident| H
        C3[CLOUD‑Act] -.->|Secure data sovereignty| H
    end

    %% ---- Scalability ----
    subgraph scaling
        H -->|OPEX <$15 k / yr per 10 k customers| OPEX
    end

    %% ---- Financials ----
    subgraph unitEconomics
        U1 -->|70–80 % gross margin (IDC, 2024)| GM
        GM -->|> 80 % of deals VC‑funded (PitchBook, 2024)| VC
    end

    %% Styling for clarity
    classDef main fill:#f9f,stroke:#333,stroke-width:2px;
    classDef cost fill:#bbf,stroke:#333,stroke-width:1px;
    classDef compliance fill:#dff,stroke:#333,stroke-width:1px,stroke-dasharray: 4 4;
    classDef scaling fill:#efe,stroke:#333,stroke-width:1px;
    classDef unitEconomics fill:#fee,stroke:#333,stroke-width:1px;

    H, U1, A, R, D1, C1, C2, C3, OPEX, GM, VC
        class H,U1,A,R,D1,C1 main;
    U1,class cost;
    compliance
        class C2,C3 compliance;
    scaling
        class OPEX scaling;
    unitEconomics
        class GM,VC unitEconomics;
