From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 4/9] ARM: s3c24xx: use SAMSUNG_WAKEMASK for s3c2416
Date: Thu, 12 Feb 2015 20:35:41 +0100
Message-ID: <1423769746-582629-5-git-send-email-arnd@arndb.de>
References: <1423769746-582629-1-git-send-email-arnd@arndb.de>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.187]:60568 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752013AbbBLTgN (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 12 Feb 2015 14:36:13 -0500
In-Reply-To: <1423769746-582629-1-git-send-email-arnd@arndb.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>, arm@kernel.org, Arnd Bergmann <arnd@arndb.de>

Both s3c2412 and s3c2416 use the s3c2412_pm_prepare code, which
depends on the common wakemask code, but only s3c2412 currently
selects the code, leading to a build error for an s3c2416-only
kernel.

arch/arm/mach-s3c24xx/built-in.o: In function `s3c2412_pm_prepare':
:(.text+0x240): undefined reference to `samsung_sync_wakemask'
arch/arm/mach-s3c24xx/built-in.o:(.data+0xeb0): undefined reference to `s3c2412_subsys'

This adds the missing select.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-s3c24xx/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-s3c24xx/Kconfig b/arch/arm/mach-s3c24xx/Kconfig
index 79c49ff77f6e..389173690716 100644
--- a/arch/arm/mach-s3c24xx/Kconfig
+++ b/arch/arm/mach-s3c24xx/Kconfig
@@ -362,6 +362,7 @@ if CPU_S3C2416
 config S3C2416_PM
 	bool
 	select S3C2412_PM_SLEEP
+	select SAMSUNG_WAKEMASK
 	help
 	  Internal config node to apply S3C2416 power management
 
-- 
2.1.0.rc2
