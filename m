From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: [PATCH 1/3] Samsung SoC: NTC Thermistor attached to S3C-ADC.
Date: Thu, 30 Jun 2011 17:26:25 +0900
Message-ID: <1309422387-11546-2-git-send-email-myungjoo.ham@samsung.com>
References: <1309422387-11546-1-git-send-email-myungjoo.ham@samsung.com>
Content-Transfer-Encoding: 7BIT
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:50429 "EHLO
	mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758831Ab1F3I0b (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 30 Jun 2011 04:26:31 -0400
Received: from epcpsbgm1.samsung.com (mailout2.samsung.com [203.254.224.25])
 by mailout2.samsung.com
 (Oracle Communications Messaging Exchange Server 7u4-19.01 64bit (built Sep  7
 2010)) with ESMTP id <0LNL006PFGRS1CI0@mailout2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Jun 2011 17:26:28 +0900 (KST)
Received: from TNRNDGASPAPP1.tn.corp.samsungelectronics.net ([165.213.149.150])
 by mmp2.samsung.com (iPlanet Messaging Server 5.2 Patch 2 (built Jul 14 2004))
 with ESMTPA id <0LNL00B3LGS4G2@mmp2.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 30 Jun 2011 17:26:28 +0900 (KST)
In-reply-to: <1309422387-11546-1-git-send-email-myungjoo.ham@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Kukjin Kim <kgene.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Changhwan Youn <chaos.youn@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, myungjoo.ham@gmail.com, dg77.kim@samsung.com, Mark Brown <broonie@opensource.wolfsonmicro.com>

This patch allows platform configurations to share information about
the NTC thermistor device attached to ADC port of S3C.

A platform configuration is required to initialize the ADC port for NTC
thermistor by calling "s3c_adc_ntc_init(portnum);" before registering
the NTC thermistor device. Then, registering a platform device,
s3c_device_adc_ntc_thermistor, enables NTC thermistor for the
platform.

The platform data is configured for Exynos4-Nuri, S5PC110-Aquila, and
S5PC110-Goni. However, if a board happens to have different platform
data setting, we will need to provide different platform data either
by providing a function to update the platform data or by providing
another platform data entry.

Signed-off-by: MyungJoo Ham <myungjoo.ham@samsung.com>
Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
---
 arch/arm/plat-samsung/dev-adc.c           |   57 +++++++++++++++++++++++++++++
 arch/arm/plat-samsung/include/plat/devs.h |    1 +
 2 files changed, 58 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/dev-adc.c b/arch/arm/plat-samsung/dev-adc.c
index 9d903d4..622972c 100644
--- a/arch/arm/plat-samsung/dev-adc.c
+++ b/arch/arm/plat-samsung/dev-adc.c
@@ -9,9 +9,11 @@
  * published by the Free Software Foundation.
 */
 
+#include <linux/err.h>
 #include <linux/kernel.h>
 #include <linux/string.h>
 #include <linux/platform_device.h>
+#include <linux/platform_data/ntc_thermistor.h>
 
 #include <mach/irqs.h>
 #include <mach/map.h>
@@ -44,3 +46,58 @@ struct platform_device s3c_device_adc = {
 	.num_resources	= ARRAY_SIZE(s3c_adc_resource),
 	.resource	= s3c_adc_resource,
 };
+
+/* NTC Thermistor. Attached to S3C-ADC in some Samsung SoC Devices */
+struct platform_device s3c_device_adc_ntc_thermistor;
+static int ntc_adc_num = -EINVAL; /* Uninitialized */
+static struct s3c_adc_client *ntc_adc;
+
+int __init s3c_adc_ntc_init(int port)
+{
+	int err = 0;
+
+	if (port < 0 || port > 9)
+		return -EINVAL;
+	ntc_adc_num = port;
+
+	ntc_adc = s3c_adc_register(&s3c_device_adc_ntc_thermistor, NULL, NULL,
+				   0);
+	if (IS_ERR(ntc_adc)) {
+		err = PTR_ERR(ntc_adc);
+		ntc_adc = NULL;
+		return err;
+	}
+
+	return 0;
+}
+
+static int read_thermistor_uV(void)
+{
+	int val;
+	s64 converted;
+
+	WARN(ntc_adc == NULL || ntc_adc_num < 0,
+	     "S3C NTC-ADC is not initialized for %s.\n", __func__);
+
+	val = s3c_adc_read(ntc_adc, ntc_adc_num);
+
+	converted = 3300000LL * (s64) val;
+	converted >>= 12;
+
+	return converted;
+}
+
+static struct ntc_thermistor_platform_data ntc_adc_pdata = {
+	.read_uV	= read_thermistor_uV,
+	.pullup_uV	= 3300000, /* voltage of vdd for ADC */
+	.pullup_ohm	= 100000,
+	.pulldown_ohm	= 100000,
+	.connect	= NTC_CONNECTED_GROUND,
+};
+
+struct platform_device s3c_device_adc_ntc_thermistor = {
+	.name			= "ncp15wb473",
+	.dev			= {
+		.platform_data = &ntc_adc_pdata,
+	},
+};
diff --git a/arch/arm/plat-samsung/include/plat/devs.h b/arch/arm/plat-samsung/include/plat/devs.h
index 3c87779..f83b1da 100644
--- a/arch/arm/plat-samsung/include/plat/devs.h
+++ b/arch/arm/plat-samsung/include/plat/devs.h
@@ -61,6 +61,7 @@ extern struct platform_device s3c_device_i2c6;
 extern struct platform_device s3c_device_i2c7;
 extern struct platform_device s3c_device_rtc;
 extern struct platform_device s3c_device_adc;
+extern struct platform_device s3c_device_adc_ntc_thermistor;
 extern struct platform_device s3c_device_sdi;
 extern struct platform_device s3c_device_iis;
 extern struct platform_device s3c_device_hwmon;
-- 
1.7.4.1
