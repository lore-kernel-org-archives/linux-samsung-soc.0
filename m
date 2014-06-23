From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH v3 4/4] ASoC: samsung: s3c24xx-i2s: Move to clk_prepare_enable/clk_disable_unprepare
Date: Mon, 23 Jun 2014 23:24:07 +0300
Message-ID: <1403555047-14783-5-git-send-email-anarsoul@gmail.com>
References: <1403555047-14783-1-git-send-email-anarsoul@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f179.google.com ([209.85.212.179]:63394 "EHLO
	mail-wi0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932361AbaFWU0w (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Jun 2014 16:26:52 -0400
Received: by mail-wi0-f179.google.com with SMTP id cc10so4904205wib.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jun 2014 13:26:51 -0700 (PDT)
In-Reply-To: <1403555047-14783-1-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Lars-Peter Clausen <lars@metafoo.de>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>

Use clk_prepare_enable/clk_disable_unprepare to make the driver
work properly with common clock framework.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 sound/soc/samsung/s3c24xx-i2s.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/samsung/s3c24xx-i2s.c b/sound/soc/samsung/s3c24xx-i2s.c
index 6f3ee87..e8b9852 100644
--- a/sound/soc/samsung/s3c24xx-i2s.c
+++ b/sound/soc/samsung/s3c24xx-i2s.c
@@ -373,7 +373,7 @@ static int s3c24xx_i2s_probe(struct snd_soc_dai *dai)
 		pr_err("failed to get iis_clock\n");
 		return PTR_ERR(s3c24xx_i2s.iis_clk);
 	}
-	clk_enable(s3c24xx_i2s.iis_clk);
+	clk_prepare_enable(s3c24xx_i2s.iis_clk);
 
 	/* Configure the I2S pins (GPE0...GPE4) in correct mode */
 	s3c_gpio_cfgall_range(S3C2410_GPE(0), 5, S3C_GPIO_SFN(2),
@@ -397,7 +397,7 @@ static int s3c24xx_i2s_suspend(struct snd_soc_dai *cpu_dai)
 	s3c24xx_i2s.iisfcon = readl(s3c24xx_i2s.regs + S3C2410_IISFCON);
 	s3c24xx_i2s.iispsr = readl(s3c24xx_i2s.regs + S3C2410_IISPSR);
 
-	clk_disable(s3c24xx_i2s.iis_clk);
+	clk_disable_unprepare(s3c24xx_i2s.iis_clk);
 
 	return 0;
 }
@@ -405,7 +405,7 @@ static int s3c24xx_i2s_suspend(struct snd_soc_dai *cpu_dai)
 static int s3c24xx_i2s_resume(struct snd_soc_dai *cpu_dai)
 {
 	pr_debug("Entered %s\n", __func__);
-	clk_enable(s3c24xx_i2s.iis_clk);
+	clk_prepare_enable(s3c24xx_i2s.iis_clk);
 
 	writel(s3c24xx_i2s.iiscon, s3c24xx_i2s.regs + S3C2410_IISCON);
 	writel(s3c24xx_i2s.iismod, s3c24xx_i2s.regs + S3C2410_IISMOD);
-- 
2.0.0
