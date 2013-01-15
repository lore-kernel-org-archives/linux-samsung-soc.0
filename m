From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 4/4] ARM: Exynos5250: Enabling dwc3-exynos driver
Date: Tue, 15 Jan 2013 19:08:32 +0530
Message-ID: <1358257112-19595-5-git-send-email-gautam.vivek@samsung.com>
References: <1358257112-19595-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1358257112-19595-1-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Adding DWC3 device tree node for Exynos5250 needed to
parse device tree data.
Also enabling XHCI support on exynos5250.

Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 .../devicetree/bindings/usb/exynos-usb.txt         |   14 ++++++++++++++
 arch/arm/boot/dts/exynos5250.dtsi                  |    6 ++++++
 arch/arm/mach-exynos/Kconfig                       |    1 +
 3 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/exynos-usb.txt b/Documentation/devicetree/bindings/usb/exynos-usb.txt
index f66fcdd..d660410 100644
--- a/Documentation/devicetree/bindings/usb/exynos-usb.txt
+++ b/Documentation/devicetree/bindings/usb/exynos-usb.txt
@@ -38,3 +38,17 @@ Example:
 		reg = <0x12120000 0x100>;
 		interrupts = <0 71 0>;
 	};
+
+DWC3
+Required properties:
+ - compatible: should be "samsung,exynos5250-dwc3" for USB 3.0 DWC3 controller.
+ - reg: physical base address of the controller and length of memory mapped
+   region.
+ - interrupts: interrupt number to the cpu.
+
+Example:
+	usb@12000000 {
+		compatible = "samsung,exynos5250-dwc3";
+		reg = <0x12000000 0x10000>;
+		interrupts = <0 72 0>;
+	};
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index ebb0907..a747524 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -275,6 +275,12 @@
 		#size-cells = <0>;
 	};
 
+	usb@12000000 {
+		compatible = "samsung,exynos5250-dwc3";
+		reg = <0x12000000 0x10000>;
+		interrupts = <0 72 0>;
+	};
+
 	usb@12110000 {
 		compatible = "samsung,exynos4210-ehci";
 		reg = <0x12110000 0x100>;
diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index d26c9f9..e62fd20 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -428,6 +428,7 @@ config MACH_EXYNOS5_DT
 	depends on ARCH_EXYNOS5
 	select ARM_AMBA
 	select USE_OF
+	select USB_ARCH_HAS_XHCI
 	help
 	  Machine support for Samsung EXYNOS5 machine with device tree enabled.
 	  Select this if a fdt blob is available for the EXYNOS5 SoC based board.
-- 
1.7.6.5
