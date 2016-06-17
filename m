From: weiyj_lk@163.com
Subject: [PATCH -next] PM / devfreq: event: Fix return value check in exynos_nocp_parse_dt()
Date: Fri, 17 Jun 2016 18:10:03 +0000
Message-ID: <1466187003-19823-1-git-send-email-weiyj_lk@163.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from m12-13.163.com ([220.181.12.13]:40471 "EHLO m12-13.163.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751577AbcFQSKo (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Jun 2016 14:10:44 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Wei Yongjun <yongjun_wei@trendmicro.com.cn>, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org

From: Wei Yongjun <yongjun_wei@trendmicro.com.cn>

In case of error, the function platform_get_resource() returns NULL
pointer not ERR_PTR(). Remove unneeded error handling on the result
of a call to platform_get_resource() since the value is passed to
devm_ioremap_resource().

Signed-off-by: Wei Yongjun <yongjun_wei@trendmicro.com.cn>
---
 drivers/devfreq/event/exynos-nocp.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/devfreq/event/exynos-nocp.c b/drivers/devfreq/event/exynos-nocp.c
index 6b6a5f3..a584140 100644
--- a/drivers/devfreq/event/exynos-nocp.c
+++ b/drivers/devfreq/event/exynos-nocp.c
@@ -220,9 +220,6 @@ static int exynos_nocp_parse_dt(struct platform_device *pdev,
 
 	/* Maps the memory mapped IO to control nocp register */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (IS_ERR(res))
-		return PTR_ERR(res);
-
 	base = devm_ioremap_resource(dev, res);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
