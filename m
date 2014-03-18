From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 6/6] ARM: s5p64x0: Explicitly include linux/serial_s3c.h in
 mach/pm-core.h
Date: Tue, 18 Mar 2014 18:16:04 +0100
Message-ID: <1395162964-5916-6-git-send-email-t.figa@samsung.com>
References: <1395162964-5916-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:44998 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756662AbaCRRQh (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Mar 2014 13:16:37 -0400
Received: from eucpsbgm2.samsung.com (unknown [203.254.199.245])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N2N00FJD6NBQS90@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Mar 2014 17:16:23 +0000 (GMT)
In-reply-to: <1395162964-5916-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Tomasz Figa <t.figa@samsung.com>

This patch fixes compilation failure due to missing explicit inclusion
of linux/serial_s3c.h in mach/pm-core.h, which contains definitions
required for further code in this header.

Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 arch/arm/mach-s5p64x0/include/mach/pm-core.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-s5p64x0/include/mach/pm-core.h b/arch/arm/mach-s5p64x0/include/mach/pm-core.h
index e52f754..1e0eb65 100644
--- a/arch/arm/mach-s5p64x0/include/mach/pm-core.h
+++ b/arch/arm/mach-s5p64x0/include/mach/pm-core.h
@@ -12,6 +12,8 @@
  * published by the Free Software Foundation.
  */
 
+#include <linux/serial_s3c.h>
+
 #include <mach/regs-gpio.h>
 
 static inline void s3c_pm_debug_init_uart(void)
-- 
1.9.0
