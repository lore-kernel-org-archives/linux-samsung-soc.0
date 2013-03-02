From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH 2/4] ARM: s3c24xx: Removed unneeded dependency on CPU_S3C2410
Date: Sat,  2 Mar 2013 13:22:52 +0400
Message-ID: <1362216174-10478-2-git-send-email-shc_work@mail.ru>
References: <1362216174-10478-1-git-send-email-shc_work@mail.ru>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from fallback1.mail.ru ([94.100.176.18]:50494 "EHLO
	fallback1.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751584Ab3CBJXl (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 2 Mar 2013 04:23:41 -0500
Received: from smtp45.i.mail.ru (smtp45.i.mail.ru [94.100.177.105])
	by fallback1.mail.ru (mPOP.Fallback_MX) with ESMTP id 1C7F7125FBDB
	for <linux-samsung-soc@vger.kernel.org>; Sat,  2 Mar 2013 13:23:40 +0400 (MSK)
In-Reply-To: <1362216174-10478-1-git-send-email-shc_work@mail.ru>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Alexander Shiyan <shc_work@mail.ru>

S3C2410 boards are already under "if CPU_S3C2410" condition, so
additional dependencies on this symbol can be removed.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 arch/arm/mach-s3c24xx/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-s3c24xx/Kconfig b/arch/arm/mach-s3c24xx/Kconfig
index 567d77b..dddb49b 100644
--- a/arch/arm/mach-s3c24xx/Kconfig
+++ b/arch/arm/mach-s3c24xx/Kconfig
@@ -229,7 +229,7 @@ if CPU_S3C2410
 
 config S3C2410_CPUFREQ
 	bool
-	depends on CPU_FREQ_S3C24XX && CPU_S3C2410
+	depends on CPU_FREQ_S3C24XX
 	select S3C2410_CPUFREQ_UTILS
 	help
 	  CPU Frequency scaling support for S3C2410
-- 
1.7.12.4
