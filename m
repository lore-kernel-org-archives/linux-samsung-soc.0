From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: [PATCH v3 1/2] arm64: dts: exynos: Add USB 3.0 controller node for
 Exynos7
Date: Wed, 18 Jan 2017 12:02:52 +0530
Message-ID: <1484721173-30474-2-git-send-email-pankaj.dubey@samsung.com>
References: <1484721173-30474-1-git-send-email-pankaj.dubey@samsung.com>
 <CGME20170118063008epcas5p26a5a1fd73d843b2b08eae0fdb03b775c@epcas5p2.samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-reply-to: <1484721173-30474-1-git-send-email-pankaj.dubey@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Cc: Pankaj Dubey <pankaj.dubey@samsung.com>, krzk@kernel.org, Vivek Gautam <gautamvivek1987@gmail.com>, javier@osg.samsung.com, robh+dt@kernel.org, kgene@kernel.org, sanath@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

From: Vivek Gautam <gautamvivek1987@gmail.com>

Add USB 3.0 DRD controller device node, with its clock
and phy information to enable the same on Exynos7.

Signed-off-by: Vivek Gautam <gautamvivek1987@gmail.com>
Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
Reviewed-by: Javier Martinez Canillas <javier@osg.samsung.com>
---
 arch/arm64/boot/dts/exynos/exynos7.dtsi | 34 +++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos7.dtsi b/arch/arm64/boot/dts/exynos/exynos7.dtsi
index 80aa60e..9a3fbed 100644
--- a/arch/arm64/boot/dts/exynos/exynos7.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos7.dtsi
@@ -603,6 +603,40 @@
 				#include "exynos7-trip-points.dtsi"
 			};
 		};
+
+		usbdrd_phy: phy@15500000 {
+			compatible = "samsung,exynos7-usbdrd-phy";
+			reg = <0x15500000 0x100>;
+			clocks = <&clock_fsys0 ACLK_USBDRD300>,
+			       <&clock_fsys0 OSCCLK_PHY_CLKOUT_USB30_PHY>,
+			       <&clock_fsys0 PHYCLK_USBDRD300_UDRD30_PIPE_PCLK_USER>,
+			       <&clock_fsys0 PHYCLK_USBDRD300_UDRD30_PHYCLK_USER>,
+			       <&clock_fsys0 SCLK_USBDRD300_REFCLK>;
+			clock-names = "phy", "ref", "phy_pipe",
+				"phy_utmi", "itp";
+			samsung,pmu-syscon = <&pmu_system_controller>;
+			#phy-cells = <1>;
+		};
+
+		usbdrd3 {
+			compatible = "samsung,exynos7-dwusb3";
+			clocks = <&clock_fsys0 ACLK_USBDRD300>,
+			       <&clock_fsys0 SCLK_USBDRD300_SUSPENDCLK>,
+			       <&clock_fsys0 ACLK_AXIUS_USBDRD30X_FSYS0X>;
+			clock-names = "usbdrd30", "usbdrd30_susp_clk",
+				"usbdrd30_axius_clk";
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			dwc3@15400000 {
+				compatible = "snps,dwc3";
+				reg = <0x15400000 0x10000>;
+				interrupts = <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&usbdrd_phy 0>, <&usbdrd_phy 1>;
+				phy-names = "usb2-phy", "usb3-phy";
+			};
+		};
 	};
 };
 
-- 
2.7.4
