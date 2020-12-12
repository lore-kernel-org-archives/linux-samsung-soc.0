Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F694C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 12 Dec 2020 12:30:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D0B7F207C5
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 12 Dec 2020 12:30:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393408AbgLLMaH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 12 Dec 2020 07:30:07 -0500
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:59066 "EHLO
        smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390468AbgLLMaH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 12 Dec 2020 07:30:07 -0500
Received: from localhost.localdomain ([93.22.36.60])
        by mwinf5d61 with ME
        id 3QUL2400B1HrHD103QULvm; Sat, 12 Dec 2020 13:28:22 +0100
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 12 Dec 2020 13:28:22 +0100
X-ME-IP: 93.22.36.60
From:   Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To:     krzk@kernel.org, b.zolnierkie@samsung.com, mturquette@baylibre.com,
        sboyd@kernel.org, yadi.brar@samsung.com, mturquette@linaro.org
Cc:     linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH] clk: s2mps11: Fix a resource leak in error handling paths in the probe function
Date:   Sat, 12 Dec 2020 13:28:18 +0100
Message-Id: <20201212122818.86195-1-christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Some resource should be released in the error handling path of the probe
function, as already done in the remove function.

The remove function was fixed in commit bf416bd45738 ("clk: s2mps11: Add
missing of_node_put and of_clk_del_provider")

Fixes: 7cc560dea415 ("clk: s2mps11: Add support for s2mps11")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/clk/clk-s2mps11.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
index aa21371f9104..a3e883a9f406 100644
--- a/drivers/clk/clk-s2mps11.c
+++ b/drivers/clk/clk-s2mps11.c
@@ -195,6 +195,7 @@ static int s2mps11_clk_probe(struct platform_device *pdev)
 	return ret;
 
 err_reg:
+	of_node_put(s2mps11_clks[0].clk_np);
 	while (--i >= 0)
 		clkdev_drop(s2mps11_clks[i].lookup);
 
-- 
2.27.0

