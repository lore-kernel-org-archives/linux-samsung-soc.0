From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 38/50] ARM: dts: exynos: change parent and rate of
 bus_fsys2 in Exynos5422
Date: Mon, 15 Jul 2019 14:44:05 +0200
Message-ID: <20190715124417.4787-39-l.luba@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124505eucas1p14e68a537cb53cda2cfd832e59425cd25@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The FSYS2 bus OPP table has been aligned to the new parent rate.  The OPP
table is also shared with bus_fsys. This patch sets the proper parent and
picks the init frequency before the devfreq governor starts working. It
sets also parent rate (DPLL to 1200MHz).

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
index 6a82dd175b8a..0e71ba64a4fe 100644
--- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
@@ -82,6 +82,11 @@
 
 &bus_fsys2 {
 	devfreq = <&bus_wcore>;
+	assigned-clocks = <&clock CLK_MOUT_ACLK200_FSYS2>,
+			  <&clock CLK_DOUT_ACLK200_FSYS2>,
+			  <&clock CLK_FOUT_DPLL>;
+	assigned-clock-parents = <&clock CLK_MOUT_SCLK_DPLL>;
+	assigned-clock-rates = <0>, <240000000>,<1200000000>;
 	status = "okay";
 };
 
-- 
2.17.1
