Return-Path: <SRS0=zATP=EE=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC6FC55179
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 00:30:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 263EE20829
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 29 Oct 2020 00:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603931436;
	bh=6ehR7YXqa9nliZWFk/43rNiUaT0bFg1g+JVzRLztlkA=;
	h=From:To:Subject:Date:In-Reply-To:References:List-ID:From;
	b=WQbJulMxYUS2rMOLh1QFXfhIRSJSWCWlGDpJF6SKBLqRw229+bgoTLT7QOxG1h6Bl
	 40VwI5xkt5R8CPzGTO8MZ+AsehHFIms8fve+OfbnuyxGwBtfnIHAddNOf1o0NdE+9E
	 7x7bgpOGr9yGwvtiUmptqLpfYGzfzBNu4om3xKaQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728283AbgJ2Aac (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 28 Oct 2020 20:30:32 -0400
Received: from mail.kernel.org ([198.145.29.99]:47378 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388104AbgJ1Wd0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Oct 2020 18:33:26 -0400
Received: from kozik-lap.proceq-device.com (unknown [194.230.155.184])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0C33720714;
        Wed, 28 Oct 2020 22:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603924405;
        bh=6ehR7YXqa9nliZWFk/43rNiUaT0bFg1g+JVzRLztlkA=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=qm22gpyJyyHjM1UNzH7josbbWk4pdz5i1qF7ub263Zn943/EQVAXjBBAvEAC/v2g4
         4X0vL95RSyHyEXP9ivvcdnZLzNNsYDwevmhYDymBwP4+nDjXjmnnM68Ipctiv9eAOL
         CoY3uQb8wzYGeLFmH33KdCbsNQ8aAOvtO/AwUzgA=
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
Subject: [RESEND PATCH 36/42] mfd: tps65910: use PLATFORM_DEVID_NONE
Date:   Wed, 28 Oct 2020 23:30:03 +0100
Message-Id: <20201028223009.369824-36-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201028223009.369824-1-krzk@kernel.org>
References: <20201028223009.369824-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use PLATFORM_DEVID_NONE define instead of "-1" value because:
 - it brings some meaning,
 - it might point attention why auto device ID was not used.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/mfd/tps65910.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
index 11959021b50a..d332072ee9de 100644
--- a/drivers/mfd/tps65910.c
+++ b/drivers/mfd/tps65910.c
@@ -502,7 +502,7 @@ static int tps65910_i2c_probe(struct i2c_client *i2c,
 		pm_power_off = tps65910_power_off;
 	}
 
-	ret = devm_mfd_add_devices(tps65910->dev, -1,
+	ret = devm_mfd_add_devices(tps65910->dev, PLATFORM_DEVID_NONE,
 				   tps65910s, ARRAY_SIZE(tps65910s),
 				   NULL, 0,
 				   regmap_irq_get_domain(tps65910->irq_data));
-- 
2.25.1

