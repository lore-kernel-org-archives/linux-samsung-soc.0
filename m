From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 25/50] ARM: dts: exynos: add 300MHz to bus_disp1_fimd in
 Exynos5420
Date: Mon, 15 Jul 2019 14:43:52 +0200
Message-ID: <20190715124417.4787-26-l.luba@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124454eucas1p1cd37552b222539b02629cb52e646ae29@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

According to the documentation max frequency for ACLK300_DISP1 is 300MHz.
Add an OPP which makes it possible to use the full performance when needed.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 74d014f3eaa6..1097fa758d9e 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -1299,6 +1299,9 @@
 			opp01 {
 				opp-hz = /bits/ 64 <200000000>;
 			};
+			opp02 {
+				opp-hz = /bits/ 64 <300000000>;
+			};
 		};
 
 		bus_disp1_opp_table: opp_table14 {
-- 
2.17.1
