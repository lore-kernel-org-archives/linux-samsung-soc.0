From: Sachin Kamat <sachin.kamat@linaro.org>
Subject: [PATCH 2/4] ARM: SAMSUNG: Add API to set platform data for s5p-tv driver
Date: Mon,  2 Jul 2012 14:18:50 +0530
Message-ID: <1341218932-15846-2-git-send-email-sachin.kamat@linaro.org>
References: <1341218932-15846-1-git-send-email-sachin.kamat@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pb0-f46.google.com ([209.85.160.46]:33238 "EHLO
	mail-pb0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932449Ab2GBJBO (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 2 Jul 2012 05:01:14 -0400
Received: by pbbrp8 with SMTP id rp8so7268914pbb.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 02 Jul 2012 02:01:14 -0700 (PDT)
In-Reply-To: <1341218932-15846-1-git-send-email-sachin.kamat@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, sachin.kamat@linaro.org, tushar.behera@linaro.org, patches@linaro.org

From: Tushar Behera <tushar.behera@linaro.org>

Commit 350f2f4dad64 ("[media] v4l: s5p-tv: hdmi: add support for
platform data") makes the presence of platform data mandatory for s5p-tv
driver. Adding an API to plat-samsung for this purpose.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
---
 arch/arm/plat-samsung/devs.c              |   26 ++++++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/hdmi.h |   16 ++++++++++++++++
 2 files changed, 42 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/plat-samsung/include/plat/hdmi.h

diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index 07b5ac6..921ed88 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -32,6 +32,8 @@
 #include <linux/platform_data/s3c-hsudc.h>
 #include <linux/platform_data/s3c-hsotg.h>
 
+#include <media/s5p_hdmi.h>
+
 #include <asm/irq.h>
 #include <asm/pmu.h>
 #include <asm/mach/arch.h>
@@ -759,6 +761,30 @@ void __init s5p_i2c_hdmiphy_set_platdata(struct s3c2410_platform_i2c *pd)
 	npd = s3c_set_platdata(pd, sizeof(struct s3c2410_platform_i2c),
 			       &s5p_device_i2c_hdmiphy);
 }
+
+struct s5p_hdmi_platform_data s5p_hdmi_def_platdata;
+
+void __init s5p_hdmi_set_platdata(struct i2c_board_info *hdmiphy_info,
+				struct i2c_board_info *mhl_info, int mhl_bus)
+{
+	struct s5p_hdmi_platform_data *pd = &s5p_hdmi_def_platdata;
+
+	if (soc_is_exynos4210() || soc_is_exynos4212() ||
+						soc_is_exynos4412())
+		pd->hdmiphy_bus = 8;
+	else if (soc_is_s5pv210())
+		pd->hdmiphy_bus = 3;
+	else
+		pd->hdmiphy_bus = 0;
+
+	pd->hdmiphy_info = hdmiphy_info;
+	pd->mhl_info = mhl_info;
+	pd->mhl_bus = mhl_bus;
+
+	s3c_set_platdata(pd, sizeof(struct s5p_hdmi_platform_data),
+				&s5p_device_hdmi);
+}
+
 #endif /* CONFIG_S5P_DEV_I2C_HDMIPHY */
 
 /* I2S */
diff --git a/arch/arm/plat-samsung/include/plat/hdmi.h b/arch/arm/plat-samsung/include/plat/hdmi.h
new file mode 100644
index 0000000..5dc7347
--- /dev/null
+++ b/arch/arm/plat-samsung/include/plat/hdmi.h
@@ -0,0 +1,16 @@
+/*
+ * Copyright (C) 2012 Samsung Electronics Co.Ltd
+ *
+ * This program is free software; you can redistribute  it and/or modify it
+ * under  the terms of  the GNU General  Public License as published by the
+ * Free Software Foundation;  either version 2 of the  License, or (at your
+ * option) any later version.
+ */
+
+#ifndef __PLAT_SAMSUNG_HDMI_H
+#define __PLAT_SAMSUNG_HDMI_H __FILE__
+
+extern void s5p_hdmi_set_platdata(struct i2c_board_info *hdmiphy_info,
+				struct i2c_board_info *mhl_info, int mhl_bus);
+
+#endif /* __PLAT_SAMSUNG_HDMI_H */
-- 
1.7.4.1
