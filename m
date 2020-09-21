Return-Path: <SRS0=QYj3=C6=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5315EC4363C
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Sep 2020 20:51:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1870723730
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Sep 2020 20:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600721475;
	bh=zb0fiXx4q88oQ4QlGImpEgmvV2wcIYbMZneDGVsL9nE=;
	h=From:To:Subject:Date:In-Reply-To:References:List-ID:From;
	b=rIrmiss/3z+7lRIQK2VyAPSPUkgWtjiQKJwZv6v4xYAfHx7eSxlNbhSQzHX4tj2DA
	 XjXmtEoGrN+SPTdwpEv9Mhk1xDTbnNtthKYKTzF1z4i+HJMt9zOe+z5lIxVPx4t82+
	 JWUjqGbDX8+SjsmqNWpNiOM66no2rOHzZDmd3ZN8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728293AbgIUUvO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 21 Sep 2020 16:51:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:56900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727062AbgIUUvO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 21 Sep 2020 16:51:14 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 15C1521D7A;
        Mon, 21 Sep 2020 20:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600721473;
        bh=zb0fiXx4q88oQ4QlGImpEgmvV2wcIYbMZneDGVsL9nE=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=WeH4xWqDUbnrmfayiyVfy6f47B8JMK1omBHCn2XogiSRitB4Xm9ydtzd4levj5bHi
         oig/AEYU6grBcr84LjXQa+37OlcaHMtU2ws4Vr/JovJ59BNlk5NykLJRpt0YkQS5kR
         DaXApGlPh93oocq91VJtARDT5tb0QmzY76Xkl4xM=
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
Subject: [PATCH 08/42] mfd: da9055: use PLATFORM_DEVID_NONE
Date:   Mon, 21 Sep 2020 22:49:42 +0200
Message-Id: <20200921205016.20461-8-krzk@kernel.org>
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
 drivers/mfd/da9055-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/da9055-core.c b/drivers/mfd/da9055-core.c
index 6d0af8486269..ff8fe165b937 100644
--- a/drivers/mfd/da9055-core.c
+++ b/drivers/mfd/da9055-core.c
@@ -400,7 +400,7 @@ int da9055_device_init(struct da9055 *da9055)
 
 	da9055->irq_base = regmap_irq_chip_get_base(da9055->irq_data);
 
-	ret = mfd_add_devices(da9055->dev, -1,
+	ret = mfd_add_devices(da9055->dev, PLATFORM_DEVID_NONE,
 			      da9055_devs, ARRAY_SIZE(da9055_devs),
 			      NULL, da9055->irq_base, NULL);
 	if (ret)
-- 
2.17.1

