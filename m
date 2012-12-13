From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v3 2/2] ARM: Exynos5250: Enabling ohci-exynos driver
Date: Thu, 13 Dec 2012 22:06:02 +0530
Message-ID: <1355416562-25539-3-git-send-email-gautam.vivek@samsung.com>
References: <1355416562-25539-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-reply-to: <1355416562-25539-1-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
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
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Adding OHCI device tree node for Exynos5250 along with
the device base address.

Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Acked-by: Jingoo Han <jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 .../devicetree/bindings/usb/exynos-usb.txt         |   15 +++++++++++++++
 arch/arm/boot/dts/exynos5250.dtsi                  |    6 ++++++
 arch/arm/mach-exynos/include/mach/map.h            |    1 +
 arch/arm/mach-exynos/mach-exynos5-dt.c             |    2 ++
 4 files changed, 24 insertions(+), 0 deletions(-)

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
index 584bb9a..75510d1 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -305,6 +305,12 @@
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
diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index b2c662f..4bf6fd9 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -202,6 +202,7 @@
 #define EXYNOS4_PA_OHCI			0x12590000
 #define EXYNOS4_PA_HSPHY		0x125B0000
 #define EXYNOS5_PA_EHCI			0x12110000
+#define EXYNOS5_PA_OHCI			0x12120000
 #define EXYNOS4_PA_MFC			0x13400000
 
 #define EXYNOS4_PA_UART			0x13800000
diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index b3b9af1..07aa586 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -112,6 +112,8 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
 				"samsung-i2s.2", NULL),
 	OF_DEV_AUXDATA("samsung,exynos4210-ehci", EXYNOS5_PA_EHCI,
 				"s5p-ehci", NULL),
+	OF_DEV_AUXDATA("samsung,exynos4210-ohci", EXYNOS5_PA_OHCI,
+				"exynos-ohci", NULL),
 	{},
 };
 
-- 
1.7.6.5
