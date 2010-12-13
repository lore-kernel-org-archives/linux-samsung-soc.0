From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH 4/4] ARM: S5P64X0: Add SDHCI support for SMDK6440 and SMDK6450
Date: Mon, 13 Dec 2010 14:46:25 +0900
Message-ID: <1292219185-3911-5-git-send-email-sbkim73@samsung.com>
References: <1292219185-3911-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:41981 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751441Ab0LMGFh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Dec 2010 01:05:37 -0500
In-Reply-To: <1292219185-3911-1-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, Abhilash Kesavan <a.kesavan@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>

From: Abhilash Kesavan <a.kesavan@samsung.com>

Enables SDHCI supports for S5P64X0.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 arch/arm/mach-s5p64x0/mach-smdk6440.c |   23 +++++++++++++++++++++++
 arch/arm/mach-s5p64x0/mach-smdk6450.c |   23 +++++++++++++++++++++++
 2 files changed, 46 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-s5p64x0/mach-smdk6440.c b/arch/arm/mach-s5p64x0/mach-smdk6440.c
index 87c3f03..3d30701 100644
--- a/arch/arm/mach-s5p64x0/mach-smdk6440.c
+++ b/arch/arm/mach-s5p64x0/mach-smdk6440.c
@@ -43,6 +43,7 @@
 #include <plat/pll.h>
 #include <plat/adc.h>
 #include <plat/ts.h>
+#include <plat/sdhci.h>
 
 #define SMDK6440_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
 				S3C2410_UCON_RXILEVEL |		\
@@ -96,6 +97,24 @@ static struct platform_device *smdk6440_devices[] __initdata = {
 	&s3c_device_ts,
 	&s3c_device_wdt,
 	&s5p6440_device_iis,
+	&s3c_device_hsmmc0,
+	&s3c_device_hsmmc1,
+	&s3c_device_hsmmc2,
+};
+
+static struct s3c_sdhci_platdata smdk6440_hsmmc0_pdata __initdata = {
+	.cd_type		= S3C_SDHCI_CD_NONE,
+	.max_width		= 4,
+};
+
+static struct s3c_sdhci_platdata smdk6440_hsmmc1_pdata __initdata = {
+	.cd_type		= S3C_SDHCI_CD_INTERNAL,
+	.max_width		= 4,
+};
+
+static struct s3c_sdhci_platdata smdk6440_hsmmc2_pdata __initdata = {
+	.cd_type		= S3C_SDHCI_CD_NONE,
+	.max_width		= 4,
 };
 
 static struct s3c2410_platform_i2c s5p6440_i2c0_data __initdata = {
@@ -147,6 +166,10 @@ static void __init smdk6440_machine_init(void)
 	i2c_register_board_info(1, smdk6440_i2c_devs1,
 			ARRAY_SIZE(smdk6440_i2c_devs1));
 
+	s3c_sdhci0_set_platdata(&smdk6440_hsmmc0_pdata);
+	s3c_sdhci1_set_platdata(&smdk6440_hsmmc1_pdata);
+	s3c_sdhci2_set_platdata(&smdk6440_hsmmc2_pdata);
+
 	platform_add_devices(smdk6440_devices, ARRAY_SIZE(smdk6440_devices));
 }
 
diff --git a/arch/arm/mach-s5p64x0/mach-smdk6450.c b/arch/arm/mach-s5p64x0/mach-smdk6450.c
index d609f5a..37ac1ad 100644
--- a/arch/arm/mach-s5p64x0/mach-smdk6450.c
+++ b/arch/arm/mach-s5p64x0/mach-smdk6450.c
@@ -43,6 +43,7 @@
 #include <plat/pll.h>
 #include <plat/adc.h>
 #include <plat/ts.h>
+#include <plat/sdhci.h>
 
 #define SMDK6450_UCON_DEFAULT	(S3C2410_UCON_TXILEVEL |	\
 				S3C2410_UCON_RXILEVEL |		\
@@ -114,9 +115,27 @@ static struct platform_device *smdk6450_devices[] __initdata = {
 	&s3c_device_ts,
 	&s3c_device_wdt,
 	&s5p6450_device_iis0,
+	&s3c_device_hsmmc0,
+	&s3c_device_hsmmc1,
+	&s3c_device_hsmmc2,
 	/* s5p6450_device_spi0 will be added */
 };
 
+static struct s3c_sdhci_platdata smdk6450_hsmmc0_pdata __initdata = {
+	.cd_type		= S3C_SDHCI_CD_NONE,
+	.max_width		= 4,
+};
+
+static struct s3c_sdhci_platdata smdk6450_hsmmc1_pdata __initdata = {
+	.cd_type		= S3C_SDHCI_CD_INTERNAL,
+	.max_width		= 4,
+};
+
+static struct s3c_sdhci_platdata smdk6450_hsmmc2_pdata __initdata = {
+	.cd_type		= S3C_SDHCI_CD_NONE,
+	.max_width		= 4,
+};
+
 static struct s3c2410_platform_i2c s5p6450_i2c0_data __initdata = {
 	.flags		= 0,
 	.slave_addr	= 0x10,
@@ -166,6 +185,10 @@ static void __init smdk6450_machine_init(void)
 	i2c_register_board_info(1, smdk6450_i2c_devs1,
 			ARRAY_SIZE(smdk6450_i2c_devs1));
 
+	s3c_sdhci0_set_platdata(&smdk6450_hsmmc0_pdata);
+	s3c_sdhci1_set_platdata(&smdk6450_hsmmc1_pdata);
+	s3c_sdhci2_set_platdata(&smdk6450_hsmmc2_pdata);
+
 	platform_add_devices(smdk6450_devices, ARRAY_SIZE(smdk6450_devices));
 }
 
-- 
1.6.6.1
