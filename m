From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 39/50] ARM: dts: exynos: change parent and rate of
 bus_fsys_acp in Exynos5422
Date: Mon, 15 Jul 2019 14:44:06 +0200
Message-ID: <20190715124417.4787-40-l.luba@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124506eucas1p2b4e906a88978e3edd875e92b1a9fedc4@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The FSYS APB bus OPP table has been aligned to the new parent rate. This
patch sets the proper parent and picks the init frequency before the
devfreq governor starts working. It sets also parent rate (MPLL to
600MHz).

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
index 0e71ba64a4fe..6225d044d01c 100644
--- a/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroid-core.dtsi
@@ -67,6 +67,11 @@
 
 &bus_fsys_apb {
 	devfreq = <&bus_wcore>;
+	assigned-clocks = <&clock CLK_MOUT_PCLK200_FSYS>,
+			  <&clock CLK_DOUT_PCLK200_FSYS>,
+			  <&clock CLK_FOUT_MPLL>;
+	assigned-clock-parents = <&clock CLK_MOUT_SCLK_MPLL>;
+	assigned-clock-rates = <0>, <200000000>,<600000000>;
 	status = "okay";
 };
 
-- 
2.17.1
