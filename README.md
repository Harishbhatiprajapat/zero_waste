# ANN-DAAN AI: AI-Powered Food Rescue, Safety, Fraud Detection & Smart Redistribution Platform

**Pilot Regional Node:** Jaipur, Rajasthan, India  
**Compliance Standard:** FSSAI (Recovery and Distribution of Surplus Food) Regulations, 2019 (Schedule I & II)  
**Core Innovations:** Dual-Channel Architecture (Commercial Rescue + Social Rescue), AI Dynamic Rescue Pricing, Surprise Rescue Bags, Rescue-to-Donation Engine

ANN-DAAN AI is an end-to-end web platform connecting restaurants, hotels, college hostels, caterers, customers, NGOs, and volunteer couriers to eliminate edible food waste and redistribute safe surplus nutrition across urban centres.

---

## 1. System Architecture & The Core Engines

The platform operates across two strictly separated channels powered by intelligent engines:

```
┌────────────────────────────────────────────────────────────────────────────────────────┐
│                                       ANN-DAAN AI                                      │
├───────────────────────────────────────────┬────────────────────────────────────────────┤
│         A. COMMERCIAL RESCUE              │             B. SOCIAL RESCUE               │
│ - Affordable surplus meals for customers  │ - 100% Free redistribution to verified NGOs│
│ - AI Dynamic Markdown (50-70% off)        │ - Shelter meal deficits matching           │
│ - Surprise Rescue Bags (delightful value) │ - 80G compliant donation audit trail       │
│ - Digital payment (simulated Razorpay)    │ - Strictly zero commercial monetization    │
├───────────────────────────────────────────┴────────────────────────────────────────────┤
│                         SHARED SAFETY & VERIFICATION ENGINES                           │
├─────────────────────┬──────────────────────────┬───────────────────────────────────────┤
│ 1. AI Food Rescue   │ 2. AI Safety & Vision    │ 3. AI Fraud & Trust                   │
│ - Surplus schemas   │ - Mould & discoloration  │ - NLP scam & extortion detection      │
│ - Temp thresholds   │ - Seal breach inspection │ - Perceptual dHash photo deduplication│
│ - FSSAI Schedule I  │ - Label OCR & mismatch   │ - Isolation Forest volume anomalies   │
├─────────────────────┴──────────────────────────┴───────────────────────────────────────┤
│ 4. Smart Logistics & Delivery Engine           │ 5. Predictive AI & Pricing Engine     │
│ - PostGIS / Haversine 2-stage matching         │ - AI Dynamic Pricing Formula          │
│ - Dual OTP pickup & drop off verification      │ - Random Forest Surplus & Demand ML   │
│ - IoT ESP32 DS18B20 cold-chain telemetry       │ - WRI India GHG Carbon Accounting     │
├────────────────────────────────────────────────┴───────────────────────────────────────┤
│ 6. RESCUE-TO-DONATION ENGINE: Automatically transitions unsold commercial surplus      │
│    (with ≥45m safe shelf-life) into Social Rescue for free NGO claims.                 │
└────────────────────────────────────────────────────────────────────────────────────────┘
```

### The Engines:
1. **AI Food Rescue Engine:** Complete donation and listing lifecycle (Draft &rarr; Pending Inspection &rarr; Active &rarr; Reserved &rarr; Claimed &rarr; Picked Up &rarr; Delivered &rarr; Distributed), category-specific temperature baselines, and allergen tracking.
2. **AI Dynamic Rescue Pricing Engine:** Calculates fair, demand-responsive markdown prices (`Rescue Price = Verified Original Price * Dynamic Factor`). Enforces monotonic non-increasing prices (never raises price above initial approved price) and guards against artificial inflation of original menu prices using Jaipur category baselines.
3. **AI Food Safety & Inspection Engine:** Visual screening for surface mould, discoloration, foreign objects, and container seal integrity with the mandatory physical inspection disclaimer:
   > *"AI visual inspection is a preliminary screening tool. It does not certify food safety. Physical inspection and appropriate food-handling verification are required."*
