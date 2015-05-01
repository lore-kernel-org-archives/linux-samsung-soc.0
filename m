From: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
Subject: [PATCH 2/2] clk: s3c2410: Constify platform_device_id
Date: Sat,  2 May 2015 01:02:48 +0900
Message-ID: <1430496168-32408-2-git-send-email-k.kozlowski.k@gmail.com>
References: <1430496168-32408-1-git-send-email-k.kozlowski.k@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pd0-f172.google.com ([209.85.192.172]:32912 "EHLO
	mail-pd0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030266AbbEAQDF (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 1 May 2015 12:03:05 -0400
In-Reply-To: <1430496168-32408-1-git-send-email-k.kozlowski.k@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Tomasz Figa <tomasz.figa@gmail.com>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>

The platform_device_id is not modified by the driver and core uses it as
const.

Signed-off-by: Krzysztof Kozlowski <k.kozlowski.k@gmail.com>
---
 drivers/clk/samsung/clk-s3c2410-dclk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-s3c2410-dclk.c b/drivers/clk/samsung/clk-s3c2410-dclk.c
index db6fddb211d4..e56df5064889 100644
--- a/drivers/clk/samsung/clk-s3c2410-dclk.c
+++ b/drivers/clk/samsung/clk-s3c2410-dclk.c
@@ -404,7 +404,7 @@ static struct s3c24xx_dclk_drv_data dclk_variants[] = {
 	},
 };
 
-static struct platform_device_id s3c24xx_dclk_driver_ids[] = {
+static const struct platform_device_id s3c24xx_dclk_driver_ids[] = {
 	{
 		.name		= "s3c2410-dclk",
 		.driver_data	= (kernel_ulong_t)&dclk_variants[S3C2410],
-- 
2.1.4
