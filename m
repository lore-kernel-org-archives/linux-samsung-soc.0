From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 12/23] ARM: S3C24XX: Change s3c2410_gpio_pullupl(x, 1) to use s3c_gpio_cfgpull()
Date: Fri,  7 May 2010 08:15:34 +0900
Message-ID: <1273187745-6566-13-git-send-email-ben-linux@fluff.org>
References: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from [121.136.51.148] ([121.136.51.148]:60634 "EHLO ben-laptop"
	rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752798Ab0EFXQG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 6 May 2010 19:16:06 -0400
In-Reply-To: <1273187745-6566-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Start moving code that is using the old s3c2410_gpio API to using the
newer s3c_gpio variants by finding all the usages of s3c2410_gpio_pullup()
which disable the pin's pull up and replacing them.

 sed 's/s3c2410_gpio_pullup\(.*\), 1/s3c_gpio_cfgpull\1, S3C_GPIO_PULL_NONE/g'

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/plat-s3c24xx/spi-bus0-gpe11_12_13.c |    6 +++---
 arch/arm/plat-s3c24xx/spi-bus1-gpd8_9_10.c   |    6 +++---
 arch/arm/plat-s3c24xx/spi-bus1-gpg5_6_7.c    |    6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/plat-s3c24xx/spi-bus0-gpe11_12_13.c b/arch/arm/plat-s3c24xx/spi-bus0-gpe11_12_13.c
index da7a617..71256ad 100644
--- a/arch/arm/plat-s3c24xx/spi-bus0-gpe11_12_13.c
+++ b/arch/arm/plat-s3c24xx/spi-bus0-gpe11_12_13.c
@@ -29,8 +29,8 @@ void s3c24xx_spi_gpiocfg_bus0_gpe11_12_13(struct s3c2410_spi_info *spi,
 	} else {
 		s3c2410_gpio_cfgpin(S3C2410_GPE(13), S3C2410_GPIO_INPUT);
 		s3c2410_gpio_cfgpin(S3C2410_GPE(11), S3C2410_GPIO_INPUT);
-		s3c2410_gpio_pullup(S3C2410_GPE(11), 1);
-		s3c2410_gpio_pullup(S3C2410_GPE(12), 1);
-		s3c2410_gpio_pullup(S3C2410_GPE(13), 1);
+		s3c_gpio_cfgpull(S3C2410_GPE(11), S3C_GPIO_PULL_NONE);
+		s3c_gpio_cfgpull(S3C2410_GPE(12), S3C_GPIO_PULL_NONE);
+		s3c_gpio_cfgpull(S3C2410_GPE(13), S3C_GPIO_PULL_NONE);
 	}
 }
diff --git a/arch/arm/plat-s3c24xx/spi-bus1-gpd8_9_10.c b/arch/arm/plat-s3c24xx/spi-bus1-gpd8_9_10.c
index 89fcf53..31bda55 100644
--- a/arch/arm/plat-s3c24xx/spi-bus1-gpd8_9_10.c
+++ b/arch/arm/plat-s3c24xx/spi-bus1-gpd8_9_10.c
@@ -31,8 +31,8 @@ void s3c24xx_spi_gpiocfg_bus1_gpd8_9_10(struct s3c2410_spi_info *spi,
 	} else {
 		s3c2410_gpio_cfgpin(S3C2410_GPD(8), S3C2410_GPIO_INPUT);
 		s3c2410_gpio_cfgpin(S3C2410_GPD(9), S3C2410_GPIO_INPUT);
-		s3c2410_gpio_pullup(S3C2410_GPD(10), 1);
-		s3c2410_gpio_pullup(S3C2410_GPD(9), 1);
-		s3c2410_gpio_pullup(S3C2410_GPD(8), 1);
+		s3c_gpio_cfgpull(S3C2410_GPD(10), S3C_GPIO_PULL_NONE);
+		s3c_gpio_cfgpull(S3C2410_GPD(9), S3C_GPIO_PULL_NONE);
+		s3c_gpio_cfgpull(S3C2410_GPD(8), S3C_GPIO_PULL_NONE);
 	}
 }
diff --git a/arch/arm/plat-s3c24xx/spi-bus1-gpg5_6_7.c b/arch/arm/plat-s3c24xx/spi-bus1-gpg5_6_7.c
index 86b9edc..7910501 100644
--- a/arch/arm/plat-s3c24xx/spi-bus1-gpg5_6_7.c
+++ b/arch/arm/plat-s3c24xx/spi-bus1-gpg5_6_7.c
@@ -29,8 +29,8 @@ void s3c24xx_spi_gpiocfg_bus1_gpg5_6_7(struct s3c2410_spi_info *spi,
 	} else {
 		s3c2410_gpio_cfgpin(S3C2410_GPG(7), S3C2410_GPIO_INPUT);
 		s3c2410_gpio_cfgpin(S3C2410_GPG(5), S3C2410_GPIO_INPUT);
-		s3c2410_gpio_pullup(S3C2410_GPG(5), 1);
-		s3c2410_gpio_pullup(S3C2410_GPG(6), 1);
-		s3c2410_gpio_pullup(S3C2410_GPG(7), 1);
+		s3c_gpio_cfgpull(S3C2410_GPG(5), S3C_GPIO_PULL_NONE);
+		s3c_gpio_cfgpull(S3C2410_GPG(6), S3C_GPIO_PULL_NONE);
+		s3c_gpio_cfgpull(S3C2410_GPG(7), S3C_GPIO_PULL_NONE);
 	}
 }
-- 
1.7.0.4
