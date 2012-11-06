From: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 3/5] ARM: Exynos5250: Enabling samsung-usbphy driver
Date: Tue, 06 Nov 2012 20:24:57 +0530
Message-ID: <1352213699-11112-4-git-send-email-gautam.vivek@samsung.com>
References: <1352213699-11112-1-git-send-email-gautam.vivek@samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1352213699-11112-1-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, jg1.han-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, yulgon.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, kishon-l0cyMroinI0@public.gmane.org, p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Adding usbphy node for Exynos5250 along with the platform data

Signed-off-by: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 .../devicetree/bindings/usb/samsung-usbphy.txt     |   12 +++++-
 arch/arm/boot/dts/exynos5250.dtsi                  |    5 ++
 arch/arm/mach-exynos/Kconfig                       |    1 +
 arch/arm/mach-exynos/include/mach/map.h            |    1 +
 arch/arm/mach-exynos/mach-exynos5-dt.c             |    9 ++++
 arch/arm/mach-exynos/setup-usb-phy.c               |   41 ++++++++++++++++---
 arch/arm/plat-samsung/include/plat/usb-phy.h       |    1 +
 7 files changed, 61 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/samsung-usbphy.txt b/Documentation/devicetree/bindings/usb/samsung-usbphy.txt
index 7b26e2d..9e21f4b 100644
--- a/Documentation/devicetree/bindings/usb/samsung-usbphy.txt
+++ b/Documentation/devicetree/bindings/usb/samsung-usbphy.txt
@@ -1,11 +1,19 @@
 * Samsung's usb phy transceiver
 
-The Samsung's phy transceiver is used for controlling usb otg phy for
-s3c-hsotg usb device controller.
+The Samsung's phy transceiver is used for controlling usb phy for
+s3c-hsotg as well as ehci-s5p and ohci-exynos usb controllers
+across Samsung SOCs.
 TODO: Adding the PHY binding with controller(s) according to the under
 developement generic PHY driver.
 
+Exynos4210:
 Required properties:
 - compatible : should be "samsung,exynos4210-usbphy"
 - reg : base physical address of the phy registers and length of memory mapped
 	region.
+
+Exynos5250:
+Required properties:
+- compatible : should be "samsung,exynos5250-usbphy"
+- reg : base physical address of the phy registers and length of memory mapped
+	region.
diff --git a/arch/arm/boot/dts/exynos5250.dtsi b/arch/arm/boot/dts/exynos5250.dtsi
index dddfd6e..82bf042 100644
--- a/arch/arm/boot/dts/exynos5250.dtsi
+++ b/arch/arm/boot/dts/exynos5250.dtsi
@@ -218,6 +218,11 @@
 		#size-cells = <0>;
 	};
 
