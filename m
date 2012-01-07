From: Kukjin Kim <kgene.kim@samsung.com>
Subject: [PATCH] ARM: S3C24XX: Fix build error for missing <mach/system-reset.h>
Date: Sat, 07 Jan 2012 20:47:47 +0900
Message-ID: <010101cccd32$2cf0cfe0$86d26fa0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:39213 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751327Ab2AGLru (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 7 Jan 2012 06:47:50 -0500
Received: from epcpsbgm2.samsung.com (mailout1.samsung.com [203.254.224.24])
 by mailout1.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LXF00BFLFFP85C0@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Sat, 07 Jan 2012 20:47:49 +0900 (KST)
Received: from DOKGENEKIM03 ([12.23.120.114])
 by mmp1.samsung.com (Oracle Communications Messaging Exchange Server 7u4-19.01
 64bit (built Sep  7 2010)) with ESMTPA id <0LXF00CHLFFN0600@mmp1.samsung.com>
 for linux-samsung-soc@vger.kernel.org; Sat, 07 Jan 2012 20:47:49 +0900 (KST)
Content-language: ko
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: rmk+kernel@arm.linux.org.uk, 'Kukjin Kim' <kgene.kim@samsung.com>

Since the arch/arm/mach-s3c2410/include/mach/system-reset.h has
been removed by commit f88b8979 ("ARM: restart: remove the now
empty arch_reset()"), so the inclusion of <mach/system-reset.h>
should be removed at the plat-s3c24xx/cpu.c file.

The build error happens like following:
  arch/arm/plat-s3c24xx/cpu.c:41: fatal error: mach/system-reset.h: No such file or directory

Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
---
Russell,

I think, you missed removing this in your patch.
If you have patches to send to Linus for this merge window,
could you please send this together? Or...?

 arch/arm/plat-s3c24xx/cpu.c |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/arch/arm/plat-s3c24xx/cpu.c b/arch/arm/plat-s3c24xx/cpu.c
index 1121df1..21f1fda 100644
--- a/arch/arm/plat-s3c24xx/cpu.c
+++ b/arch/arm/plat-s3c24xx/cpu.c
@@ -38,8 +38,6 @@
 #include <asm/mach/arch.h>
 #include <asm/mach/map.h>
 
-#include <mach/system-reset.h>
-
 #include <mach/regs-gpio.h>
 #include <plat/regs-serial.h>
 
-- 
1.7.1
