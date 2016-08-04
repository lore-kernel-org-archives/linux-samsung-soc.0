From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH 5/8] ASoC: s3c24xx_uda134x: Drop initialization of codec's
 platform data
Date: Thu, 04 Aug 2016 15:38:45 +0200
Message-ID: <1470317928-25365-6-git-send-email-s.nawrocki@samsung.com>
References: <1470317928-25365-1-git-send-email-s.nawrocki@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:43534 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933738AbcHDNkX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 4 Aug 2016 09:40:23 -0400
Received: from epcpsbgm1new.samsung.com (epcpsbgm1 [203.254.230.26])
 by mailout3.samsung.com
 (Oracle Communications Messaging Server 7.0.5.31.0 64bit (built May  5 2014))
 with ESMTP id <0OBE013KD0GKDQE0@mailout3.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 04 Aug 2016 22:39:32 +0900 (KST)
In-reply-to: <1470317928-25365-1-git-send-email-s.nawrocki@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: broonie@kernel.org
Cc: krzk@kernel.org, alsa-devel@alsa-project.org, b.zolnierkie@samsung.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sylwester Nawrocki <s.nawrocki@samsung.com>

It's already taken care by the codec and its platform_data defined
in the arch/arm/mach-s3c24xx/mach-mini2440.c board file.

Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/s3c24xx_uda134x.c | 71 +------------------------------------
 1 file changed, 1 insertion(+), 70 deletions(-)

diff --git a/sound/soc/samsung/s3c24xx_uda134x.c b/sound/soc/samsung/s3c24xx_uda134x.c
index c145eb2..794e30d 100644
--- a/sound/soc/samsung/s3c24xx_uda134x.c
+++ b/sound/soc/samsung/s3c24xx_uda134x.c
@@ -227,78 +227,12 @@ static struct snd_soc_card snd_soc_s3c24xx_uda134x = {
 	.num_links = 1,
 };
 
-static struct s3c24xx_uda134x_platform_data *s3c24xx_uda134x_l3_pins;
-
-static void setdat(int v)
-{
-	gpio_set_value(s3c24xx_uda134x_l3_pins->l3_data, v > 0);
-}
-
-static void setclk(int v)
-{
-	gpio_set_value(s3c24xx_uda134x_l3_pins->l3_clk, v > 0);
-}
-
-static void setmode(int v)
-{
-	gpio_set_value(s3c24xx_uda134x_l3_pins->l3_mode, v > 0);
-}
-
-/* FIXME - This must be codec platform data but in which board file ?? */
-static struct uda134x_platform_data s3c24xx_uda134x = {
-	.l3 = {
-		.setdat = setdat,
-		.setclk = setclk,
-		.setmode = setmode,
-		.data_hold = 1,
-		.data_setup = 1,
-		.clock_high = 1,
-		.mode_hold = 1,
-		.mode = 1,
-		.mode_setup = 1,
-	},
-};
-
-static int s3c24xx_uda134x_setup_pin(int pin, char *fun)
-{
-	if (gpio_request(pin, "s3c24xx_uda134x") < 0) {
-		printk(KERN_ERR "S3C24XX_UDA134X SoC Audio: "
-		       "l3 %s pin already in use", fun);
-		return -EBUSY;
-	}
-	gpio_direction_output(pin, 0);
-	return 0;
-}
-
 static int s3c24xx_uda134x_probe(struct platform_device *pdev)
 {
 	int ret;
 
 	printk(KERN_INFO "S3C24XX_UDA134X SoC Audio driver\n");
 
-	s3c24xx_uda134x_l3_pins = pdev->dev.platform_data;
-	if (s3c24xx_uda134x_l3_pins == NULL) {
-		printk(KERN_ERR "S3C24XX_UDA134X SoC Audio: "
-		       "unable to find platform data\n");
-		return -ENODEV;
-	}
-	s3c24xx_uda134x.model = s3c24xx_uda134x_l3_pins->model;
-
-	if (s3c24xx_uda134x_setup_pin(s3c24xx_uda134x_l3_pins->l3_data,
-				      "data") < 0)
-		return -EBUSY;
-	if (s3c24xx_uda134x_setup_pin(s3c24xx_uda134x_l3_pins->l3_clk,
-				      "clk") < 0) {
-		gpio_free(s3c24xx_uda134x_l3_pins->l3_data);
-		return -EBUSY;
-	}
-	if (s3c24xx_uda134x_setup_pin(s3c24xx_uda134x_l3_pins->l3_mode,
-				      "mode") < 0) {
-		gpio_free(s3c24xx_uda134x_l3_pins->l3_data);
-		gpio_free(s3c24xx_uda134x_l3_pins->l3_clk);
-		return -EBUSY;
-	}
-
 	s3c24xx_uda134x_snd_device = platform_device_alloc("soc-audio", -1);
 	if (!s3c24xx_uda134x_snd_device) {
 		printk(KERN_ERR "S3C24XX_UDA134X SoC Audio: "
@@ -308,7 +242,7 @@ static int s3c24xx_uda134x_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(s3c24xx_uda134x_snd_device,
 			     &snd_soc_s3c24xx_uda134x);
-	platform_device_add_data(s3c24xx_uda134x_snd_device, &s3c24xx_uda134x, sizeof(s3c24xx_uda134x));
+
 	ret = platform_device_add(s3c24xx_uda134x_snd_device);
 	if (ret) {
 		printk(KERN_ERR "S3C24XX_UDA134X SoC Audio: Unable to add\n");
@@ -321,9 +255,6 @@ static int s3c24xx_uda134x_probe(struct platform_device *pdev)
 static int s3c24xx_uda134x_remove(struct platform_device *pdev)
 {
 	platform_device_unregister(s3c24xx_uda134x_snd_device);
-	gpio_free(s3c24xx_uda134x_l3_pins->l3_data);
-	gpio_free(s3c24xx_uda134x_l3_pins->l3_clk);
-	gpio_free(s3c24xx_uda134x_l3_pins->l3_mode);
 	return 0;
 }
 
-- 
1.9.1
