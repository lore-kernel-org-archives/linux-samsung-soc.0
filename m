From: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/2] serial: s3c: Fix build of header without serial_core.h preinclusion
Date: Tue, 18 Mar 2014 11:56:42 +0000
Message-ID: <1395143803-2032-1-git-send-email-broonie@kernel.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:53914 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753281AbaCRL47 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Mar 2014 07:56:59 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>

From: Mark Brown <broonie@linaro.org>

serial_s3c.h uses upf_t which is defined in serial_core.h but does not
include that itself meaning that users which include serial_s3c.h by
itself don't build.

Signed-off-by: Mark Brown <broonie@linaro.org>
---

This is needed together with patch 2 to fix build failures in -next, I
didn't have the time/enthusiasm to isolate the issue.

 include/linux/serial_s3c.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/serial_s3c.h b/include/linux/serial_s3c.h
index 907d9d1d56cf..44e4a6b92ddb 100644
--- a/include/linux/serial_s3c.h
+++ b/include/linux/serial_s3c.h
@@ -29,6 +29,8 @@
 #ifndef __ASM_ARM_REGS_SERIAL_H
 #define __ASM_ARM_REGS_SERIAL_H
 
+#include <linux/serial_core.h>
+
 #define S3C2410_URXH	  (0x24)
 #define S3C2410_UTXH	  (0x20)
 #define S3C2410_ULCON	  (0x00)
-- 
1.9.0
