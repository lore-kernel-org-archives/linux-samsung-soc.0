From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 4/4] ARM: SAMSUNG: Add __init attribute to xxx_set_platdata() wrappers
Date: Thu,  1 Mar 2012 14:47:26 +0530
Message-ID: <1330593446-663-5-git-send-email-tushar.behera@linaro.org>
References: <1330593446-663-1-git-send-email-tushar.behera@linaro.org>
Mime-Version: 1.0
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pw0-f46.google.com ([209.85.160.46]:49532 "EHLO
	mail-pw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964878Ab2CAJYR (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 1 Mar 2012 04:24:17 -0500
Received: by mail-pw0-f46.google.com with SMTP id up15so667120pbc.19
        for <linux-samsung-soc@vger.kernel.org>; Thu, 01 Mar 2012 01:24:16 -0800 (PST)
In-Reply-To: <1330593446-663-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: ben-linux@fluff.org, linux@arm.linux.org.uk, kgene.kim@samsung.com, kyungmin.park@samsung.com, patches@linaro.org

s3c_set_platdata() is defined with __init attribute, hence all functions
referencing this function should also be defined with __init attribute.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/plat-samsung/devs.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index 75ff3b0..b7d4cdc 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -782,7 +782,7 @@ struct platform_device s3c_device_cfcon = {
 	.resource	= s3c_cfcon_resource,
 };
 
-void s3c_ide_set_platdata(struct s3c_ide_platdata *pdata)
+void __init s3c_ide_set_platdata(struct s3c_ide_platdata *pdata)
 {
 	s3c_set_platdata(pdata, sizeof(struct s3c_ide_platdata),
 			 &s3c_device_cfcon);
@@ -1062,7 +1062,7 @@ struct platform_device s3c64xx_device_onenand1 = {
 	.resource	= s3c64xx_onenand1_resources,
 };
 
-void s3c64xx_onenand1_set_platdata(struct onenand_platform_data *pdata)
+void __init s3c64xx_onenand1_set_platdata(struct onenand_platform_data *pdata)
 {
 	s3c_set_platdata(pdata, sizeof(struct onenand_platform_data),
 			 &s3c64xx_device_onenand1);
-- 
1.7.4.1
