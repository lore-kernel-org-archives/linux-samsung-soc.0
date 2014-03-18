From: Tomasz Figa <t.figa@samsung.com>
Subject: [PATCH v2 1/6] serial: s3c: Fix build of header without serial_core.h
 preinclusion
Date: Tue, 18 Mar 2014 18:15:59 +0100
Message-ID: <1395162964-5916-1-git-send-email-t.figa@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.w1.samsung.com ([210.118.77.14]:44414 "EHLO
	mailout4.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753950AbaCRRQX (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 18 Mar 2014 13:16:23 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout4.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N2N001J66N9V590@mailout4.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Tue, 18 Mar 2014 17:16:21 +0000 (GMT)
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linaro-kernel@lists.linaro.org, Mark Brown <broonie@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Tomasz Figa <t.figa@samsung.com>

From: Mark Brown <broonie@linaro.org>

serial_s3c.h uses upf_t which is defined in serial_core.h but does not
include that itself meaning that users which include serial_s3c.h by
itself don't build.

Signed-off-by: Mark Brown <broonie@linaro.org>
[t.figa: Moved inclusion under #ifndef __ASSEMBLY__ to fix mach-exynos.]
Signed-off-by: Tomasz Figa <t.figa@samsung.com>
---
 include/linux/serial_s3c.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/serial_s3c.h b/include/linux/serial_s3c.h
index 907d9d1..e6fc956 100644
--- a/include/linux/serial_s3c.h
+++ b/include/linux/serial_s3c.h
@@ -233,6 +233,8 @@
 
 #ifndef __ASSEMBLY__
 
+#include <linux/serial_core.h>
+
 /* configuration structure for per-machine configurations for the
  * serial port
  *
-- 
1.9.0
