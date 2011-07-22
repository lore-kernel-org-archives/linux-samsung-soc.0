From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: [PATCH v2 3/3] arm: dt: Add device tree support for i2c instance 0 and
 1 on exynos4 dt machine
Date: Fri, 22 Jul 2011 15:48:38 +0530
Message-ID: <1311329918-8105-4-git-send-email-thomas.abraham@linaro.org>
References: <1311329918-8105-1-git-send-email-thomas.abraham@linaro.org>
 <1311329918-8105-2-git-send-email-thomas.abraham@linaro.org>
 <1311329918-8105-3-git-send-email-thomas.abraham@linaro.org>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:44471 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753806Ab1GVKGE (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 22 Jul 2011 06:06:04 -0400
In-reply-to: <1311329918-8105-3-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: devicetree-discuss@lists.ozlabs.org
Cc: linux-i2c@vger.kernel.org, grant.likely@secretlab.ca, ben-linux@fluff.org, linux-samsung-soc@vger.kernel.org

Add device node for i2c instance 0 and 1 and list all its connected slave
devices.

Signed-off-by: Thomas Abraham <thomas.abraham at linaro.org>
---
 arch/arm/boot/dts/exynos4-smdkv310.dts  |   45 +++++++++++++++++++++++++++++++
 arch/arm/mach-exynos4/Kconfig           |    2 +
 arch/arm/mach-exynos4/mach-exynos4-dt.c |   23 ++++++++++++++++
 3 files changed, 70 insertions(+), 0 deletions(-)

diff --git a/arch/arm/boot/dts/exynos4-smdkv310.dts b/arch/arm/boot/dts/exynos4-smdkv310.dts
index d65c18c..6fd2032 100644
--- a/arch/arm/boot/dts/exynos4-smdkv310.dts
+++ b/arch/arm/boot/dts/exynos4-smdkv310.dts
@@ -41,6 +41,12 @@
 			irq-start = <61>;
 		};
 
+		gpd1: gpio-controller@114000C0 {
+			compatible = "samsung,exynos4-gpio-gpd1","samsung,exynos4-gpio";
+			#gpio-cells = <2>;
+			gpio-controller;
+		};
+
 		watchdog@10060000 {
 			compatible = "samsung,s3c2410-wdt";
 			reg = <0x10060000 0x400>;
@@ -64,5 +70,44 @@
 			samsung,sdhci-cd-type = <0>;
 			samsung,sdhci-clkdiv-external;
 		};
+
+		i2c@13860000 {
+			compatible = "samsung,s3c2440-i2c";
+			reg = <0x13860000 0x100>;
+			interrupts = <344>;
+			samsung,i2c-sda-delay = <100>;
+			samsung,i2c-max-bus-freq = <20000>;
+			gpios = <&gpd1 0 0 /* SDA */
+				 &gpd1 1 0 /* SCL */>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			eeprom@50 {
+				compatible = "samsung,24ad0xd1";
+				reg = <0x50>;
+			};
+
+			eeprom@52 {
+				compatible = "samsung,24ad0xd1";
+				reg = <0x51>;
+			};
+		};
+
+		i2c@13870000 {
+			compatible = "samsung,s3c2440-i2c";
+			reg = <0x13870000 0x100>;
+			interrupts = <345>;
+			samsung,i2c-sda-delay = <100>;
+			samsung,i2c-max-bus-freq = <100000>;
+			gpios = <&gpd1 2 0 /* SDA */
+				 &gpd1 3 0 /* SCL */>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			wm8994@1a {
+				compatible = "wlf,wm8994";
+				reg = <0x1a>;
+			};
+		};
 	};
 };
diff --git a/arch/arm/mach-exynos4/Kconfig b/arch/arm/mach-exynos4/Kconfig
index bb97b7e..06b43ca 100644
--- a/arch/arm/mach-exynos4/Kconfig
+++ b/arch/arm/mach-exynos4/Kconfig
@@ -193,6 +193,8 @@ config MACH_EXYNOS4_DT
 	select S3C_DEV_HSMMC
 	select S3C_DEV_HSMMC2
 	select EXYNOS4_SETUP_SDHCI
+	select EXYNOS4_SETUP_I2C0
+	select EXYNOS4_SETUP_I2C1
 	help
 	  Machine support for Samsung Exynos4 machine with device tree enabled.
 
diff --git a/arch/arm/mach-exynos4/mach-exynos4-dt.c b/arch/arm/mach-exynos4/mach-exynos4-dt.c
index 120665a..8b0cf8f 100644
--- a/arch/arm/mach-exynos4/mach-exynos4-dt.c
+++ b/arch/arm/mach-exynos4/mach-exynos4-dt.c
@@ -23,7 +23,10 @@
 #include <plat/regs-serial.h>
 #include <plat/exynos4.h>
 #include <plat/cpu.h>
+#include <plat/devs.h>
 #include <plat/sdhci.h>
+#include <plat/iic.h>
+#include <plat/iic-core.h>
 
 #include <mach/map.h>
 
@@ -63,6 +66,22 @@ static struct s3c2410_uartcfg smdkv310_uartcfgs[] __initdata = {
 };
 
 /*
+ * The i2c driver does not handle the pinmux settings. Instead, the
+ * platform specific callback function is passed through the platform
+ * data that can handle the pinmux settings for the i2c module.
+ * Eventually, when the new pinmux api is merged, the i2c driver can
+ * be modified to handle the pinmux settings. This is temporary for
+ * now.
+ */
+static struct s3c2410_platform_i2c exynos4_dt_i2c_data0 __initdata = {
+	.cfg_gpio	= s3c_i2c0_cfg_gpio,
+};
+
+static struct s3c2410_platform_i2c exynos4_dt_i2c_data1 __initdata = {
+	.cfg_gpio	= s3c_i2c1_cfg_gpio,
+};
+
+/*
  * The following lookup table is used to override device names when devices
  * are registered from device tree. Optionally, the platform data can also
  * to supplied. The sdhci driver requires the device name to be overridden
@@ -75,6 +94,10 @@ static const struct of_dev_auxdata exynos4_auxdata_lookup[] __initconst = {
 				"s3c-sdhci.2", &s3c_hsmmc2_def_platdata),
 	OF_DEV_AUXDATA("samsung,s3c6410-sdhci", EXYNOS4_PA_HSMMC(0),
 				"s3c-sdhci.0", &s3c_hsmmc0_def_platdata),
+	OF_DEV_AUXDATA("samsung,s3c2440-i2c", EXYNOS4_PA_IIC(0),
+				"s3c2440-i2c.0", &exynos4_dt_i2c_data0),
+	OF_DEV_AUXDATA("samsung,s3c2440-i2c", EXYNOS4_PA_IIC(1),
+				"s3c2440-i2c.1", &exynos4_dt_i2c_data1),
 	{},
 };
 
-- 
1.6.6.rc2
