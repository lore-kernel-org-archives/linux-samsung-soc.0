From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 26/50] ARM: dts: exynos: align NOC100 bus OPPs in
 Exynos5420
Date: Mon, 15 Jul 2019 14:43:53 +0200
Message-ID: <20190715124417.4787-27-l.luba@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124455eucas1p13bfc0c1d113225db9607e4c0dbac353c@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

The NOC100 has a parent which clock rate is set tot 400MHz. The OPPs which
are not possible to set are removed and new one is added.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 1097fa758d9e..f8c36ff0d4c3 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -1135,12 +1135,9 @@
 				opp-hz = /bits/ 64 <67000000>;
 			};
 			opp01 {
-				opp-hz = /bits/ 64 <75000000>;
+				opp-hz = /bits/ 64 <80000000>;
 			};
 			opp02 {
-				opp-hz = /bits/ 64 <86000000>;
-			};
-			opp03 {
 				opp-hz = /bits/ 64 <100000000>;
 			};
 		};
-- 
2.17.1
