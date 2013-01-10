From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 1/1] ARM: S3C24XX: Make 'clk_msysclk' static
Date: Thu, 10 Jan 2013 15:49:51 +0530
Message-ID: <1357813191-1873-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f41.google.com ([209.85.160.41]:34772 "EHLO
	mail-pb0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752470Ab3AJK2I (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 10 Jan 2013 05:28:08 -0500
Received: by mail-pb0-f41.google.com with SMTP id xa7so222374pbc.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jan 2013 02:28:08 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Fixes the following warning:
arch/arm/mach-s3c24xx/common-s3c2443.c:135:19: warning:
symbol 'clk_msysclk' was not declared. Should it be static?

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/mach-s3c24xx/common-s3c2443.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/common-s3c2443.c b/arch/arm/mach-s3c24xx/common-s3c2443.c
index aeb4a24..f6b9f2e 100644
--- a/arch/arm/mach-s3c24xx/common-s3c2443.c
+++ b/arch/arm/mach-s3c24xx/common-s3c2443.c
@@ -132,7 +132,7 @@ static struct clk *clk_msysclk_sources[] = {
 	[3] = &clk_mpllref,
 };
 
-struct clksrc_clk clk_msysclk = {
+static struct clksrc_clk clk_msysclk = {
 	.clk	= {
 		.name		= "msysclk",
 		.parent		= &clk_xtal,
-- 
1.7.4.1
