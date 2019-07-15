From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 46/50] ARM: dts: exynos: change rates of bus_disp1 in
 Exynos5422
Date: Mon, 15 Jul 2019 14:44:13 +0200
Message-ID: <20190715124417.4787-47-l.luba@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124512eucas1p1bd847805f945ada00f2b7952592cc104@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The bus_disp1 OPP table has been aligned to the new parent rate. This patch
sets the proper frequencies before the devfreq governor starts working. It
sets 200MHz to bus ACLK_200_DISP1 which is controlled via CLK_DOUT_ACLK200
and 400MHz to ACLK400_DISP1 which is controlled via CLK_DOUT_ACLK400_DISP1.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
index 2cfe1effe290..fac5659516ad 100644
--- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
@@ -150,6 +150,9 @@
 
 &bus_disp1 {
 	devfreq = <&bus_wcore>;
+	assigned-clocks = <&clock CLK_DOUT_ACLK200>,
+			  <&clock CLK_DOUT_ACLK400_DISP1>;
+	assigned-clock-rates = <200000000>, <400000000>;
 	status = "okay";
 };
 
-- 
2.17.1
