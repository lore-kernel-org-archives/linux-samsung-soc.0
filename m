From: Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH 1/3] drm/bridge/sii8620: perform I2C bus recovery after
 reset
Date: Mon, 15 Jan 2018 18:33:55 +0100
Message-ID: <20180115173357.31067-2-a.hajda@samsung.com>
References: <20180115173357.31067-1-a.hajda@samsung.com>
        <CGME20180115173404eucas1p11cd93514b1c6cefedca81b4d06de860e@eucas1p1.samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:60359 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751258AbeAOReH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 15 Jan 2018 12:34:07 -0500
In-reply-to: <20180115173357.31067-1-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Archit Taneja <architt@codeaurora.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Andrzej Hajda <a.hajda@samsung.com>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org

Chip has known bug which causes I2C client state machine to frequently
enter non-idle mode after chip reset. Let's ask I2C adapter to perform
bus recovery to mitigate this bug.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
---
 drivers/gpu/drm/bridge/sil-sii8620.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
index 86789f8918a4..db93e5e0497c 100644
--- a/drivers/gpu/drm/bridge/sil-sii8620.c
+++ b/drivers/gpu/drm/bridge/sil-sii8620.c
@@ -978,6 +978,8 @@ static int sii8620_hw_off(struct sii8620 *ctx)
 
 static void sii8620_hw_reset(struct sii8620 *ctx)
 {
+	struct i2c_client *i2c = to_i2c_client(ctx->dev);
+
 	usleep_range(10000, 20000);
 	gpiod_set_value(ctx->gpio_reset, 0);
 	usleep_range(5000, 20000);
@@ -985,6 +987,9 @@ static void sii8620_hw_reset(struct sii8620 *ctx)
 	usleep_range(10000, 20000);
 	gpiod_set_value(ctx->gpio_reset, 0);
 	msleep(300);
+
+	/* I2C bus recovery prevents I2C errors due to known bug in the chip */
+	i2c_recover_bus(i2c->adapter);
 }
 
 static void sii8620_cbus_reset(struct sii8620 *ctx)
-- 
2.15.1
