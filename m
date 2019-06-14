From: Joseph Kogut <joseph.kogut@gmail.com>
Subject: [PATCH 2/2] arm: dts: add ARM Mali GPU node for Odroid XU3
Date: Fri, 14 Jun 2019 13:31:44 -0700
Message-ID: <20190614203144.3850-2-joseph.kogut@gmail.com>
References: <20190614203144.3850-1-joseph.kogut@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190614203144.3850-1-joseph.kogut@gmail.com>
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
 .../boot/dts/exynos5422-odroidxu3-common.dtsi  | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
index 93a48f2dda49..1f2ae19d01af 100644
--- a/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
+++ b/arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi
@@ -48,6 +48,24 @@
 		cooling-levels = <0 130 170 230>;
 	};
 
+	gpu: gpu@11800000 {
+		compatible = "samsung,exynos-mali", "arm,mali-t628";
+		reg = <0x11800000 0x5000>;
+		interrupts = <0 117 0>,
+			     <0 219 0>,
+			     <0 74  0>;
+		interrupt-names = "gpu", "job", "mmu";
+		clocks = <&clock CLK_G3D>,
+			 <&clock CLK_DOUT_ACLK_G3D>,
+			 <&clock CLK_FOUT_VPLL>;
+		mali-supply = <&buck4_reg>;
+		operating-points = <
+			/* KHz  uV   */
+			600000  1150000
+			177000  812500
+		>;
+	};
+
 	thermal-zones {
 		cpu0_thermal: cpu0-thermal {
 			thermal-sensors = <&tmu_cpu0 0>;
-- 
2.22.0
