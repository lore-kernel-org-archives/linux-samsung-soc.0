From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH V2] ARM: S5PV310: Change to using s3c_gpio_cfgall_range()
Date: Tue, 12 Oct 2010 07:38:16 +0900
Message-ID: <1286836696-26659-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:39016 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756672Ab0JKWpr (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Oct 2010 18:45:47 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

Change the code setting a range of GPIO pins' configuration and
pull state to use the recently introduced s3c_gpio_cfgall_range().

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
Changes since v1: 
- Fix wrong s3c_gpio_cfgall_range

 arch/arm/mach-s5pv310/setup-i2c0.c |    5 ++---
 arch/arm/mach-s5pv310/setup-i2c1.c |    5 ++---
 arch/arm/mach-s5pv310/setup-i2c2.c |    5 ++---
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-s5pv310/setup-i2c0.c b/arch/arm/mach-s5pv310/setup-i2c0.c
index 17c54c8..f47f8f3 100644
--- a/arch/arm/mach-s5pv310/setup-i2c0.c
+++ b/arch/arm/mach-s5pv310/setup-i2c0.c
@@ -21,7 +21,6 @@ struct platform_device; /* don't need the contents */
 
 void s3c_i2c0_cfg_gpio(struct platform_device *dev)
 {
-	s3c_gpio_cfgpin_range(S5PV310_GPD1(0), 2, S3C_GPIO_SFN(2));
-	s3c_gpio_setpull(S5PV310_GPD1(0), S3C_GPIO_PULL_UP);
-	s3c_gpio_setpull(S5PV310_GPD1(1), S3C_GPIO_PULL_UP);
+	s3c_gpio_cfgall_range(S5PV310_GPD1(0), 2,
+			      S3C_GPIO_SFN(2), S3C_GPIO_PULL_UP);
 }
diff --git a/arch/arm/mach-s5pv310/setup-i2c1.c b/arch/arm/mach-s5pv310/setup-i2c1.c
index 1740c9f..9d07e4e 100644
--- a/arch/arm/mach-s5pv310/setup-i2c1.c
+++ b/arch/arm/mach-s5pv310/setup-i2c1.c
@@ -18,7 +18,6 @@ struct platform_device; /* don't need the contents */
 
 void s3c_i2c1_cfg_gpio(struct platform_device *dev)
 {
-	s3c_gpio_cfgpin_range(S5PV310_GPD1(2), 2, S3C_GPIO_SFN(2));
-	s3c_gpio_setpull(S5PV310_GPD1(2), S3C_GPIO_PULL_UP);
-	s3c_gpio_setpull(S5PV310_GPD1(3), S3C_GPIO_PULL_UP);
+	s3c_gpio_cfgall_range(S5PV310_GPD1(2), 2,
+			      S3C_GPIO_SFN(2), S3C_GPIO_PULL_UP);
 }
diff --git a/arch/arm/mach-s5pv310/setup-i2c2.c b/arch/arm/mach-s5pv310/setup-i2c2.c
index 860f77b..ad0f431 100644
--- a/arch/arm/mach-s5pv310/setup-i2c2.c
+++ b/arch/arm/mach-s5pv310/setup-i2c2.c
@@ -18,7 +18,6 @@ struct platform_device; /* don't need the contents */
 
 void s3c_i2c2_cfg_gpio(struct platform_device *dev)
 {
-	s3c_gpio_cfgpin_range(S5PV310_GPA0(6), 2, S3C_GPIO_SFN(3));
-	s3c_gpio_setpull(S5PV310_GPA0(6), S3C_GPIO_PULL_UP);
-	s3c_gpio_setpull(S5PV310_GPA0(7), S3C_GPIO_PULL_UP);
+	s3c_gpio_cfgall_range(S5PV310_GPA0(6), 2,
+			      S3C_GPIO_SFN(3), S3C_GPIO_PULL_UP);
 }
-- 
1.6.2.5
