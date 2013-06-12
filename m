From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V6 4/6] ARM: dts: add clock provider information for i2s
 controllers in Exynos5250
Date: Wed, 12 Jun 2013 13:37:41 +0530
Message-ID: <1371024463-303-5-git-send-email-padma.v@samsung.com>
References: <1371024463-303-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:9519 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751545Ab3FLIEI (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 12 Jun 2013 04:04:08 -0400
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MO9004T0T2QGKL0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 12 Jun 2013 17:04:07 +0900 (KST)
In-reply-to: <1371024463-303-1-git-send-email-padma.v@samsung.com>
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
index 84edf42..0aa9091 100644
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
+		clocks = <&clock 307>, <&clock 157>;
+		clock-names = "iis", "i2s_opclk0";
 		pinctrl-names = "default";
 		pinctrl-0 = <&i2s1_bus>;
 	};
@@ -481,6 +489,8 @@
 		dmas = <&pdma0 12
 			&pdma0 11>;
 		dma-names = "tx", "rx";
+		clocks = <&clock 308>, <&clock 158>;
+		clock-names = "iis", "i2s_opclk0";
 		pinctrl-names = "default";
 		pinctrl-0 = <&i2s2_bus>;
 	};
-- 
1.7.4.4
