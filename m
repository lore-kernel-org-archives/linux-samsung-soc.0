From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH 3/3] dt-bindings: ddr: Add bindings for Samsung LPDDR3
 memories
Date: Fri,  6 Sep 2019 12:13:44 +0200
Message-ID: <20190906101344.3535-4-l.luba@partner.samsung.com>
References: <20190906101344.3535-1-l.luba@partner.samsung.com>
        <CGME20190906101407eucas1p15eb0df53374b27497b4793eab24becf6@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190906101344.3535-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, willy.mh.wolff.ml@gmail.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add description of bindings for Samsung k3qf2f20db LPDDR3 memory.
Minor fixes in the old documentation.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 .../devicetree/bindings/ddr/lpddr3.txt        | 29 +++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/ddr/lpddr3.txt b/Documentation/devicetree/bindings/ddr/lpddr3.txt
index 3b2485b84b3f..de0905239767 100644
--- a/Documentation/devicetree/bindings/ddr/lpddr3.txt
+++ b/Documentation/devicetree/bindings/ddr/lpddr3.txt
@@ -40,10 +40,34 @@ Child nodes:
   a given speed-bin. Please see Documentation/devicetree/
   bindings/ddr/lpddr3-timings.txt for more information on "lpddr3-timings"
 
+Samsung K3QF2F20DB LPDDR3 memory
+------------------------------------------------------------
+
+This binding uses the LPDDR3 binding (described above)
+
+Required properties:
+- compatible:	Should be:
+		"samsung,K3QF2F20DB"
+		followed by "jedec,lpddr3"
+- density  : <u32> representing density in Mb (Mega bits)
+- io-width : <u32> representing bus width. Possible value 32
+- #address-cells: Must be set to 1
+- #size-cells: Must be set to 0
+
+Optional properties:
+
+The optional properties are the same as in the LPDDR3 generic bindings and
+values should be taken from the data-sheet. Detailed bindings are described
+above.
+
+Child nodes:
+
+Detailed bindings are described in LPDDR3 generic bindings described above.
+
 Example:
 
 samsung_K3QF2F20DB: lpddr3 {
-	compatible	= "Samsung,K3QF2F20DB", "jedec,lpddr3";
+	compatible	= "samsung,K3QF2F20DB", "jedec,lpddr3";
 	density		= <16384>;
 	io-width	= <32>;
 	#address-cells	= <1>;
@@ -73,7 +97,8 @@ samsung_K3QF2F20DB: lpddr3 {
 
 	timings_samsung_K3QF2F20DB_800mhz: lpddr3-timings@800000000 {
 		compatible	= "jedec,lpddr3-timings";
-		reg		= <800000000>; /* workaround: it shows max-freq */
+		/* workaround: 'reg' shows max-freq */
+		reg		= <800000000>;
 		min-freq	= <100000000>;
 		tRFC		= <65000>;
 		tRRD		= <6000>;
-- 
2.17.1
