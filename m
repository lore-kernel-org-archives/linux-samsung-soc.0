From: Markus Reichl <m.reichl@fivetechno.de>
Subject: [PATCH V4 1/2] ARM: dts: Add bindings for 32kHz clocks from s2mps11
Date: Tue, 31 Mar 2015 13:57:20 +0200
Message-ID: <551A8BA0.4020003@fivetechno.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from wp126.webpack.hosteurope.de ([80.237.132.133]:34079 "EHLO
	wp126.webpack.hosteurope.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751414AbbCaL5Z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 31 Mar 2015 07:57:25 -0400
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: Krzysztof Kozlowski <k.kozlowski@samsung.com>, Anand Moon <linux.amoon@gmail.com>

This creates include/dt-bindings/clock/samsung,s2mps11.h with the three
32kHz clock outputs from the s2mps11 mfd.

Signed-off-by: Markus Reichl <m.reichl@fivetechno.de>
Reviewed-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
---
Changes since v3:
   None
Changes since v2:
   None
Changes since v1:
1. Dropped Documentation.
2. Split into 2 parts.
---
 include/dt-bindings/clock/samsung,s2mps11.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 include/dt-bindings/clock/samsung,s2mps11.h

diff --git a/include/dt-bindings/clock/samsung,s2mps11.h b/include/dt-bindings/clock/samsung,s2mps11.h
new file mode 100644
index 0000000..b903d7d
--- /dev/null
+++ b/include/dt-bindings/clock/samsung,s2mps11.h
@@ -0,0 +1,23 @@
+/*
+ * Copyright (C) 2015 Markus Reichl
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * Device Tree binding constants clocks for the Samsung S2MPS11 PMIC.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_SAMSUNG_S2MPS11_CLOCK_H
+#define _DT_BINDINGS_CLOCK_SAMSUNG_S2MPS11_CLOCK_H
+
+/* Fixed rate clocks. */
+
+#define S2MPS11_CLK_AP		0
+#define S2MPS11_CLK_CP		1
+#define S2MPS11_CLK_BT		2
+
+/* Total number of clocks. */
+#define S2MPS11_CLKS_NUM		(S2MPS11_CLK_BT + 1)
+
+#endif /* _DT_BINDINGS_CLOCK_SAMSUNG_S2MPS11_CLOCK_H */
-- 
1.9.1

--
To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html


