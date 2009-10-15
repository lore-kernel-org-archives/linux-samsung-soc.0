From: Thomas Abraham <thomas.ab@samsung.com>
Subject: [PATCH v2 2/4] S3C: sdhci: Update sdhci platform data.
Date: Thu, 15 Oct 2009 14:59:31 +0900
Message-ID: <1255586371-28042-1-git-send-email-thomas.ab@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:39355 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933562AbZJOGDR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 15 Oct 2009 02:03:17 -0400
Received: from uucp by ganesha.gnumonks.org with local-bsmtp (Exim 4.63)
	(envelope-from <thomas.ab@samsung.com>)
	id 1MyJQ9-0006iI-2T
	for linux-samsung-soc@vger.kernel.org; Thu, 15 Oct 2009 08:02:41 +0200
Received: from localhost ([127.0.0.1] helo=localhost.localdomain)
	by meercat.kr.gnumonks.org with esmtp (Exim 4.68)
	(envelope-from <thomas.ab@samsung.com>)
	id 1MyJN5-0007IY-Kw
	for linux-samsung-soc@vger.kernel.org; Thu, 15 Oct 2009 14:59:31 +0900
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org

This patch removes the unsed host_caps field entry from the sdhci platform data
structure. It then adds three new fields for specifying parent clock name,
source clock name and clock frequency for sdhci controller. This patch also
does corresponding fixups for sdhci-0 amd sdhci-1 controller's platform data.

Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
---
 arch/arm/plat-s3c/dev-hsmmc.c          |    2 --
 arch/arm/plat-s3c/dev-hsmmc1.c         |    2 --
 arch/arm/plat-s3c/include/plat/sdhci.h |   17 ++++++++++++++---
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/arch/arm/plat-s3c/dev-hsmmc.c b/arch/arm/plat-s3c/dev-hsmmc.c
index 4c05b39..8f5c56a 100644
--- a/arch/arm/plat-s3c/dev-hsmmc.c
+++ b/arch/arm/plat-s3c/dev-hsmmc.c
@@ -39,8 +39,6 @@ static u64 s3c_device_hsmmc_dmamask = 0xffffffffUL;
 
 struct s3c_sdhci_platdata s3c_hsmmc0_def_platdata = {
 	.max_width	= 4,
-	.host_caps	= (MMC_CAP_4_BIT_DATA |
-			   MMC_CAP_MMC_HIGHSPEED | MMC_CAP_SD_HIGHSPEED),
 };
 
 struct platform_device s3c_device_hsmmc0 = {
diff --git a/arch/arm/plat-s3c/dev-hsmmc1.c b/arch/arm/plat-s3c/dev-hsmmc1.c
index e49bc4c..1f91f09 100644
--- a/arch/arm/plat-s3c/dev-hsmmc1.c
+++ b/arch/arm/plat-s3c/dev-hsmmc1.c
@@ -39,8 +39,6 @@ static u64 s3c_device_hsmmc1_dmamask = 0xffffffffUL;
 
 struct s3c_sdhci_platdata s3c_hsmmc1_def_platdata = {
 	.max_width	= 4,
-	.host_caps	= (MMC_CAP_4_BIT_DATA |
-			   MMC_CAP_MMC_HIGHSPEED | MMC_CAP_SD_HIGHSPEED),
 };
 
 struct platform_device s3c_device_hsmmc1 = {
diff --git a/arch/arm/plat-s3c/include/plat/sdhci.h b/arch/arm/plat-s3c/include/plat/sdhci.h
index f615308..722969d 100644
--- a/arch/arm/plat-s3c/include/plat/sdhci.h
+++ b/arch/arm/plat-s3c/include/plat/sdhci.h
@@ -15,6 +15,8 @@
 #ifndef __PLAT_S3C_SDHCI_H
 #define __PLAT_S3C_SDHCI_H __FILE__
 
+#include <plat/cpu.h>
+
 struct platform_device;
 struct mmc_host;
 struct mmc_card;
@@ -23,7 +25,9 @@ struct mmc_ios;
 /**
  * struct s3c_sdhci_platdata() - Platform device data for Samsung SDHCI
  * @max_width: The maximum number of data bits supported.
- * @host_caps: Standard MMC host capabilities bit field.
+ * @clocks: List of clock sources available as SDHCI base clock.
+ * clk_parent_name: Name of the SDHCI controller parent clock.
+ * clk_source_name: Name of the SDHCI controller source clock.
  * @cfg_gpio: Configure the GPIO for a specific card bit-width
  * @cfg_card: Configure the interface for a specific card and speed. This
  *            is necessary the controllers and/or GPIO blocks require the
@@ -36,9 +40,10 @@ struct mmc_ios;
 */
 struct s3c_sdhci_platdata {
 	unsigned int	max_width;
-	unsigned int	host_caps;
-
 	char		**clocks;	/* set of clock sources */
+	char            clk_parent_name[20];
+	char            clk_source_name[20];
+	ulong   	clk_speed;
 
 	void	(*cfg_gpio)(struct platform_device *dev, int width);
 	void	(*cfg_card)(struct platform_device *dev,
@@ -122,6 +127,11 @@ extern void s3c6410_setup_sdhci0_cfg_card(struct platform_device *dev,
 static inline void s3c6410_default_sdhci0(void)
 {
 	s3c_hsmmc0_def_platdata.clocks = s3c6410_hsmmc_clksrcs;
+	strcpy((void *)s3c_hsmmc0_def_platdata.clk_parent_name,
+			(void *)"dout_mpll");
+	strcpy((void *)s3c_hsmmc0_def_platdata.clk_source_name,
+			(void *)"mmc_bus");
+	s3c_hsmmc0_def_platdata.clk_speed = 50 * MHZ;
 	s3c_hsmmc0_def_platdata.cfg_gpio = s3c64xx_setup_sdhci0_cfg_gpio;
 	s3c_hsmmc0_def_platdata.cfg_card = s3c6410_setup_sdhci0_cfg_card;
 }
@@ -133,6 +141,11 @@ static inline void s3c6410_default_sdhci0(void) { }
 static inline void s3c6410_default_sdhci1(void)
 {
 	s3c_hsmmc1_def_platdata.clocks = s3c6410_hsmmc_clksrcs;
+	strcpy((void *)s3c_hsmmc0_def_platdata.clk_parent_name,
+			(void *)"dout_mpll");
+	strcpy((void *)s3c_hsmmc0_def_platdata.clk_source_name,
+			(void *)"mmc_bus");
+	s3c_hsmmc0_def_platdata.clk_speed = 50 * MHZ;
 	s3c_hsmmc1_def_platdata.cfg_gpio = s3c64xx_setup_sdhci1_cfg_gpio;
 	s3c_hsmmc1_def_platdata.cfg_card = s3c6410_setup_sdhci0_cfg_card;
 }
-- 
1.5.3.4
