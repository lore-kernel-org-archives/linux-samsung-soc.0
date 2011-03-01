From: Heiko =?iso-8859-1?q?St=FCbner?= <heiko@sntech.de>
Subject: resend hsudc patches for s3c24xx?
Date: Tue, 1 Mar 2011 18:07:01 +0100
Message-ID: <201103011807.01828.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_1eSbNu+/IQQys84"
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Thomas Abraham <thomas.ab@samsung.com>
Cc: Alexander Neumann <fd0@lochraster.org>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-samsung-soc@vger.kernel.org

--Boundary-00=_1eSbNu+/IQQys84
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi,

some time around october 2010 Sangbeom Kim posted patches from Thomas Abraham 
to support the hs-udc of the s3c24xx-platform. But these patches were not 
added to the kernel.

We are currently working on s3c2416 based devices which would profit from this 
drivers and not having to keep them locally.

We ported the patches to a 2.6.38-rc state which can be found on [1] and also 
attached. Especially the driver itself [2] needed a bit of rework and I'm not 
sure if the gadget_chips id is simply incremented for new drivers.

As the merge-window for 2.6.39 approaches, could you have another look at them 
and merge eventually them into the linux-samsung tree?


Thanks
Heiko


[1] http://gitorious.org/oyo-hack/kernel/commits/s3c-hsudc
[2] http://gitorious.org/oyo-
hack/kernel/commit/c063317869d11c3b8f906061319f8a075de06b5c

--Boundary-00=_1eSbNu+/IQQys84
Content-Type: text/x-patch;
  charset="UTF-8";
  name="0001-ARM-S3C2416-Add-USB-Phy-register-definitions.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0001-ARM-S3C2416-Add-USB-Phy-register-definitions.patch"

=46rom 92a488ff6afa7d33ed04d476c4f1704899be9da1 Mon Sep 17 00:00:00 2001
=46rom: Thomas Abraham <thomas.ab@samsung.com>
Date: Wed, 13 Oct 2010 09:10:24 +0900
Subject: [PATCH 1/4] ARM: S3C2416: Add USB Phy register definitions

Add register definitions required to configure the USB Phy. The definitions
for PHYCTRL, PHYPWR, URSTCON and UCLKCON registers and corresponding bit
field definitions are added.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
=2D--
 .../mach-s3c2410/include/mach/regs-s3c2443-clock.h |   25 ++++++++++++++++=
++++
 1 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c2410/include/mach/regs-s3c2443-clock.h b/arch=
/arm/mach-s3c2410/include/mach/regs-s3c2443-clock.h
index 44494a5..5e06c72 100644
=2D-- a/arch/arm/mach-s3c2410/include/mach/regs-s3c2443-clock.h
+++ b/arch/arm/mach-s3c2410/include/mach/regs-s3c2443-clock.h
@@ -37,6 +37,10 @@
 #define S3C2443_SYSID			S3C2443_CLKREG(0x5C)
 #define S3C2443_PWRCFG			S3C2443_CLKREG(0x60)
 #define S3C2443_RSTCON			S3C2443_CLKREG(0x64)
+#define S3C2443_PHYCTRL			S3C2443_CLKREG(0x80)
+#define S3C2443_PHYPWR			S3C2443_CLKREG(0x84)
+#define S3C2443_URSTCON			S3C2443_CLKREG(0x88)
+#define S3C2443_UCLKCON			S3C2443_CLKREG(0x8C)
=20
 #define S3C2443_SWRST_RESET		(0x533c2443)
=20
@@ -121,6 +125,27 @@
=20
 #define S3C2443_PWRCFG_SLEEP		(1<<15)
=20
+#define S3C2443_PWRCFG_USBPHY		(1 << 4)
+
+#define S3C2443_URSTCON_FUNCRST		(1 << 2)
+#define S3C2443_URSTCON_PHYRST		(1 << 0)
+
+#define S3C2443_PHYCTRL_CLKSEL		(1 << 3)
+#define S3C2443_PHYCTRL_EXTCLK		(1 << 2)
+#define S3C2443_PHYCTRL_PLLSEL		(1 << 1)
+#define S3C2443_PHYCTRL_DSPORT		(1 << 0)
+
+#define S3C2443_PHYPWR_COMMON_ON	(1 << 31)
+#define S3C2443_PHYPWR_ANALOG_PD	(1 << 4)
+#define S3C2443_PHYPWR_PLL_REFCLK	(1 << 3)
+#define S3C2443_PHYPWR_XO_ON		(1 << 2)
+#define S3C2443_PHYPWR_PLL_PWRDN	(1 << 1)
+#define S3C2443_PHYPWR_FSUSPEND		(1 << 0)
+
+#define S3C2443_UCLKCON_DETECT_VBUS	(1 << 31)
+#define S3C2443_UCLKCON_FUNC_CLKEN	(1 << 2)
+#define S3C2443_UCLKCON_TCLKEN		(1 << 0)
+
 #include <asm/div64.h>
=20
 static inline unsigned int
=2D-=20
1.7.2.3


--Boundary-00=_1eSbNu+/IQQys84
Content-Type: text/x-patch;
  charset="UTF-8";
  name="0002-ARM-S3C24XX-Add-plaform-device-definition-for-USB-Hi.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0002-ARM-S3C24XX-Add-plaform-device-definition-for-USB-Hi.patch"

=46rom 0e89d462593eeb69a168ed1712c3e27039c2af78 Mon Sep 17 00:00:00 2001
=46rom: Thomas Abraham <thomas.ab@samsung.com>
Date: Wed, 13 Oct 2010 09:10:25 +0900
Subject: [PATCH 2/4] ARM: S3C24XX: Add plaform device definition for USB Hi=
gh-Speed gadget controller.

S3C2416, S3C2443 and S3C2450 includes a USB High-Speed Gadget controller mo=
dule.
This patch adds the following for supporting this controller.

1. Definition for USB High-Speed controller base address.
2. Platform device instantiation.
3. Declaration for platform data structure.
4. Functionality to setup platform data for the controller.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
=2D--
 arch/arm/mach-s3c2410/include/mach/map.h  |    4 +++
 arch/arm/plat-s3c24xx/devs.c              |   41 +++++++++++++++++++++++++=
++++
 arch/arm/plat-s3c24xx/include/plat/udc.h  |   17 ++++++++++++
 arch/arm/plat-samsung/include/plat/devs.h |    1 +
 4 files changed, 63 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c2410/include/mach/map.h b/arch/arm/mach-s3c24=
10/include/mach/map.h
index 25bbf5a..425552d 100644
=2D-- a/arch/arm/mach-s3c2410/include/mach/map.h
+++ b/arch/arm/mach-s3c2410/include/mach/map.h
@@ -21,6 +21,10 @@
 /* USB host controller */
 #define S3C2410_PA_USBHOST (0x49000000)
=20
+/* S3C2416/S3C2443/S3C2450 High-Speed USB Gadget */
+#define S3C2416_PA_HSUDC	(0x49800000)
+#define S3C2416_SZ_HSUDC	(SZ_4K)
+
 /* DMA controller */
 #define S3C2410_PA_DMA	   (0x4B000000)
 #define S3C24XX_SZ_DMA	   SZ_1M
diff --git a/arch/arm/plat-s3c24xx/devs.c b/arch/arm/plat-s3c24xx/devs.c
index 268f3ed..7366799 100644
=2D-- a/arch/arm/plat-s3c24xx/devs.c
+++ b/arch/arm/plat-s3c24xx/devs.c
@@ -22,6 +22,7 @@
 #include <linux/io.h>
 #include <linux/slab.h>
 #include <linux/string.h>
+#include <linux/dma-mapping.h>
=20
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
@@ -233,6 +234,46 @@ void __init s3c24xx_udc_set_platdata(struct s3c2410_ud=
c_mach_info *pd)
 	}
 }
=20
+/* USB High Speed 2.0 Device (Gadget) */
+static struct resource s3c_hsudc_resource[] =3D {
+	[0] =3D {
+		.start	=3D S3C2416_PA_HSUDC,
+		.end	=3D S3C2416_PA_HSUDC + S3C2416_SZ_HSUDC - 1,
+		.flags	=3D IORESOURCE_MEM,
+	},
+	[1] =3D {
+		.start	=3D IRQ_USBD,
+		.end	=3D IRQ_USBD,
+		.flags	=3D IORESOURCE_IRQ,
+	}
+};
+
+static u64 s3c_hsudc_dmamask =3D DMA_BIT_MASK(32);
+
+struct platform_device s3c_device_usb_hsudc =3D {
+	.name		=3D "s3c-hsudc",
+	.id		=3D -1,
+	.num_resources	=3D ARRAY_SIZE(s3c_hsudc_resource),
+	.resource	=3D s3c_hsudc_resource,
+	.dev		=3D {
+		.dma_mask		=3D &s3c_hsudc_dmamask,
+		.coherent_dma_mask	=3D DMA_BIT_MASK(32),
+	},
+};
+
+void __init s3c24xx_hsudc_set_platdata(struct s3c24xx_hsudc_platdata *pd)
+{
+	struct s3c24xx_hsudc_platdata *npd;
+
+	npd =3D kmalloc(sizeof(*npd), GFP_KERNEL);
+	if (npd) {
+		memcpy(npd, pd, sizeof(*npd));
+		s3c_device_usb_hsudc.dev.platform_data =3D npd;
+	} else {
+		printk(KERN_ERR "no memory for udc platform data\n");
+	}
+}
+
 /* IIS */
