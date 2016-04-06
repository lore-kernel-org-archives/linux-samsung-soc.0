From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 02/11] ARM: dts: exynos: Fix DTC unit name warnings in
 Exynos3250
Date: Wed, 06 Apr 2016 11:00:41 +0900
Message-ID: <1459908050-16430-2-git-send-email-k.kozlowski@samsung.com>
References: <1459908050-16430-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1459908050-16430-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Fix following DTC warnings in Exynos3250 boards:

Warning (unit_address_vs_reg): Node /soc/video-phy@10020710 has a unit name, but no reg property

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

Changes since v1:
1. Add Javier's tag.
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
