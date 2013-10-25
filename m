From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH] ASoC: Samsung: I2S: fix return value check in i2s_alloc_dai()
Date: Fri, 25 Oct 2013 17:06:24 +0800
Message-ID: <CAPgLHd8nzO9Q1fF1KsuJna_JVJDd+cimBC3ipd3nTP9Sz=fE9g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ee0-f46.google.com ([74.125.83.46]:36405 "EHLO
	mail-ee0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751967Ab3JYJG1 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 25 Oct 2013 05:06:27 -0400
Received: by mail-ee0-f46.google.com with SMTP id c1so1748170eek.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Oct 2013 02:06:26 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: ben-linux@fluff.org, kgene.kim@samsung.com, sbkim73@samsung.com, lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.de, grant.likely@linaro.org, rob.herring@calxeda.com
Cc: yongjun_wei@trendmicro.com.cn, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, alsa-devel@alsa-project.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

In case of error, the function platform_device_alloc() returns NULL
pointer not ERR_PTR(). The IS_ERR() test in the return value check
should be replaced with NULL test.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 sound/soc/samsung/i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index b302f3b..b721443 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1073,7 +1073,7 @@ static struct i2s_dai *i2s_alloc_dai(struct platform_device *pdev, bool sec)
 		dev_set_drvdata(&i2s->pdev->dev, i2s);
 	} else {	/* Create a new platform_device for Secondary */
 		i2s->pdev = platform_device_alloc("samsung-i2s-sec", -1);
-		if (IS_ERR(i2s->pdev))
+		if (!i2s->pdev)
 			return NULL;
 
 		i2s->pdev->dev.parent = &pdev->dev;
