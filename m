From: Joseph Kogut <joseph.kogut@gmail.com>
Subject: [PATCH v2 2/2] arm: dts: add ARM Mali GPU node for Odroid XU3
Date: Fri, 14 Jun 2019 16:57:19 -0700
Message-ID: <20190614235719.8134-1-joseph.kogut@gmail.com>
References: <20190614203144.3850-2-joseph.kogut@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190614203144.3850-2-joseph.kogut@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: robh+dt@kernel.org, mark.rutland@arm.com, kgene@kernel.org, krzk@kernel.org
Cc: Joseph Kogut <joseph.kogut@gmail.com>, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, airlied@linux.ie, dri-devel@lists.freedesktop.org, daniel@ffwll.ch, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Add device tree node for mali gpu on Odroid XU3 SoCs.

Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
---

Changes v1 -> v2:
- Use interrupt name ordering from binding doc
- Specify a single clock for GPU node
- Add gpu opp table
- Fix warnings from IRQ_TYPE_NONE

 .../boot/dts/exynos5422-odroidxu3-common.dtsi | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index 93a48f2dda49..b8a4246e3b37 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -48,6 +48,32 @@
 		cooling-levels = <0 130 170 230>;
 	};

+	gpu: gpu@11800000 {
+		compatible = "samsung,exynos-mali", "arm,mali-t628";
+		reg = <0x11800000 0x5000>;
+		interrupts = <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 74  IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "job", "mmu", "gpu";
+		clocks = <&clock CLK_G3D>;
+		mali-supply = <&buck4_reg>;
+		operating-points-v2 = <&gpu_opp_table>;
+	};
+
+	gpu_opp_table: gpu-opp-table {
+		compatible = "operating-points-v2";
+
+		opp-177000000 {
+			opp-hz = /bits/ 64 <117000000>;
+			opp-microvolt = <812500>;
+		};
+
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <1150000>;
+		};
+	};
+
 	thermal-zones {
 		cpu0_thermal: cpu0-thermal {
 			thermal-sensors = <&tmu_cpu0 0>;
--
2.22.0
