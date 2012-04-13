From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH] ARM: EXYNOS: Increase framebuffer virtual size for origen
Date: Fri, 13 Apr 2012 16:29:31 +0530
Message-ID: <1334314771-10928-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:53603 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S935210Ab2DMLIH (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 13 Apr 2012 07:08:07 -0400
Received: by pbcun15 with SMTP id un15so3511332pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 13 Apr 2012 04:08:07 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, patches@linaro.org

To support display panning, framebuffer virtual size needs to be increased.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/mach-exynos/mach-origen.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-exynos/mach-origen.c b/arch/arm/mach-exynos/mach-origen.c
index 878d4c9..4d80212 100644
--- a/arch/arm/mach-exynos/mach-origen.c
+++ b/arch/arm/mach-exynos/mach-origen.c
@@ -596,6 +596,8 @@ static struct s3c_fb_pd_win origen_fb_win0 = {
 	},
 	.max_bpp		= 32,
 	.default_bpp		= 24,
+	.virtual_x		= 1024,
+	.virtual_y		= 2 * 600,
 };
 
 static struct s3c_fb_platdata origen_lcd_pdata __initdata = {
-- 
1.7.4.1
