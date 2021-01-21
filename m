Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDFEBC433E0
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Jan 2021 16:00:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9001923A24
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Jan 2021 16:00:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731820AbhAUQAG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Jan 2021 11:00:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:53714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733067AbhAUP77 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Jan 2021 10:59:59 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A32123A22;
        Thu, 21 Jan 2021 15:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611244758;
        bh=QlLfJKgaN5Mq8D4mp0Z/dKqJoXd0apOrKkDP0Ii26mQ=;
        h=From:To:Cc:Subject:Date:From;
        b=TzfeMJkIU8A3+Nof4oN3TgRn/4xTeN5RoiZ8b8JAV5f++YBHZPsU92xgVpkv7kyXN
         KmjYTlCWKFkdAoFwNuKlmWrey1GSQBQ3Jgqvaj7solCt52UPsB1slBr88SLSML4PLr
         3SAJr+i3YqVImOK/Ipl9CqfdvcAVMfyU0dwINSq8Q1Ai+xvByhY5tVuILLS/TsMzUb
         ELJmjbtvH7m6yPTLjgnog7aZqvHdEAzLvYqD1h+fTZ48bdjWckzIckRM769cKqGVpw
         NNow83h7txOU8DHehSXJnCWXM1jmYN9nDmyYrGfCsPAYOVACCehYRHluWcC6oPlzFn
         2Po7z3B0wn6wQ==
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Pan Bian <bianpan2016@163.com>
Subject: [PATCH] regulator: s5m8767: Drop regulators OF node reference
Date:   Thu, 21 Jan 2021 16:59:14 +0100
Message-Id: <20210121155914.48034-1-krzk@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The device node reference obtained with of_get_child_by_name() should be
dropped on error paths.

Fixes: 26aec009f6b6 ("regulator: add device tree support for s5m8767")
Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/regulator/s5m8767.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
index 3fa472127e9a..fa10f1f550a4 100644
--- a/drivers/regulator/s5m8767.c
+++ b/drivers/regulator/s5m8767.c
@@ -544,14 +544,18 @@ static int s5m8767_pmic_dt_parse_pdata(struct platform_device *pdev,
 	rdata = devm_kcalloc(&pdev->dev,
 			     pdata->num_regulators, sizeof(*rdata),
 			     GFP_KERNEL);
-	if (!rdata)
+	if (!rdata) {
+		of_node_put(regulators_np);
 		return -ENOMEM;
+	}
 
 	rmode = devm_kcalloc(&pdev->dev,
 			     pdata->num_regulators, sizeof(*rmode),
 			     GFP_KERNEL);
-	if (!rmode)
+	if (!rmode) {
+		of_node_put(regulators_np);
 		return -ENOMEM;
+	}
 
 	pdata->regulators = rdata;
 	pdata->opmode = rmode;
-- 
2.25.1

