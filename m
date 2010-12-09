From: Sangbeom Kim <sbkim73@samsung.com>
Subject: [PATCH 4/4] ARM: S5P64X0: Enable pm save/restore functions for GPIO banks
Date: Thu,  9 Dec 2010 17:11:57 +0900
Message-ID: <1291882317-20411-5-git-send-email-sbkim73@samsung.com>
References: <1291882317-20411-1-git-send-email-sbkim73@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:40887 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754856Ab0LII3p (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 9 Dec 2010 03:29:45 -0500
In-Reply-To: <1291882317-20411-1-git-send-email-sbkim73@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, ben-linux@fluff.org, Abhilash Kesavan <a.kesavan@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>

From: Abhilash Kesavan <a.kesavan@samsung.com>

Fix the "no pm for GPIOXX" messages appearing during bootup due
to the lack of save/restore functions for those GPIO banks.

Signed-off-by: Abhilash Kesavan <a.kesavan@samsung.com>
Signed-off-by: Sangbeom Kim <sbkim73@samsung.com>
---
 arch/arm/mach-s5p64x0/gpiolib.c |   14 ++++++++++++--
 1 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s5p64x0/gpiolib.c b/arch/arm/mach-s5p64x0/gpiolib.c
index 072668a..9302d86 100644
--- a/arch/arm/mach-s5p64x0/gpiolib.c
+++ b/arch/arm/mach-s5p64x0/gpiolib.c
@@ -460,6 +460,15 @@ void __init s5p64x0_gpiolib_set_cfg(struct s3c_gpio_cfg *chipcfg, int nr_chips)
 	}
 }
 
+static void __init s5p64x0_gpio_add_2bit(struct s3c_gpio_chip *chip,
+						int nr_chips)
+{
+	for (; nr_chips > 0; nr_chips--, chip++) {
+		chip->pm = __gpio_pm(&s3c_gpio_pm_2bit);
+		s3c_gpiolib_add(chip);
+	}
+}
+
 static void __init s5p64x0_gpio_add_rbank_4bit2(struct s3c_gpio_chip *chip,
 						int nr_chips)
 {
@@ -467,6 +476,7 @@ static void __init s5p64x0_gpio_add_rbank_4bit2(struct s3c_gpio_chip *chip,
 		chip->chip.direction_input = s5p64x0_gpiolib_rbank_4bit2_input;
 		chip->chip.direction_output =
 					s5p64x0_gpiolib_rbank_4bit2_output;
+		chip->pm = __gpio_pm(&s3c_gpio_pm_4bit);
 		s3c_gpiolib_add(chip);
 	}
 }
@@ -481,7 +491,7 @@ static int __init s5p64x0_gpiolib_init(void)
 				ARRAY_SIZE(s5p64x0_gpio_cfgs));
 
 	if ((chipid & 0xff000) == 0x50000) {
-		samsung_gpiolib_add_2bit_chips(s5p6450_gpio_2bit,
+		s5p64x0_gpio_add_2bit(s5p6450_gpio_2bit,
 					ARRAY_SIZE(s5p6450_gpio_2bit));
 
 		samsung_gpiolib_add_4bit_chips(s5p6450_gpio_4bit,
@@ -493,7 +503,7 @@ static int __init s5p64x0_gpiolib_init(void)
 		s5p64x0_gpio_add_rbank_4bit2(s5p6450_gpio_rbank_4bit2,
 					ARRAY_SIZE(s5p6450_gpio_rbank_4bit2));
 	} else {
-		samsung_gpiolib_add_2bit_chips(s5p6440_gpio_2bit,
+		s5p64x0_gpio_add_2bit(s5p6440_gpio_2bit,
 					ARRAY_SIZE(s5p6440_gpio_2bit));
 
 		samsung_gpiolib_add_4bit_chips(s5p6440_gpio_4bit,
-- 
1.6.6.1
