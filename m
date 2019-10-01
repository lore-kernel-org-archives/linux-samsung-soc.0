From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v2 1/4] dt-bindings: memory-controllers: Add Exynos5422 DMC
 interrupts description
Date: Tue,  1 Oct 2019 14:54:33 +0200
Message-ID: <20191001125436.24086-2-l.luba@partner.samsung.com>
References: <20191001125436.24086-1-l.luba@partner.samsung.com>
        <CGME20191001125444eucas1p2e4254acf8434e1fadf0e208dbe62b2d7@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191001125436.24086-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, robh+dt@kernel.org, willy.mh.wolff.ml@gmail.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add description for optional interrupt lines. It provides a new operation
mode, which uses internal performance counters interrupt when overflow.
This is more reliable than using default polling mode implemented in
devfreq.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 .../bindings/memory-controllers/exynos5422-dmc.txt     | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/exynos5422-dmc.txt b/Documentation/devicetree/bindings/memory-controllers/exynos5422-dmc.txt
index 02aeb3b5a820..afc38aea6b1c 100644
--- a/Documentation/devicetree/bindings/memory-controllers/exynos5422-dmc.txt
+++ b/Documentation/devicetree/bindings/memory-controllers/exynos5422-dmc.txt
@@ -31,6 +31,13 @@ Required properties for DMC device for Exynos5422:
 	The register offsets are in the driver code and specyfic for this SoC
 	type.
 
+Optional properties for DMC device for Exynos5422:
+- interrupt-parent : The parent interrupt controller.
+- interrupts : Contains the IRQ line numbers for the DMC internal performance
+  event counters. Align with specification of the interrupt line(s) in the
+  interrupt-parent controller.
+- interrupt-names : List of IRQ names.
+
 Example:
 
 	ppmu_dmc0_0: ppmu@10d00000 {
@@ -70,4 +77,7 @@ Example:
 		device-handle = <&samsung_K3QF2F20DB>;
 		vdd-supply = <&buck1_reg>;
 		samsung,syscon-clk = <&clock>;
+		interrupt-parent = <&combiner>;
+		interrupts = <16 0>, <16 1>;
+		interrupt-names = "drex_0", "drex_1";
 	};
-- 
2.17.1
