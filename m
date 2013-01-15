From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH v4 2/4] ARM: Exynos5250: Enabling ohci-exynos driver
Date: Tue, 15 Jan 2013 19:08:30 +0530
Message-ID: <1358257112-19595-3-git-send-email-gautam.vivek@samsung.com>
References: <1358257112-19595-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1358257112-19595-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, kgene.kim@samsung.com, grant.likely@secretlab.ca, dianders@chromium.org, jg1.han@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Adding OHCI device tree node for Exynos5250 along with
the device base address.

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
Acked-by: Jingoo Han <jg1.han@samsung.com>
Acked-by: Grant Likely <grant.likely@secretlab.ca>
---
 .../devicetree/bindings/usb/exynos-usb.txt         |   15 +++++++++++++++
 arch/arm/boot/dts/exynos5250.dtsi                  |    6 ++++++
 2 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/exynos-usb.txt b/Documentation/devicetree/bindings/usb/exynos-usb.txt
index e8bbb47..f66fcdd 100644
--- a/Documentation/devicetree/bindings/usb/exynos-usb.txt
+++ b/Documentation/devicetree/bindings/usb/exynos-usb.txt
@@ -23,3 +23,18 @@ Example:
 		interrupts = <0 71 0>;
 		samsung,vbus-gpio = <&gpx2 6 1 3 3>;
 	};
+
+OHCI
+Required properties:
+ - compatible: should be "samsung,exynos4210-ohci" for USB 2.0
+   OHCI companion controller in host mode.
+ - reg: physical base address of the controller and length of memory mapped
+   region.
+ - interrupts: interrupt number to the cpu.
+
+Example:
+	usb@12120000 {
+		compatible = "samsung,exynos4210-ohci";
+		reg = <0x12120000 0x100>;
+		interrupts = <0 71 0>;
+	};
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 2cbe53e..ebb0907 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -281,6 +281,12 @@
 		interrupts = <0 71 0>;
 	};
 
+	usb@12120000 {
+		compatible = "samsung,exynos4210-ohci";
+		reg = <0x12120000 0x100>;
+		interrupts = <0 71 0>;
+	};
+
 	amba {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
1.7.6.5
