From: Alexander Shiyan <shc_work@mail.ru>
Subject: [PATCH 3/4] ARM: s3c24xx: Removed unneeded dependency on CPU_S3C2412
Date: Sat,  2 Mar 2013 13:22:53 +0400
Message-ID: <1362216174-10478-3-git-send-email-shc_work@mail.ru>
References: <1362216174-10478-1-git-send-email-shc_work@mail.ru>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from fallback8.mail.ru ([94.100.176.136]:36829 "EHLO
	fallback8.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751584Ab3CBJYB (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 2 Mar 2013 04:24:01 -0500
Received: from smtp45.i.mail.ru (smtp45.i.mail.ru [94.100.177.105])
	by fallback8.mail.ru (mPOP.Fallback_MX) with ESMTP id AB5231D017E4
	for <linux-samsung-soc@vger.kernel.org>; Sat,  2 Mar 2013 13:23:38 +0400 (MSK)
In-Reply-To: <1362216174-10478-1-git-send-email-shc_work@mail.ru>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org, Ben Dooks <ben-linux@fluff.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Alexander Shiyan <shc_work@mail.ru>

S3C2412 boards are already under "if CPU_S3C2412" condition, so
additional dependencies on this symbol can be removed.

Signed-off-by: Alexander Shiyan <shc_work@mail.ru>
---
 arch/arm/mach-s3c24xx/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-s3c24xx/Kconfig b/arch/arm/mach-s3c24xx/Kconfig
index dddb49b..e6f7d7c 100644
--- a/arch/arm/mach-s3c24xx/Kconfig
+++ b/arch/arm/mach-s3c24xx/Kconfig
@@ -377,12 +377,12 @@ if CPU_S3C2412
 config CPU_S3C2412_ONLY
 	bool
 	depends on !CPU_S3C2410 && !CPU_S3C2416 && !CPU_S3C2440 && \
-		   !CPU_S3C2442 && !CPU_S3C2443 && CPU_S3C2412
+		   !CPU_S3C2442 && !CPU_S3C2443
 	default y
 
 config S3C2412_CPUFREQ
 	bool
-	depends on CPU_FREQ_S3C24XX && CPU_S3C2412
+	depends on CPU_FREQ_S3C24XX
 	default y
 	select S3C2412_IOTIMING
 	help
-- 
1.7.12.4
