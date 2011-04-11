From: Vladimir Zapolskiy <vzapolskiy@gmail.com>
Subject: [PATCH] ARM: S5P: high resolution timer depends on PWM timer device
Date: Tue, 12 Apr 2011 01:40:58 +0300
Message-ID: <1302561658-16267-1-git-send-email-vzapolskiy@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:57678 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755910Ab1DKWlL (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 11 Apr 2011 18:41:11 -0400
Received: by ewy4 with SMTP id 4so1861602ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 11 Apr 2011 15:41:09 -0700 (PDT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Vladimir Zapolskiy <vzapolskiy@gmail.com>

Some Samsung S5P platforms have support for high resolution timer, and
this change fixes compilation problems for boards, which have forced
hr-timer, but PWM timer is not selected.

Fixes:
  arch/arm/plat-s5p/built-in.o: In function `s5p_set_timer_source':
  .../linux/arch/arm/plat-s5p/s5p-time.c:235:
  undefined reference to `s3c_device_timer'

Signed-off-by: Vladimir Zapolskiy <vzapolskiy@gmail.com>
---
 arch/arm/plat-s5p/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-s5p/Kconfig b/arch/arm/plat-s5p/Kconfig
index 554427d..a91970a 100644
--- a/arch/arm/plat-s5p/Kconfig
+++ b/arch/arm/plat-s5p/Kconfig
@@ -39,6 +39,7 @@ config S5P_GPIO_INT
 
 config S5P_HRT
 	bool
+	select SAMSUNG_DEV_PWM
 	help
 	  Use the High Resolution timer support
 
-- 
1.7.2.3
