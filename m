Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD91EC4361A
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Dec 2020 22:54:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5986B22482
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  3 Dec 2020 22:54:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387474AbgLCWyC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 3 Dec 2020 17:54:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:59238 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727533AbgLCWyC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 3 Dec 2020 17:54:02 -0500
From:   Arnd Bergmann <arnd@kernel.org>
Authentication-Results: mail.kernel.org; dkim=permerror (bad message/signature format)
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Arnd Bergmann <arnd@arndb.de>, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] clk: samsung: mark PM functions as __maybe_unused
Date:   Thu,  3 Dec 2020 23:53:11 +0100
Message-Id: <20201203225315.1477137-1-arnd@kernel.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

drivers/clk/samsung/clk-exynos-clkout.c:219:12: error: 'exynos_clkout_resume' defined but not used [-Werror=unused-function]
  219 | static int exynos_clkout_resume(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~
drivers/clk/samsung/clk-exynos-clkout.c:210:12: error: 'exynos_clkout_suspend' defined but not used [-Werror=unused-function]
  210 | static int exynos_clkout_suspend(struct device *dev)
      |            ^~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clk/samsung/clk-exynos-clkout.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
index 9ec2f40cc400..e6d6cbf8c4e6 100644
--- a/drivers/clk/samsung/clk-exynos-clkout.c
+++ b/drivers/clk/samsung/clk-exynos-clkout.c
@@ -207,7 +207,7 @@ static int exynos_clkout_remove(struct platform_device *pdev)
 	return 0;
 }
 
-static int exynos_clkout_suspend(struct device *dev)
+static int __maybe_unused exynos_clkout_suspend(struct device *dev)
 {
 	struct exynos_clkout *clkout = dev_get_drvdata(dev);
 
@@ -216,7 +216,7 @@ static int exynos_clkout_suspend(struct device *dev)
 	return 0;
 }
 
-static int exynos_clkout_resume(struct device *dev)
+static int __maybe_unused exynos_clkout_resume(struct device *dev)
 {
 	struct exynos_clkout *clkout = dev_get_drvdata(dev);
 
-- 
2.27.0

