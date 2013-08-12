From: Padmavathi Venna <padma.v@samsung.com>
Subject: [PATCH V4 1/4] ARM: dts: exynos5420: add i2s controllers
Date: Mon, 12 Aug 2013 15:37:47 +0530
Message-ID: <1376302070-1877-2-git-send-email-padma.v@samsung.com>
References: <1376302070-1877-1-git-send-email-padma.v@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:47849 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755963Ab3HLKGi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 12 Aug 2013 06:06:38 -0400
In-reply-to: <1376302070-1877-1-git-send-email-padma.v@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, padma.v@samsung.com, padma.kvr@gmail.com
Cc: broonie@kernel.org, kgene.kim@samsung.com, tomasz.figa@gmail.com, abrestic@chromium.org

From: Andrew Bresticker <abrestic@chromium.org>

This adds device-tree bindings for the i2s controllers on Exynos 5420.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
Signed-off-by: Padmavathi Venna <padma.v@samsung.com>
Reviewed-on: https://gerrit.chromium.org/gerrit/57713
---
 arch/arm/boot/dts/exynos5420.dtsi |   32 ++++++++++++++++++++++++++++++++
 1 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index d2fdb87..8d57369 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -242,4 +242,36 @@
 		pinctrl-names = "default";
 		pinctrl-0 = <&i2c3_bus>;
 	};
+
+	i2s_0: i2s@03830000 {
+		compatible = "samsung,exynos5420-i2s";
+		dmas = <&adma 0
+			&adma 2
+			&adma 1>;
+		dma-names = "tx", "rx", "tx-sec";
+		clocks = <&clock_audss EXYNOS_I2S_BUS>,
+			<&clock_audss EXYNOS_I2S_BUS>,
+			<&clock_audss EXYNOS_SCLK_I2S>;
+		clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2s0_bus>;
+		status = "disabled";
+	};
+
+	i2s_1: i2s@12D60000 {
+		clocks = <&clock 275>, <&clock 138>;
+		clock-names = "iis", "i2s_opclk0";
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2s1_bus>;
+		status = "disabled";
+	};
+
+	i2s_2: i2s@12D70000 {
+		clocks = <&clock 276>, <&clock 139>;
+		clock-names = "iis", "i2s_opclk0";
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2s2_bus>;
+		status = "disabled";
+	};
+
 };
-- 
1.7.4.4