4. **AI Fraud Detection & Trust Engine:** Real-time NLP classifier scanning user communications for advance fee demands, OTP solicitations, phishing links, and impersonation. Perceptual image hashing (`dHash`) prevents recycled photos; Scikit-learn `IsolationForest` flags anomalous transaction volumes.
5. **Smart Logistics & Volunteer Engine:** Two-stage matching (Mandatory safety/dietary filters &rarr; Weighted distance, capacity, and reliability ranking). 6-digit cryptographic OTPs for pickup and drop custody confirmation with continuous temperature logging.
6. **AI Predictive Intelligence & Impact Engine:** Random Forest Regressor models predicting weekend surplus peaks from banquets and matching NGO demand. Computes net avoided GHG emissions referencing the WRI India Food Waste GHG Protocol with logistics emissions deductions.
7. **Rescue-to-Donation Engine:** When commercial surplus nears its pickup deadline (with &ge;45 minutes safe holding time remaining and restaurant consent), the engine seamlessly transitions unsold quantities into Social Rescue listings for free NGO claiming.

---

## 2. Technology Stack

* **Frontend:** Next.js (App Router, Webpack), React 19, TypeScript, Tailwind CSS, Lucide Icons, Recharts.
* **Backend:** Python FastAPI, Pydantic v2, JWT (HS256) PBKDF2 authentication, SQLAlchemy ORM.
* **Database:** Relational schema supporting PostgreSQL + PostGIS and local SQLite with registered C-level Haversine spatial distance calculations.
* **AI & Machine Learning:** Scikit-Learn (`IsolationForest`, `RandomForestRegressor`), Pillow (`dHash`), NLP text classification.
* **Payments & Verification:** Simulated Razorpay checkout flow, 6-digit OTP verification, SHA-256 QR code signatures.
* **Hardware & IoT:** REST telemetry ingestion for ESP32 + DS18B20 digital temperature sensors.

---

## 3. Project Directory Structure

