From: Vikas Sajjan <vikas.sajjan@linaro.org>
Subject: [PATCH v4 4/5] ARM: dts: add FIMD AUXDATA node entry for exynos4 DT
Date: Fri, 15 Feb 2013 12:39:59 +0530
Message-ID: <1360912200-26377-5-git-send-email-vikas.sajjan@linaro.org>
References: <1360912200-26377-1-git-send-email-vikas.sajjan@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f41.google.com ([209.85.160.41]:47100 "EHLO
	mail-pb0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753165Ab3BOHK3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 15 Feb 2013 02:10:29 -0500
Received: by mail-pb0-f41.google.com with SMTP id um15so508206pbc.14
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Feb 2013 23:10:29 -0800 (PST)
In-Reply-To: <1360912200-26377-1-git-send-email-vikas.sajjan@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Adds the FIMD AUXDATA node

Signed-off-by: Vikas Sajjan <vikas.sajjan@linaro.org>
---
 arch/arm/mach-exynos/mach-exynos4-dt.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-exynos/mach-exynos4-dt.c b/arch/arm/mach-exynos/mach-exynos4-dt.c
index b68115a..779f151 100644
--- a/arch/arm/mach-exynos/mach-exynos4-dt.c
+++ b/arch/arm/mach-exynos/mach-exynos4-dt.c
@@ -84,6 +84,8 @@ static const struct of_dev_auxdata exynos4_auxdata_lookup[] __initconst = {
 	OF_DEV_AUXDATA("samsung,exynos4210-tmu", EXYNOS4_PA_TMU,
 				"exynos-tmu", NULL),
 	OF_DEV_AUXDATA("samsung,mfc-v5", 0x13400000, "s5p-mfc", NULL),
+	OF_DEV_AUXDATA("samsung,exynos4-fimd", EXYNOS4_PA_FIMD0,
+			"exynos4-fb.0", NULL),
 	{},
 };
 
-- 
1.7.9.5
