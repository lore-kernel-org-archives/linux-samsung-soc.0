From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH 3/4] ARM: S5P64X0: Cleanup S5P64X0 GPIOlib adding 2bit chips
Date: Thu, 25 Nov 2010 14:30:16 +0900
Message-ID: <1290663017-9350-4-git-send-email-kgene.kim@samsung.com>
References: <1290663017-9350-1-git-send-email-kgene.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from ganesha.gnumonks.org ([213.95.27.120]:58860 "EHLO
	ganesha.gnumonks.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750946Ab0KYFlf (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 25 Nov 2010 00:41:35 -0500
In-Reply-To: <1290663017-9350-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: ben-linux@fluff.org, Kukjin Kim <kgene.kim@samsung.com>

This patch changes S5P6440 and S5P6450 GPIOlib adding 2bit chips.

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
 arch/arm/mach-s5p64x0/gpio.c |   17 ++++++-----------
 1 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/arch/arm/mach-s5p64x0/gpio.c b/arch/arm/mach-s5p64x0/gpio.c
index 17a2eee..0670fcc 100644
--- a/arch/arm/mach-s5p64x0/gpio.c
+++ b/arch/arm/mach-s5p64x0/gpio.c
@@ -473,21 +473,16 @@ static void __init s5p64x0_gpio_add_rbank_4bit2(struct s3c_gpio_chip *chip,
 
 static int __init s5p64x0_gpiolib_init(void)
 {
-	struct s3c_gpio_chip *s5p6440_chips = s5p6440_gpio_2bit;
-	int s5p6440_nr_chips = ARRAY_SIZE(s5p6440_gpio_2bit);
-
-	struct s3c_gpio_chip *s5p6450_chips = s5p6450_gpio_2bit;
-	int s5p6450_nr_chips = ARRAY_SIZE(s5p6450_gpio_2bit);
-
 	unsigned int chipid;
 
+	chipid = __raw_readl(S5P64X0_SYS_ID);
+
 	s5p64x0_gpiolib_set_cfg(s5p64x0_gpio_cfgs,
 				ARRAY_SIZE(s5p64x0_gpio_cfgs));
-	chipid = __raw_readl(S5P64X0_SYS_ID);
 
 	if ((chipid & 0xff000) == 0x50000) {
-		for (; s5p6450_nr_chips > 0; s5p6450_nr_chips--, s5p6450_chips++)
-			s3c_gpiolib_add(s5p6450_chips);
+		samsung_gpiolib_add_2bit_chips(s5p6450_gpio_2bit,
+					ARRAY_SIZE(s5p6450_gpio_2bit));
 
 		samsung_gpiolib_add_4bit_chips(s5p6450_gpio_4bit,
 					ARRAY_SIZE(s5p6450_gpio_4bit));
@@ -498,8 +493,8 @@ static int __init s5p64x0_gpiolib_init(void)
 		s5p64x0_gpio_add_rbank_4bit2(s5p6450_gpio_rbank_4bit2,
 					ARRAY_SIZE(s5p6450_gpio_rbank_4bit2));
 	} else {
-		for (; s5p6440_nr_chips > 0; s5p6440_nr_chips--, s5p6440_chips++)
-			s3c_gpiolib_add(s5p6440_chips);
+		samsung_gpiolib_add_2bit_chips(s5p6440_gpio_2bit,
+					ARRAY_SIZE(s5p6440_gpio_2bit));
 
 		samsung_gpiolib_add_4bit_chips(s5p6440_gpio_4bit,
 					ARRAY_SIZE(s5p6440_gpio_4bit));
-- 
1.6.2.5
