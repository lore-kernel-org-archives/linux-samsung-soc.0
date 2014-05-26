From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH] ARM: dts: Add pmu sysreg node to Exynos3250
Date: Mon, 26 May 2014 15:29:36 +0900
Message-ID: <1401085776-14212-1-git-send-email-cw00.choi@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:49095 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751381AbaEZG3q (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 26 May 2014 02:29:46 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com
Cc: t.figa@samsung.com, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, rdunlap@infradead.org, ben-linux@fluff.org, linux@arm.linux.org.uk, l.krishna@samsung.com, chanho61.park@samsung.com, kyungmin.park@samsung.com, cw00.choi@samsung.com, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

This patch add pmusysreg node for Exynos3250 to access PMU (Power Management Unit)
register in a centralized way using syscon driver.

Signed-off-by: Chanwoo Choi <cw00.choi@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 Documentation/devicetree/bindings/arm/samsung/pmu.txt | 1 +
 arch/arm/boot/dts/exynos3250.dtsi                     | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/samsung/pmu.txt b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
index b562634..2a4ab04 100644
--- a/Documentation/devicetree/bindings/arm/samsung/pmu.txt
+++ b/Documentation/devicetree/bindings/arm/samsung/pmu.txt
@@ -2,6 +2,7 @@ SAMSUNG Exynos SoC series PMU Registers
 
 Properties:
  - compatible : should contain two values. First value must be one from following list:
+		   - "samsung,exynos3250-pmu" - for Exynos3250 SoC,
 		   - "samsung,exynos4210-pmu" - for Exynos4210 SoC,
 		   - "samsung,exynos4212-pmu" - for Exynos4212 SoC,
 		   - "samsung,exynos4412-pmu" - for Exynos4412 SoC,
diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index ca28eac..3e678fa 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -125,6 +125,11 @@
 			reg = <0x10010000 0x400>;
 		};
 
+		pmu_system_controller: system-controller@10020000 {
+			compatible = "samsung,exynos3250-pmu", "syscon";
+			reg = <0x10020000 0x4000>;
+		};
+
 		pd_cam: cam-power-domain@10023C00 {
 			compatible = "samsung,exynos4210-pd";
 			reg = <0x10023C00 0x20>;
-- 
1.8.0
