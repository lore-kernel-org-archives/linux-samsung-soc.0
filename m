From: Beata Michalska <b.michalska@samsung.com>
Subject: [PATCH 2/2] ARM: dts: exynos3250: Add assigned clock parents to CMU
 node
Date: Mon, 02 Mar 2015 14:17:30 +0100
Message-ID: <1425302250-13446-3-git-send-email-b.michalska@samsung.com>
References: <1425302250-13446-1-git-send-email-b.michalska@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1425302250-13446-1-git-send-email-b.michalska@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: s.nawrocki@samsung.com, tomasz.figa@gmail.com, mturquette@linaro.org, kgene@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, sw0312.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Use assigned-clocks/assigned-clock-parents properties for
CMU clock controller DT node to secure proper clock setup:
switching the two muxes to root oscillator clock is not only
required for proper powering down the ISP power domain,
but it also reduces the risk of accessing the ISP CMU
registers while the ISP power domain remains turned off
(i.e. through the common clock framework by clk_summary)

Signed-off-by: Beata Michalska <b.michalska@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos3250.dtsi |    4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 277b48b..6d6118e 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -172,6 +172,10 @@
 			compatible = "samsung,exynos3250-cmu";
 			reg = <0x10030000 0x20000>;
 			#clock-cells = <1>;
+			assigned-clocks = <&cmu CLK_MOUT_ACLK_400_MCUISP_SUB>,
+					  <&cmu CLK_MOUT_ACLK_266_SUB>;
+			assigned-clock-parents = <&cmu CLK_FIN_PLL>,
+						 <&cmu CLK_FIN_PLL>;
 		};
 
 		cmu_dmc: clock-controller@105C0000 {
-- 
1.7.9.5
