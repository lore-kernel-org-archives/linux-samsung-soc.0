From: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [RFT 03/10] ARM: dts: exynos: Fix language typo and indentation
Date: Tue, 18 Jun 2019 21:05:27 +0200
Message-ID: <20190618190534.4951-4-krzk@kernel.org>
References: <20190618190534.4951-1-krzk@kernel.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190618190534.4951-1-krzk@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Kukjin Kim <kgene@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Chanwoo Choi <cw00.choi@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Olof Johansson <olof@lixom.net>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Inki Dae <inki.dae@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>
List-Id: linux-samsung-soc@vger.kernel.org

Correct language typo and wrong indentation.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/arm/boot/dts/exynos4210.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index b491c345b2e8..ea0e043cd2b4 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -8,7 +8,7 @@
  *		www.linaro.org
  *
  * Samsung's Exynos4210 SoC device nodes are listed in this file. Exynos4210
- * based board files can include this file and provide values for board specfic
+ * based board files can include this file and provide values for board specific
  * bindings.
  *
  * Note: This file does not include device nodes for all the controllers in
@@ -381,13 +381,13 @@
 
 			trips {
 				cpu_alert0: cpu-alert-0 {
-				temperature = <85000>; /* millicelsius */
+					temperature = <85000>; /* millicelsius */
 				};
 				cpu_alert1: cpu-alert-1 {
-				temperature = <100000>; /* millicelsius */
+					temperature = <100000>; /* millicelsius */
 				};
 				cpu_alert2: cpu-alert-2 {
-				temperature = <110000>; /* millicelsius */
+					temperature = <110000>; /* millicelsius */
 				};
 			};
 		};
-- 
2.17.1
