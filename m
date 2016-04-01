From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH 02/11] ARM: dts: exynos: Fix DTC unit name warnings in
 Exynos3250
Date: Fri, 01 Apr 2016 15:57:45 +0900
Message-ID: <1459493874-2366-2-git-send-email-k.kozlowski@samsung.com>
References: <1459493874-2366-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1459493874-2366-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org

Fix following DTC warnings in Exynos3250 boards:

Warning (unit_address_vs_reg): Node /soc/video-phy@10020710 has a unit name, but no reg property

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
 arch/arm/boot/dts/exynos3250.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 137f9015d4e8..5225e953d2ed 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -153,7 +153,7 @@
 			interrupt-parent = <&gic>;
 		};
 
-		mipi_phy: video-phy@10020710 {
+		mipi_phy: video-phy {
 			compatible = "samsung,s5pv210-mipi-video-phy";
 			#phy-cells = <1>;
 			syscon = <&pmu_system_controller>;
-- 
2.5.0
