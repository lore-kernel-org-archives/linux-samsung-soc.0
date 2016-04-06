From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Subject: [PATCH v2 09/11] ARM: dts: exynos: Fix DTC unit name warnings in
 SMDK5420
Date: Wed, 06 Apr 2016 11:00:48 +0900
Message-ID: <1459908050-16430-9-git-send-email-k.kozlowski@samsung.com>
References: <1459908050-16430-1-git-send-email-k.kozlowski@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1459908050-16430-1-git-send-email-k.kozlowski@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Fix following DTC warnings in Exynos5420 SMDK5420:

Warning (unit_address_vs_reg): Node /dp-controller@145B0000/display-timings/timing@0 has a unit name, but no reg property

Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>

---

Changes since v1:
1. Add Javier's tag.
---
 arch/arm/boot/dts/exynos5420-smdk5420.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5420-smdk5420.dts b/arch/arm/boot/dts/exynos5420-smdk5420.dts
index 0785fedf441e..99160f796851 100644
--- a/arch/arm/boot/dts/exynos5420-smdk5420.dts
+++ b/arch/arm/boot/dts/exynos5420-smdk5420.dts
@@ -111,7 +111,7 @@
 
 	display-timings {
 		native-mode = <&timing0>;
-		timing0: timing@0 {
+		timing0: timing {
 			clock-frequency = <50000>;
 			hactive = <2560>;
 			vactive = <1600>;
-- 
2.5.0
