From: Wei Yongjun <weiyj.lk@gmail.com>
Subject: [PATCH -next] clk: exynos-audss: remove redundant dev_err call in exynos_audss_clk_probe()
Date: Tue, 14 Jan 2014 10:05:42 +0800
Message-ID: <CAPgLHd9A8QjVk8ThLbP8vv8wMmJ-DovvR+=uadTXWyTFJok_JQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bk0-f54.google.com ([209.85.214.54]:65007 "EHLO
	mail-bk0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751172AbaANCFn (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 13 Jan 2014 21:05:43 -0500
Received: by mail-bk0-f54.google.com with SMTP id u14so40082bkz.41
        for <linux-samsung-soc@vger.kernel.org>; Mon, 13 Jan 2014 18:05:42 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: t.figa@samsung.com, mturquette@linaro.org, kgene.kim@samsung.com, grant.likely@linaro.org, robh+dt@kernel.org
Cc: yongjun_wei@trendmicro.com.cn, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/clk/samsung/clk-exynos-audss.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos-audss.c b/drivers/clk/samsung/clk-exynos-audss.c
index 884187f..01ef381 100644
--- a/drivers/clk/samsung/clk-exynos-audss.c
+++ b/drivers/clk/samsung/clk-exynos-audss.c
@@ -94,10 +94,8 @@ static int exynos_audss_clk_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	reg_base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(reg_base)) {
-		dev_err(&pdev->dev, "failed to map audss registers\n");
+	if (IS_ERR(reg_base))
 		return PTR_ERR(reg_base);
-	}
 
 	clk_table = devm_kzalloc(&pdev->dev,
 				sizeof(struct clk *) * EXYNOS_AUDSS_MAX_CLKS,
