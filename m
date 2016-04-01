From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 03/11] ARM: dts: exynos: Fix DTC unit name warnings in Exynos4
Date: Fri, 01 Apr 2016 15:57:46 +0900
Message-ID: <1459493874-2366-3-git-send-email-k.kozlowski@samsung.com>
References: <1459493874-2366-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1459493874-2366-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Fix following DTC warnings in all Exynos4 boards:

Warning (unit_address_vs_reg): Node /soc/video-phy@10020710 has a unit name, but no reg property

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/boot/dts/exynos4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 000d506c027b..021f52d43ff7 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -82,7 +82,7 @@
 		reg = <0x12570000 0x14>;
 	};
 
-	mipi_phy: video-phy@10020710 {
+	mipi_phy: video-phy {
 		compatible = "samsung,s5pv210-mipi-video-phy";
 		#phy-cells = <1>;
 		syscon = <&pmu_system_controller>;
-- 
2.5.0