=20
 static struct resource s3c_iis_resource[] =3D {
diff --git a/arch/arm/plat-s3c24xx/include/plat/udc.h b/arch/arm/plat-s3c24=
xx/include/plat/udc.h
index 546bb40..a3fc1be 100644
=2D-- a/arch/arm/plat-s3c24xx/include/plat/udc.h
+++ b/arch/arm/plat-s3c24xx/include/plat/udc.h
@@ -33,4 +33,21 @@ struct s3c2410_udc_mach_info {
=20
 extern void __init s3c24xx_udc_set_platdata(struct s3c2410_udc_mach_info *=
);
=20
+/**
+ * s3c24xx_hsudc_platdata - Platform data for USB High-Speed gadget contro=
ller.
+ * @epnum: Number of endpoints to be instantiated by the controller driver.
+ * @gpio_init: Platform specific USB related GPIO initialization.
+ * @gpio_uninit: Platform specific USB releted GPIO uninitialzation.
+ *
+ * Representation of platform data for the S3C24XX USB 2.0 High Speed gadg=
et
+ * controllers.
+ */
+struct s3c24xx_hsudc_platdata {
+	unsigned int	epnum;
+	void		(*gpio_init)(void);
+	void		(*gpio_uninit)(void);
+};
+
+extern void __init s3c24xx_hsudc_set_platdata(struct s3c24xx_hsudc_platdat=
a *pd);
+
 #endif /* __ASM_ARM_ARCH_UDC_H */
diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-sams=
ung/include/plat/devs.h
index b4d208b..fcb6e30 100644
=2D-- a/arch/arm/plat-samsung/include/plat/devs.h
+++ b/arch/arm/plat-samsung/include/plat/devs.h
@@ -85,6 +85,7 @@ extern struct platform_device s3c64xx_device_onenand1;
 extern struct platform_device s5p_device_onenand;
=20
 extern struct platform_device s3c_device_usbgadget;
+extern struct platform_device s3c_device_usb_hsudc;
 extern struct platform_device s3c_device_usb_hsotg;
=20
 extern struct platform_device s5pv210_device_ac97;
=2D-=20
1.7.2.3


--Boundary-00=_1eSbNu+/IQQys84
Content-Type: text/x-patch;
  charset="UTF-8";
  name="0004-ARM-S3C2416-Add-support-for-USB-2.0-High-Speed-gadge.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0004-ARM-S3C2416-Add-support-for-USB-2.0-High-Speed-gadge.patch"

=46rom 80eed2079d7aed5013e3d3c89e7b4b12f3ee6bd6 Mon Sep 17 00:00:00 2001
=46rom: Thomas Abraham <thomas.ab@samsung.com>
Date: Wed, 13 Oct 2010 09:10:27 +0900
Subject: [PATCH 4/4] ARM: S3C2416: Add support for USB 2.0 High-Speed gadge=
t controller

Add support for USB 2.0 High-Speed gadget controller driver for Samsung's
S3C2416 processor.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
=2D--
 arch/arm/mach-s3c2416/mach-smdk2416.c |   27 +++++++++++++++++++++++++++
 1 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s3c2416/mach-smdk2416.c b/arch/arm/mach-s3c2416/=
mach-smdk2416.c
index 3f83177..ac27ebb 100644
=2D-- a/arch/arm/mach-s3c2416/mach-smdk2416.c
+++ b/arch/arm/mach-s3c2416/mach-smdk2416.c
@@ -23,6 +23,7 @@
 #include <linux/mtd/partitions.h>
 #include <linux/gpio.h>
 #include <linux/fb.h>
+#include <linux/delay.h>
=20
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
@@ -35,6 +36,7 @@
 #include <plat/regs-serial.h>
 #include <mach/regs-gpio.h>
 #include <mach/regs-lcd.h>
+#include <mach/regs-s3c2443-clock.h>
=20
 #include <mach/idle.h>
 #include <mach/leds-gpio.h>
@@ -47,6 +49,7 @@
 #include <plat/cpu.h>
 #include <plat/nand.h>
 #include <plat/sdhci.h>
+#include <plat/udc.h>
=20
 #include <plat/regs-fb-v4.h>
 #include <plat/fb.h>
@@ -121,6 +124,27 @@ static struct s3c2410_uartcfg smdk2416_uartcfgs[] __in=
itdata =3D {
 	}
 };
=20
+void smdk2416_hsudc_gpio_init(void)
+{
+	s3c_gpio_setpull(S3C2410_GPH(14), S3C_GPIO_PULL_UP);
+	s3c_gpio_setpull(S3C2410_GPF(2), S3C_GPIO_PULL_NONE);
+	s3c_gpio_cfgpin(S3C2410_GPH(14), S3C_GPIO_SFN(1));
+	s3c2410_modify_misccr(S3C2416_MISCCR_SEL_SUSPND, 0);
+}
+
+void smdk2416_hsudc_gpio_uninit(void)
+{
+	s3c2410_modify_misccr(S3C2416_MISCCR_SEL_SUSPND, 1);
+	s3c_gpio_setpull(S3C2410_GPH(14), S3C_GPIO_PULL_NONE);
+	s3c_gpio_cfgpin(S3C2410_GPH(14), S3C_GPIO_SFN(0));
+}
+
+struct s3c24xx_hsudc_platdata smdk2416_hsudc_platdata =3D {
+	.epnum =3D 9,
+	.gpio_init =3D smdk2416_hsudc_gpio_init,
+	.gpio_uninit =3D smdk2416_hsudc_gpio_uninit,
+};
+
 struct s3c_fb_pd_win smdk2416_fb_win[] =3D {
 	[0] =3D {
 		/* think this is the same as the smdk6410 */
@@ -186,6 +210,7 @@ static struct platform_device *smdk2416_devices[] __ini=
tdata =3D {
 	&s3c_device_i2c0,
 	&s3c_device_hsmmc0,
 	&s3c_device_hsmmc1,
+	&s3c_device_usb_hsudc,
 };
=20
 static void __init smdk2416_map_io(void)
@@ -203,6 +228,8 @@ static void __init smdk2416_machine_init(void)
 	s3c_sdhci0_set_platdata(&smdk2416_hsmmc0_pdata);
 	s3c_sdhci1_set_platdata(&smdk2416_hsmmc1_pdata);
=20
+	s3c24xx_hsudc_set_platdata(&smdk2416_hsudc_platdata);
+
 	gpio_request(S3C2410_GPB(4), "USBHost Power");
 	gpio_direction_output(S3C2410_GPB(4), 1);
=20
=2D-=20
1.7.2.3


--Boundary-00=_1eSbNu+/IQQys84
Content-Type: text/x-patch;
  charset="UTF-8";
  name="0003-USB-Gadget-Add-Samsung-S3C24XX-USB-High-Speed-contro.patch"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="0003-USB-Gadget-Add-Samsung-S3C24XX-USB-High-Speed-contro.patch"

=46rom c063317869d11c3b8f906061319f8a075de06b5c Mon Sep 17 00:00:00 2001
=46rom: Thomas Abraham <thomas.ab@samsung.com>
Date: Sat, 23 Oct 2010 07:51:55 +0900
Subject: [PATCH 3/4] USB: Gadget: Add Samsung S3C24XX USB High-Speed contro=
ller driver

The Samsung's S3C2416, S3C2443 and S3C2450 includes a USB High-Speed
device controller module. This driver enables support for USB high-speed
gadget functionality for the Samsung S3C24xx SoC's that include this
controller.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
=2D--
 drivers/usb/gadget/Kconfig        |   17 +
 drivers/usb/gadget/Makefile       |    1 +
 drivers/usb/gadget/gadget_chips.h |    8 +
 drivers/usb/gadget/s3c-hsudc.c    | 1329 +++++++++++++++++++++++++++++++++=
++++
 4 files changed, 1355 insertions(+), 0 deletions(-)
 create mode 100644 drivers/usb/gadget/s3c-hsudc.c

diff --git a/drivers/usb/gadget/Kconfig b/drivers/usb/gadget/Kconfig
index d500996..d836756 100644
=2D-- a/drivers/usb/gadget/Kconfig
+++ b/drivers/usb/gadget/Kconfig
@@ -338,6 +338,23 @@ config USB_S3C2410_DEBUG
 	boolean "S3C2410 udc debug messages"
 	depends on USB_GADGET_S3C2410
=20
+config USB_GADGET_S3C_HSUDC
+	boolean "S3C2416, S3C2443 and S3C2450 USB Device Controller"
+	depends on ARCH_S3C2410
+	select USB_GADGET_DUALSPEED
+	help
+	  Samsung's S3C2416, S3C2443 and S3C2450 is an ARM9 based SoC
+	  integrated with dual speed USB 2.0 device controller. It has
+	  8 endpoints, as well as endpoint zero.
+
+	  This driver has been tested on S3C2416 and S3C2450 processors.
+
+config USB_S3C_HSUDC
+	tristate
+	depends on USB_GADGET_S3C_HSUDC
+	default USB_GADGET
+	select USB_GADGET_SELECTED
+
 config USB_GADGET_PXA_U2O
 	boolean "PXA9xx Processor USB2.0 controller"
 	select USB_GADGET_DUALSPEED
diff --git a/drivers/usb/gadget/Makefile b/drivers/usb/gadget/Makefile
index 55f5e8a..540783c 100644
=2D-- a/drivers/usb/gadget/Makefile
+++ b/drivers/usb/gadget/Makefile
@@ -23,6 +23,7 @@ obj-$(CONFIG_USB_R8A66597)	+=3D r8a66597-udc.o
 obj-$(CONFIG_USB_FSL_QE)	+=3D fsl_qe_udc.o
 obj-$(CONFIG_USB_CI13XXX_PCI)	+=3D ci13xxx_pci.o
 obj-$(CONFIG_USB_S3C_HSOTG)	+=3D s3c-hsotg.o
+obj-$(CONFIG_USB_S3C_HSUDC)	+=3D s3c-hsudc.o
 obj-$(CONFIG_USB_LANGWELL)	+=3D langwell_udc.o
 obj-$(CONFIG_USB_EG20T)		+=3D pch_udc.o
 obj-$(CONFIG_USB_PXA_U2O)	+=3D mv_udc.o
diff --git a/drivers/usb/gadget/gadget_chips.h b/drivers/usb/gadget/gadget_=
chips.h
index 5c2720d..836a08e 100644
=2D-- a/drivers/usb/gadget/gadget_chips.h
+++ b/drivers/usb/gadget/gadget_chips.h
@@ -142,6 +142,12 @@
 #define gadget_is_s3c_hsotg(g)    0
 #endif
=20
+#ifdef CONFIG_USB_S3C_HSUDC
+#define gadget_is_s3c_hsudc(g) (!strcmp("s3c-hsudc", (g)->name))
+#else
+#define gadget_is_s3c_hsudc(g) 0
+#endif
+
 #ifdef CONFIG_USB_GADGET_EG20T
 #define	gadget_is_pch(g)	(!strcmp("pch_udc", (g)->name))
 #else
@@ -215,6 +221,8 @@ static inline int usb_gadget_controller_number(struct u=
sb_gadget *gadget)
 		return 0x27;
 	else if (gadget_is_ci13xxx_msm(gadget))
 		return 0x28;
+	else if (gadget_is_s3c_hsudc(gadget))
+		return 0x29;
 	return -ENOENT;
 }
=20
diff --git a/drivers/usb/gadget/s3c-hsudc.c b/drivers/usb/gadget/s3c-hsudc.c
new file mode 100644
index 0000000..b98d8a1
=2D-- /dev/null
+++ b/drivers/usb/gadget/s3c-hsudc.c
@@ -0,0 +1,1329 @@
+/* linux/drivers/usb/gadget/s3c-hsudc.c
+ *
+ * Copyright (c) 2010 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * S3C24XX USB 2.0 High-speed USB controller gadget driver
+ *
+ * The S3C24XX USB 2.0 high-speed USB controller supports upto 9 endpoints.
+ * Each endpoint can be configured as either in or out endpoint. Endpoints
+ * can be configured for Bulk or Interrupt transfer mode.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/spinlock.h>
+#include <linux/interrupt.h>
+#include <linux/platform_device.h>
+#include <linux/dma-mapping.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/slab.h>
+#include <linux/clk.h>
+#include <linux/usb/ch9.h>
+#include <linux/usb/gadget.h>
+
+#include <mach/regs-s3c2443-clock.h>
+#include <plat/udc.h>
+
+#define S3C_HSUDC_REG(x)	(x)
+
+/* Non-Indexed Registers */
+#define S3C_IR				S3C_HSUDC_REG(0x00) /* Index Register */
+#define S3C_EIR				S3C_HSUDC_REG(0x04) /* EP Intr Status */
+#define S3C_EIR_EP0			(1<<0)
+#define S3C_EIER			S3C_HSUDC_REG(0x08) /* EP Intr Enable */
+#define S3C_FAR				S3C_HSUDC_REG(0x0c) /* Gadget Address */
+#define S3C_FNR				S3C_HSUDC_REG(0x10) /* Frame Number */
+#define S3C_EDR				S3C_HSUDC_REG(0x14) /* EP Direction */
+#define S3C_TR				S3C_HSUDC_REG(0x18) /* Test Register */
+#define S3C_SSR				S3C_HSUDC_REG(0x1c) /* System Status */
+#define S3C_SSR_DTZIEN_EN		(0xff8f)
+#define S3C_SSR_ERR			(0xff80)
+#define S3C_SSR_VBUSON			(1 << 8)
+#define S3C_SSR_HSP			(1 << 4)
+#define S3C_SSR_SDE			(1 << 3)
+#define S3C_SSR_RESUME			(1 << 2)
+#define S3C_SSR_SUSPEND			(1 << 1)
+#define S3C_SSR_RESET			(1 << 0)
+#define S3C_SCR				S3C_HSUDC_REG(0x20) /* System Control */
+#define S3C_SCR_DTZIEN_EN		(1 << 14)
+#define S3C_SCR_RRD_EN			(1 << 5)
+#define S3C_SCR_SUS_EN			(1 << 1)
+#define S3C_SCR_RST_EN			(1 << 0)
+#define S3C_EP0SR			S3C_HSUDC_REG(0x24) /* EP0 Status */
+#define S3C_EP0SR_EP0_LWO		(1 << 6)
+#define S3C_EP0SR_STALL			(1 << 4)
+#define S3C_EP0SR_TX_SUCCESS		(1 << 1)
+#define S3C_EP0SR_RX_SUCCESS		(1 << 0)
+#define S3C_EP0CR			S3C_HSUDC_REG(0x28) /* EP0 Control */
+#define S3C_BR(_x)			S3C_HSUDC_REG(0x60 + (_x * 4))
+
+/* Indexed Registers */
+#define S3C_ESR				S3C_HSUDC_REG(0x2c) /* EPn Status */
+#define S3C_ESR_FLUSH			(1 << 6)
+#define S3C_ESR_STALL			(1 << 5)
+#define S3C_ESR_LWO			(1 << 4)
+#define S3C_ESR_PSIF_ONE		(1 << 2)
+#define S3C_ESR_PSIF_TWO		(2 << 2)
+#define S3C_ESR_TX_SUCCESS		(1 << 1)
+#define S3C_ESR_RX_SUCCESS		(1 << 0)
+#define S3C_ECR				S3C_HSUDC_REG(0x30) /* EPn Control */
+#define S3C_ECR_DUEN			(1 << 7)
+#define S3C_ECR_FLUSH			(1 << 6)
+#define S3C_ECR_STALL			(1 << 1)
+#define S3C_ECR_IEMS			(1 << 0)
+#define S3C_BRCR			S3C_HSUDC_REG(0x34) /* Read Count */
+#define S3C_BWCR			S3C_HSUDC_REG(0x38) /* Write Count */
+#define S3C_MPR				S3C_HSUDC_REG(0x3c) /* Max Pkt Size */
+
+#define WAIT_FOR_SETUP			(0)
+#define DATA_STATE_XMIT			(1)
+#define DATA_STATE_RECV			(2)
+
+/**
+ * struct s3c_hsudc_ep - Endpoint representation used by driver.
+ * @ep: USB gadget layer representation of device endpoint.
+ * @name: Endpoint name (as required by ep autoconfiguration).
+ * @dev: Reference to the device controller to which this EP belongs.
+ * @desc: Endpoint descriptor obtained from the gadget driver.
+ * @queue: Transfer request queue for the endpoint.
+ * @stopped: Maintains state of endpoint, set if EP is halted.
+ * @bEndpointAddress: EP address (including direction bit).
+ * @fifo: Base address of EP FIFO.
+ */
+struct s3c_hsudc_ep {
+	struct usb_ep ep;
+	char name[20];
+	struct s3c_hsudc *dev;
+	const struct usb_endpoint_descriptor *desc;
+	struct list_head queue;
+	u8 stopped;
+	u8 bEndpointAddress;
+	void __iomem *fifo;
+};
+
+/**
+ * struct s3c_hsudc_req - Driver encapsulation of USB gadget transfer requ=
est.
+ * @req: Reference to USB gadget transfer request.
+ * @queue: Used for inserting this request to the endpoint request queue.
+ */
+struct s3c_hsudc_req {
+	struct usb_request req;
+	struct list_head queue;
+};
+
+/**
+ * struct s3c_hsudc - Driver's abstraction of the device controller.
+ * @gadget: Instance of usb_gadget which is referenced by gadget driver.
+ * @driver: Reference to currenty active gadget driver.
+ * @dev: The device reference used by probe function.
+ * @lock: Lock to synchronize the usage of Endpoints (EP's are indexed).
+ * @regs: Remapped base address of controller's register space.
+ * @mem_rsrc: Device memory resource used for remapping device register sp=
ace.
+ * irq: IRQ number used by the controller.
+ * uclk: Reference to the controller clock.
+ * ep0state: Current state of EP0.
+ * ep: List of endpoints supported by the controller.
+ */
+struct s3c_hsudc {
+	struct usb_gadget gadget;
+	struct usb_gadget_driver *driver;
+	struct device *dev;
+	struct s3c24xx_hsudc_platdata *pd;
+	spinlock_t lock;
+	void __iomem *regs;
+	struct resource *mem_rsrc;
+	int irq;
+	struct clk *uclk;
+	int ep0state;
+	struct s3c_hsudc_ep ep[];
+};
+
+#define ep_maxpacket(_ep)	((_ep)->ep.maxpacket)
+#define ep_is_in(_ep)		((_ep)->bEndpointAddress & USB_DIR_IN)
+#define ep_index(_ep)		((_ep)->bEndpointAddress & \
+					USB_ENDPOINT_NUMBER_MASK)
+
+static struct s3c_hsudc *the_controller;
+static const char driver_name[] =3D "s3c-udc";
+static const char ep0name[] =3D "ep0-control";
+
+static inline struct s3c_hsudc_req *our_req(struct usb_request *req)
+{
+	return container_of(req, struct s3c_hsudc_req, req);
+}
+
+static inline struct s3c_hsudc_ep *our_ep(struct usb_ep *ep)
+{
+	return container_of(ep, struct s3c_hsudc_ep, ep);
+}
+
+static inline struct s3c_hsudc *to_hsudc(struct usb_gadget *gadget)
+{
+	return container_of(gadget, struct s3c_hsudc, gadget);
+}
+
+static inline void set_index(struct s3c_hsudc *hsudc, int ep_addr)
+{
+	ep_addr &=3D USB_ENDPOINT_NUMBER_MASK;
+	writel(ep_addr, hsudc->regs + S3C_IR);
+}
+
+static inline void __orr32(void __iomem *ptr, u32 val)
+{
+	writel(readl(ptr) | val, ptr);
+}
+
+static void s3c_hsudc_init_phy(void)
+{
+	u32 cfg;
+
+	cfg =3D readl(S3C2443_PWRCFG) | S3C2443_PWRCFG_USBPHY;
+	writel(cfg, S3C2443_PWRCFG);
+
+	cfg =3D readl(S3C2443_URSTCON);
+	cfg |=3D (S3C2443_URSTCON_FUNCRST | S3C2443_URSTCON_PHYRST);
+	writel(cfg, S3C2443_URSTCON);
+	mdelay(1);
+
+	cfg =3D readl(S3C2443_URSTCON);
+	cfg &=3D ~(S3C2443_URSTCON_FUNCRST | S3C2443_URSTCON_PHYRST);
+	writel(cfg, S3C2443_URSTCON);
+
+	cfg =3D readl(S3C2443_PHYCTRL);
+	cfg &=3D ~(S3C2443_PHYCTRL_CLKSEL | S3C2443_PHYCTRL_DSPORT);
+	cfg |=3D (S3C2443_PHYCTRL_EXTCLK | S3C2443_PHYCTRL_PLLSEL);
+	writel(cfg, S3C2443_PHYCTRL);
+
+	cfg =3D readl(S3C2443_PHYPWR);
+	cfg &=3D ~(S3C2443_PHYPWR_FSUSPEND | S3C2443_PHYPWR_PLL_PWRDN |
+		S3C2443_PHYPWR_XO_ON | S3C2443_PHYPWR_PLL_REFCLK |
+		S3C2443_PHYPWR_ANALOG_PD);
+	cfg |=3D S3C2443_PHYPWR_COMMON_ON;
+	writel(cfg, S3C2443_PHYPWR);
+
+	cfg =3D readl(S3C2443_UCLKCON);
+	cfg |=3D (S3C2443_UCLKCON_DETECT_VBUS | S3C2443_UCLKCON_FUNC_CLKEN |
+		S3C2443_UCLKCON_TCLKEN);
+	writel(cfg, S3C2443_UCLKCON);
+}
+
+static void s3c_hsudc_uninit_phy(void)
+{
+	u32 cfg;
+
+	cfg =3D readl(S3C2443_PWRCFG) & ~S3C2443_PWRCFG_USBPHY;
+	writel(cfg, S3C2443_PWRCFG);
+
+	writel(S3C2443_PHYPWR_FSUSPEND, S3C2443_PHYPWR);
+
+	cfg =3D readl(S3C2443_UCLKCON) & ~S3C2443_UCLKCON_FUNC_CLKEN;
+	writel(cfg, S3C2443_UCLKCON);
+}
+
+/**
+ * s3c_hsudc_complete_request - Complete a transfer request.
+ * @hsep: Endpoint to which the request belongs.
+ * @hsreq: Transfer request to be completed.
+ * @status: Transfer completion status for the transfer request.
+ */
+static void s3c_hsudc_complete_request(struct s3c_hsudc_ep *hsep,
+				struct s3c_hsudc_req *hsreq, int status)
+{
+	unsigned int stopped =3D hsep->stopped;
+	struct s3c_hsudc *hsudc =3D hsep->dev;
+
+	list_del_init(&hsreq->queue);
+	hsreq->req.status =3D status;
+
+	if (!ep_index(hsep)) {
+		hsudc->ep0state =3D WAIT_FOR_SETUP;
+		hsep->bEndpointAddress &=3D ~USB_DIR_IN;
+	}
+
+	hsep->stopped =3D 1;
+	spin_unlock(&hsudc->lock);
+	if (hsreq->req.complete !=3D NULL)
+		hsreq->req.complete(&hsep->ep, &hsreq->req);
+	spin_lock(&hsudc->lock);
+	hsep->stopped =3D stopped;
+}
+
+/**
+ * s3c_hsudc_nuke_ep - Terminate all requests queued for a endpoint.
+ * @hsep: Endpoint for which queued requests have to be terminated.
+ * @status: Transfer completion status for the transfer request.
+ */
+static void s3c_hsudc_nuke_ep(struct s3c_hsudc_ep *hsep, int status)
+{
+	struct s3c_hsudc_req *hsreq;
+
+	while (!list_empty(&hsep->queue)) {
+		hsreq =3D list_entry(hsep->queue.next,
+				struct s3c_hsudc_req, queue);
+		s3c_hsudc_complete_request(hsep, hsreq, status);
+	}
+}
+
+/**
+ * s3c_hsudc_stop_activity - Stop activity on all endpoints.
+ * @hsudc: Device controller for which EP activity is to be stopped.
+ * @driver: Reference to the gadget driver which is currently active.
+ *
+ * All the endpoints are stopped and any pending transfer requests if any =
on
+ * the endpoint are terminated.
+ */
+static void s3c_hsudc_stop_activity(struct s3c_hsudc *hsudc,
+			  struct usb_gadget_driver *driver)
+{
+	struct s3c_hsudc_ep *hsep;
+	int epnum;
+
+	hsudc->gadget.speed =3D USB_SPEED_UNKNOWN;
+
+	for (epnum =3D 0; epnum < hsudc->pd->epnum; epnum++) {
+		hsep =3D &hsudc->ep[epnum];
+		hsep->stopped =3D 1;
+		s3c_hsudc_nuke_ep(hsep, -ESHUTDOWN);
+	}
+
+	spin_unlock(&hsudc->lock);
+	driver->disconnect(&hsudc->gadget);
+	spin_lock(&hsudc->lock);
+}
+
+/**
+ * s3c_hsudc_read_setup_pkt - Read the received setup packet from EP0 fifo.
+ * @hsudc: Device controller from which setup packet is to be read.
+ * @buf: The buffer into which the setup packet is read.
+ *
+ * The setup packet received in the EP0 fifo is read and stored into a
+ * given buffer address.
+ */
+
+static void s3c_hsudc_read_setup_pkt(struct s3c_hsudc *hsudc, u16 *buf)
+{
+	int count;
+
+	count =3D readl(hsudc->regs + S3C_BRCR);
+	while (count--)
+		*buf++ =3D (u16)readl(hsudc->regs + S3C_BR(0));
+
+	writel(S3C_EP0SR_RX_SUCCESS, hsudc->regs + S3C_EP0SR);
+}
+
+/**
+ * s3c_hsudc_write_fifo - Write next chunk of transfer data to EP fifo.
+ * @hsep: Endpoint to which the data is to be written.
+ * @hsreq: Transfer request from which the next chunk of data is written.
+ *
+ * Write the next chunk of data from a transfer request to the endpoint FI=
=46O.
+ * If the transfer request completes, 1 is returned, otherwise 0 is return=
ed.
+ */
+static int s3c_hsudc_write_fifo(struct s3c_hsudc_ep *hsep,
+				struct s3c_hsudc_req *hsreq)
+{
+	u16 *buf;
+	u32 max =3D ep_maxpacket(hsep);
+	u32 count, length;
+	bool is_last;
+	void __iomem *fifo =3D hsep->fifo;
+
+	buf =3D hsreq->req.buf + hsreq->req.actual;
+	prefetch(buf);
+
+	length =3D hsreq->req.length - hsreq->req.actual;
+	length =3D min(length, max);
+	hsreq->req.actual +=3D length;
+
+	writel(length, hsep->dev->regs + S3C_BWCR);
+	for (count =3D 0; count < length; count +=3D 2)
+		writel(*buf++, fifo);
+
+	if (count !=3D max) {
+		is_last =3D true;
+	} else {
+		if (hsreq->req.length !=3D hsreq->req.actual || hsreq->req.zero)
+			is_last =3D false;
+		else
+			is_last =3D true;
+	}
+
+	if (is_last) {
+		s3c_hsudc_complete_request(hsep, hsreq, 0);
+		return 1;
+	}
+
+	return 0;
+}
+
+/**
+ * s3c_hsudc_read_fifo - Read the next chunk of data from EP fifo.
+ * @hsep: Endpoint from which the data is to be read.
+ * @hsreq: Transfer request to which the next chunk of data read is writte=
n.
+ *
+ * Read the next chunk of data from the endpoint FIFO and a write it to the
+ * transfer request buffer. If the transfer request completes, 1 is return=
ed,
+ * otherwise 0 is returned.
+ */
+static int s3c_hsudc_read_fifo(struct s3c_hsudc_ep *hsep,
+				struct s3c_hsudc_req *hsreq)
+{
+	struct s3c_hsudc *hsudc =3D hsep->dev;
+	u32 csr, offset;
+	u16 *buf, word;
+	u32 buflen, rcnt, rlen;
+	void __iomem *fifo =3D hsep->fifo;
+	u32 is_short =3D 0;
+
+	offset =3D (ep_index(hsep)) ? S3C_ESR : S3C_EP0SR;
+	csr =3D readl(hsudc->regs + offset);
+	if (!(csr & S3C_ESR_RX_SUCCESS))
+		return -EINVAL;
+
+	buf =3D hsreq->req.buf + hsreq->req.actual;
+	prefetchw(buf);
+	buflen =3D hsreq->req.length - hsreq->req.actual;
+
+	rcnt =3D readl(hsudc->regs + S3C_BRCR);
+	rlen =3D (csr & S3C_ESR_LWO) ? (rcnt * 2 - 1) : (rcnt * 2);
+
+	hsreq->req.actual +=3D min(rlen, buflen);
+	is_short =3D (rlen < hsep->ep.maxpacket);
+
+	while (rcnt-- !=3D 0) {
+		word =3D (u16)readl(fifo);
+		if (buflen) {
+			*buf++ =3D word;
+			buflen--;
+		} else {
+			hsreq->req.status =3D -EOVERFLOW;
+		}
+	}
+
+	writel(S3C_ESR_RX_SUCCESS, hsudc->regs + offset);
+
+	if (is_short || hsreq->req.actual =3D=3D hsreq->req.length) {
+		s3c_hsudc_complete_request(hsep, hsreq, 0);
+		return 1;
+	}
+
+	return 0;
+}
+
+/**
+ * s3c_hsudc_epin_intr - Handle in-endpoint interrupt.
+ * @hsudc - Device controller for which the interrupt is to be handled.
+ * @ep_idx - Endpoint number on which an interrupt is pending.
+ *
+ * Handles interrupt for a in-endpoint. The interrupts that are handled are
+ * stall and data transmit complete interrupt.
+ */
+static void s3c_hsudc_epin_intr(struct s3c_hsudc *hsudc, u32 ep_idx)
+{
+	struct s3c_hsudc_ep *hsep =3D &hsudc->ep[ep_idx];
+	struct s3c_hsudc_req *hsreq;
+	u32 csr;
+
+	csr =3D readl((u32)hsudc->regs + S3C_ESR);
+	if (csr & S3C_ESR_STALL) {
+		writel(S3C_ESR_STALL, hsudc->regs + S3C_ESR);
+		return;
+	}
+
+	if (csr & S3C_ESR_TX_SUCCESS) {
+		writel(S3C_ESR_TX_SUCCESS, hsudc->regs + S3C_ESR);
+		if (list_empty(&hsep->queue))
+			return;
+
+		hsreq =3D list_entry(hsep->queue.next,
+				struct s3c_hsudc_req, queue);
+		if ((s3c_hsudc_write_fifo(hsep, hsreq) =3D=3D 0) &&
+				(csr & S3C_ESR_PSIF_TWO))
+			s3c_hsudc_write_fifo(hsep, hsreq);
+	}
+}
+
+/**
+ * s3c_hsudc_epout_intr - Handle out-endpoint interrupt.
+ * @hsudc - Device controller for which the interrupt is to be handled.
+ * @ep_idx - Endpoint number on which an interrupt is pending.
+ *
+ * Handles interrupt for a out-endpoint. The interrupts that are handled a=
re
+ * stall, flush and data ready interrupt.
+ */
+static void s3c_hsudc_epout_intr(struct s3c_hsudc *hsudc, u32 ep_idx)
+{
+	struct s3c_hsudc_ep *hsep =3D &hsudc->ep[ep_idx];
+	struct s3c_hsudc_req *hsreq;
+	u32 csr;
+
+	csr =3D readl((u32)hsudc->regs + S3C_ESR);
+	if (csr & S3C_ESR_STALL) {
+		writel(S3C_ESR_STALL, hsudc->regs + S3C_ESR);
+		return;
+	}
+
+	if (csr & S3C_ESR_FLUSH) {
+		__orr32(hsudc->regs + S3C_ECR, S3C_ECR_FLUSH);
+		return;
+	}
+
+	if (csr & S3C_ESR_RX_SUCCESS) {
+		if (list_empty(&hsep->queue))
+			return;
+
+		hsreq =3D list_entry(hsep->queue.next,
+				struct s3c_hsudc_req, queue);
+		if (((s3c_hsudc_read_fifo(hsep, hsreq)) =3D=3D 0) &&
+				(csr & S3C_ESR_PSIF_TWO))
+			s3c_hsudc_read_fifo(hsep, hsreq);
+	}
+}
+
+/** s3c_hsudc_set_halt - Set or clear a endpoint halt.
+ * @_ep: Endpoint on which halt has to be set or cleared.
+ * @value: 1 for setting halt on endpoint, 0 to clear halt.
+ *
+ * Set or clear endpoint halt. If halt is set, the endpoint is stopped.
+ * If halt is cleared, for in-endpoints, if there are any pending
+ * transfer requests, transfers are started.
+ */
+static int s3c_hsudc_set_halt(struct usb_ep *_ep, int value)
+{
+	struct s3c_hsudc_ep *hsep =3D our_ep(_ep);
+	struct s3c_hsudc *hsudc =3D hsep->dev;
+	struct s3c_hsudc_req *hsreq;
+	unsigned long irqflags;
+	u32 ecr;
+	u32 offset;
+
+	if (value && ep_is_in(hsep) && !list_empty(&hsep->queue))
+		return -EAGAIN;
+
+	spin_lock_irqsave(&hsudc->lock, irqflags);
+	set_index(hsudc, ep_index(hsep));
+	offset =3D (ep_index(hsep)) ? S3C_ECR : S3C_EP0CR;
+	ecr =3D readl(hsudc->regs + offset);
+
+	if (value) {
+		ecr |=3D S3C_ECR_STALL;
+		if (ep_index(hsep))
+			ecr |=3D S3C_ECR_FLUSH;
+		hsep->stopped =3D 1;
+	} else {
+		ecr &=3D ~S3C_ECR_STALL;
+		hsep->stopped =3D 0;
+	}
+	writel(ecr, hsudc->regs + offset);
+
+	if (ep_is_in(hsep) && !list_empty(&hsep->queue) && !value) {
+		hsreq =3D list_entry(hsep->queue.next,
+			struct s3c_hsudc_req, queue);
+		if (hsreq)
+			s3c_hsudc_write_fifo(hsep, hsreq);
+	}
+
+	spin_unlock_irqrestore(&hsudc->lock, irqflags);
+	return 0;
+}
+
+/** s3c_hsudc_handle_reqfeat - Handle set feature or clear feature request=
s.
+ * @_ep: Device controller on which the set/clear feature needs to be hand=
led.
+ * @ctrl: Control request as received on the endpoint 0.
+ *
+ * Handle set feature or clear feature control requests on the control end=
point.
+ */
+static int s3c_hsudc_handle_reqfeat(struct s3c_hsudc *hsudc,
+					struct usb_ctrlrequest *ctrl)
+{
+	struct s3c_hsudc_ep *hsep;
+	bool set =3D (ctrl->bRequest =3D=3D USB_REQ_SET_FEATURE);
+	u8 ep_num =3D ctrl->wIndex & USB_ENDPOINT_NUMBER_MASK;
+
+	if (ctrl->bRequestType =3D=3D USB_RECIP_ENDPOINT) {
+		hsep =3D &hsudc->ep[ep_num];
+		switch (le16_to_cpu(ctrl->wValue)) {
+		case USB_ENDPOINT_HALT:
+			s3c_hsudc_set_halt(&hsep->ep, set);
+			return 0;
+		}
+	}
+
+	return -ENOENT;
+}
+
+/**
+ * s3c_hsudc_process_req_status - Handle get status control request.
+ * @hsudc: Device controller on which get status request has be handled.
+ * @ctrl: Control request as received on the endpoint 0.
+ *
+ * Handle get status control request received on control endpoint.
+ */
+static void s3c_hsudc_process_req_status(struct s3c_hsudc *hsudc,
+					struct usb_ctrlrequest *ctrl)
+{
+	struct s3c_hsudc_ep *hsep0 =3D &hsudc->ep[0];
+	struct s3c_hsudc_req hsreq;
+	struct s3c_hsudc_ep *hsep;
+	__le16 reply;
+	u8 epnum;
+
+	switch (ctrl->bRequestType & USB_RECIP_MASK) {
+	case USB_RECIP_DEVICE:
+		reply =3D cpu_to_le16(0);
+		break;
+
+	case USB_RECIP_INTERFACE:
+		reply =3D cpu_to_le16(0);
+		break;
+
+	case USB_RECIP_ENDPOINT:
+		epnum =3D le16_to_cpu(ctrl->wIndex) & USB_ENDPOINT_NUMBER_MASK;
+		hsep =3D &hsudc->ep[epnum];
+		reply =3D cpu_to_le16(hsep->stopped ? 1 : 0);
+		break;
+	}
+
+	INIT_LIST_HEAD(&hsreq.queue);
+	hsreq.req.length =3D 2;
+	hsreq.req.buf =3D &reply;
+	hsreq.req.actual =3D 0;
+	hsreq.req.complete =3D NULL;
+	s3c_hsudc_write_fifo(hsep0, &hsreq);
+}
+
+/**
+ * s3c_hsudc_process_setup - Process control request received on endpoint =
0.
+ * @hsudc: Device controller on which control request has been received.
+ *
+ * Read the control request received on endpoint 0, decode it and handle
+ * the request.
+ */
+static void s3c_hsudc_process_setup(struct s3c_hsudc *hsudc)
+{
+	struct s3c_hsudc_ep *hsep =3D &hsudc->ep[0];
+	struct usb_ctrlrequest ctrl =3D {0};
+	int ret;
+
+	s3c_hsudc_nuke_ep(hsep, -EPROTO);
+	s3c_hsudc_read_setup_pkt(hsudc, (u16 *)&ctrl);
+
+	if (ctrl.bRequestType & USB_DIR_IN) {
+		hsep->bEndpointAddress |=3D USB_DIR_IN;
+		hsudc->ep0state =3D DATA_STATE_XMIT;
+	} else {
+		hsep->bEndpointAddress &=3D ~USB_DIR_IN;
+		hsudc->ep0state =3D DATA_STATE_RECV;
+	}
+
+	switch (ctrl.bRequest) {
+	case USB_REQ_SET_ADDRESS:
+		if (ctrl.bRequestType !=3D (USB_TYPE_STANDARD | USB_RECIP_DEVICE))
+			break;
+		hsudc->ep0state =3D WAIT_FOR_SETUP;
+		return;
+
+	case USB_REQ_GET_STATUS:
+		if ((ctrl.bRequestType & USB_TYPE_MASK) !=3D USB_TYPE_STANDARD)
+			break;
+		s3c_hsudc_process_req_status(hsudc, &ctrl);
+		return;
+
+	case USB_REQ_SET_FEATURE:
+	case USB_REQ_CLEAR_FEATURE:
+		if ((ctrl.bRequestType & USB_TYPE_MASK) !=3D USB_TYPE_STANDARD)
+			break;
+		s3c_hsudc_handle_reqfeat(hsudc, &ctrl);
+		hsudc->ep0state =3D WAIT_FOR_SETUP;
+		return;
+	}
+
+	if (hsudc->driver) {
+		spin_unlock(&hsudc->lock);
+		ret =3D hsudc->driver->setup(&hsudc->gadget, &ctrl);
+		spin_lock(&hsudc->lock);
+
+		if (ctrl.bRequest =3D=3D USB_REQ_SET_CONFIGURATION) {
+			hsep->bEndpointAddress &=3D ~USB_DIR_IN;
+			hsudc->ep0state =3D WAIT_FOR_SETUP;
+		}
+
+		if (ret < 0) {
+			dev_err(hsudc->dev, "setup failed, returned %d\n",
+						ret);
+			s3c_hsudc_set_halt(&hsep->ep, 1);
+			hsudc->ep0state =3D WAIT_FOR_SETUP;
+			hsep->bEndpointAddress &=3D ~USB_DIR_IN;
+		}
+	}
+}
+
+/** s3c_hsudc_handle_ep0_intr - Handle endpoint 0 interrupt.
+ * @hsudc: Device controller on which endpoint 0 interrupt has occured.
+ *
+ * Handle endpoint 0 interrupt when it occurs. EP0 interrupt could occur
+ * when a stall handshake is sent to host or data is sent/received on
+ * endpoint 0.
+ */
+static void s3c_hsudc_handle_ep0_intr(struct s3c_hsudc *hsudc)
+{
+	struct s3c_hsudc_ep *hsep =3D &hsudc->ep[0];
+	struct s3c_hsudc_req *hsreq;
+	u32 csr =3D readl(hsudc->regs + S3C_EP0SR);
+	u32 ecr;
+
+	if (csr & S3C_EP0SR_STALL) {
+		ecr =3D readl(hsudc->regs + S3C_EP0CR);
+		ecr &=3D ~(S3C_ECR_STALL | S3C_ECR_FLUSH);
+		writel(ecr, hsudc->regs + S3C_EP0CR);
+
+		writel(S3C_EP0SR_STALL, hsudc->regs + S3C_EP0SR);
+		hsep->stopped =3D 0;
+
+		s3c_hsudc_nuke_ep(hsep, -ECONNABORTED);
+		hsudc->ep0state =3D WAIT_FOR_SETUP;
+		hsep->bEndpointAddress &=3D ~USB_DIR_IN;
+		return;
+	}
+
+	if (csr & S3C_EP0SR_TX_SUCCESS) {
+		writel(S3C_EP0SR_TX_SUCCESS, hsudc->regs + S3C_EP0SR);
+		if (ep_is_in(hsep)) {
+			if (list_empty(&hsep->queue))
+				return;
+
+			hsreq =3D list_entry(hsep->queue.next,
+					struct s3c_hsudc_req, queue);
+			s3c_hsudc_write_fifo(hsep, hsreq);
+		}
+	}
+
+	if (csr & S3C_EP0SR_RX_SUCCESS) {
+		if (hsudc->ep0state =3D=3D WAIT_FOR_SETUP)
+			s3c_hsudc_process_setup(hsudc);
+		else {
+			if (!ep_is_in(hsep)) {
+				if (list_empty(&hsep->queue))
+					return;
+				hsreq =3D list_entry(hsep->queue.next,
+					struct s3c_hsudc_req, queue);
+				s3c_hsudc_read_fifo(hsep, hsreq);
+			}
+		}
+	}
+}
+
+/**
+ * s3c_hsudc_ep_enable - Enable a endpoint.
+ * @_ep: The endpoint to be enabled.
+ * @desc: Endpoint descriptor.
+ *
+ * Enables a endpoint when called from the gadget driver. Endpoint stall if
+ * any is cleared, transfer type is configured and endpoint interrupt is
+ * enabled.
+ */
+static int s3c_hsudc_ep_enable(struct usb_ep *_ep,
+				const struct usb_endpoint_descriptor *desc)
+{
+	struct s3c_hsudc_ep *hsep;
+	struct s3c_hsudc *hsudc;
+	unsigned long flags;
+	u32 ecr =3D 0;
+
+	hsep =3D container_of(_ep, struct s3c_hsudc_ep, ep);
+	if (!_ep || !desc || hsep->desc || _ep->name =3D=3D ep0name
+		|| desc->bDescriptorType !=3D USB_DT_ENDPOINT
+		|| hsep->bEndpointAddress !=3D desc->bEndpointAddress
+		|| ep_maxpacket(hsep) < le16_to_cpu(desc->wMaxPacketSize))
+		return -EINVAL;
+
+	if ((desc->bmAttributes =3D=3D USB_ENDPOINT_XFER_BULK
+		&& le16_to_cpu(desc->wMaxPacketSize) !=3D ep_maxpacket(hsep))
+		|| !desc->wMaxPacketSize)
+		return -ERANGE;
+
+	hsudc =3D hsep->dev;
+	if (!hsudc->driver || hsudc->gadget.speed =3D=3D USB_SPEED_UNKNOWN)
+		return -ESHUTDOWN;
+
+	spin_lock_irqsave(&hsudc->lock, flags);
+
+	set_index(hsudc, hsep->bEndpointAddress);
+	ecr |=3D ((usb_endpoint_xfer_int(desc)) ? S3C_ECR_IEMS : S3C_ECR_DUEN);
+	writel(ecr, hsudc->regs + S3C_ECR);
+
+	hsep->stopped =3D 0;
+	hsep->desc =3D desc;
+	hsep->ep.maxpacket =3D le16_to_cpu(desc->wMaxPacketSize);
+
+	s3c_hsudc_set_halt(_ep, 0);
+	__set_bit(ep_index(hsep), hsudc->regs + S3C_EIER);
+
+	spin_unlock_irqrestore(&hsudc->lock, flags);
+	return 0;
+}
+
+/**
+ * s3c_hsudc_ep_disable - Disable a endpoint.
+ * @_ep: The endpoint to be disabled.
+ * @desc: Endpoint descriptor.
+ *
+ * Disables a endpoint when called from the gadget driver.
+ */
+static int s3c_hsudc_ep_disable(struct usb_ep *_ep)
+{
+	struct s3c_hsudc_ep *hsep =3D our_ep(_ep);
+	struct s3c_hsudc *hsudc =3D hsep->dev;
+	unsigned long flags;
+
+	if (!_ep || !hsep->desc)
+		return -EINVAL;
+
+	spin_lock_irqsave(&hsudc->lock, flags);
+
+	set_index(hsudc, hsep->bEndpointAddress);
+	__clear_bit(ep_index(hsep), hsudc->regs + S3C_EIER);
+
+	s3c_hsudc_nuke_ep(hsep, -ESHUTDOWN);
+
+	hsep->desc =3D 0;
+	hsep->stopped =3D 1;
+
+	spin_unlock_irqrestore(&hsudc->lock, flags);
+	return 0;
+}
+
+/**
+ * s3c_hsudc_alloc_request - Allocate a new request.
+ * @_ep: Endpoint for which request is allocated (not used).
+ * @gfp_flags: Flags used for the allocation.
+ *
+ * Allocates a single transfer request structure when called from gadget d=
river.
+ */
+static struct usb_request *s3c_hsudc_alloc_request(struct usb_ep *_ep,
+						gfp_t gfp_flags)
+{
+	struct s3c_hsudc_req *hsreq;
+
+	hsreq =3D kzalloc(sizeof *hsreq, gfp_flags);
+	if (!hsreq)
+		return 0;
+
+	INIT_LIST_HEAD(&hsreq->queue);
+	return &hsreq->req;
+}
+
+/**
+ * s3c_hsudc_free_request - Deallocate a request.
+ * @ep: Endpoint for which request is deallocated (not used).
+ * @_req: Request to be deallocated.
+ *
+ * Allocates a single transfer request structure when called from gadget d=
river.
+ */
+static void s3c_hsudc_free_request(struct usb_ep *ep, struct usb_request *=
_req)
+{
+	struct s3c_hsudc_req *hsreq;
+
+	hsreq =3D container_of(_req, struct s3c_hsudc_req, req);
+	WARN_ON(!list_empty(&hsreq->queue));
+	kfree(hsreq);
+}
+
+/**
+ * s3c_hsudc_queue - Queue a transfer request for the endpoint.
+ * @_ep: Endpoint for which the request is queued.
+ * @_req: Request to be queued.
+ * @gfp_flags: Not used.
+ *
+ * Start or enqueue a request for a endpoint when called from gadget drive=
r.
+ */
+static int s3c_hsudc_queue(struct usb_ep *_ep, struct usb_request *_req,
+			gfp_t gfp_flags)
+{
+	struct s3c_hsudc_req *hsreq;
+	struct s3c_hsudc_ep *hsep;
+	struct s3c_hsudc *hsudc;
+	unsigned long flags;
+	u32 offset;
+	u32 csr;
+
+	hsreq =3D container_of(_req, struct s3c_hsudc_req, req);
+	if ((!_req || !_req->complete || !_req->buf ||
+		!list_empty(&hsreq->queue)))
+		return -EINVAL;
+
+	hsep =3D container_of(_ep, struct s3c_hsudc_ep, ep);
+	hsudc =3D hsep->dev;
+	if (!hsudc->driver || hsudc->gadget.speed =3D=3D USB_SPEED_UNKNOWN)
+		return -ESHUTDOWN;
+
+	spin_lock_irqsave(&hsudc->lock, flags);
+	set_index(hsudc, hsep->bEndpointAddress);
+
+	_req->status =3D -EINPROGRESS;
+	_req->actual =3D 0;
+
+	if (!ep_index(hsep) && _req->length =3D=3D 0) {
+		hsudc->ep0state =3D WAIT_FOR_SETUP;
+		s3c_hsudc_complete_request(hsep, hsreq, 0);
+		spin_unlock_irqrestore(&hsudc->lock, flags);
+		return 0;
+	}
+
+	if (list_empty(&hsep->queue) && !hsep->stopped) {
+		offset =3D (ep_index(hsep)) ? S3C_ESR : S3C_EP0SR;
+		if (ep_is_in(hsep)) {
+			csr =3D readl((u32)hsudc->regs + offset);
+			if (!(csr & S3C_ESR_TX_SUCCESS) &&
+				(s3c_hsudc_write_fifo(hsep, hsreq) =3D=3D 1))
+				hsreq =3D 0;
+		} else {
+			csr =3D readl((u32)hsudc->regs + offset);
+			if ((csr & S3C_ESR_RX_SUCCESS)
+				   && (s3c_hsudc_read_fifo(hsep, hsreq) =3D=3D 1))
+				hsreq =3D 0;
+		}
+	}
+
+	if (hsreq !=3D 0)
+		list_add_tail(&hsreq->queue, &hsep->queue);
+
+	spin_unlock_irqrestore(&hsudc->lock, flags);
+	return 0;
+}
+
+/**
+ * s3c_hsudc_dequeue - Dequeue a transfer request from an endpoint.
+ * @_ep: Endpoint from which the request is dequeued.
+ * @_req: Request to be dequeued.
+ *
+ * Dequeue a request from a endpoint when called from gadget driver.
+ */
+static int s3c_hsudc_dequeue(struct usb_ep *_ep, struct usb_request *_req)
+{
+	struct s3c_hsudc_ep *hsep =3D our_ep(_ep);
+	struct s3c_hsudc *hsudc =3D hsep->dev;
+	struct s3c_hsudc_req *hsreq;
+	unsigned long flags;
+
+	hsep =3D container_of(_ep, struct s3c_hsudc_ep, ep);
+	if (!_ep || hsep->ep.name =3D=3D ep0name)
+		return -EINVAL;
+
+	spin_lock_irqsave(&hsudc->lock, flags);
+
+	list_for_each_entry(hsreq, &hsep->queue, queue) {
+		if (&hsreq->req =3D=3D _req)
+			break;
+	}
+	if (&hsreq->req !=3D _req) {
+		spin_unlock_irqrestore(&hsudc->lock, flags);
+		return -EINVAL;
+	}
+
+	set_index(hsudc, hsep->bEndpointAddress);
+	s3c_hsudc_complete_request(hsep, hsreq, -ECONNRESET);
+
+	spin_unlock_irqrestore(&hsudc->lock, flags);
+	return 0;
+}
+
+static struct usb_ep_ops s3c_hsudc_ep_ops =3D {
+	.enable =3D s3c_hsudc_ep_enable,
+	.disable =3D s3c_hsudc_ep_disable,
+	.alloc_request =3D s3c_hsudc_alloc_request,
+	.free_request =3D s3c_hsudc_free_request,
+	.queue =3D s3c_hsudc_queue,
+	.dequeue =3D s3c_hsudc_dequeue,
+	.set_halt =3D s3c_hsudc_set_halt,
+};
+
+/**
+ * s3c_hsudc_initep - Initialize a endpoint to default state.
+ * @hsudc - Reference to the device controller.
+ * @hsep - Endpoint to be initialized.
+ * @epnum - Address to be assigned to the endpoint.
+ *
+ * Initialize a endpoint with default configuration.
+ */
+static void s3c_hsudc_initep(struct s3c_hsudc *hsudc,
+				struct s3c_hsudc_ep *hsep, int epnum)
+{
+	char *dir;
+
+	if ((epnum % 2) =3D=3D 0) {
+		dir =3D "out";
+	} else {
+		dir =3D "in";
+		hsep->bEndpointAddress =3D USB_DIR_IN;
+	}
+
+	hsep->bEndpointAddress |=3D epnum;
+	if (epnum)
+		snprintf(hsep->name, sizeof(hsep->name), "ep%d%s", epnum, dir);
+	else
+		snprintf(hsep->name, sizeof(hsep->name), "%s", ep0name);
+
+	INIT_LIST_HEAD(&hsep->queue);
+	INIT_LIST_HEAD(&hsep->ep.ep_list);
+	if (epnum)
+		list_add_tail(&hsep->ep.ep_list, &hsudc->gadget.ep_list);
+
+	hsep->dev =3D hsudc;
+	hsep->ep.name =3D hsep->name;
+	hsep->ep.maxpacket =3D epnum ? 512 : 64;
+	hsep->ep.ops =3D &s3c_hsudc_ep_ops;
+	hsep->fifo =3D hsudc->regs + S3C_BR(epnum);
+	hsep->desc =3D 0;
+	hsep->stopped =3D 0;
+
+	set_index(hsudc, epnum);
+	writel(hsep->ep.maxpacket, hsudc->regs + S3C_MPR);
+}
+
+/**
+ * s3c_hsudc_setup_ep - Configure all endpoints to default state.
+ * @hsudc: Reference to device controller.
+ *
+ * Configures all endpoints to default state.
+ */
+static void s3c_hsudc_setup_ep(struct s3c_hsudc *hsudc)
+{
+	int epnum;
+
+	hsudc->ep0state =3D WAIT_FOR_SETUP;
+	INIT_LIST_HEAD(&hsudc->gadget.ep_list);
+	for (epnum =3D 0; epnum < hsudc->pd->epnum; epnum++)
+		s3c_hsudc_initep(hsudc, &hsudc->ep[epnum], epnum);
+}
+
+/**
+ * s3c_hsudc_reconfig - Reconfigure the device controller to default state.
+ * @hsudc: Reference to device controller.
+ *
+ * Reconfigures the device controller registers to a default state.
+ */
+static void s3c_hsudc_reconfig(struct s3c_hsudc *hsudc)
+{
+	writel(0xAA, hsudc->regs + S3C_EDR);
+	writel(1, hsudc->regs + S3C_EIER);
+	writel(0, hsudc->regs + S3C_TR);
+	writel(S3C_SCR_DTZIEN_EN | S3C_SCR_RRD_EN | S3C_SCR_SUS_EN |
+			S3C_SCR_RST_EN, hsudc->regs + S3C_SCR);
+	writel(0, hsudc->regs + S3C_EP0CR);
+
+	s3c_hsudc_setup_ep(hsudc);
+}
+
+/**
+ * s3c_hsudc_irq - Interrupt handler for device controller.
+ * @irq: Not used.
+ * @_dev: Reference to the device controller.
+ *
+ * Interrupt handler for the device controller. This handler handles contr=
oller
+ * interrupts and endpoint interrupts.
+ */
+static irqreturn_t s3c_hsudc_irq(int irq, void *_dev)
+{
+	struct s3c_hsudc *hsudc =3D _dev;
+	struct s3c_hsudc_ep *hsep;
+	u32 ep_intr;
+	u32 sys_status;
+	u32 ep_idx;
+
+	spin_lock(&hsudc->lock);
+
+	sys_status =3D readl(hsudc->regs + S3C_SSR);
+	ep_intr =3D readl(hsudc->regs + S3C_EIR) & 0x3FF;
+
+	if (!ep_intr && !(sys_status & S3C_SSR_DTZIEN_EN)) {
+		spin_unlock(&hsudc->lock);
+		return IRQ_HANDLED;
+	}
+
+	if (sys_status) {
+		if (sys_status & S3C_SSR_VBUSON)
+			writel(S3C_SSR_VBUSON, hsudc->regs + S3C_SSR);
+
+		if (sys_status & S3C_SSR_ERR)
+			writel(S3C_SSR_ERR, hsudc->regs + S3C_SSR);
+
+		if (sys_status & S3C_SSR_SDE) {
+			writel(S3C_SSR_SDE, hsudc->regs + S3C_SSR);
+			hsudc->gadget.speed =3D (sys_status & S3C_SSR_HSP) ?
+				USB_SPEED_HIGH : USB_SPEED_FULL;
+		}
+
+		if (sys_status & S3C_SSR_SUSPEND) {
+			writel(S3C_SSR_SUSPEND, hsudc->regs + S3C_SSR);
+			if (hsudc->gadget.speed !=3D USB_SPEED_UNKNOWN
+				&& hsudc->driver && hsudc->driver->suspend)
+				hsudc->driver->suspend(&hsudc->gadget);
+		}
+
+		if (sys_status & S3C_SSR_RESUME) {
+			writel(S3C_SSR_RESUME, hsudc->regs + S3C_SSR);
+			if (hsudc->gadget.speed !=3D USB_SPEED_UNKNOWN
+				&& hsudc->driver && hsudc->driver->resume)
+				hsudc->driver->resume(&hsudc->gadget);
+		}
+
+		if (sys_status & S3C_SSR_RESET) {
+			writel(S3C_SSR_RESET, hsudc->regs + S3C_SSR);
+			for (ep_idx =3D 0; ep_idx < hsudc->pd->epnum; ep_idx++) {
+				hsep =3D &hsudc->ep[ep_idx];
+				hsep->stopped =3D 1;
+				s3c_hsudc_nuke_ep(hsep, -ECONNRESET);
+			}
+			s3c_hsudc_reconfig(hsudc);
+			hsudc->ep0state =3D WAIT_FOR_SETUP;
+		}
+	}
+
+	if (ep_intr & S3C_EIR_EP0) {
+		writel(S3C_EIR_EP0, hsudc->regs + S3C_EIR);
+		set_index(hsudc, 0);
+		s3c_hsudc_handle_ep0_intr(hsudc);
+	}
+
+	ep_intr >>=3D 1;
+	ep_idx =3D 1;
+	while (ep_intr) {
+		if (ep_intr & 1)  {
+			hsep =3D &hsudc->ep[ep_idx];
+			set_index(hsudc, ep_idx);
+			writel(1 << ep_idx, hsudc->regs + S3C_EIR);
+			if (ep_is_in(hsep))
+				s3c_hsudc_epin_intr(hsudc, ep_idx);
+			else
+				s3c_hsudc_epout_intr(hsudc, ep_idx);
+		}
+		ep_intr >>=3D 1;
+		ep_idx++;
+	}
+
+	spin_unlock(&hsudc->lock);
+	return IRQ_HANDLED;
+}
+
+int usb_gadget_probe_driver(struct usb_gadget_driver *driver,
+               int (*bind)(struct usb_gadget *))
+{
+	struct s3c_hsudc *hsudc =3D the_controller;
+	int ret;
+
+	if (!driver
+		|| (driver->speed !=3D USB_SPEED_FULL &&
+			driver->speed !=3D USB_SPEED_HIGH)
+		|| !bind
+		|| !driver->unbind || !driver->disconnect || !driver->setup)
+		return -EINVAL;
+
+	if (!hsudc)
+		return -ENODEV;
+
+	if (hsudc->driver)
+		return -EBUSY;
+
+	hsudc->driver =3D driver;
+	hsudc->gadget.dev.driver =3D &driver->driver;
+	hsudc->gadget.speed =3D USB_SPEED_UNKNOWN;
+	ret =3D device_add(&hsudc->gadget.dev);
+	if (ret) {
+		dev_err(hsudc->dev, "failed to probe gadget device");
+		return ret;
+	}
+
+	ret =3D bind(&hsudc->gadget);
+	if (ret) {
+		dev_err(hsudc->dev, "%s: bind failed\n", hsudc->gadget.name);
+		device_del(&hsudc->gadget.dev);
+
+		hsudc->driver =3D NULL;
+		hsudc->gadget.dev.driver =3D NULL;
+		return ret;
+	}
+
+	enable_irq(hsudc->irq);
+	dev_info(hsudc->dev, "bound driver %s\n", driver->driver.name);
+
+	s3c_hsudc_reconfig(hsudc);
+	s3c_hsudc_init_phy();
+	if (hsudc->pd->gpio_init)
+		hsudc->pd->gpio_init();
+
+	return 0;
+}
+EXPORT_SYMBOL(usb_gadget_probe_driver);
+
+int usb_gadget_unregister_driver(struct usb_gadget_driver *driver)
+{
+	struct s3c_hsudc *hsudc =3D the_controller;
+	unsigned long flags;
+
+	if (!hsudc)
+		return -ENODEV;
+
+	if (!driver || driver !=3D hsudc->driver || !driver->unbind)
+		return -EINVAL;
+
+	spin_lock_irqsave(&hsudc->lock, flags);
+	hsudc->driver =3D 0;
+	s3c_hsudc_uninit_phy();
+	if (hsudc->pd->gpio_uninit)
+		hsudc->pd->gpio_uninit();
+	s3c_hsudc_stop_activity(hsudc, driver);
+	spin_unlock_irqrestore(&hsudc->lock, flags);
+
+	driver->unbind(&hsudc->gadget);
+	device_del(&hsudc->gadget.dev);
+	disable_irq(hsudc->irq);
+
+	dev_info(hsudc->dev, "unregistered gadget driver '%s'\n",
+			driver->driver.name);
+	return 0;
+}
+EXPORT_SYMBOL(usb_gadget_unregister_driver);
+
+static inline u32 s3c_hsudc_read_frameno(struct s3c_hsudc *hsudc)
+{
+	return readl(hsudc->regs + S3C_FNR) & 0x3FF;
+}
+
+static int s3c_hsudc_gadget_getframe(struct usb_gadget *gadget)
+{
+	return s3c_hsudc_read_frameno(to_hsudc(gadget));
+}
+
+static struct usb_gadget_ops s3c_hsudc_gadget_ops =3D {
+	.get_frame	=3D s3c_hsudc_gadget_getframe,
+};
+
+static int s3c_hsudc_probe(struct platform_device *pdev)
+{
+	struct device *dev =3D &pdev->dev;
+	struct resource *res;
+	struct s3c_hsudc *hsudc;
+	struct s3c24xx_hsudc_platdata *pd =3D pdev->dev.platform_data;
+	int ret;
+
+	hsudc =3D kzalloc(sizeof(struct s3c_hsudc) +
+			sizeof(struct s3c_hsudc_ep) * pd->epnum,
+			GFP_KERNEL);
+	if (!hsudc) {
+		dev_err(dev, "cannot allocate memory\n");
+		return -ENOMEM;
+	}
+
+	the_controller =3D hsudc;
+	platform_set_drvdata(pdev, dev);
+	hsudc->dev =3D dev;
+	hsudc->pd =3D pdev->dev.platform_data;
+
+	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		dev_err(dev, "unable to obtain driver resource data\n");
+		ret =3D -ENODEV;
+		goto err_res;
+	}
+
+	hsudc->mem_rsrc =3D request_mem_region(res->start, resource_size(res),
+				dev_name(&pdev->dev));
+	if (!hsudc->mem_rsrc) {
+		dev_err(dev, "failed to reserve register area\n");
+		ret =3D -ENODEV;
+		goto err_res;
+	}
+
+	hsudc->regs =3D ioremap(res->start, resource_size(res));
+	if (!hsudc->regs) {
+		dev_err(dev, "error mapping device register area\n");
+		ret =3D -EBUSY;
+		goto err_remap;
+	}
+
+	ret =3D platform_get_irq(pdev, 0);
+	if (ret < 0) {
+		dev_err(dev, "unable to obtain IRQ number\n");
+		goto err_irq;
+	}
+	hsudc->irq =3D ret;
+
+	ret =3D request_irq(hsudc->irq, s3c_hsudc_irq, 0, driver_name, hsudc);
+	if (ret < 0) {
+		dev_err(dev, "irq request failed\n");
+		goto err_irq;
+	}
+
+	spin_lock_init(&hsudc->lock);
+
+	device_initialize(&hsudc->gadget.dev);
+	dev_set_name(&hsudc->gadget.dev, "gadget");
+
+	hsudc->gadget.is_dualspeed =3D 1;
+	hsudc->gadget.ops =3D &s3c_hsudc_gadget_ops;
+	hsudc->gadget.name =3D dev_name(dev);
+	hsudc->gadget.dev.parent =3D dev;
+	hsudc->gadget.dev.dma_mask =3D dev->dma_mask;
+	hsudc->gadget.ep0 =3D &hsudc->ep[0].ep;
+
+	hsudc->gadget.is_otg =3D 0;
+	hsudc->gadget.is_a_peripheral =3D 0;
+
+	s3c_hsudc_setup_ep(hsudc);
+
+	hsudc->uclk =3D clk_get(&pdev->dev, "usb-device");
+	if (hsudc->uclk =3D=3D NULL) {
+		dev_err(dev, "failed to find usb-device clock source\n");
+		return -ENOENT;
+	}
+	clk_enable(hsudc->uclk);
+
+	local_irq_disable();
+
+	disable_irq(hsudc->irq);
+	local_irq_enable();
+	return 0;
+
+err_irq:
+	iounmap(hsudc->regs);
+
+err_remap:
+	release_resource(hsudc->mem_rsrc);
+	kfree(hsudc->mem_rsrc);
+
+err_res:
+	kfree(hsudc);
+	return ret;
+}
+
+static struct platform_driver s3c_hsudc_driver =3D {
+	.driver		=3D {
+		.owner	=3D THIS_MODULE,
+		.name	=3D "s3c-hsudc",
+	},
+	.probe		=3D s3c_hsudc_probe,
+};
+
+static int __init s3c_hsudc_modinit(void)
+{
+	return platform_driver_register(&s3c_hsudc_driver);
+}
+
+static void __exit s3c_hsudc_modexit(void)
+{
+	platform_driver_unregister(&s3c_hsudc_driver);
+}
+
+module_init(s3c_hsudc_modinit);
+module_exit(s3c_hsudc_modexit);
+
+MODULE_DESCRIPTION("Samsung S3C24XX USB high-speed controller driver");
+MODULE_AUTHOR("Thomas Abraham <thomas.ab@samsung.com>");
+MODULE_LICENSE("GPL");
=2D-=20
1.7.2.3


--Boundary-00=_1eSbNu+/IQQys84
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--Boundary-00=_1eSbNu+/IQQys84--
