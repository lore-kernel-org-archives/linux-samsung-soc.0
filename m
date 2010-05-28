From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 14/15] ARM: S5PC100: Change to using s3c_gpio_cfgrange_nopull()
Date: Fri, 28 May 2010 06:56:51 +0100
Message-ID: <1275026212-27510-15-git-send-email-ben-linux@fluff.org>
References: <1275026212-27510-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:33984 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755887Ab0E1F5N (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 May 2010 01:57:13 -0400
In-Reply-To: <1275026212-27510-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Chane code setting special-function and no pull-up to use
the s3c_gpio_cfgrange_nopull() wrapper.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/mach-s5pc100/setup-sdhci-gpio.c |   15 +++++----------
 1 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/arm/mach-s5pc100/setup-sdhci-gpio.c b/arch/arm/mach-s5pc100/setup-sdhci-gpio.c
index 15cf1ac..b353441 100644
--- a/arch/arm/mach-s5pc100/setup-sdhci-gpio.c
+++ b/arch/arm/mach-s5pc100/setup-sdhci-gpio.c
@@ -31,13 +31,10 @@ void s5pc100_setup_sdhci0_cfg_gpio(struct platform_device *dev, int width)
 		num = width - 2;
 
 	/* Set all the necessary GPG0/GPG1 pins to special-function 0 */
-	s3c_gpio_cfgall_range(S5PC100_GPG0(0), 2 + num,
-			      S3C_GPIO_SFN(2), S3C_GPIO_PULL_NONE);
+	s3c_gpio_cfgrange_nopull(S5PC100_GPG0(0), 2 + num, S3C_GPIO_SFN(2));
 
-	if (width == 8) {
-		s3c_gpio_cfgall_range(S5PC100_GPG1(0), 2,
-				      S3C_GPIO_SFN(2), S3C_GPIO_PULL_NONE);
-	}
+	if (width == 8)
+		s3c_gpio_cfgrange_nopull(S5PC100_GPG1(0), 2, S3C_GPIO_SFN(2));
 
 	s3c_gpio_setpull(S5PC100_GPG1(2), S3C_GPIO_PULL_UP);
 	s3c_gpio_cfgpin(S5PC100_GPG1(2), S3C_GPIO_SFN(2));
@@ -46,8 +43,7 @@ void s5pc100_setup_sdhci0_cfg_gpio(struct platform_device *dev, int width)
 void s5pc100_setup_sdhci1_cfg_gpio(struct platform_device *dev, int width)
 {
 	/* Set all the necessary GPG2 pins to special-function 2 */
-	s3c_gpio_cfgall_range(S5PC100_GPG2(0), 2 + width,
-			      S3C_GPIO_SFN(2), S3C_GPIO_PULL_NONE);
+	s3c_gpio_cfgrange_nopull(S5PC100_GPG2(0), 2 + width, S3C_GPIO_SFN(2));
 
 	s3c_gpio_setpull(S5PC100_GPG2(6), S3C_GPIO_PULL_UP);
 	s3c_gpio_cfgpin(S5PC100_GPG2(6), S3C_GPIO_SFN(2));
@@ -56,8 +52,7 @@ void s5pc100_setup_sdhci1_cfg_gpio(struct platform_device *dev, int width)
 void s5pc100_setup_sdhci2_cfg_gpio(struct platform_device *dev, int width)
 {
 	/* Set all the necessary GPG3 pins to special-function 2 */
-	s3c_gpio_cfgall_range(S5PC100_GPG3(0), 2 + width,
-			      S3C_GPIO_SFN(2), S3C_GPIO_PULL_NONE);
+	s3c_gpio_cfgrange_nopull(S5PC100_GPG3(0), 2 + width, S3C_GPIO_SFN(2));
 
 	s3c_gpio_setpull(S5PC100_GPG3(6), S3C_GPIO_PULL_UP);
 	s3c_gpio_cfgpin(S5PC100_GPG3(6), S3C_GPIO_SFN(2));
-- 
1.6.3.3
