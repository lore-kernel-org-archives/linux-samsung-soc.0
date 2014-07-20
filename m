From: weiyj_lk@163.com
Subject: [PATCH -next] clk: samsung: Remove redundant dev_err call in s5pv210_audss_clk_probe()
Date: Sun, 20 Jul 2014 20:30:55 +0800
Message-ID: <1405859455-30518-1-git-send-email-weiyj_lk@163.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from m12-18.163.com ([220.181.12.18]:42464 "EHLO m12-18.163.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752434AbaGTMbp (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 20 Jul 2014 08:31:45 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>, Mike Turquette <mturquette@linaro.org>, Grant Likely <grant.likely@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: Wei Yongjun <yongjun_wei@trendmicro.com.cn>, linux-samsung-soc@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/clk/samsung/clk-s5pv210-audss.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-s5pv210-audss.c b/drivers/clk/samsung/clk-s5pv210-audss.c
index a8053b4..ea1038b 100644
--- a/drivers/clk/samsung/clk-s5pv210-audss.c
+++ b/drivers/clk/samsung/clk-s5pv210-audss.c
@@ -75,10 +75,8 @@ static int s5pv210_audss_clk_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	reg_base = devm_ioremap_resource(&pdev->dev, res);
-	if (IS_ERR(reg_base)) {
-		dev_err(&pdev->dev, "failed to map audss registers\n");
+	if (IS_ERR(reg_base))
 		return PTR_ERR(reg_base);
-	}
 
 	clk_table = devm_kzalloc(&pdev->dev,
 				sizeof(struct clk *) * AUDSS_MAX_CLKS,
