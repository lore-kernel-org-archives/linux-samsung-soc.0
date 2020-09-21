Return-Path: <SRS0=QYj3=C6=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DAC8C4363C
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Sep 2020 20:36:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 33EFB21BE5
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 21 Sep 2020 20:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600720570;
	bh=7tMA83fPkwwifbGWM/Mtryk22zhljlDOCxeJU+SjYs0=;
	h=From:To:Subject:Date:List-ID:From;
	b=R0iIgShvCVwHZ8t5BQlKQJqQJVP1QPZq7g0044j0uM5DJCE/ldgf/XYVieE1PFsuL
	 AiXoSORrmUArZ4QDkr3jSCL+Og/t7WoYcBT7+UvXu4+ttNbUaW5qSrzJ5S57oalZAX
	 lH4IhVzq3ZB7Ng4ot96Nqn+RiaAbt+PodtQBgrVo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726498AbgIUUgJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 21 Sep 2020 16:36:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:50358 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726451AbgIUUgJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 21 Sep 2020 16:36:09 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 026DD218AC;
        Mon, 21 Sep 2020 20:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600720569;
        bh=7tMA83fPkwwifbGWM/Mtryk22zhljlDOCxeJU+SjYs0=;
        h=From:To:Subject:Date:From;
        b=qmQsJu9lBQ5hfhCSRPtpmTxGQ0Y+6aRKFPRJbQo3w+6VG3RxKZmlhhuoLOl14XyxZ
         zrn6BvmMeBMcKrwJsiaw9RCe1urbu1HeZ+leybrW5s/n22peiMOPfEm0ycCj9GlXdZ
         hkk3KfebpPOoGQ4sSFcMSbrcvTNVh3RHoV8SWD6M=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Sangbeom Kim <sbkim73@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk: s2mps11: initialize driver via module_platform_driver
Date:   Mon, 21 Sep 2020 22:35:57 +0200
Message-Id: <20200921203558.19554-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The driver was using subsys_initcall() because in old times deferred
probe was not supported everywhere and specific ordering was needed.
Since probe deferral works fine and specific ordering is discouraged
(hides dependencies between drivers and couples their boot order), the
driver can be converted to regular module_platform_driver.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clk/clk-s2mps11.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/clk/clk-s2mps11.c b/drivers/clk/clk-s2mps11.c
index 2ce370c804aa..aa21371f9104 100644
--- a/drivers/clk/clk-s2mps11.c
+++ b/drivers/clk/clk-s2mps11.c
@@ -267,18 +267,7 @@ static struct platform_driver s2mps11_clk_driver = {
 	.remove = s2mps11_clk_remove,
 	.id_table = s2mps11_clk_id,
 };
-
-static int __init s2mps11_clk_init(void)
-{
-	return platform_driver_register(&s2mps11_clk_driver);
-}
-subsys_initcall(s2mps11_clk_init);
-
-static void __exit s2mps11_clk_cleanup(void)
-{
-	platform_driver_unregister(&s2mps11_clk_driver);
-}
-module_exit(s2mps11_clk_cleanup);
+module_platform_driver(s2mps11_clk_driver);
 
 MODULE_DESCRIPTION("S2MPS11 Clock Driver");
 MODULE_AUTHOR("Yadwinder Singh Brar <yadi.brar@samsung.com>");
-- 
2.17.1