+	usbphy {
+		compatible = "samsung,exynos5250-usbphy";
+		reg = <0x12130000 0x100>;
+	};
+
 	amba {
 		#address-cells = <1>;
 		#size-cells = <1>;
diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index da55107..d73fa42 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -419,6 +419,7 @@ config MACH_EXYNOS5_DT
 	bool "SAMSUNG EXYNOS5 Machine using device tree"
 	depends on ARCH_EXYNOS5
 	select ARM_AMBA
+	select EXYNOS4_SETUP_USB_PHY
 	select SOC_EXYNOS5250
 	select USE_OF
 	help
diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index 9694424..7f5eb03 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -195,6 +195,7 @@
 #define EXYNOS4_PA_EHCI			0x12580000
 #define EXYNOS4_PA_OHCI			0x12590000
 #define EXYNOS4_PA_HSPHY		0x125B0000
+#define EXYNOS5_PA_HSPHY		0x12130000
 #define EXYNOS4_PA_MFC			0x13400000
 
 #define EXYNOS4_PA_UART			0x13800000
diff --git a/arch/arm/mach-exynos/mach-exynos5-dt.c b/arch/arm/mach-exynos/mach-exynos5-dt.c
index db1cd8e..bf20918 100644
--- a/arch/arm/mach-exynos/mach-exynos5-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos5-dt.c
@@ -11,6 +11,7 @@
 
 #include <linux/of_platform.h>
 #include <linux/serial_core.h>
+#include <linux/platform_data/samsung-usbphy.h>
 
 #include <asm/mach/arch.h>
 #include <asm/hardware/gic.h>
@@ -18,9 +19,15 @@
 
 #include <plat/cpu.h>
 #include <plat/regs-serial.h>
+#include <plat/usb-phy.h>
 
 #include "common.h"
 
+static struct samsung_usbphy_data exynos5_usbphy_pdata = {
+	.pmu_isolation = s5p_usb_phy_pmu_isolation,
+	.phy_cfg_sel = s5p_usb_phy_cfg_sel,
+};
+
 /*
  * The following lookup table is used to override device names when devices
  * are registered from device tree. This is temporarily added to enable
@@ -72,6 +79,8 @@ static const struct of_dev_auxdata exynos5250_auxdata_lookup[] __initconst = {
 				"exynos-gsc.2", NULL),
 	OF_DEV_AUXDATA("samsung,exynos5-gsc", EXYNOS5_PA_GSC3,
 				"exynos-gsc.3", NULL),
+	OF_DEV_AUXDATA("samsung,exynos5250-usbphy", EXYNOS5_PA_HSPHY,
+				"s3c-usbphy", &exynos5_usbphy_pdata),
 	{},
 };
 
diff --git a/arch/arm/mach-exynos/setup-usb-phy.c b/arch/arm/mach-exynos/setup-usb-phy.c
index 39de35f..6c768e0 100644
--- a/arch/arm/mach-exynos/setup-usb-phy.c
+++ b/arch/arm/mach-exynos/setup-usb-phy.c
@@ -15,11 +15,15 @@
 #include <linux/io.h>
 #include <linux/platform_device.h>
 #include <linux/usb/samsung_usb_phy.h>
+#include <linux/platform_data/samsung-usbphy.h>
 #include <mach/regs-pmu.h>
 #include <mach/regs-usb-phy.h>
 #include <plat/cpu.h>
+#include <plat/map-base.h>
 #include <plat/usb-phy.h>
 
+#define EXYNOS5_USB_CFG			(S3C_VA_SYS + 0x230)
+
 static atomic_t host_usage;
 
 static int exynos4_usb_host_phy_is_on(void)
@@ -225,13 +229,36 @@ int s5p_usb_phy_exit(struct platform_device *pdev, int type)
 
 void s5p_usb_phy_pmu_isolation(int on, int type)
 {
-	if (on) {
-		writel(readl(S5P_USBDEVICE_PHY_CONTROL)
-			& ~S5P_USBDEVICE_PHY_ENABLE,
-				S5P_USBDEVICE_PHY_CONTROL);
+	if (type == USB_PHY_TYPE_HOST) {
+		if (on)
+			writel(readl(S5P_USBHOST_PHY_CONTROL)
+				& ~S5P_USBHOST_PHY_ENABLE,
+					S5P_USBHOST_PHY_CONTROL);
+		else
+			writel(readl(S5P_USBHOST_PHY_CONTROL)
+				| S5P_USBHOST_PHY_ENABLE,
+					S5P_USBHOST_PHY_CONTROL);
 	} else {
-		writel(readl(S5P_USBDEVICE_PHY_CONTROL)
-			| S5P_USBDEVICE_PHY_ENABLE,
-				S5P_USBDEVICE_PHY_CONTROL);
+		if (on)
+			writel(readl(S5P_USBDEVICE_PHY_CONTROL)
+				& ~S5P_USBDEVICE_PHY_ENABLE,
+					S5P_USBDEVICE_PHY_CONTROL);
+		else
+			writel(readl(S5P_USBDEVICE_PHY_CONTROL)
+				| S5P_USBDEVICE_PHY_ENABLE,
+					S5P_USBDEVICE_PHY_CONTROL);
 	}
 }
+
+/* Switch between HOST and OTG link from PHY_CFG */
+void s5p_usb_phy_cfg_sel(struct device *dev, int type)
+{
+	u32 is_host;
+
+	is_host = readl(EXYNOS5_USB_CFG);
+	writel(type, EXYNOS5_USB_CFG);
+
+	if (is_host != type)
+		dev_dbg(dev, "Changed USB MUX from %s to %s",
+			is_host ? "Host" : "Device", type ? "Host" : "Device");
+}
diff --git a/arch/arm/plat-samsung/include/plat/usb-phy.h b/arch/arm/plat-samsung/include/plat/usb-phy.h
index 5156343..f57e324 100644
--- a/arch/arm/plat-samsung/include/plat/usb-phy.h
+++ b/arch/arm/plat-samsung/include/plat/usb-phy.h
@@ -14,5 +14,6 @@
 extern int s5p_usb_phy_init(struct platform_device *pdev, int type);
 extern int s5p_usb_phy_exit(struct platform_device *pdev, int type);
 extern void s5p_usb_phy_pmu_isolation(int on, int type);
+extern void s5p_usb_phy_cfg_sel(struct device *dev, int type);
 
 #endif /* __PLAT_SAMSUNG_USB_PHY_H */
-- 
1.7.6.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
