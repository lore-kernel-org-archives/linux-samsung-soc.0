From: Vasily Khoruzhick <anarsoul@gmail.com>
Subject: [PATCH v3 3/4] ASoC: samsung: s3c2412-i2s: Move to clk_prepare_enable/clk_disable_unprepare
Date: Mon, 23 Jun 2014 23:24:06 +0300
Message-ID: <1403555047-14783-4-git-send-email-anarsoul@gmail.com>
References: <1403555047-14783-1-git-send-email-anarsoul@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-we0-f172.google.com ([74.125.82.172]:63503 "EHLO
	mail-we0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932361AbaFWU0u (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 23 Jun 2014 16:26:50 -0400
Received: by mail-we0-f172.google.com with SMTP id u57so7777204wes.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 23 Jun 2014 13:26:49 -0700 (PDT)
In-Reply-To: <1403555047-14783-1-git-send-email-anarsoul@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, alsa-devel@alsa-project.org, Kukjin Kim <kgene.kim@samsung.com>, Sangbeom Kim <sbkim73@samsung.com>, Lars-Peter Clausen <lars@metafoo.de>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Tomasz Figa <t.figa@samsung.com>, =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>

Use clk_prepare_enable/clk_disable_unprepare to make the driver
work properly with common clock framework.

Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
---
 sound/soc/samsung/s3c2412-i2s.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/s3c2412-i2s.c b/sound/soc/samsung/s3c2412-i2s.c
index d9d27cc..d6bc6dc 100644
--- a/sound/soc/samsung/s3c2412-i2s.c
+++ b/sound/soc/samsung/s3c2412-i2s.c
@@ -76,7 +76,7 @@ static int s3c2412_i2s_probe(struct snd_soc_dai *dai)
 	/* Set MPLL as the source for IIS CLK */
 
 	clk_set_parent(s3c2412_i2s.iis_cclk, clk_get(NULL, "mpll"));
-	clk_enable(s3c2412_i2s.iis_cclk);
+	clk_prepare_enable(s3c2412_i2s.iis_cclk);
 
 	s3c2412_i2s.iis_cclk = s3c2412_i2s.iis_pclk;
 
@@ -89,7 +89,7 @@ static int s3c2412_i2s_probe(struct snd_soc_dai *dai)
 
 static int s3c2412_i2s_remove(struct snd_soc_dai *dai)
 {
-	clk_disable(s3c2412_i2s.iis_cclk);
+	clk_disable_unprepare(s3c2412_i2s.iis_cclk);
 
 	return 0;
 }
-- 
2.0.0
