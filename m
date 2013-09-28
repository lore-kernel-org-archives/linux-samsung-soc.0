From: Tomasz Figa <tomasz.figa@gmail.com>
Subject: [PATCH] ARM: s3c64xx: Select CPU_V6K instead of CPU_V6
Date: Sat, 28 Sep 2013 19:49:14 +0200
Message-ID: <1380390554-4400-1-git-send-email-tomasz.figa@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ea0-f182.google.com ([209.85.215.182]:42550 "EHLO
	mail-ea0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754561Ab3I1Rt3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 28 Sep 2013 13:49:29 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, Russell King <linux@arm.linux.org.uk>, Kukjin Kim <kgene.kim@samsung.com>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Tomasz Figa <tomasz.figa@gmail.com>

All S3C64XX SoCs come with ARM1176JZF-s core, which fully supports
ARMv6K extensions. This patch lets the kernel use them on S3C6410 by
adding selection of CPU_V6K to ARCH_S3C64XX.

Signed-off-by: Tomasz Figa <tomasz.figa@gmail.com>
---
 arch/arm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index b766dad..3a41bbb 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -728,7 +728,7 @@ config ARCH_S3C64XX
 	select CLKDEV_LOOKUP
 	select CLKSRC_SAMSUNG_PWM
 	select COMMON_CLK
-	select CPU_V6
+	select CPU_V6K
 	select GENERIC_CLOCKEVENTS
 	select GPIO_SAMSUNG
 	select HAVE_CLK
-- 
1.8.3.2
