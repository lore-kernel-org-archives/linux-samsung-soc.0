Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB2C1C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 11 Nov 2022 08:40:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230043AbiKKIkw (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 11 Nov 2022 03:40:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232671AbiKKIkv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 11 Nov 2022 03:40:51 -0500
Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DB2A6F378
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Nov 2022 00:40:50 -0800 (PST)
Received: from mxde.zte.com.cn (unknown [10.35.20.165])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mxct.zte.com.cn (FangMail) with ESMTPS id 4N7sc05hS2z1DyP
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Nov 2022 16:40:48 +0800 (CST)
Received: from mxus.zte.com.cn (unknown [10.207.168.7])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mxde.zte.com.cn (FangMail) with ESMTPS id 4N7sbd5r1Gz5TCGC
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Nov 2022 16:40:29 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.137])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mxus.zte.com.cn (FangMail) with ESMTPS id 4N7sbZ72gFz9tyD6
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Nov 2022 16:40:26 +0800 (CST)
Received: from mxct.zte.com.cn (unknown [192.168.251.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mxhk.zte.com.cn (FangMail) with ESMTPS id 4N7sbW6Bb8z8QrkZ
        for <linux-samsung-soc@vger.kernel.org>; Fri, 11 Nov 2022 16:40:23 +0800 (CST)
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mxct.zte.com.cn (FangMail) with ESMTPS id 4N7sbS4xF3z501N7;
        Fri, 11 Nov 2022 16:40:20 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.40.50])
        by mse-fl2.zte.com.cn with SMTP id 2AB8e7dP010444;
        Fri, 11 Nov 2022 16:40:07 +0800 (+08)
        (envelope-from ye.xingchen@zte.com.cn)
Received: from mapi (xaxapp02[null])
        by mapi (Zmail) with MAPI id mid31;
        Fri, 11 Nov 2022 16:40:08 +0800 (CST)
Date:   Fri, 11 Nov 2022 16:40:08 +0800 (CST)
X-Zmail-TransId: 2afa636e0a68ffffffffa01e2181
X-Mailer: Zmail v1.0
Message-ID: <202211111640089246472@zte.com.cn>
Mime-Version: 1.0
From:   <ye.xingchen@zte.com.cn>
To:     <lee@kernel.org>
Cc:     <krzysztof.kozlowski@linaro.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <chi.minghao@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSBtZmQ6IGV4eW5vcy1scGFzczogdXNlCgogZGV2bV9wbGF0Zm9ybV9nZXRfYW5kX2lvcmVtYXBfcmVzb3VyY2UoKQ==?=
Content-Type: text/plain;
        charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 2AB8e7dP010444
X-Fangmail-Gw-Spam-Type: 0
X-FangMail-Miltered: at cgslv5.04-192.168.251.14.novalocal with ID 636E0A8F.001 by FangMail milter!
X-FangMail-Envelope: 1668156048/4N7sc05hS2z1DyP/636E0A8F.001/10.35.20.165/[10.35.20.165]/mxde.zte.com.cn/<ye.xingchen@zte.com.cn>
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 636E0A8F.001/4N7sc05hS2z1DyP
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Minghao Chi <chi.minghao@zte.com.cn>

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/mfd/exynos-lpass.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mfd/exynos-lpass.c b/drivers/mfd/exynos-lpass.c
index 166cd21088cd..ac99e742a355 100644
--- a/drivers/mfd/exynos-lpass.c
+++ b/drivers/mfd/exynos-lpass.c
@@ -109,14 +109,12 @@ static int exynos_lpass_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct exynos_lpass *lpass;
 	void __iomem *base_top;
-	struct resource *res;

 	lpass = devm_kzalloc(dev, sizeof(*lpass), GFP_KERNEL);
 	if (!lpass)
 		return -ENOMEM;

-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base_top = devm_ioremap_resource(dev, res);
+	base_top = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);
 	if (IS_ERR(base_top))
 		return PTR_ERR(base_top);

-- 
2.25.1
