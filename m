Return-Path: <SRS0=QYj3=C6=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A147CC4363C
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Sep 2020 20:51:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6596E238A0
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Sep 2020 20:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600721500;
	bh=r6W/NCKCrSOS8pg+sBm0gaxcT+K5fqsZ/LKE3XOavyQ=;
	h=From:To:Subject:Date:In-Reply-To:References:List-ID:From;
	b=HkI4g7DX9fY16270ZqFcz5+sJ5mFAR/svjq5g5zyTHp4cN6WdkL+pU5953QGEG/gF
	 rRSVBFGYUVKFwgtwl49FiFaEPEsF1beobDO7VaLx8WR1GrS6YXpH9xdF8Xcl5+/P5K
	 bzgsHyp3xQIMQh2lNtWbCLMnGEHhqRzV1T48KYxw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728082AbgIUUvk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 21 Sep 2020 16:51:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:57388 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727302AbgIUUvj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 21 Sep 2020 16:51:39 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8FB5A2389E;
        Mon, 21 Sep 2020 20:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600721499;
        bh=r6W/NCKCrSOS8pg+sBm0gaxcT+K5fqsZ/LKE3XOavyQ=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=irKdLI/ptWRCC4g1ksZf3X84XgcgFS9fJJ/M/jkx1FmkhNC/KRbyudqwntNIsQ6aL
         YwgID0wJpVHQcnaB5SZ0FM6IKhe9U85vZ/dEd1SO1oc2EyqzsOa7Akf0fdoJO2ezmo
         TxSVBnNYn6BeRNvgBrWwpiLUf75suZKTqF66MapY=
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
Subject: [PATCH 12/42] mfd: kempld: use PLATFORM_DEVID_NONE
Date:   Mon, 21 Sep 2020 22:49:46 +0200
Message-Id: <20200921205016.20461-12-krzk@kernel.org>
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
 drivers/mfd/kempld-core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mfd/kempld-core.c b/drivers/mfd/kempld-core.c
index 52bec01149e5..71d484f31f04 100644
--- a/drivers/mfd/kempld-core.c
+++ b/drivers/mfd/kempld-core.c
@@ -105,7 +105,8 @@ static int kempld_register_cells_generic(struct kempld_device_data *pld)
 	if (pld->feature_mask & KEMPLD_FEATURE_MASK_UART)
 		devs[i++].name = kempld_dev_names[KEMPLD_UART];
 
-	return mfd_add_devices(pld->dev, -1, devs, i, NULL, 0, NULL);
+	return mfd_add_devices(pld->dev, PLATFORM_DEVID_NONE, devs, i, NULL, 0,
+			       NULL);
 }
 
 static struct resource kempld_ioresource = {
-- 
2.17.1

