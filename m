From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 36/50] ARM: dts: exynos: change ACLK100_NOC config in
 Exynos5422
Date: Mon, 15 Jul 2019 14:44:03 +0200
Message-ID: <20190715124417.4787-37-l.luba@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124503eucas1p1d41112e5c10c4fd21c7aada7bdf8e513@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

This patch changes NOC100 bus to proper parent and proper rate. The OPPs
have been align to reflect this parent and its clock rate.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
index aaf18653d8ac..d460041f716c 100644
--- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
@@ -58,6 +58,10 @@
 
 &bus_noc {
 	devfreq = <&bus_wcore>;
+	assigned-clocks = <&clock CLK_MOUT_ACLK100_NOC>,
+			  <&clock CLK_DOUT_ACLK100_NOC>;
+	assigned-clock-parents = <&clock CLK_FF_DOUT_SPLL2>;
+	assigned-clock-rates = <0>, <100000000>;
 	status = "okay";
 };
 
-- 
2.17.1
