From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH 2/3] Samsung SoC: ready to use NTC value inside kernel
Date: Thu, 30 Jun 2011 17:26:26 +0900
Message-ID: <1309422387-11546-3-git-send-email-myungjoo.ham@samsung.com>
References: <1309422387-11546-1-git-send-email-myungjoo.ham@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:18044 "EHLO
	mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758700Ab1F3I0a (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jun 2011 04:26:30 -0400
Received: from epcpsbgm2.samsung.com (mailout4.samsung.com [203.254.224.34])
 by mailout4.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LNL00HAMGRP1FJ0@mailout4.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Jun 2011 17:26:28 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LNL00A2WGS5G0@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Jun 2011 17:26:29 +0900 (KST)
In-reply-to: <1309422387-11546-1-git-send-email-myungjoo.ham@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Changhwan Youn <chaos.youn@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, myungjoo.ham@gmail.com, dg77.kim@samsung.com, Mark Brown <broonie@opensource.wolfsonmicro.com>

This patch allows kernel codes to use values from NTC LM-Sensor
driver, which allows SYSFS access only.

Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-samsung/dev-adc.c              |   62 ++++++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/adc-ntc.h |   19 ++++++++
 2 files changed, 81 insertions(+), 0 deletions(-)
 create mode 100644 arch/arm/plat-samsung/include/plat/adc-ntc.h

diff --git a/arch/arm/plat-samsung/dev-adc.c b/arch/arm/plat-samsung/dev-adc.c
index 622972c..526097a 100644
--- a/arch/arm/plat-samsung/dev-adc.c
+++ b/arch/arm/plat-samsung/dev-adc.c
@@ -22,6 +22,8 @@
 #include <plat/devs.h>
 #include <plat/cpu.h>
 
+#include "../../../fs/sysfs/sysfs.h"
+
 static struct resource s3c_adc_resource[] = {
 	[0] = {
 		.start = SAMSUNG_PA_ADC,
@@ -101,3 +103,63 @@ struct platform_device s3c_device_adc_ntc_thermistor = {
 		.platform_data = &ntc_adc_pdata,
 	},
 };
+
+static struct device_attribute *ntc_attr;
+
+static int init_s3c_adc_ntc_read(void)
+{
+	struct kobject *ntc;
+	struct sysfs_dirent *ntc_d;
+
+	ntc = &s3c_device_adc_ntc_thermistor.dev.kobj;
+	ntc_d = sysfs_get_dirent(ntc->sd, get_ktype(ntc)->namespace(ntc),
+				 "temp1_input");
+	if (!ntc_d || sysfs_type(ntc_d) != SYSFS_KOBJ_ATTR) {
+		dev_err(&s3c_device_adc_ntc_thermistor.dev,
+			"Cannot initialize thermistor dirent info.\n");
+		if (ntc_d)
+			sysfs_put(ntc_d);
+		return -ENODEV;
+	}
+	ntc_attr = container_of(ntc_d->s_attr.attr, struct device_attribute,
+				attr);
+
+	sysfs_put(ntc_d);
+	if (IS_ERR(ntc_attr)) {
+		dev_err(&s3c_device_adc_ntc_thermistor.dev,
+			"Cannot access NTC thermistor.\n");
+		return PTR_ERR(ntc_attr);
+	}
+
+	return 0;
+}
+
+/* A helper function to read values from NTC, in 1/1000 Centigrade */
+int read_s3c_adc_ntc(int *mC)
+{
+	char buf[32];
+	int ret;
+
+	/* init should be done after ADC and NTC are probed */
+	if (ntc_attr == NULL) {
+		ret = init_s3c_adc_ntc_read();
+		if (ret) {
+			if (ntc_attr == NULL)
+				ntc_attr = ERR_PTR(ret);
+			return ret;
+		}
+	}
+
+	if (IS_ERR(ntc_attr))
+		return -ENODEV;
+
+	if (!ntc_attr->show)
+		return -EINVAL;
+
+	ret = ntc_attr->show(&s3c_device_adc_ntc_thermistor.dev, ntc_attr, buf);
+	if (ret < 0)
+		return ret;
+	sscanf(buf, "%d", mC);
+
+	return 0;
+}
diff --git a/arch/arm/plat-samsung/include/plat/adc-ntc.h b/arch/arm/plat-samsung/include/plat/adc-ntc.h
new file mode 100644
index 0000000..3d74118
--- /dev/null
+++ b/arch/arm/plat-samsung/include/plat/adc-ntc.h
@@ -0,0 +1,19 @@
+/* linux/arch/arm/plat-samsung/include/plat/adc-ntc.h
+ *
+ * Copyright (c) 2011 Samsung Electronics Co., Ltd.
+ *		http://www.samsung.com/
+ *
+ * NTC Thermistor attached to Samsung ADC Controller driver information
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+*/
+
+#ifndef __PLAT_ADC_NTC_H
+#define __PLAT_ADC_NTC_H __FILE__
+
+extern void s3c_adc_ntc_init(int port);
+extern int read_s3c_adc_ntc(int *mC);
+
+#endif /* __PLAT_ADC_NTC_H */
-- 
1.7.4.1
