From: Sangwook Lee <sangwook.lee@linaro.org>
Subject: [PATCH] ARM:EXYNOS4:Fix Samsung Power Domain
Date: Wed, 27 Jul 2011 13:25:03 +0100
Message-ID: <1311769503-4232-1-git-send-email-sangwook.lee@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:60916 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750937Ab1G0M1K (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 27 Jul 2011 08:27:10 -0400
Received: by wwe5 with SMTP id 5so1355307wwe.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 27 Jul 2011 05:27:09 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: kgene.kim@samsung.com, linux-samsung-soc@vger.kernel.org
Cc: Sangwook Lee <sangwook.lee@linaro.org>

Func:samsung_pd_init should be postponed utill end of drivers
registeration because this activates runtime_suspend in advance.

For example,
If PD's runtime_suspend is called, it will power down LCD0_CONF0.
Since this happens before s3cfb driver registers itself,
it makes s3cfb_probe hang up with both Origen and SMDK

Signed-off-by: Sangwook Lee <sangwook.lee@linaro.org>
---
 arch/arm/plat-samsung/pd.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-samsung/pd.c b/arch/arm/plat-samsung/pd.c
index efe1d56..5ffc737 100644
--- a/arch/arm/plat-samsung/pd.c
+++ b/arch/arm/plat-samsung/pd.c
@@ -92,4 +92,4 @@ static int __init samsung_pd_init(void)
 
 	return ret;
 }
-arch_initcall(samsung_pd_init);
+late_initcall_sync(samsung_pd_init);
-- 
1.7.4.1
