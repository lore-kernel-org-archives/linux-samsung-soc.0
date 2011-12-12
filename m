From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH] ARM: S5PV210: Use gpio_request_one
Date: Mon, 12 Dec 2011 11:36:47 +0900
Message-ID: <003f01ccb876$e4f86ec0$aee94c40$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:21920 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752756Ab1LLCgs (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 11 Dec 2011 21:36:48 -0500
Received: from epcpsbgm1.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LW2003F9KKX43C0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 12 Dec 2011 11:36:47 +0900 (KST)
Received: from DOJG1HAN02 ([12.23.120.153])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LW200KP4KLB3M40@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Mon, 12 Dec 2011 11:36:47 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: 'Kukjin Kim' <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org
Cc: 'Jingoo Han' <jg1.han@samsung.com>

By using gpio_request_one it is possible to set the direction
and initial value in one shot. Thus, using gpio_request_one can
make the code simpler.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 arch/arm/mach-s5pv210/mach-aquila.c   |    3 +--
 arch/arm/mach-s5pv210/mach-goni.c     |    6 ++----
 arch/arm/mach-s5pv210/mach-smdkv210.c |   10 +++-------
 3 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/arch/arm/mach-s5pv210/mach-aquila.c b/arch/arm/mach-s5pv210/mach-aquila.c
index 5811a96..404ac7a 100644
--- a/arch/arm/mach-s5pv210/mach-aquila.c
+++ b/arch/arm/mach-s5pv210/mach-aquila.c
@@ -595,8 +595,7 @@ static struct s3c_sdhci_platdata aquila_hsmmc2_data __initdata = {
 
 static void aquila_setup_sdhci(void)
 {
-	gpio_request(AQUILA_EXT_FLASH_EN, "FLASH_EN");
-	gpio_direction_output(AQUILA_EXT_FLASH_EN, 1);
+	gpio_request_one(AQUILA_EXT_FLASH_EN, GPIOF_OUT_INIT_HIGH, "FLASH_EN");
 
 	s3c_sdhci0_set_platdata(&aquila_hsmmc0_data);
 	s3c_sdhci1_set_platdata(&aquila_hsmmc1_data);
diff --git a/arch/arm/mach-s5pv210/mach-goni.c b/arch/arm/mach-s5pv210/mach-goni.c
index 15edcae..e2754e9 100644
--- a/arch/arm/mach-s5pv210/mach-goni.c
+++ b/arch/arm/mach-s5pv210/mach-goni.c
@@ -227,8 +227,7 @@ static void __init goni_radio_init(void)
 	i2c1_devs[0].irq = gpio_to_irq(gpio);
 
 	gpio = S5PV210_GPJ2(5);			/* XMSMDATA_5 */
-	gpio_request(gpio, "FM_RST");
-	gpio_direction_output(gpio, 1);
+	gpio_request_one(gpio, GPIOF_OUT_INIT_HIGH, "FM_RST");
 }
 
 /* TSP */
@@ -264,8 +263,7 @@ static void __init goni_tsp_init(void)
 	int gpio;
 
 	gpio = S5PV210_GPJ1(3);		/* XMSMADDR_11 */
-	gpio_request(gpio, "TSP_LDO_ON");
-	gpio_direction_output(gpio, 1);
+	gpio_request_one(gpio, GPIOF_OUT_INIT_HIGH, "TSP_LDO_ON");
 	gpio_export(gpio, 0);
 
 	gpio = S5PV210_GPJ0(5);		/* XMSMADDR_5 */
diff --git a/arch/arm/mach-s5pv210/mach-smdkv210.c b/arch/arm/mach-s5pv210/mach-smdkv210.c
index a9106c3..10a4ec6 100644
--- a/arch/arm/mach-s5pv210/mach-smdkv210.c
+++ b/arch/arm/mach-s5pv210/mach-smdkv210.c
@@ -153,15 +153,12 @@ static void smdkv210_lte480wv_set_power(struct plat_lcd_data *pd,
 {
 	if (power) {
 #if !defined(CONFIG_BACKLIGHT_PWM)
-		gpio_request(S5PV210_GPD0(3), "GPD0");
-		gpio_direction_output(S5PV210_GPD0(3), 1);
+		gpio_request_one(S5PV210_GPD0(3), GPIOF_OUT_INIT_HIGH, "GPD0");
 		gpio_free(S5PV210_GPD0(3));
 #endif
 
 		/* fire nRESET on power up */
-		gpio_request(S5PV210_GPH0(6), "GPH0");
-
-		gpio_direction_output(S5PV210_GPH0(6), 1);
+		gpio_request_one(S5PV210_GPH0(6), GPIOF_OUT_INIT_HIGH, "GPH0");
 
 		gpio_set_value(S5PV210_GPH0(6), 0);
 		mdelay(10);
@@ -172,8 +169,7 @@ static void smdkv210_lte480wv_set_power(struct plat_lcd_data *pd,
 		gpio_free(S5PV210_GPH0(6));
 	} else {
 #if !defined(CONFIG_BACKLIGHT_PWM)
-		gpio_request(S5PV210_GPD0(3), "GPD0");
-		gpio_direction_output(S5PV210_GPD0(3), 0);
+		gpio_request_one(S5PV210_GPD0(3), GPIOF_OUT_INIT_LOW, "GPD0");
 		gpio_free(S5PV210_GPD0(3));
 #endif
 	}
-- 
1.7.1
