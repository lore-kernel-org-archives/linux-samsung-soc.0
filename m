From: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH v4 5/5] ARM: Exynos4210: Enabling samsung-usbphy driver
Date: Fri, 10 Aug 2012 12:40:31 +0530
Message-ID: <1344582631-13658-6-git-send-email-p.paneri@samsung.com>
References: <1344582631-13658-1-git-send-email-p.paneri@samsung.com>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-reply-to: <1344582631-13658-1-git-send-email-p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, balbi-l0cyMroinI0@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, l.majewski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Adding usbphy node for Exynos4210 along with the platform data.

Signed-off-by: Praveen Paneri <p.paneri-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
---
 arch/arm/boot/dts/exynos4210.dtsi       |    5 +++++
 arch/arm/mach-exynos/include/mach/map.h |    1 +
 arch/arm/mach-exynos/mach-exynos4-dt.c  |    8 ++++++++
 arch/arm/mach-exynos/setup-usb-phy.c    |   13 +++++++++++++
 4 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4210.dtsi b/arch/arm/boot/dts/exynos4210.dtsi
index 02891fe..e28cf10 100644
--- a/arch/arm/boot/dts/exynos4210.dtsi
+++ b/arch/arm/boot/dts/exynos4210.dtsi
@@ -62,6 +62,11 @@
 		interrupts = <0 44 0>, <0 45 0>;
 	};
 
+	usbphy@125B0000 {
+		compatible = "samsung,exynos4210-usbphy";
+		reg = <0x125B0000 0x100>;
+	};
+
 	keypad@100A0000 {
 		compatible = "samsung,s5pv210-keypad";
 		reg = <0x100A0000 0x100>;
diff --git a/arch/arm/mach-exynos/include/mach/map.h b/arch/arm/mach-exynos/include/mach/map.h
index c72b675..0625c0a 100644
--- a/arch/arm/mach-exynos/include/mach/map.h
+++ b/arch/arm/mach-exynos/include/mach/map.h
@@ -234,6 +234,7 @@
 #define S3C_PA_SPI1			EXYNOS4_PA_SPI1
 #define S3C_PA_SPI2			EXYNOS4_PA_SPI2
 #define S3C_PA_USB_HSOTG		EXYNOS4_PA_HSOTG
+#define S3C_PA_USB_PHY			EXYNOS4_PA_HSPHY
 
 #define S5P_PA_EHCI			EXYNOS4_PA_EHCI
 #define S5P_PA_FIMC0			EXYNOS4_PA_FIMC0
diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c b/arch/arm/mach-exynos/mach-exynos4-dt.c
index b2b5d5f..0739be8 100644
--- a/arch/arm/mach-exynos/mach-exynos4-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
@@ -13,6 +13,7 @@
 
 #include <linux/of_platform.h>
 #include <linux/serial_core.h>
+#include <linux/platform_data/samsung-usbphy.h>
 
 #include <asm/mach/arch.h>
 #include <asm/hardware/gic.h>
@@ -20,9 +21,14 @@
 
 #include <plat/cpu.h>
 #include <plat/regs-serial.h>
+#include <plat/usb-phy.h>
 
 #include "common.h"
 
+static struct samsung_usbphy_data exynos4_usbphy_pdata = {
+	.pmu_isolation = s5p_usb_phy_pmu_isolation,
+};
+
 /*
  * The following lookup table is used to override device names when devices
  * are registered from device tree. This is temporarily added to enable
@@ -63,6 +69,8 @@ static const struct of_dev_auxdata exynos4210_auxdata_lookup[] __initconst = {
 				"exynos4210-spi.2", NULL),
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS4_PA_PDMA0, "dma-pl330.0", NULL),
 	OF_DEV_AUXDATA("arm,pl330", EXYNOS4_PA_PDMA1, "dma-pl330.1", NULL),
+	OF_DEV_AUXDATA("samsung,exynos4210-usbphy", EXYNOS4_PA_HSPHY,
+			"s3c-usbphy", &exynos4_usbphy_pdata),
 	{},
 };
 
diff --git a/arch/arm/mach-exynos/setup-usb-phy.c b/arch/arm/mach-exynos/setup-usb-phy.c
index b81cc56..1c62d20 100644
--- a/arch/arm/mach-exynos/setup-usb-phy.c
+++ b/arch/arm/mach-exynos/setup-usb-phy.c
@@ -221,3 +221,16 @@ int s5p_usb_phy_exit(struct platform_device *pdev, int type)
 
 	return -EINVAL;
 }
+
+void s5p_usb_phy_pmu_isolation(int on)
+{
+	if (on) {
+		writel(readl(S5P_USBDEVICE_PHY_CONTROL)
+			& ~S5P_USBDEVICE_PHY_ENABLE,
+				S5P_USBDEVICE_PHY_CONTROL);
+	} else {
+		writel(readl(S5P_USBDEVICE_PHY_CONTROL)
+			| S5P_USBDEVICE_PHY_ENABLE,
+				S5P_USBDEVICE_PHY_CONTROL);
+	}
+}
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
