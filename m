From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH] ARM: Samsung: Make uart_save static in pm.c file
Date: Thu,  2 Aug 2012 12:10:44 +0530
Message-ID: <1343889644-27266-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yw0-f46.google.com ([209.85.213.46]:36326 "EHLO
	mail-yw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751237Ab2HBGl7 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 2 Aug 2012 02:41:59 -0400
Received: by yhmm54 with SMTP id m54so8314175yhm.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 01 Aug 2012 23:41:59 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, patches@linaro.org

Fixes the following sparse warning:
arch/arm/plat-samsung/pm.c:77:21:
warning: symbol 'uart_save' was not declared. Should it be static?

Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/plat-samsung/pm.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/plat-samsung/pm.c b/arch/arm/plat-samsung/pm.c
index 64ab65f..1507028 100644
--- a/arch/arm/plat-samsung/pm.c
+++ b/arch/arm/plat-samsung/pm.c
@@ -74,7 +74,7 @@ unsigned char pm_uart_udivslot;
 
 #ifdef CONFIG_SAMSUNG_PM_DEBUG
 
-struct pm_uart_save uart_save[CONFIG_SERIAL_SAMSUNG_UARTS];
+static struct pm_uart_save uart_save[CONFIG_SERIAL_SAMSUNG_UARTS];
 
 static void s3c_pm_save_uart(unsigned int uart, struct pm_uart_save *save)
 {
-- 
1.7.4.1
