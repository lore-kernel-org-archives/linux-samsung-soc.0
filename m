From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH v2 2/3] ARM: dts: exynos: Update I2S0 device node in
 exynos5433.dtsi
Date: Thu, 08 Feb 2018 19:44:07 +0100
Message-ID: <20180208184408.24185-2-s.nawrocki@samsung.com>
References: <20180208184408.24185-1-s.nawrocki@samsung.com>
        <CGME20180208184442epcas1p1c207d993f6f028fb954476a781757479@epcas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:10636 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751094AbeBHSop (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 8 Feb 2018 13:44:45 -0500
In-reply-to: <20180208184408.24185-1-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: krzk@kernel.org
Cc: kgene@kernel.org, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, jcsing.lee@samsung.com, linux-arm-kernel@lists.infradead.org, b.zolnierkie@samsung.com, m.szyprowski@samsung.com, Sylwester Nawrocki <s.nawrocki@samsung.com>

The i2s0 node name is changed to a more generic "i2s" and missing
(optional) properties are added. The #sound-dai-cells property is
required for HDMI audio support on TM2 board.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos5433.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos5433.dtsi b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
index 3845a8de7a42..2b73bd86bc56 100644
--- a/arch/arm64/boot/dts/exynos/exynos5433.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos5433.dtsi
@@ -1658,7 +1658,7 @@
 				power-domains = <&pd_aud>;
 			};
 
-			i2s0: i2s0@11440000 {
+			i2s0: i2s@11440000 {
 				compatible = "samsung,exynos7-i2s";
 				reg = <0x11440000 0x100>;
 				dmas = <&adma 0 &adma 2>;
@@ -1670,9 +1670,11 @@
 					<&cmu_aud CLK_SCLK_AUD_I2S>,
 					<&cmu_aud CLK_SCLK_I2S_BCLK>;
 				clock-names = "iis", "i2s_opclk0", "i2s_opclk1";
+				#clock-cells = <1>;
 				pinctrl-names = "default";
 				pinctrl-0 = <&i2s0_bus>;
 				power-domains = <&pd_aud>;
+				#sound-dai-cells = <1>;
 				status = "disabled";
 			};
 
-- 
2.14.2
