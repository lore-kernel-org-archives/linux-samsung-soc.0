From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v1 34/50] ARM: dts: exynos: set parent clocks to PWM in
 Exynos5420
Date: Mon, 15 Jul 2019 14:44:01 +0200
Message-ID: <20190715124417.4787-35-l.luba@partner.samsung.com>
References: <20190715124417.4787-1-l.luba@partner.samsung.com>
        <CGME20190715124502eucas1p20a35f8c0f426878e50583fa3402de988@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190715124417.4787-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, mark.rutland@arm.com, robh+dt@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, a.hajda@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

Change the parent of PWM clock to the CPLL which has 666MHz.
The PWM's divider uses /10 rate so it would set 66.6MHz.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 79f635043247..a361dd5a6036 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -1473,6 +1473,8 @@
 
 &pwm {
 	clocks = <&clock CLK_PWM>;
+	assigned-clocks = <&clock CLK_MOUT_PWM>;
+	assigned-clock-parents = <&clock CLK_MOUT_SCLK_CPLL>;
 	clock-names = "timers";
 };
 
-- 
2.17.1
