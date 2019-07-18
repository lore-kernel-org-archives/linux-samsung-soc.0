From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 7/9] soc: samsung: Update the CHIP ID DT binding
 documentation
Date: Thu, 18 Jul 2019 16:30:42 +0200
Message-ID: <20190718143044.25066-8-s.nawrocki@samsung.com>
References: <20190718143044.25066-1-s.nawrocki@samsung.com>
        <CGME20190718143135eucas1p2da5b7842b35327c60667064184619a9f@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190718143044.25066-1-s.nawrocki@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: krzk@kernel.org
Cc: robh+dt@kernel.org, vireshk@kernel.org, devicetree@vger.kernel.org, kgene@kernel.org, pankaj.dubey@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds documentation of a new optional "samsung,asv-bin"
property in the chipid device node and documents requirement of
"syscon" compatible string.  These additions are needed to support
Exynos ASV (Adaptive Supply Voltage) feature.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v1 (RFC):
 - new patch
---
 .../devicetree/bindings/arm/samsung/exynos-chipid.txt  | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/samsung/exynos-chipid.txt b/Documentation/devicetree/bindings/arm/samsung/exynos-chipid.txt
index 85c5dfd4a720..be3657e6c00c 100644
--- a/Documentation/devicetree/bindings/arm/samsung/exynos-chipid.txt
+++ b/Documentation/devicetree/bindings/arm/samsung/exynos-chipid.txt
@@ -1,12 +1,18 @@
-SAMSUNG Exynos SoCs Chipid driver.
+SAMSUNG Exynos SoC series CHIPID subsystem
 
 Required properties:
-- compatible : Should at least contain "samsung,exynos4210-chipid".
+- compatible : Should at least contain "samsung,exynos4210-chipid", "syscon".
 
 - reg: offset and length of the register set
 
+Optional properties:
+ - samsung,asv-bin : Adaptive Supply Voltage bin selection. This can be used
+   to determine the ASV bin of an SoC if respective information is missing
+   in the CHIPID registers or in the OTP memory. Possible values: 0...3.
+
 Example:
 	chipid@10000000 {
 		compatible = "samsung,exynos4210-chipid";
 		reg = <0x10000000 0x100>;
+		samsung,asv-bin = <2>;
 	};
-- 
2.17.1
