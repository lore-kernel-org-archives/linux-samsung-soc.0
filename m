From: Lukasz Luba <l.luba@partner.samsung.com>
Subject: [PATCH v10 11/13] ARM: dts: exynos: add syscon to clock compatible
Date: Fri, 14 Jun 2019 11:53:07 +0200
Message-ID: <20190614095309.24100-12-l.luba@partner.samsung.com>
References: <20190614095309.24100-1-l.luba@partner.samsung.com>
        <CGME20190614095330eucas1p1e5a73f31251af7d16caf951054ec9def@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190614095309.24100-1-l.luba@partner.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: mturquette@baylibre.com, sboyd@kernel.org, b.zolnierkie@samsung.com, krzk@kernel.org, kgene@kernel.org, cw00.choi@samsung.com, kyungmin.park@samsung.com, m.szyprowski@samsung.com, s.nawrocki@samsung.com, myungjoo.ham@samsung.com, keescook@chromium.org, tony@atomide.com, jroedel@suse.de, treding@nvidia.com, digetx@gmail.com, gregkh@linuxfoundation.org, willy.mh.wolff.ml@gmail.com, Lukasz Luba <l.luba@partner.samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

In order to get the clock by phandle and use it with regmap it needs to be
compatible with syscon. The DMC driver uses two registers from clock
register set and needs the regmap of them.

Signed-off-by: Lukasz Luba <l.luba@partner.samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi | 2 +-
 arch/arm/boot/dts/exynos5800.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index 5fb2326875dc..d153617ff1a3 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -173,7 +173,7 @@
 		};
 
 		clock: clock-controller@10010000 {
-			compatible = "samsung,exynos5420-clock";
+			compatible = "samsung,exynos5420-clock", "syscon";
 			reg = <0x10010000 0x30000>;
 			#clock-cells = <1>;
 		};
diff --git a/arch/arm/boot/dts/exynos5800.dtsi b/arch/arm/boot/dts/exynos5800.dtsi
index 57d3b319fd65..0a2b3287ed92 100644
--- a/arch/arm/boot/dts/exynos5800.dtsi
+++ b/arch/arm/boot/dts/exynos5800.dtsi
@@ -17,7 +17,7 @@
 };
 
 &clock {
-	compatible = "samsung,exynos5800-clock";
+	compatible = "samsung,exynos5800-clock", "syscon";
 };
 
 &cluster_a15_opp_table {
-- 
2.17.1
