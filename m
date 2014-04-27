From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [RFC v3 PATCH 16/16] ARM: dts: exynos5420: add dsi node
Date: Sun, 27 Apr 2014 10:50:12 +0900
Message-ID: <1398563412-21781-17-git-send-email-yj44.cho@samsung.com>
References: <1398563412-21781-1-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1398563412-21781-1-git-send-email-yj44.cho@samsung.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: airlied@linux.ie, dri-devel@lists.freedesktop.org
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, laurent.pinchart@ideasonboard.com, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds common part of dsi node.

Changelog v2:
- Uses clock macros instead of numbers (commented by Sachin Kamat)

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Acked-by: Inki Dae <inki.dae@samsung.com>
Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi |   15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index f0184c7..f1030f5 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -17,6 +17,7 @@
 #include "exynos5420-pinctrl.dtsi"
 
 #include <dt-bindings/clk/exynos-audss-clk.h>
+#include <dt-bindings/clock/exynos5420.h>
 
 / {
 	compatible = "samsung,exynos5420";
@@ -422,6 +423,20 @@
 		#phy-cells = <1>;
 	};
 
+	dsi@14500000 {
+		compatible = "samsung,exynos5420-mipi-dsi";
+		reg = <0x14500000 0x10000>;
+		interrupts = <0 82 0>;
+		samsung,power-domain = <&disp_pd>;
+		phys = <&mipi_phy 1>;
+		phy-names = "dsim";
+		clocks = <&clock CLK_DSIM1>, <&clock CLK_SCLK_MIPI1>;
+		clock-names = "bus_clk", "pll_clk";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
 	fimd@14400000 {
 		samsung,power-domain = <&disp_pd>;
 		clocks = <&clock 147>, <&clock 421>;
-- 
1.7.9.5