```
zero_waste Food/
├── backend/
│   ├── app/
│   │   ├── config.py                 # Configuration, FSSAI rules, disclaimers
│   │   ├── database.py               # Engine & spatial Haversine function
│   │   ├── main.py                   # FastAPI app entrypoint & middleware
│   │   ├── models/
│   │   │   └── entities.py           # 20 relational tables & audit logs
│   │   ├── schemas/
│   │   │   └── schemas.py            # Pydantic request & response models
│   │   ├── routers/
│   │   │   ├── auth.py               # JWT login, registration & profiles
│   │   │   ├── marketplace.py        # 12 commercial marketplace endpoints & Section 16 demo
│   │   │   ├── rescue.py             # Food listings CRUD & lifecycle
│   │   │   ├── matching.py           # Two-stage NGO matching & claims
│   │   │   ├── safety.py             # Computer vision & admin review
│   │   │   ├── ocr.py                # Food label OCR extraction
│   │   │   ├── temperature.py        # Temperature logs & IoT endpoint
│   │   │   ├── fraud.py              # NLP message sentinel & trust score
│   │   │   ├── logistics.py          # Volunteer dispatches & dual OTP
│   │   │   ├── predictions.py        # Surplus & demand forecasting
│   │   │   ├── impact.py             # WRI India GHG calculations
│   │   │   ├── admin.py              # Verification & alert triage
│   │   │   └── demo.py               # Section 20 demonstration runner
│   │   └── services/
│   │       ├── pricing_engine.py     # AI dynamic rescue pricing & inflation guards
│   │       ├── rescue_to_donation.py # Transition unsold commercial food to NGOs
│   │       ├── marketplace_prediction.py # Random forest category clearance models
│   │       ├── ai_vision.py          # Visual safety screening model
│   │       ├── ocr_service.py        # Label parser & discrepancy engine
│   │       ├── nlp_fraud.py          # Message scam classifier
│   │       ├── image_hash.py         # Perceptual difference hashing
│   │       ├── anomaly_detector.py   # Hybrid Isolation Forest + rules
│   │       ├── trust_engine.py       # Dynamic platform trust score
│   │       ├── forecasting.py        # Random Forest predictive regression
│   │       ├── impact_engine.py      # WRI India avoided GHG emissions
│   │       └── seed_data.py          # Jaipur pilot demonstration dataset
│   └── tests/
│       └── test_backend.py           # 17 comprehensive unit & scenario tests
├── frontend/
│   ├── src/
│   │   ├── app/
│   │   │   ├── globals.css           # Modern SaaS styling & emerald theme
│   │   │   ├── layout.tsx            # Root layout & meta tags
│   │   │   └── page.tsx              # Dynamic role controller & demo state
│   │   ├── components/
│   │   │   ├── Navbar.tsx            # Role navigation & demo launcher
│   │   │   ├── DisclaimerBanner.tsx  # Mandatory safety disclaimer
│   │   │   ├── LandingPage.tsx       # Public showcase & impact metrics
│   │   │   ├── MarketplaceView.tsx   # Customer rescue deals & checkout
│   │   │   ├── CustomerDashboard.tsx # Affordability tracker & OTP collection
│   │   │   ├── DonorDashboard.tsx    # Listing creation & surplus revenue analytics
│   │   │   ├── NgoDashboard.tsx      # Matching directory & meal claiming
│   │   │   ├── VolunteerDashboard.tsx# Route dispatch & OTP verification
│   │   │   ├── AdminDashboard.tsx    # Fraud sentinel & safety approval
│   │   │   └── JaipurDemoModal.tsx   # Interactive Section 16 & Section 20 simulator
│   │   └── lib/
│   │       ├── api.ts                # Complete API client with fallbacks
│   │       └── types.ts              # TypeScript interfaces
│   └── package.json
├── run_backend.py                    # Fast startup script for backend
├── run_demo_scenario.py              # CLI runner for demonstration scenarios
├── .env.example                      # Environment variables template
└── README.md
```

---

## 4. Setup and Execution Instructions

### Prerequisites
* Python 3.10+ (tested on Python 3.14)
* Node.js 18+ & npm

### Backend Setup
1. Open a terminal in the root folder:
   ```bash
   python -m pip install fastapi uvicorn sqlalchemy python-dotenv pydantic pyjwt passlib bcrypt python-multipart pillow scikit-learn email-validator pytest httpx
   ```
2. Start the FastAPI backend:
   ```bash
   python run_backend.py
   ```
   * The API server will be live at `http://localhost:8000`
   * Interactive Swagger docs at `http://localhost:8000/docs`

### Frontend Setup
1. Open a second terminal and navigate to the frontend:
   ```bash
   cd frontend
   npm install
   npm run dev
   ```
2. Open your browser at `http://localhost:3000`

---

## 5. Demo Accounts & Credentials

The platform is pre-seeded with fictional accounts calibrated to the Jaipur pilot:

| Role | Name & Establishment | Email | Password | Primary Capability |
|---|---|---|---|---|
| **Customer** | Pooja Sharma (Jaipur Consumer) | `customer@jaipur-demo.in` | `password123` | Browse Rescue Deals, Buy Meals, View OTPs & Savings |
| **Donor (Restaurant)** | Jaipur Heritage Banquets (C-Scheme) | `restaurant@jaipur-demo.in` | `password123` | Commercial Rescue Listings & Surplus Revenue Analytics |
| **Donor (Hostel)** | MNIT Jaipur Hostel Mess No. 4 | `hostel@jaipur-demo.in` | `password123` | Social Rescue Listings & Temperature Logging |
| **NGO** | Jaipur Annapurna Seva Sansthan | `ngo@jaipur-demo.in` | `password123` | Claim Free Donations for Night Shelters |
| **Volunteer** | Rahul Meena (Bike Courier) | `volunteer@jaipur-demo.in` | `password123` | Accept Dispatch Routes, Enter Pickup & Delivery OTPs |
| **Admin** | FSSAI Rajasthan Operations Admin | `admin@jaipur-demo.in` | `password123` | Verify Listings, Monitor Fraud Sentinel & Platform Audit |

