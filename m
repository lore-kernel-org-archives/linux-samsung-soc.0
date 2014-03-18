From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 2/6] ARM: s3c64xx: Fix build for implicit serial_s3c.h
 inclusion
Date: Tue, 18 Mar 2014 18:16:00 +0100
Message-ID: <1395162964-5916-2-git-send-email-t.figa@samsung.com>
References: <1395162964-5916-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:40553 "EHLO
	mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754722AbaCRRQY (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Mar 2014 13:16:24 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout2.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N2N00JH06N3GM90@mailout2.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Mar 2014 17:16:15 +0000 (GMT)
In-reply-to: <1395162964-5916-1-git-send-email-t.figa@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>

From: Mark Brown <broonie@linaro.org>

Some very recent change appears to have removed an implicit inclusion of
serial_s3c.h causing build failures due to references to UART registers
in the serial port restore code in next-20140318.  Include it explicitly
to fix the build.

Signed-off-by: Mark Brown <broonie@linaro.org>
---
 arch/arm/mach-s3c64xx/include/mach/pm-core.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-s3c64xx/include/mach/pm-core.h b/arch/arm/mach-s3c64xx/include/mach/pm-core.h
index c0537f4..a30a1e3 100644
--- a/arch/arm/mach-s3c64xx/include/mach/pm-core.h
+++ b/arch/arm/mach-s3c64xx/include/mach/pm-core.h
@@ -15,6 +15,8 @@
 #ifndef __MACH_S3C64XX_PM_CORE_H
 #define __MACH_S3C64XX_PM_CORE_H __FILE__
 
+#include <linux/serial_s3c.h>
+
 #include <mach/regs-gpio.h>
 
 static inline void s3c_pm_debug_init_uart(void)
-- 
1.9.0
