From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH V4 3/5] dt: exynos5420: Enable support for DWC3 controller
Date: Tue,  8 Apr 2014 20:06:41 +0530
Message-ID: <1396967803-28868-4-git-send-email-gautam.vivek@samsung.com>
References: <1396967803-28868-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1396967803-28868-1-git-send-email-gautam.vivek@samsung.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-usb@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, kishon@ti.com
Cc: k.debski@samsung.com, kgene.kim@samsung.com, gregkh@linuxfoundation.org, t.figa@samsung.com, jg1.han@samsung.com, balbi@ti.com, gautam.vivek@samsung.com, sylvester.nawrocki@gmail.com
List-Id: linux-samsung-soc@vger.kernel.org

Add device tree nodes for DWC3 controller present on
Exynos 5420 SoC, to enable support for USB 3.0.

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
---
 arch/arm/boot/dts/exynos5420.dtsi |   34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/arm/boot/dts/exynos5420.dtsi b/arch/arm/boot/dts/exynos5420.dtsi
index a6efb52..20c2d0b 100644
--- a/arch/arm/boot/dts/exynos5420.dtsi
+++ b/arch/arm/boot/dts/exynos5420.dtsi
@@ -653,6 +653,23 @@
 		clock-names = "tmu_apbif", "tmu_triminfo_apbif";
 	};
 
+	usb@12000000 {
+		compatible = "samsung,exynos5250-dwusb3";
+		clocks = <&clock 366>;
+		clock-names = "usbdrd30";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		dwc3 {
+			compatible = "synopsys,dwc3";
+			reg = <0x12000000 0x10000>;
+			interrupts = <0 72 0>;
+			phys = <&usbdrd_phy0 0>, <&usbdrd_phy0 1>;
+			phy-names = "usb2-phy", "usb3-phy";
+		};
+	};
+
 	usbdrd_phy0: phy@12100000 {
 		compatible = "samsung,exynos5420-usbdrd-phy";
 		reg = <0x12100000 0x100>;
@@ -663,6 +680,23 @@
 		#phy-cells = <1>;
 	};
 
+	usb@12400000 {
+		compatible = "samsung,exynos5250-dwusb3";
+		clocks = <&clock 367>;
+		clock-names = "usbdrd30";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		dwc3 {
+			compatible = "synopsys,dwc3";
+			reg = <0x12400000 0x10000>;
+			interrupts = <0 73 0>;
+			phys = <&usbdrd_phy1 0>, <&usbdrd_phy1 1>;
+			phy-names = "usb2-phy", "usb3-phy";
+		};
+	};
+
 	usbdrd_phy1: phy@12500000 {
 		compatible = "samsung,exynos5420-usbdrd-phy";
 		reg = <0x12500000 0x100>;
-- 
1.7.10.4
