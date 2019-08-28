From: Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v3 1/2] ARM: dts: exynos: Add support ARM architected timers
 on Exynos5
Date: Wed, 28 Aug 2019 14:10:04 +0200
Message-ID: <20190828121005.29368-2-m.szyprowski@samsung.com>
References: <20190828121005.29368-1-m.szyprowski@samsung.com>
 <CGME20190828121012eucas1p10bac7ebb742d968bca251f21dd3aad11@eucas1p1.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190828121005.29368-1-m.szyprowski@samsung.com>
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
Cc: Chanwoo Choi <cw00.choi@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marc Zyngier <maz@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
List-Id: linux-samsung-soc@vger.kernel.org

All CortexA7/A15 based Exynos5 SoCs have ARM architected timers, so enable
support for them directly in the base dtsi. None of the known firmware
properly configures CNTFRQ arch timer register, so force clock frequency
to 24MHz, which is the only configuration supported by the remaining
clock drivers so far.

Stock firmware for Peach Pit and Pi Chromebooks also doesn't reset
properly other arch timer registers, so add respective properties
indicating that. Other Exynos5-based boards behaves correctly in this area,
what finally allows to enable support for KVM-based virtualization.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
---
 arch/arm/boot/dts/exynos5420-peach-pit.dts | 4 ++++
 arch/arm/boot/dts/exynos54xx.dtsi          | 9 +++++++++
 arch/arm/boot/dts/exynos5800-peach-pi.dts  | 4 ++++
 3 files changed, 17 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420-peach-pit.dts b/arch/arm/boot/dts/exynos5420-peach-pit.dts
index f78db6809cca..77e08a4c7300 100644
--- a/arch/arm/boot/dts/exynos5420-peach-pit.dts
+++ b/arch/arm/boot/dts/exynos5420-peach-pit.dts
@@ -1064,6 +1064,10 @@
 	status = "okay";
 };
 
+&timer {
+	arm,cpu-registers-not-fw-configured;
+};
+
 &tmu_cpu0 {
 	vtmu-supply = <&ldo10_reg>;
 };
diff --git a/arch/arm/boot/dts/exynos54xx.dtsi b/arch/arm/boot/dts/exynos54xx.dtsi
index 9c3b63b7cac6..02d34957cd83 100644
--- a/arch/arm/boot/dts/exynos54xx.dtsi
+++ b/arch/arm/boot/dts/exynos54xx.dtsi
@@ -45,6 +45,15 @@
 		status = "disabled";
 	};
 
+	timer: timer {
+		compatible = "arm,armv7-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
+		clock-frequency = <24000000>;
+	};
+
 	soc: soc {
 		sysram@2020000 {
 			compatible = "mmio-sram";
diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
index e0f470fe54c8..5e8cec736444 100644
--- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
+++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
@@ -1033,6 +1033,10 @@
 	status = "okay";
 };
 
+&timer {
+	arm,cpu-registers-not-fw-configured;
+};
+
 &tmu_cpu0 {
 	vtmu-supply = <&ldo10_reg>;
 };
-- 
2.17.1
