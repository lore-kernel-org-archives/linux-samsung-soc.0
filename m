From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH v5 4/9] dts: exynos5250: Update DWC3 usb controller to use new
 phy driver
Date: Wed, 23 Apr 2014 20:00:46 +0530
Message-ID: <1398263451-18023-5-git-send-email-gautam.vivek@samsung.com>
References: <1398263451-18023-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1398263451-18023-1-git-send-email-gautam.vivek@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, gregkh@linuxfoundation.org, t.figa@samsung.com, jg1.han@samsung.com, linux-kernel@vger.kernel.org, balbi@ti.com, robh+dt@kernel.org, olof@lixom.net, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

Removing the dt node for older usb3 phy driver from Exynos5250
device tree and updating the dt node for DWC3 controller to
use new phy driver based on generic phy framework.

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
Reviewed-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/boot/dts/exynos5250.dtsi |   17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index d4254c0..d7c65e6 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -533,21 +533,8 @@
 			compatible = "synopsys,dwc3";
 			reg = <0x12000000 0x10000>;
 			interrupts = <0 72 0>;
-			usb-phy = <&usb2_phy &usb3_phy>;
-		};
-	};
-
-	usb3_phy: usbphy@12100000 {
-		compatible = "samsung,exynos5250-usb3phy";
-		reg = <0x12100000 0x100>;
-		clocks = <&clock CLK_FIN_PLL>, <&clock CLK_USB3>;
-		clock-names = "ext_xtal", "usbdrd30";
-		#address-cells = <1>;
-		#size-cells = <1>;
-		ranges;
-
-		usbphy-sys {
-			reg = <0x10040704 0x8>;
+			phys = <&usbdrd_phy 0>, <&usbdrd_phy 1>;
+			phy-names = "usb2-phy", "usb3-phy";
 		};
 	};
 
-- 
1.7.10.4