Use the role switcher in the top navigation bar to instantaneously toggle between roles.

---

## 6. Demonstration Scenarios

### Scenario 1: Section 16 Hybrid Commercial & Social Rescue Demonstration
* **Pilot Story:** Jaipur Heritage Banquets has 30 surplus dinner portions (Original ₹150).
  1. **Commercial Listing & AI Pricing:** AI prices meals at ₹75 (50% markdown) based on urgency and demand.
  2. **Customer Reservation & Payment:** Customer purchases 18 meals for ₹1,350 via simulated Razorpay, receiving Pickup OTP `719245`.
  3. **Restaurant Counter Pickup:** Customer collects 18 meals upon OTP verification.
  4. **Rescue-to-Donation Engine:** The 12 unsold meals nearing pickup deadline auto-transition into Social Rescue.
  5. **NGO Claim:** Annapurna Seva Sansthan claims 12 meals free for Bapu Nagar Shelter.
  6. **Volunteer Delivery:** Volunteer Rahul Meena delivers with OTP `691340`.
  7. **Outcome:** Restaurant recovers ₹1,215, customer saves ₹1,350, 0% waste achieved.

### Scenario 2: Section 20 Hostel Social Rescue Demonstration
* **Pilot Story:** MNIT Jaipur Hostel Mess produces 120 surplus vegetarian lunch portions of Dal Makhani & Jeera Rice at 64.2°C.
  1. **Surplus Registration:** 120 meals registered under FSSAI Schedule I.
  2. **AI Visual Inspection:** Scans for surface mould, discoloration, and container seal integrity.
  3. **Food Label OCR:** Cross-verifies preparation timestamp and pure veg status.
  4. **Intelligent NGO Matching:** Evaluates distance (3.2 km) and capacity to rank Jaipur Annapurna Seva Sansthan (Score: 94.2%).
  5. **Portion Claim:** NGO claims 80 meals for Gandhi Nagar shelter distribution.
  6. **Volunteer Logistics:** Rahul Meena accepts task; Pickup OTP (`842109`) and Delivery OTP (`519302`) issued.
  7. **Cold-Chain Telemetry:** ESP32 + DS18B20 records 61.8°C in transit.
  8. **Sign-Off & Impact:** Delivery verified; WRI India net avoided emissions calculated and audited.

### Running the Demos:
* **Option A (Web Interface):** Click the **"Jaipur Demo"** button on the top navigation bar. Toggle between **Section 16 Hybrid Marketplace** and **Section 20 Hostel Rescue**, then click **"Run Simulation"**.
* **Option B (CLI):** Run `python run_demo_scenario.py` from the root folder.

---

## 7. Running Backend Unit Tests

A comprehensive 17-test suite is located in `backend/tests/test_backend.py`.

Run tests with:
```bash
cd backend
python -m pytest tests/test_backend.py -v
```

**Test Coverage (17/17 Passing):**
* Root health check and CORS headers
* Donor authentication & credential verification
* Rejection of invalid credentials
* Surplus listing creation & retrieval
* Mandatory food safety disclaimer verification
* Visual mould and spoilage detection
* Food label OCR date & dietary mismatch flagging
* NLP scam message classification (OTP theft & fee extortion)
* PostGIS / Haversine two-stage NGO matching
* Danger-zone temperature violation alerts
* WRI India avoided GHG emissions calculations
* Complete Section 20 Jaipur Hostel end-to-end simulation
* AI dynamic rescue price calculation and monotonic non-increasing rules
* Marketplace browse deals with filters and sorting
* Customer order reservation and oversell prevention
* Restaurant surplus revenue & rescue analytics
* Section 16 Jaipur Hybrid Commercial & Social Rescue full demonstration
