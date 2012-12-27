From: Inderpal Singh <inderpal.singh@linaro.org>
Subject: [PATCH 1/2] i2c: s3c2410: Initialize i2c->gpios[] with requested gpio lines
Date: Thu, 27 Dec 2012 09:39:43 +0530
Message-ID: <1356581384-23063-1-git-send-email-inderpal.singh@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-da0-f41.google.com ([209.85.210.41]:39015 "EHLO
	mail-da0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751852Ab2L0EJu (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 26 Dec 2012 23:09:50 -0500
Received: by mail-da0-f41.google.com with SMTP id e20so4160002dak.28
        for <linux-samsung-soc@vger.kernel.org>; Wed, 26 Dec 2012 20:09:49 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-i2c@vger.kernel.org
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org, thomas.abraham@linaro.org, patches@linaro.org

i2c->gpios[] is being used to free_gpios but it's not getting initialized.

Signed-off-by: Inderpal Singh <inderpal.singh@linaro.org>
---
 drivers/i2c/busses/i2c-s3c2410.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
index a290d08..f1d1f1e 100644
--- a/drivers/i2c/busses/i2c-s3c2410.c
+++ b/drivers/i2c/busses/i2c-s3c2410.c
@@ -875,6 +875,8 @@ static int s3c24xx_i2c_parse_dt_gpio(struct s3c24xx_i2c *i2c)
 			dev_err(i2c->dev, "gpio [%d] request failed\n", gpio);
 			goto free_gpio;
 		}
+
+		i2c->gpios[idx] = gpio;
 	}
 	return 0;
 
-- 
1.7.9.5
