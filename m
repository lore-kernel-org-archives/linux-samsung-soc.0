Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36B90C00140
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 21 Aug 2022 16:43:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230474AbiHUQny (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 21 Aug 2022 12:43:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229982AbiHUQnx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 21 Aug 2022 12:43:53 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81ECD14009
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Aug 2022 09:43:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 22CB1B80B94
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Aug 2022 16:43:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9DD0C433D6;
        Sun, 21 Aug 2022 16:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661100229;
        bh=WtlqS8ekb/Mvx6VAbI+TwumMMQt1oc7YbdmyEkIiH44=;
        h=From:To:Cc:Subject:Date:From;
        b=pJaxtuLEWhjv1PRUdfqLKqY7gv2cIWW+6VkwvFXHd+7ToCyzR/435P330iWvE3H+4
         jKdCt9m4sGY2kWpQTzqKD5RAND/6ifnvt7H4NynFECs3nLx8xB78GosbkAYSz+yBLW
         uDUXPPSxHM9eoy4TDkQooYu71JYmbxwBKURJfcEO8SCSOdALW24vmIkmsUNjTjtjN5
         q53bxeyYxDgHqAXGZsfvM0RauAb8ZQAJUTH+diMt+R45AVHWdnXxkpBBQt5CePiSWF
         WiY/kmGpMRFeLMPmG5LYms4/FvZ3uEulBKnC6AkAtNplhHx8u7WoSXEQOAcnHsZvA2
         tJTx0lDpKXgTQ==
From:   Jonathan Cameron <jic23@kernel.org>
To:     alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: [PATCH] ASoC: samsung: Use iio_get_channel_type() accessor.
Date:   Sun, 21 Aug 2022 17:09:14 +0100
Message-Id: <20220821160914.2207116-1-jic23@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Jonathan Cameron <Jonathan.Cameron@huawei.com>

struct iio_chan_spec is meant to be opaque to IIO consumer drivers
which should only use the interfaces in linux/iio/consumer.h.
Use the provided accessor function to find get the type of the
channel instead of directly reading it form the structure.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
---
 sound/soc/samsung/aries_wm8994.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/samsung/aries_wm8994.c b/sound/soc/samsung/aries_wm8994.c
index e7d52d27132e..0fbbf3b02c09 100644
--- a/sound/soc/samsung/aries_wm8994.c
+++ b/sound/soc/samsung/aries_wm8994.c
@@ -1,7 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 #include <linux/extcon.h>
 #include <linux/iio/consumer.h>
-#include <linux/iio/iio.h>
 #include <linux/input-event-codes.h>
 #include <linux/mfd/wm8994/registers.h>
 #include <linux/module.h>
@@ -543,6 +542,7 @@ static int aries_audio_probe(struct platform_device *pdev)
 	struct aries_wm8994_data *priv;
 	struct snd_soc_dai_link *dai_link;
 	const struct of_device_id *match;
+	enum iio_chan_type channel_type;
 	int ret, i;
 
 	if (!np)
@@ -594,7 +594,11 @@ static int aries_audio_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(priv->adc),
 				     "Failed to get ADC channel");
 
-	if (priv->adc->channel->type != IIO_VOLTAGE)
+	ret = iio_get_channel_type(priv->adc, &channel_type);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to get ADC channel type");
+	if (channel_type != IIO_VOLTAGE)
 		return -EINVAL;
 
 	priv->gpio_headset_key = devm_gpiod_get(dev, "headset-key",
-- 
2.37.2

