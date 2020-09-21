Return-Path: <SRS0=QYj3=C6=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A3A6C4363C
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Sep 2020 20:53:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5957323A33
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Sep 2020 20:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600721626;
	bh=cMiRJpoRq2UzInKVvMQQX4aNM30Dhzlto4skXmptPUE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-ID:From;
	b=IcuEKII2xUwc5WB8+h3zBQPb90lG0Q+FsFcn6Nk+6z0swjJgIgIhWrTXHBd6t9YF6
	 GMUU4/d3PIDldSq7ysuhuTSqMHgXujQv7k5ACqKrazLeyBtasZdIDZqkb2WUWZjzUf
	 CbcnZJn82RAEM/E84DJpHmKr90wT5gouqNYaufy4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728256AbgIUUxq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 21 Sep 2020 16:53:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:60000 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727808AbgIUUxp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 21 Sep 2020 16:53:45 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F178623A40;
        Mon, 21 Sep 2020 20:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600721625;
        bh=cMiRJpoRq2UzInKVvMQQX4aNM30Dhzlto4skXmptPUE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=OmTRGutKlSehHWokIvFIzS4x5J16PPPWTUJ8TJhyh488X7zteCKvsFkbdzfp0fhUF
         L5DjHNEMbE3xeOQXspd1yFHkWnxgGnZp2TsKlcLpDbCgfHWWmBh+erNA9WTSQPKac6
         v7Hd0WvLWgZD9OIun9P2sOV64Nw+I4DdAFDj7stM=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Lee Jones <lee.jones@linaro.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Support Opensource <support.opensource@diasemi.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Milo Kim <milo.kim@ti.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sangbeom Kim <sbkim73@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org
Subject: [PATCH 33/42] mfd: tps65090: use PLATFORM_DEVID_NONE
Date:   Mon, 21 Sep 2020 22:50:07 +0200
Message-Id: <20200921205016.20461-33-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200921205016.20461-1-krzk@kernel.org>
References: <20200921205016.20461-1-krzk@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use PLATFORM_DEVID_NONE define instead of "-1" value because:
 - it brings some meaning,
 - it might point attention why auto device ID was not used.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mfd/tps65090.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/tps65090.c b/drivers/mfd/tps65090.c
index 6cdf6c315034..f8f7170f5822 100644
--- a/drivers/mfd/tps65090.c
+++ b/drivers/mfd/tps65090.c
@@ -209,7 +209,7 @@ static int tps65090_i2c_probe(struct i2c_client *client,
 		tps65090s[CHARGER].num_resources = 0;
 	}
 
-	ret = mfd_add_devices(tps65090->dev, -1, tps65090s,
+	ret = mfd_add_devices(tps65090->dev, PLATFORM_DEVID_NONE, tps65090s,
 			      ARRAY_SIZE(tps65090s), NULL,
 			      0, regmap_irq_get_domain(tps65090->irq_data));
 	if (ret) {
-- 
2.17.1

