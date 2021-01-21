Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4BECC433DB
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Jan 2021 04:22:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F84B2368A
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Jan 2021 04:22:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726698AbhAUETY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 20 Jan 2021 23:19:24 -0500
Received: from m12-18.163.com ([220.181.12.18]:46690 "EHLO m12-18.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1732189AbhAUESa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Jan 2021 23:18:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
        s=s110527; h=From:Subject:Date:Message-Id; bh=H0ITWsAArzEYQHMrXc
        KwLk2Ks43hWyzT0tDFW2uD9Iw=; b=mZoI9pj7hc3KtwbA/YkixgX6rpOHxfClGI
        8cndTXHR8gpW7N7kiBmRT6rUNvsARDxdxqPV7uGKi8IWbdRGIGGpi68x5eg28yXF
        fgnsrr8m7Phuce5ZkF9Zowt/x+Oc8PvW1/0+jwlHyM9bCAPVVVzPJkywziBSFlkR
        S3Hmfqgcc=
Received: from localhost.localdomain (unknown [119.3.119.20])
        by smtp14 (Coremail) with SMTP id EsCowADH3_7B9AhgWP_jQA--.17273S4;
        Thu, 21 Jan 2021 11:28:06 +0800 (CST)
From:   Pan Bian <bianpan2016@163.com>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Pan Bian <bianpan2016@163.com>
Subject: [PATCH] regulator: s5m8767: Fix reference count leak
Date:   Wed, 20 Jan 2021 19:27:56 -0800
Message-Id: <20210121032756.49501-1-bianpan2016@163.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: EsCowADH3_7B9AhgWP_jQA--.17273S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrur48uF4UWw47ZF15Zr4ruFg_yoWkurg_Ww
        1xAFW7Zw4DCFWj9rsrXFnxtFyYya17X3ZrKa18tFW3Gr9rZr15tw17XFW3Zanrur4ayr9r
        ur4UZFWxCw43XjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0XtxDUUUUU==
X-Originating-IP: [119.3.119.20]
X-CM-SenderInfo: held01tdqsiiqw6rljoofrz/xtbBzwYhclaD9y99cQAAsb
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Call of_node_put() to drop references of regulators_np and reg_np before
returning error code.

Fixes: 9ae5cc75ceaa ("regulator: s5m8767: Pass descriptor instead of GPIO number")
Signed-off-by: Pan Bian <bianpan2016@163.com>
---
 drivers/regulator/s5m8767.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
index 3fa472127e9a..48dd95b3ff45 100644
--- a/drivers/regulator/s5m8767.c
+++ b/drivers/regulator/s5m8767.c
@@ -573,10 +573,13 @@ static int s5m8767_pmic_dt_parse_pdata(struct platform_device *pdev,
 			"s5m8767,pmic-ext-control",
 			GPIOD_OUT_HIGH | GPIOD_FLAGS_BIT_NONEXCLUSIVE,
 			"s5m8767");
-		if (PTR_ERR(rdata->ext_control_gpiod) == -ENOENT)
+		if (PTR_ERR(rdata->ext_control_gpiod) == -ENOENT) {
 			rdata->ext_control_gpiod = NULL;
-		else if (IS_ERR(rdata->ext_control_gpiod))
+		} else if (IS_ERR(rdata->ext_control_gpiod)) {
+			of_node_put(reg_np);
+			of_node_put(regulators_np);
 			return PTR_ERR(rdata->ext_control_gpiod);
+		}
 
 		rdata->id = i;
 		rdata->initdata = of_get_regulator_init_data(
-- 
2.17.1


