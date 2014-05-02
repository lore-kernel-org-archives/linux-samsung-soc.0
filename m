From: Arun Kumar K <arun.kk@samsung.com>
Subject: [PATCH 2/3] ARM: dts: Add Exynos5800 dt file
Date: Fri,  2 May 2014 18:33:40 +0530
Message-ID: <1399035821-25096-3-git-send-email-arun.kk@samsung.com>
References: <1399035821-25096-1-git-send-email-arun.kk@samsung.com>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pa0-f42.google.com ([209.85.220.42]:45869 "EHLO
	mail-pa0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751827AbaEBND5 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 2 May 2014 09:03:57 -0400
In-Reply-To: <1399035821-25096-1-git-send-email-arun.kk@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: kgene.kim@samsung.com, dianders@chromium.org, olofj@google.com, t.figa@samsung.com, sachin.kamat@linaro.org, tushar.behera@linaro.org, arunkk.samsung@gmail.com

Most of the nodes of exynos5420 remains same for exynos5800.
So the exynos5420.dtsi is included in exynos5800 and the changed
node properties will be overriden.

Signed-off-by: Arun Kumar K <arun.kk@samsung.com>
---
 arch/arm/boot/dts/exynos5800.dtsi |   24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 arch/arm/boot/dts/exynos5800.dtsi

diff --git a/arch/arm/boot/dts/exynos5800.dtsi b/arch/arm/boot/dts/exynos5800.dtsi
new file mode 100644
index 0000000..6979fc7
--- /dev/null
+++ b/arch/arm/boot/dts/exynos5800.dtsi
@@ -0,0 +1,24 @@
+/*
+ * SAMSUNG EXYNOS5800 SoC device tree source
+ *
+ * Copyright (c) 2014 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com
+ *
+ * SAMSUNG EXYNOS5800 SoC device nodes are listed in this file.
+ * EXYNOS5800 based board files can include this file and provide
+ * values for board specfic bindings.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include "exynos5420.dtsi"
+
+/ {
+	compatible = "samsung,exynos5800", "samsung,exynos5";
+};
+
+&clock {
+	compatible = "samsung,exynos5800-clock";
+};
-- 
1.7.9.5
