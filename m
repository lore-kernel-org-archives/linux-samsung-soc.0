From: Tushar Behera <tushar.behera@linaro.org>
Subject: [RFC] ARM: SAMSUNG: devs: Use common macro to define resources
Date: Tue, 24 Apr 2012 14:33:26 +0530
Message-ID: <1335258206-5937-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:33118 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756479Ab2DXJMb (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 24 Apr 2012 05:12:31 -0400
Received: by pbbro12 with SMTP id ro12so704567pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 24 Apr 2012 02:12:30 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: kgene.kim@samsung.com, linux@arm.linux.org.uk

CC: Kukjin Kim <kgene.kim@samsung.com>
Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
I am not sure whether changes like this are accepted as independent patches,
as they are not changing the behaviour of the code at all.

I have a patchset doing similar clean up in various Samsung related arch files.
If changes like this are acceptable, I will post the complete patchset.

 arch/arm/plat-samsung/devs.c |   12 ++----------
 1 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index db32ec5..1013a34 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -272,16 +272,8 @@ struct platform_device s5p_device_fimc3 = {
 
 #ifdef CONFIG_S5P_DEV_G2D
 static struct resource s5p_g2d_resource[] = {
-	[0] = {
-		.start	= S5P_PA_G2D,
-		.end	= S5P_PA_G2D + SZ_4K - 1,
-		.flags	= IORESOURCE_MEM,
-	},
-	[1] = {
-		.start	= IRQ_2D,
-		.end	= IRQ_2D,
-		.flags	= IORESOURCE_IRQ,
-	},
+	[0] = DEFINE_RES_MEM(S5P_PA_G2D, SZ_4K),
+	[1] = DEFINE_RES_IRQ(IRQ_2D),
 };
 
 struct platform_device s5p_device_g2d = {
-- 
1.7.4.1
