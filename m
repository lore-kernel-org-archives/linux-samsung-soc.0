From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 50/50] ARM: dts: exynos: change MMC0 clock parent in
 Exynos5800 Peach Pi
Date: Mon, 15 Jul 2019 14:44:17 +0200
Message-ID: <20190715124417.4787-51-l.luba@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124515eucas1p240a8c61dd62d56cbbd0e4d313be2273e@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Change MMC0 clock settings and set parent to MOUT_SPLL with proper rate.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 arch/arm/boot/dts/exynos5800-peach-pi.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index 38edb00c7f1b..c8e02ecc6627 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -891,6 +891,9 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&sd2_clk &sd2_cmd &sd2_cd &sd2_bus1 &sd2_bus4>;
 	bus-width = <4>;
+	assigned-clocks = <&clock CLK_MOUT_MMC0>, <&clock CLK_FOUT_SPLL>;
+	assigned-clock-parents = <&clock CLK_MOUT_SCLK_SPLL>;
+	assigned-clock-rates = <0>, <800000000>;
 };
 
 &nocp_mem0_0 {
-- 
2.17.1
