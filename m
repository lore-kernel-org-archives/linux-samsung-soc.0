From: Guillaume GARDET <guillaume.gardet@free.fr>
Subject: [PATCH] arm: dts: exynos: Add GPU/Mali T604 node to exynos5250
Date: Wed, 24 Jul 2019 09:20:08 +0200
Message-ID: <20190724072008.6272-1-guillaume.gardet@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>, Guillaume GARDET <guillaume.gardet@arm.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Guillaume GARDET <guillaume.gardet@arm.com>

Add nodes for GPU (Mali T604) to Exynos5250, disabled by default.
Tested with kmscube on Chromebook snow.

Signed-off-by: Guillaume GARDET <guillaume.gardet@arm.com>

Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org

---
 arch/arm/boot/dts/exynos5250.dtsi | 47 +++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index d5e0392b409e..5ce4b2853cf2 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -1097,6 +1097,53 @@
 		 */
 		clock-frequency = <24000000>;
 	};
+
+	mali: gpu@0x11800000 {
+		compatible = "samsung,exynos5250-mali", "arm,mali-t604";
+		reg = <0x11800000 0x5000>;
+		interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+		             <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "job", "mmu", "gpu";
+		clocks = <&clock CLK_G3D>;
+		clock-names = "g3d";
+		operating-points-v2 = <&gpu_opp_table>;
+		power-domains = <&pd_g3d>;
+		status = "disabled";
+	};
+
+	gpu_opp_table: gpu-opp-table {
+		compatible = "operating-points-v2";
+
+		opp-100000000 {
+			opp-hz = /bits/ 64 <100000000>;
+			opp-microvolt = <925000>;
+		};
+		opp-160000000 {
+			opp-hz = /bits/ 64 <160000000>;
+			opp-microvolt = <925000>;
+		};
+		opp-266000000 {
+			opp-hz = /bits/ 64 <266000000>;
+			opp-microvolt = <1025000>;
+		};
+		opp-350000000 {
+			opp-hz = /bits/ 64 <350000000>;
+			opp-microvolt = <1075000>;
+		};
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+			opp-microvolt = <1125000>;
+		};
+		opp-450000000 {
+			opp-hz = /bits/ 64 <450000000>;
+			opp-microvolt = <1150000>;
+		};
+		opp-533000000 {
+			opp-hz = /bits/ 64 <533000000>;
+			opp-microvolt = <1250000>;
+		};
+	};
 };
 
 &dp {
-- 
2.22.0
