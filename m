Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC327C433ED
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  8 Apr 2021 13:48:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B2569610E5
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  8 Apr 2021 13:48:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231371AbhDHNtH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 8 Apr 2021 09:49:07 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:16053 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229964AbhDHNtH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 8 Apr 2021 09:49:07 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FGMwt6pc2zNty5;
        Thu,  8 Apr 2021 21:46:06 +0800 (CST)
Received: from huawei.com (10.67.174.37) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.498.0; Thu, 8 Apr 2021
 21:48:51 +0800
From:   Chen Hui <clare.chenhui@huawei.com>
To:     <s.nawrocki@samsung.com>, <tomasz.figa@gmail.com>,
        <cw00.choi@samsung.com>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <krzysztof.kozlowski@canonical.com>
CC:     <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] clk: samsung: Remove redundant dev_err calls
Date:   Thu, 8 Apr 2021 21:48:56 +0800
Message-ID: <20210408134856.207305-1-clare.chenhui@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.37]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

There is error message within devm_ioremap_resource
already, so remove the dev_err calls to avoid redundant
error messages.

Signed-off-by: Chen Hui <clare.chenhui@huawei.com>
---
 drivers/clk/samsung/clk-exynos4412-isp.c | 4 +---
 drivers/clk/samsung/clk-s5pv210-audss.c  | 4 +---
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4412-isp.c b/drivers/clk/samsung/clk-exynos4412-isp.c
index 4b9e73608c21..b69e381b8c0c 100644
--- a/drivers/clk/samsung/clk-exynos4412-isp.c
+++ b/drivers/clk/samsung/clk-exynos4412-isp.c
@@ -115,10 +115,8 @@ static int __init exynos4x12_isp_clk_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	reg_base = devm_ioremap_resource(dev, res);
-	if (IS_ERR(reg_base)) {
-		dev_err(dev, "failed to map registers\n");
+	if (IS_ERR(reg_base))
 		return PTR_ERR(reg_base);
-	}
 
 	exynos4x12_save_isp = samsung_clk_alloc_reg_dump(exynos4x12_clk_isp_save,
 					ARRAY_SIZE(exynos4x12_clk_isp_save));
diff --git a/drivers/clk/samsung/clk-s5pv210-audss.c b/drivers/clk/samsung/clk-s5pv210-audss.c
index 14985ebd043b..a7827a120695 100644
--- a/drivers/clk/samsung/clk-s5pv210-audss.c
+++ b/drivers/clk/samsung/clk-s5pv210-audss.c
@@ -72,10 +72,8 @@ static int s5pv210_audss_clk_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	reg_base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(reg_base)) {
-		dev_err(&pdev->dev, "failed to map audss registers\n");
+	if (IS_ERR(reg_base))
 		return PTR_ERR(reg_base);
-	}
 
 	clk_data = devm_kzalloc(&pdev->dev,
 				struct_size(clk_data, hws, AUDSS_MAX_CLKS),
-- 
2.17.1

