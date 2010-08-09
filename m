From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S5PV210: Fix on missing s3c-sdhci card detection method for hsmmc3
Date: Mon,  9 Aug 2010 19:00:55 +0900
Message-ID: <1281348055-18357-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:46480 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755836Ab0HIKPV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 9 Aug 2010 06:15:21 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch fixes on missing s3c-sdhci card detection method for hsmmc3.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5pv210/setup-sdhci-gpio.c |    7 +++++--
 1 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s5pv210/setup-sdhci-gpio.c b/arch/arm/mach-s5pv210/setup-sdhci-gpio.c
index 9f0f63d..b18587b 100644
--- a/arch/arm/mach-s5pv210/setup-sdhci-gpio.c
+++ b/arch/arm/mach-s5pv210/setup-sdhci-gpio.c
@@ -115,6 +115,7 @@ void s5pv210_setup_sdhci2_cfg_gpio(struct platform_device *dev, int width)
 
 void s5pv210_setup_sdhci3_cfg_gpio(struct platform_device *dev, int width)
 {
+	struct s3c_sdhci_platdata *pdata = dev->dev.platform_data;
 	unsigned int gpio;
 
 	/* Set all the necessary GPG3[0:2] pins to special-function 2 */
@@ -129,6 +130,8 @@ void s5pv210_setup_sdhci3_cfg_gpio(struct platform_device *dev, int width)
 		s3c_gpio_setpull(gpio, S3C_GPIO_PULL_NONE);
 	}
 
-	s3c_gpio_setpull(S5PV210_GPG3(2), S3C_GPIO_PULL_UP);
-	s3c_gpio_cfgpin(S5PV210_GPG3(2), S3C_GPIO_SFN(2));
+	if (pdata->cd_type == S3C_SDHCI_CD_INTERNAL) {
+		s3c_gpio_setpull(S5PV210_GPG3(2), S3C_GPIO_PULL_UP);
+		s3c_gpio_cfgpin(S5PV210_GPG3(2), S3C_GPIO_SFN(2));
+	}
 }
-- 
1.6.2.5
