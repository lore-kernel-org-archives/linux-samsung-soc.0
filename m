From: Maciej Purski <m.purski@samsung.com>
Subject: [PATCH v2 09/10] ARM: dts: exynos5250: add DSI node
Date: Wed, 30 May 2018 14:16:00 +0200
Message-ID: <1527682561-1386-10-git-send-email-m.purski@samsung.com>
References: <1527682561-1386-1-git-send-email-m.purski@samsung.com>
 <CGME20180530121629eucas1p2cc1a8c3f5a8e704f4d6f3cf75834cf00@eucas1p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1527682561-1386-1-git-send-email-m.purski@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Mark Rutland <mark.rutland@arm.com>, Maciej Purski <m.purski@samsung.com>, Archit Taneja <architt@codeaurora.org>, Joonyoung Shim <jy0922.shim@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, David Airlie <airlied@linux.ie>, Seung-Woo Kim <sw0312.kim@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Inki Dae <inki.dae@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Kukjin Kim <kgene@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
List-Id: linux-samsung-soc@vger.kernel.org

From: Andrzej Hajda <a.hajda@samsung.com>

The patch adds common part of DSI node for Exynos5250 platforms
and a required mipi-phy node.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Signed-off-by: Maciej Purski <m.purski@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 2daf505..9965eca 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -733,6 +733,27 @@
 			#phy-cells = <0>;
 		};
 
+		mipi_phy: video-phy@10040710 {
+			compatible = "samsung,s5pv210-mipi-video-phy";
+			reg = <0x10040710 0x100>;
+			#phy-cells = <1>;
+			syscon = <&pmu_system_controller>;
+		};
+
+		dsi_0: dsi@14500000 {
+			compatible = "samsung,exynos4210-mipi-dsi";
+			reg = <0x14500000 0x10000>;
+			interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
+			samsung,power-domain = <&pd_disp1>;
+			phys = <&mipi_phy 3>;
+			phy-names = "dsim";
+			clocks = <&clock CLK_DSIM0>, <&clock CLK_SCLK_MIPI1>;
+			clock-names = "bus_clk", "sclk_mipi";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 		adc: adc@12d10000 {
 			compatible = "samsung,exynos-adc-v1";
 			reg = <0x12D10000 0x100>;
-- 
2.7.4
