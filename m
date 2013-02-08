From: Alexey Galakhov <agalakhov@gmail.com>
Subject: [PATCH] ARM: S5PV210: Fix early uart output in fifo mode
Date: Fri,  8 Feb 2013 19:00:54 +0600
Message-ID: <1360328454-20321-1-git-send-email-agalakhov@gmail.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-la0-f48.google.com ([209.85.215.48]:57756 "EHLO
	mail-la0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1946433Ab3BHNBi (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 8 Feb 2013 08:01:38 -0500
Received: by mail-la0-f48.google.com with SMTP id fq13so3678307lab.21
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Feb 2013 05:01:37 -0800 (PST)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Alexey Galakhov <agalakhov@gmail.com>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>

Enabling UART FIFO in bootloader caused the kernel infinite
loop on S5PV210 due to uninitialized fifo_max and fifo_mask global
variables. This patch adds the correct initialization.

Signed-off-by: Alexey Galakhov <agalakhov@gmail.com>
---
 arch/arm/mach-s5pv210/include/mach/uncompress.h |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-s5pv210/include/mach/uncompress.h b/arch/arm/mach-s5pv210/include/mach/uncompress.h
index 08ff2fd..ef977ea 100644
--- a/arch/arm/mach-s5pv210/include/mach/uncompress.h
+++ b/arch/arm/mach-s5pv210/include/mach/uncompress.h
@@ -19,6 +19,8 @@
 static void arch_detect_cpu(void)
 {
 	/* we do not need to do any cpu detection here at the moment. */
+	fifo_mask = S5PV210_UFSTAT_TXMASK;
+	fifo_max = 63 << S5PV210_UFSTAT_TXSHIFT;
 }
 
 #endif /* __ASM_ARCH_UNCOMPRESS_H */
-- 
1.7.10.4
