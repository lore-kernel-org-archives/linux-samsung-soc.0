From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v2 3/3] dt-bindings: ddr: Add bindings for Samsung LPDDR3
 memories
Date: Mon, 16 Sep 2019 12:07:04 +0200
Message-ID: <20190916100704.26692-4-l.luba@partner.samsung.com>
References: <20190916100704.26692-1-l.luba@partner.samsung.com>
        <CGME20190916100719eucas1p206fe95982b774840b5d6e62ba9c42c79@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190916100704.26692-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, willy.mh.wolff.ml@gmail.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add compatible for Samsung k3qf2f20db LPDDR3 memory bindings.
Introduce minor fixes in the old documentation.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 Documentation/devicetree/bindings/ddr/lpddr3.txt | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/ddr/lpddr3.txt b/Documentation/devicetree/bindings/ddr/lpddr3.txt
index 3b2485b84b3f..49afe794daaa 100644
--- a/Documentation/devicetree/bindings/ddr/lpddr3.txt
+++ b/Documentation/devicetree/bindings/ddr/lpddr3.txt
@@ -1,7 +1,9 @@
 * LPDDR3 SDRAM memories compliant to JEDEC JESD209-3C
 
 Required properties:
-- compatible : Should be  - "jedec,lpddr3"
+- compatible : should be one of the following:
+	Generic default - "jedec,lpddr3".
+	For Samsung 542x SoC - "samsung,K3QF2F20DB", "jedec,lpddr3".
 - density  : <u32> representing density in Mb (Mega bits)
 - io-width : <u32> representing bus width. Possible values are 8, 16, 32, 64
 - #address-cells: Must be set to 1
@@ -43,7 +45,7 @@ Child nodes:
 Example:
 
 samsung_K3QF2F20DB: lpddr3 {
-	compatible	= "Samsung,K3QF2F20DB", "jedec,lpddr3";
+	compatible	= "samsung,K3QF2F20DB", "jedec,lpddr3";
 	density		= <16384>;
 	io-width	= <32>;
 	#address-cells	= <1>;
@@ -73,7 +75,8 @@ samsung_K3QF2F20DB: lpddr3 {
 
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
