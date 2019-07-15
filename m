From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 41/50] ARM: dts: exynos: change parent and rate of
 bus_g2d in Exynos5422
Date: Mon, 15 Jul 2019 14:44:08 +0200
Message-ID: <20190715124417.4787-42-l.luba@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124508eucas1p2b66d72b7eadd7428063387c6881aca64@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The bus_g2d OPP table has been aligned to the new parent rate. This patch
sets the proper parent and picks the init frequency before the devfreq
governor starts working. It sets also parent rate (MPLL to 600MHz).

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
index 75664ff6d966..198e33cf115f 100644
--- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
@@ -116,6 +116,10 @@
 
 &bus_g2d {
 	devfreq = <&bus_wcore>;
+	assigned-clocks = <&clock CLK_MOUT_ACLK266_G2D>,
+			  <&clock CLK_DOUT_ACLK266_G2D>, <&clock CLK_FOUT_MPLL>;
+	assigned-clock-parents = <&clock CLK_MOUT_SCLK_MPLL>;
+	assigned-clock-rates = <0>, <300000000>,<600000000>;
 	status = "okay";
 };
 
-- 
2.17.1
