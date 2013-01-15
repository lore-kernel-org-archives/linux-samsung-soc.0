From: Vivek Gautam <gautam.vivek@samsung.com>
Subject: [PATCH v4 1/4] ARM: Exynos5250: Enabling ehci-s5p driver
Date: Tue, 15 Jan 2013 19:08:29 +0530
Message-ID: <1358257112-19595-2-git-send-email-gautam.vivek@samsung.com>
References: <1358257112-19595-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-reply-to: <1358257112-19595-1-git-send-email-gautam.vivek@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, kgene.kim@samsung.com, grant.likely@secretlab.ca, dianders@chromium.org, jg1.han@samsung.com
List-Id: linux-samsung-soc@vger.kernel.org

Adding EHCI device tree node for Exynos5250 along with
the device base adress and gpio line for vbus.

Signed-off-by: Vivek Gautam <gautam.vivek@samsung.com>
Acked-by: Jingoo Han <jg1.han@samsung.com>
Acked-by: Grant Likely <grant.likely@secretlab.ca>
---
 .../devicetree/bindings/usb/exynos-usb.txt         |   25 ++++++++++++++++++++
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |    4 +++
 arch/arm/boot/dts/exynos5250.dtsi                  |    6 ++++
 3 files changed, 35 insertions(+), 0 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/exynos-usb.txt

diff --git a/Documentation/devicetree/bindings/usb/exynos-usb.txt b/Documentation/devicetree/bindings/usb/exynos-usb.txt
new file mode 100644
index 0000000..e8bbb47
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/exynos-usb.txt
@@ -0,0 +1,25 @@
+Samsung Exynos SoC USB controller
+
+The USB devices interface with USB controllers on Exynos SOCs.
+The device node has following properties.
+
+EHCI
+Required properties:
+ - compatible: should be "samsung,exynos4210-ehci" for USB 2.0
+   EHCI controller in host mode.
+ - reg: physical base address of the controller and length of memory mapped
+   region.
+ - interrupts: interrupt number to the cpu.
+
+Optional properties:
+ - samsung,vbus-gpio:  if present, specifies the GPIO that
+   needs to be pulled up for the bus to be powered.
+
+Example:
+
+	usb@12110000 {
+		compatible = "samsung,exynos4210-ehci";
+		reg = <0x12110000 0x100>;
+		interrupts = <0 71 0>;
+		samsung,vbus-gpio = <&gpx2 6 1 3 3>;
+	};
diff --git a/arch/arm/boot/dts/exynos5250-smdk5250.dts b/arch/arm/boot/dts/exynos5250-smdk5250.dts
index 942d576..7363e14 100644
--- a/arch/arm/boot/dts/exynos5250-smdk5250.dts
+++ b/arch/arm/boot/dts/exynos5250-smdk5250.dts
@@ -204,4 +204,8 @@
 		samsung,mfc-r = <0x43000000 0x800000>;
 		samsung,mfc-l = <0x51000000 0x800000>;
 	};
+
+	usb@12110000 {
+		samsung,vbus-gpio = <&gpx2 6 1 3 3>;
+	};
 };
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index 30485de..2cbe53e 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -275,6 +275,12 @@
 		#size-cells = <0>;
 	};
 
+	usb@12110000 {
+		compatible = "samsung,exynos4210-ehci";
+		reg = <0x12110000 0x100>;
+		interrupts = <0 71 0>;
+	};
+
 	amba {
 		#address-cells = <1>;
 		#size-cells = <1>;
-- 
1.7.6.5
