From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 42/50] ARM: dts: exynos: change parent and rate of
 bus_mscl in Exynos5422
Date: Mon, 15 Jul 2019 14:44:09 +0200
Message-ID: <20190715124417.4787-43-l.luba@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124508eucas1p2f2e09e296dd4ad97a52a2023ede8ae98@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The bus_mscl OPP table has been aligned to the new parent rate. This patch
sets the proper parents in the clock tree and picks the init frequency
before the devfreq governor starts working. It sets also parent rate (MPLL
to 600MHz).

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
index 198e33cf115f..990fe03fce75 100644
--- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
@@ -103,7 +103,8 @@
 &bus_gen {
 	devfreq = <&bus_wcore>;
 	assigned-clocks = <&clock CLK_MOUT_ACLK266>,
-			  <&clock CLK_DOUT_ACLK266>, <&clock CLK_FOUT_MPLL>;
+			  <&clock CLK_DOUT_ACLK266>,
+			  <&clock CLK_FOUT_MPLL>;
 	assigned-clock-parents = <&clock CLK_MOUT_SCLK_MPLL>;
 	assigned-clock-rates = <0>, <300000000>,<600000000>;
 	status = "okay";
@@ -155,6 +156,13 @@
 
 &bus_mscl {
 	devfreq = <&bus_wcore>;
+	assigned-clocks = <&clock CLK_MOUT_ACLK400_MSCL>,
+			  <&clock CLK_MOUT_SW_ACLK400_MSCL>,
+			  <&clock CLK_DOUT_ACLK400_MSCL>,
+			  <&clock CLK_FOUT_DPLL>;
+	assigned-clock-parents = <&clock CLK_MOUT_SCLK_DPLL>,
+				 <&clock CLK_DOUT_ACLK400_MSCL>;
+	assigned-clock-rates = <0>, <0>, <400000000>, <1200000000>;
 	status = "okay";
 };
 
-- 
2.17.1
