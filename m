From: Tushar Behera <tushar.behera@linaro.org>
Subject: [PATCH 1/2] ARM: SAMSUNG: Add API to set platform data for s5p-tv driver
Date: Thu,  5 Apr 2012 13:54:55 +0530
Message-ID: <1333614296-13256-2-git-send-email-tushar.behera@linaro.org>
References: <1333614296-13256-1-git-send-email-tushar.behera@linaro.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f52.google.com ([209.85.210.52]:45708 "EHLO
	mail-pz0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751890Ab2DEIdJ (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 5 Apr 2012 04:33:09 -0400
Received: by dake40 with SMTP id e40so1342605dak.11
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Apr 2012 01:33:09 -0700 (PDT)
In-Reply-To: <1333614296-13256-1-git-send-email-tushar.behera@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-samsung-soc@vger.kernel.org
Cc: kgene.kim@samsung.com, t.stanislaws@samsung.com, patches@linaro.org

Commit 350f2f4dad64 ("[media] v4l: s5p-tv: hdmi: add support for
platform data") makes the presence of platform data mandatory for s5p-tv
driver. Adding an API to plat-samsung for this purpose.

Signed-off-by: Tushar Behera <tushar.behera@linaro.org>
---
 arch/arm/plat-samsung/devs.c              |   25 +++++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/hdmi.h |   16 ++++++++++++++++
 2 files changed, 41 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/plat-samsung/include/plat/hdmi.h

diff --git a/arch/arm/plat-samsung/devs.c b/arch/arm/plat-samsung/devs.c
index 8b928f9..0ac3884 100644
--- a/arch/arm/plat-samsung/devs.c
+++ b/arch/arm/plat-samsung/devs.c
@@ -31,6 +31,8 @@
 #include <linux/ioport.h>
 #include <linux/platform_data/s3c-hsudc.h>
 
+#include <media/s5p_hdmi.h>
+
 #include <asm/irq.h>
 #include <asm/pmu.h>
 #include <asm/mach/arch.h>
@@ -770,6 +772,29 @@ void __init s5p_i2c_hdmiphy_set_platdata(struct s3c2410_platform_i2c *pd)
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
+	if (soc_is_exynos4210())
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
