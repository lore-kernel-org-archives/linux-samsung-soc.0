From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v3 1/3] ARM: dts: exynos: Add I2S1 device node to
 exynos5433.dtsi
Date: Mon, 12 Feb 2018 17:31:45 +0100
Message-ID: <20180212163147.11561-1-s.nawrocki@samsung.com>
References: <CGME20180212163202epcas2p3acceac29dd61f37d80f50cf2640d4686@epcas2p3.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:36454 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S964902AbeBLQcF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 12 Feb 2018 11:32:05 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: krzk@kernel.org
Cc: kgene@kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, jcsing.lee@samsung.com, linux-arm-kernel@lists.infradead.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

Add DT node for the second I2S controller available
on Exynos 5433 SoC.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
Changes since v2:
 - none.
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 62f276970174..3845a8de7a42 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -1311,6 +1311,25 @@
 			status = "disabled";
 		};
 
+		i2s1: i2s@14d60000 {
+			compatible = "samsung,exynos7-i2s";
+			reg = <0x14d60000 0x100>;
+			dmas = <&pdma0 31 &pdma0 30>;
+			dma-names = "tx", "rx";
+			interrupts = <GIC_SPI 435 IRQ_TYPE_NONE>;
+			clocks = <&cmu_peric CLK_PCLK_I2S1>,
+				 <&cmu_peric CLK_PCLK_I2S1>,
+				 <&cmu_peric CLK_SCLK_I2S1>;
+			clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
+			#clock-cells = <1>;
+			samsung,supports-6ch;
+			samsung,supports-rstclr;
+			samsung,supports-tdm;
+			samsung,supports-low-rfs;
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
 		pwm: pwm@14dd0000 {
 			compatible = "samsung,exynos4210-pwm";
 			reg = <0x14dd0000 0x100>;
-- 
2.14.2
