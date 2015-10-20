From: Alim Akhtar <alim.akhtar@samsung.com>
Subject: [PATCH v2 2/6] arm: dts: Add syscon-{reboot,
 poweroff} nodes for exynos4
Date: Tue, 20 Oct 2015 14:54:41 +0530
Message-ID: <1445333085-22837-3-git-send-email-alim.akhtar@samsung.com>
References: <1445333085-22837-1-git-send-email-alim.akhtar@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:47879 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753726AbbJTJew (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 20 Oct 2015 05:34:52 -0400
In-reply-to: <1445333085-22837-1-git-send-email-alim.akhtar@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene@kernel.org, k.kozlowski@samsung.com, javier@osg.samsung.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org

This patch adds syscon-{reboot, poweroff} nodes to allow the
generic syscon-{reboot, poweroff} driver to reset/poweroff exynos4 SoC.

Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Reviewed-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
Tested-by: Tobias Jakobi <tjakobi@math.uni-bielefeld.de>
Acked-by: Moritz Fischer <moritz.fischer@ettus.com>
---
 arch/arm/boot/dts/exynos4.dtsi |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/exynos4.dtsi b/arch/arm/boot/dts/exynos4.dtsi
index 98c0a368b777..1622f487e269 100644
--- a/arch/arm/boot/dts/exynos4.dtsi
+++ b/arch/arm/boot/dts/exynos4.dtsi
@@ -158,6 +158,20 @@
 		interrupt-parent = <&gic>;
 	};
 
+	poweroff: syscon-poweroff {
+		compatible = "syscon-poweroff";
+		regmap = <&pmu_system_controller>;
+		offset = <0x330C>; /* PS_HOLD_CONTROL */
+		mask = <0x5200>; /* reset value */
+	};
+
+	reboot: syscon-reboot {
+		compatible = "syscon-reboot";
+		regmap = <&pmu_system_controller>;
+		offset = <0x0400>; /* SWRESET */
+		mask = <0x1>;
+	};
+
 	dsi_0: dsi@11C80000 {
 		compatible = "samsung,exynos4210-mipi-dsi";
 		reg = <0x11C80000 0x10000>;
-- 
1.7.10.4
