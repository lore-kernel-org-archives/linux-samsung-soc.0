From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH 4/5] ARM: dts: exynos: Add support ARM architected timers
Date: Fri, 15 Feb 2019 13:52:28 +0100
Message-ID: <20190215125229.30180-5-m.szyprowski@samsung.com>
References: <20190215125229.30180-1-m.szyprowski@samsung.com>
 <CGME20190215125240eucas1p277671ab6d0eb4d1102d3cddd6c61c255@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <20190215125229.30180-1-m.szyprowski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Daniel Lezcano <daniel.lezcano@linaro.org>, Krzysztof Kozlowski <krzk@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>, Thomas Gleixner <tglx@linutronix.de>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

All CortexA7/A15 based Exynos SoCs have ARM architected timers, so enable
support for them directly in the base dtsi for Exynos3250, Exynos5250
and Exynos54xx SoCs. None of the known firmware properly configures arch
timer registers, so mark them as not-fw-configured and set frequency
to 24MHz, which is the only configuration supported by the remaining
drivers (clocks) so far.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos3250.dtsi | 10 ++++++++++
 arch/arm/boot/dts/exynos5250.dtsi |  1 +
 arch/arm/boot/dts/exynos54xx.dtsi | 10 ++++++++++
 3 files changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/exynos3250.dtsi b/arch/arm/boot/dts/exynos3250.dtsi
index 608d17454179..3966e7960964 100644
--- a/arch/arm/boot/dts/exynos3250.dtsi
+++ b/arch/arm/boot/dts/exynos3250.dtsi
@@ -134,6 +134,16 @@
 			};
 		};
 
+		timer {
+			compatible = "arm,armv7-timer";
+			interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+				     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+				     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+				     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+			clock-frequency = <24000000>;
+			arm,cpu-registers-not-fw-configured;
+		};
+
 		sysram@2020000 {
 			compatible = "mmio-sram";
 			reg = <0x02020000 0x40000>;
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 80986b97dfe5..95af4050f69d 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -239,6 +239,7 @@
 			 * so we need the value from DT.
 			 */
 			clock-frequency = <24000000>;
+			arm,cpu-registers-not-fw-configured;
 		};
 
 		mct@101c0000 {
diff --git a/arch/arm/boot/dts/exynos54xx.dtsi b/arch/arm/boot/dts/exynos54xx.dtsi
index de26e5ee0d2d..45e06717ee51 100644
--- a/arch/arm/boot/dts/exynos54xx.dtsi
+++ b/arch/arm/boot/dts/exynos54xx.dtsi
@@ -46,6 +46,16 @@
 			status = "disabled";
 		};
 
+		timer {
+			compatible = "arm,armv7-timer";
+			interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+				     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+				     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+				     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+			arm,cpu-registers-not-fw-configured;
+			clock-frequency = <24000000>;
+		};
+
 		sysram@2020000 {
 			compatible = "mmio-sram";
 			reg = <0x02020000 0x54000>;
-- 
2.17.1
