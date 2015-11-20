From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v3 4/5] arm: dts: Add syscon-{reboot,
 poweroff} nodes for exynos5410 SoC
Date: Fri, 20 Nov 2015 10:47:08 +0530
Message-ID: <1447996629-18232-5-git-send-email-alim.akhtar@samsung.com>
References: <1447996629-18232-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:54003 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751298AbbKTFVE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 20 Nov 2015 00:21:04 -0500
In-reply-to: <1447996629-18232-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: k.kozlowski@samsung.com, kgene@kernel.org, javier@osg.samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, m.reichl@fivetechno.de, tjakobi@math.uni-bielefeld.de, ulf.hansson@linaro.org

This patch adds syscon-{reboot, poweroff} nodes to allow the
generic syscon-{reboot, poweroff} driver to reset/poweroff exynos5410 SoC.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Reviewed-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Acked-by: Moritz Fischer <moritz.fischer@ettus.com>
---
 arch/arm/boot/dts/exynos5410.dtsi |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5410.dtsi b/arch/arm/boot/dts/exynos5410.dtsi
index 731eefd23fa9..fad0779b1b6e 100644
--- a/arch/arm/boot/dts/exynos5410.dtsi
+++ b/arch/arm/boot/dts/exynos5410.dtsi
@@ -102,6 +102,20 @@
 			reg = <0x10040000 0x5000>;
 		};
 
+		poweroff: syscon-poweroff {
+			compatible = "syscon-poweroff";
+			regmap = <&pmu_system_controller>;
+			offset = <0x330C>; /* PS_HOLD_CONTROL */
+			mask = <0x5200>; /* reset value */
+		};
+
+		reboot: syscon-reboot {
+			compatible = "syscon-reboot";
+			regmap = <&pmu_system_controller>;
+			offset = <0x0400>; /* SWRESET */
+			mask = <0x1>;
+		};
+
 		mct: mct@101C0000 {
 			compatible = "samsung,exynos4210-mct";
 			reg = <0x101C0000 0xB00>;
-- 
1.7.10.4
