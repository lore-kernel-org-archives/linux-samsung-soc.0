From: Guillaume Gardet <guillaume.gardet@arm.com>
Subject: [PATCH V3 2/5] arm: dts: exynos: Add GPU/Mali T604 node to exynos5250
Date: Fri, 30 Aug 2019 12:44:59 +0200
Message-ID: <20190830104502.7128-3-guillaume.gardet@arm.com>
References: <20190725083433.6505-1-guillaume.gardet@arm.com>
 <20190830104502.7128-1-guillaume.gardet@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190830104502.7128-1-guillaume.gardet@arm.com>
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
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>, Guillaume Gardet <guillaume.gardet@arm.com>
List-Id: linux-samsung-soc@vger.kernel.org

Add nodes for GPU (Mali T604) to Exynos5250.

Signed-off-by: Guillaume Gardet <guillaume.gardet@arm.com>

Cc: Kukjin Kim <kgene@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org
---
V3 changes:
  * change clock name from 'g3d' to 'core'
  * disable node by default in exynos5250.dtsi
  * move dt-bindings before node addition in device tree

V2 changes: 
  * move mali node as /soc sub-node
  * move gpu_opp_table as mali sub-node
  * minor style updates
  * test on arndale board
  * enable by default
  * add dt bindings, in a separate patch

 arch/arm/boot/dts/exynos5250.dtsi | 47 +++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index d5e0392b409e..05b4d8755cfa 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -328,6 +328,53 @@
 			iommus = <&sysmmu_rotator>;
 		};
 
+		mali: gpu@11800000 {
+			compatible = "samsung,exynos5250-mali", "arm,mali-t604";
+			reg = <0x11800000 0x5000>;
+			interrupts = <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "job", "mmu", "gpu";
+			clocks = <&clock CLK_G3D>;
+			clock-names = "core";
+			operating-points-v2 = <&gpu_opp_table>;
+			power-domains = <&pd_g3d>;
+			status = "disabled";
+
+			gpu_opp_table: gpu-opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					opp-microvolt = <925000>;
+				};
+				opp-160000000 {
+					opp-hz = /bits/ 64 <160000000>;
+					opp-microvolt = <925000>;
+				};
+				opp-266000000 {
+					opp-hz = /bits/ 64 <266000000>;
+					opp-microvolt = <1025000>;
+				};
+				opp-350000000 {
+					opp-hz = /bits/ 64 <350000000>;
+					opp-microvolt = <1075000>;
+				};
+				opp-400000000 {
+					opp-hz = /bits/ 64 <400000000>;
+					opp-microvolt = <1125000>;
+				};
+				opp-450000000 {
+					opp-hz = /bits/ 64 <450000000>;
+					opp-microvolt = <1150000>;
+				};
+				opp-533000000 {
+					opp-hz = /bits/ 64 <533000000>;
+					opp-microvolt = <1250000>;
+				};
+			};
+		};
+
 		tmu: tmu@10060000 {
 			compatible = "samsung,exynos5250-tmu";
 			reg = <0x10060000 0x100>;
-- 
2.22.1
