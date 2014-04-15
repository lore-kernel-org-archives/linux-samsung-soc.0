From: YoungJun Cho <yj44.cho@samsung.com>
Subject: [RFC PATCH 14/14] ARM: dts: exynos5420: add dsi node
Date: Tue, 15 Apr 2014 14:47:42 +0900
Message-ID: <1397540862-21359-15-git-send-email-yj44.cho@samsung.com>
References: <1397540862-21359-1-git-send-email-yj44.cho@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-reply-to: <1397540862-21359-1-git-send-email-yj44.cho@samsung.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, pawel.moll@arm.com, ijc+devicetree@hellion.org.uk, sw0312.kim@samsung.com, a.hajda@samsung.com, kyungmin.park@samsung.com, robh+dt@kernel.org, galak@codeaurora.org, kgene.kim@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

This patch adds common part of dsi node.

Signed-off-by: YoungJun Cho <yj44.cho@samsung.com>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi |   14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index f0184c7..aa2350a 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -422,6 +422,20 @@
 		#phy-cells = <1>;
 	};
 
+	dsi@14500000 {
+		compatible = "samsung,exynos5420-mipi-dsi";
+		reg = <0x14500000 0x10000>;
+		interrupts = <0 82 0>;
+		samsung,power-domain = <&disp_pd>;
+		phys = <&mipi_phy 1>;
+		phy-names = "dsim";
+		clocks = <&clock 411>, <&clock 146>;
+		clock-names = "bus_clk", "pll_clk";
+		status = "disabled";
+		#address-cells = <1>;
+		#size-cells = <0>;
+	};
+
 	fimd@14400000 {
 		samsung,power-domain = <&disp_pd>;
 		clocks = <&clock 147>, <&clock 421>;
-- 
1.7.9.5
