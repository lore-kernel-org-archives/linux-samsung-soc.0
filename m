From: Abhilash Kesavan <a.kesavan@samsung.com>
Subject: [PATCH v2 5/7] arm64: dts: Add PMU DT node for exynos7 SoC
Date: Tue, 21 Oct 2014 11:13:55 +0530
Message-ID: <1413870237-1821-6-git-send-email-a.kesavan@samsung.com>
References: <1413870237-1821-1-git-send-email-a.kesavan@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:30243 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751664AbaJUFpt (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Oct 2014 01:45:49 -0400
In-reply-to: <1413870237-1821-1-git-send-email-a.kesavan@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, catalin.marinas@arm.com, robh@kernel.org, devicetree@vger.kernel.org, tomasz.figa@gmail.com

Adds PMU DT node for exynos7 SoC.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
---
 .../devicetree/bindings/arm/samsung/pmu.txt        |    1 +
 arch/arm64/boot/dts/exynos/exynos7.dtsi            |    5 +++++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/pmu.txt b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
index 1e1979b..67b2113 100644
--- a/Documentation/devicetree/bindings/arm/samsung/pmu.txt
+++ b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
@@ -10,6 +10,7 @@ Properties:
 		   - "samsung,exynos5260-pmu" - for Exynos5260 SoC.
 		   - "samsung,exynos5410-pmu" - for Exynos5410 SoC,
 		   - "samsung,exynos5420-pmu" - for Exynos5420 SoC.
+		   - "samsung,exynos7-pmu" - for Exynos7 SoC.
 		second value must be always "syscon".
 
  - reg : offset and length of the register set.
diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index ce221ac..6db8c78 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -243,6 +243,11 @@
 				     <1 11 0xff01>,
 				     <1 10 0xff01>;
 		};
+
+		pmu_system_controller: system-controller@105c0000 {
+			compatible = "samsung,exynos7-pmu", "syscon";
+			reg = <0x105c0000 0x5000>;
+		};
 	};
 };
 
-- 
1.7.9.5
