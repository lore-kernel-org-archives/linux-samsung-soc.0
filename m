From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 45/50] ARM: dts: exynos: change rate of bus_disp1_fimd in
 Exynos5422
Date: Mon, 15 Jul 2019 14:44:12 +0200
Message-ID: <20190715124417.4787-46-l.luba@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124511eucas1p2b11ef3a5bc093e686ae5450d16785225@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The bus_disp1_fimd OPP table has been aligned to the new parent rate. This
patch sets the proper frequency before the devfreq governor starts working.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
index 27f6ed323ba1..2cfe1effe290 100644
--- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
@@ -143,6 +143,8 @@
 
 &bus_disp1_fimd {
 	devfreq = <&bus_wcore>;
+	assigned-clocks = <&clock CLK_DOUT_ACLK300_DISP1>;
+	assigned-clock-rates = <300000000>;
 	status = "okay";
 };
 
-- 
2.17.1
