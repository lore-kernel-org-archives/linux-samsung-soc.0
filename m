From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 30/50] ARM: dts: exynos: add bus_isp266 into Exynos5800
Date: Mon, 15 Jul 2019 14:43:57 +0200
Message-ID: <20190715124417.4787-31-l.luba@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124458eucas1p2df56f2e0c7a1a0a9144a4d5fbdb471a9@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The Exynos5420 SoC had one clock for two lines while Exynos5422/5800 have
dedicated clock tree for the ACLK266_ISP. The max frequency is 300MHz so
it shares the OPP table with bus_gen. The bus is added here and is enabled
in .dts file for proper board.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 arch/arm/boot/dts/exynos5800.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5800.dtsi b/arch/arm/boot/dts/exynos5800.dtsi
index 57d3b319fd65..3b9200db43b6 100644
--- a/arch/arm/boot/dts/exynos5800.dtsi
+++ b/arch/arm/boot/dts/exynos5800.dtsi
@@ -131,3 +131,13 @@
 &mfc {
 	compatible = "samsung,mfc-v8";
 };
+
+&soc {
+		bus_isp266: bus_isp266 {
+			compatible = "samsung,exynos-bus";
+			clocks = <&clock CLK_DOUT_ACLK266_ISP>;
+			clock-names = "bus";
+			operating-points-v2 = <&bus_gen_opp_table>;
+			status = "disabled";
+		};
+};
-- 
2.17.1
