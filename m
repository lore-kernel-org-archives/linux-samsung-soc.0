Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 241C2C07548
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 15 Nov 2023 08:58:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234684AbjKOI6j (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 15 Nov 2023 03:58:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234651AbjKOI6j (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 15 Nov 2023 03:58:39 -0500
Received: from mail.nfschina.com (unknown [42.101.60.195])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id C9E1F114;
        Wed, 15 Nov 2023 00:58:34 -0800 (PST)
Received: from localhost.localdomain (unknown [180.167.10.98])
        by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id B57E860230185;
        Wed, 15 Nov 2023 16:58:22 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From:   Su Hui <suhui@nfschina.com>
To:     s.nawrocki@samsung.com, mchehab@kernel.org,
        krzysztof.kozlowski@linaro.org, alim.akhtar@samsung.com,
        nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com
Cc:     Su Hui <suhui@nfschina.com>, linux-media@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, kernel-janitors@vger.kernel.org
Subject: [PATCH] media: platform: exynos4-is: return callee's error code rather than -ENXIO
Date:   Wed, 15 Nov 2023 16:57:54 +0800
Message-Id: <20231115085753.1027348-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Clang static analyzer complains that value stored to 'ret' is never read.
Return the callee's error code to fix this.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/media/platform/samsung/exynos4-is/fimc-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-core.c b/drivers/media/platform/samsung/exynos4-is/fimc-core.c
index 97908778e1c8..0be687b01ce5 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-core.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-core.c
@@ -814,7 +814,7 @@ static int fimc_clk_get(struct fimc_dev *fimc)
 	fimc_clk_put(fimc);
 	dev_err(&fimc->pdev->dev, "failed to get clock: %s\n",
 		fimc_clocks[i]);
-	return -ENXIO;
+	return ret;
 }
 
 #ifdef CONFIG_PM
-- 
2.30.2

