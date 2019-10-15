Return-Path: <SRS0=ZUuD=YI=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DA56ECE588
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 15 Oct 2019 14:25:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1F58A2064A
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 15 Oct 2019 14:25:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732261AbfJOOZJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 15 Oct 2019 10:25:09 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:44084 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1732050AbfJOOZJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 15 Oct 2019 10:25:09 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 8F4A91629CC662650C3C;
        Tue, 15 Oct 2019 22:25:07 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Tue, 15 Oct 2019
 22:24:56 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <kgene@kernel.org>, <krzk@kernel.org>, <s.nawrocki@samsung.com>,
        <tomasz.figa@gmail.com>, <cw00.choi@samsung.com>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-samsung-soc@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] clk: s3c2410: use devm_platform_ioremap_resource() to simplify code
Date:   Tue, 15 Oct 2019 22:24:24 +0800
Message-ID: <20191015142424.25944-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/clk/samsung/clk-s3c2410-dclk.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-s3c2410-dclk.c b/drivers/clk/samsung/clk-s3c2410-dclk.c
index 1281672..7dad909 100644
--- a/drivers/clk/samsung/clk-s3c2410-dclk.c
+++ b/drivers/clk/samsung/clk-s3c2410-dclk.c
@@ -238,7 +238,6 @@ static SIMPLE_DEV_PM_OPS(s3c24xx_dclk_pm_ops,
 static int s3c24xx_dclk_probe(struct platform_device *pdev)
 {
 	struct s3c24xx_dclk *s3c24xx_dclk;
-	struct resource *mem;
 	struct s3c24xx_dclk_drv_data *dclk_variant;
 	struct clk_hw **clk_table;
 	int ret, i;
@@ -257,8 +256,7 @@ static int s3c24xx_dclk_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, s3c24xx_dclk);
 	spin_lock_init(&s3c24xx_dclk->dclk_lock);
 
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	s3c24xx_dclk->base = devm_ioremap_resource(&pdev->dev, mem);
+	s3c24xx_dclk->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(s3c24xx_dclk->base))
 		return PTR_ERR(s3c24xx_dclk->base);
 
-- 
2.7.4


