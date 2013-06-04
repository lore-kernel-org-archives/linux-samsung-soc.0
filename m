From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V5 4/5] ARM: dts: add clock provider information for i2s
 controllers in Exynos5250
Date: Tue, 04 Jun 2013 17:58:09 +0530
Message-ID: <1370348890-6645-5-git-send-email-padma.v@samsung.com>
References: <1370348890-6645-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:50763 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752783Ab3FDMav (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 4 Jun 2013 08:30:51 -0400
Received: from epcpsbgr3.samsung.com
 (u143.gpu120.samsung.co.kr [203.254.230.143])
 by mailout4.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MNV00958C3EV801@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 04 Jun 2013 21:30:50 +0900 (KST)
In-reply-to: <1370348890-6645-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: sbkim73@samsung.com, broonie@kernel.org, kgene.kim@samsung.com, mturquette@linaro.org

Add clock lookup information for i2s controllers on exynos5250 SoC.

Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
Reviewed-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 388983e..1e62ca9 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -20,6 +20,8 @@
 #include "skeleton.dtsi"
 #include "exynos5250-pinctrl.dtsi"
 
+#include <dt-bindings/clk/exynos-audss-clk.h>
+
 / {
 	compatible = "samsung,exynos5250";
 	interrupt-parent = <&gic>;
@@ -457,6 +459,10 @@
 			&pdma0 9
 			&pdma0 8>;
 		dma-names = "tx", "rx", "tx-sec";
+		clocks = <&clock_audss EXYNOS_I2S_BUS>,
+			<&clock_audss EXYNOS_I2S_BUS>,
+			<&clock_audss EXYNOS_SCLK_I2S>;
+		clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
 		samsung,supports-6ch;
 		samsung,supports-rstclr;
 		samsung,supports-secdai;
@@ -471,6 +477,8 @@
 		dmas = <&pdma1 12
 			&pdma1 11>;
 		dma-names = "tx", "rx";
+		clocks = <&clock 307>;
+		clock-names = "iis";
 		pinctrl-names = "default";
 		pinctrl-0 = <&i2s1_bus>;
 	};
@@ -481,6 +489,8 @@
 		dmas = <&pdma0 12
 			&pdma0 11>;
 		dma-names = "tx", "rx";
+		clocks = <&clock 308>;
+		clock-names = "iis";
 		pinctrl-names = "default";
 		pinctrl-0 = <&i2s2_bus>;
 	};
-- 
1.7.4.4
