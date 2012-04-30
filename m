From: "HeungJun, Kim" <riverful.kim@samsung.com>
Subject: ARM: Exynos4: Fix the I2C.0 platform device's ID to 0 in the devs.c
Date: Mon, 30 Apr 2012 20:24:56 +0900
Message-ID: <1335785096-5430-1-git-send-email-riverful.kim@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:48484 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751696Ab2D3LYx (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 30 Apr 2012 07:24:53 -0400
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0M3A007LMIDGNHD0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 30 Apr 2012 20:24:52 +0900 (KST)
Received: from riverful-ubuntu.165.213.246.161 ([165.213.219.119])
 by mmp2.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTPA id <0M3A008FZIDGS300@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Mon, 30 Apr 2012 20:24:52 +0900 (KST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, "HeungJun, Kim" <riverful.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>

From: "HeungJun, Kim" <riverful.kim@samsung.com>

The #ifdef of CONFIG_S3C_DEV_I2C1 in devs.c, occurs to fail to get I2C0 adapter.
So, this patch removes #ifdef, and fixes 0 when I2C0 devices.

Signed-off-by: HeungJun, Kim <riverful.kim@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-samsung/devs.c |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index db32ec5..964a866 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -491,11 +491,7 @@ static struct resource s3c_i2c0_resource[] = {
 
 struct platform_device s3c_device_i2c0 = {
 	.name		= "s3c2410-i2c",
-#ifdef CONFIG_S3C_DEV_I2C1
 	.id		= 0,
-#else
-	.id		= -1,
-#endif
 	.num_resources	= ARRAY_SIZE(s3c_i2c0_resource),
 	.resource	= s3c_i2c0_resource,
 };
-- 
1.7.5.4
