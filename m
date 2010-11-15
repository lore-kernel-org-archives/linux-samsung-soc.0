From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S3C24XX: Fix wrong s3c_gpio_cfgpull
Date: Mon, 15 Nov 2010 11:14:58 +0900
Message-ID: <1289787298-6555-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:55185 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932404Ab0KOCYV (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 14 Nov 2010 21:24:21 -0500
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch fixes wrong s3c_gpio_cfgpull with s3c_gpio_setpull.

Cc: Ben Dooks <ben-linux@fluff.org>
Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/plat-s3c24xx/spi-bus0-gpe11_12_13.c |    6 +++---
 arch/arm/plat-s3c24xx/spi-bus1-gpd8_9_10.c   |    6 +++---
 arch/arm/plat-s3c24xx/spi-bus1-gpg5_6_7.c    |    6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/plat-s3c24xx/spi-bus0-gpe11_12_13.c b/arch/arm/plat-s3c24xx/spi-bus0-gpe11_12_13.c
index 9793544..704175b 100644
--- a/arch/arm/plat-s3c24xx/spi-bus0-gpe11_12_13.c
+++ b/arch/arm/plat-s3c24xx/spi-bus0-gpe11_12_13.c
@@ -29,8 +29,8 @@ void s3c24xx_spi_gpiocfg_bus0_gpe11_12_13(struct s3c2410_spi_info *spi,
 	} else {
 		s3c_gpio_cfgpin(S3C2410_GPE(13), S3C2410_GPIO_INPUT);
 		s3c_gpio_cfgpin(S3C2410_GPE(11), S3C2410_GPIO_INPUT);
-		s3c_gpio_cfgpull(S3C2410_GPE(11), S3C_GPIO_PULL_NONE);
-		s3c_gpio_cfgpull(S3C2410_GPE(12), S3C_GPIO_PULL_NONE);
-		s3c_gpio_cfgpull(S3C2410_GPE(13), S3C_GPIO_PULL_NONE);
+		s3c_gpio_setpull(S3C2410_GPE(11), S3C_GPIO_PULL_NONE);
+		s3c_gpio_setpull(S3C2410_GPE(12), S3C_GPIO_PULL_NONE);
+		s3c_gpio_setpull(S3C2410_GPE(13), S3C_GPIO_PULL_NONE);
 	}
 }
diff --git a/arch/arm/plat-s3c24xx/spi-bus1-gpd8_9_10.c b/arch/arm/plat-s3c24xx/spi-bus1-gpd8_9_10.c
index db9e9e4..72457af 100644
--- a/arch/arm/plat-s3c24xx/spi-bus1-gpd8_9_10.c
+++ b/arch/arm/plat-s3c24xx/spi-bus1-gpd8_9_10.c
@@ -31,8 +31,8 @@ void s3c24xx_spi_gpiocfg_bus1_gpd8_9_10(struct s3c2410_spi_info *spi,
 	} else {
 		s3c_gpio_cfgpin(S3C2410_GPD(8), S3C2410_GPIO_INPUT);
 		s3c_gpio_cfgpin(S3C2410_GPD(9), S3C2410_GPIO_INPUT);
-		s3c_gpio_cfgpull(S3C2410_GPD(10), S3C_GPIO_PULL_NONE);
-		s3c_gpio_cfgpull(S3C2410_GPD(9), S3C_GPIO_PULL_NONE);
-		s3c_gpio_cfgpull(S3C2410_GPD(8), S3C_GPIO_PULL_NONE);
+		s3c_gpio_setpull(S3C2410_GPD(10), S3C_GPIO_PULL_NONE);
+		s3c_gpio_setpull(S3C2410_GPD(9), S3C_GPIO_PULL_NONE);
+		s3c_gpio_setpull(S3C2410_GPD(8), S3C_GPIO_PULL_NONE);
 	}
 }
diff --git a/arch/arm/plat-s3c24xx/spi-bus1-gpg5_6_7.c b/arch/arm/plat-s3c24xx/spi-bus1-gpg5_6_7.c
index 8ea663a..c3972b6 100644
--- a/arch/arm/plat-s3c24xx/spi-bus1-gpg5_6_7.c
+++ b/arch/arm/plat-s3c24xx/spi-bus1-gpg5_6_7.c
@@ -29,8 +29,8 @@ void s3c24xx_spi_gpiocfg_bus1_gpg5_6_7(struct s3c2410_spi_info *spi,
 	} else {
 		s3c_gpio_cfgpin(S3C2410_GPG(7), S3C2410_GPIO_INPUT);
 		s3c_gpio_cfgpin(S3C2410_GPG(5), S3C2410_GPIO_INPUT);
-		s3c_gpio_cfgpull(S3C2410_GPG(5), S3C_GPIO_PULL_NONE);
-		s3c_gpio_cfgpull(S3C2410_GPG(6), S3C_GPIO_PULL_NONE);
-		s3c_gpio_cfgpull(S3C2410_GPG(7), S3C_GPIO_PULL_NONE);
+		s3c_gpio_setpull(S3C2410_GPG(5), S3C_GPIO_PULL_NONE);
+		s3c_gpio_setpull(S3C2410_GPG(6), S3C_GPIO_PULL_NONE);
+		s3c_gpio_setpull(S3C2410_GPG(7), S3C_GPIO_PULL_NONE);
 	}
 }
-- 
1.6.2.5
