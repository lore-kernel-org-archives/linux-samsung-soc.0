Return-Path: <SRS0=zATP=EE=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2712C55179
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 00:32:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D6B62080D
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 00:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603931538;
	bh=Z3MQKhv+ZLUhU7MgkJiui/AhRWMSips3cc5Y1lahYAY=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=OF8eYmXMzLb5vr1elmJiJyONwHOZ+X6R0NDOI8YpkiI2wopCdToLtmNMgq+pIUe8F
	 Kv86mIrwAdyWy6ev2t2iOgqofIt6AZDEPSmS2qF110YN8HSkQ8ZtMaI4Y6Bnkzv3fv
	 ZfUjBowd7QndaM6Jf3H8VkuDbA3qll04ufWBjUYk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387698AbgJ1Wa3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:30:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:43398 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732857AbgJ1WaS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Oct 2020 18:30:18 -0400
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3895F20714;
        Wed, 28 Oct 2020 22:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603924218;
        bh=Z3MQKhv+ZLUhU7MgkJiui/AhRWMSips3cc5Y1lahYAY=;
        h=From:To:Cc:Subject:Date:From;
        b=ZfjpmpFm2yBCiugjBHAeL4425YSyLy0X5jKvkOBXp5l/nR0qUv1Nq60XeZZf8O8Xg
         HiPz8zOo8yWC3Gmw+YVoEFVUwiF1UHqgRRYDf4t+PWoHMIrM8oLGyeehSfTMLmXPx0
         vK5HI+7mrMUammjz14hEUuHkFGWdM2ge0XLVIH8U=
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
        Andy Shevchenko <andy@kernel.org>, Milo Kim <milo.kim@ti.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org
Cc:     Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: [RESEND PATCH 01/42] mfd: arizona: use PLATFORM_DEVID_NONE
Date:   Wed, 28 Oct 2020 23:29:28 +0100
Message-Id: <20201028223009.369824-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use PLATFORM_DEVID_NONE define instead of "-1" value because:
 - it brings some meaning,
 - it might point attention why auto device ID was not used.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 drivers/mfd/arizona-core.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/arizona-core.c b/drivers/mfd/arizona-core.c
index 000cb82023e3..bf48372db605 100644
--- a/drivers/mfd/arizona-core.c
+++ b/drivers/mfd/arizona-core.c
@@ -1043,8 +1043,9 @@ int arizona_dev_init(struct arizona *arizona)
 	case CS47L24:
 		break; /* No LDO1 regulator */
 	default:
-		ret = mfd_add_devices(arizona->dev, -1, early_devs,
-				      ARRAY_SIZE(early_devs), NULL, 0, NULL);
+		ret = mfd_add_devices(arizona->dev, PLATFORM_DEVID_NONE,
+				      early_devs, ARRAY_SIZE(early_devs),
+				      NULL, 0, NULL);
 		if (ret != 0) {
 			dev_err(dev, "Failed to add early children: %d\n", ret);
 			return ret;
-- 
2.25.1

