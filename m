From: Ben Dooks <ben-linux@fluff.org>
Subject: [PATCH 08/15] ARM: SAMSUNG: Add s3c_gpio_cfgall_range() function
Date: Fri, 28 May 2010 06:56:45 +0100
Message-ID: <1275026212-27510-9-git-send-email-ben-linux@fluff.org>
References: <1275026212-27510-1-git-send-email-ben-linux@fluff.org>
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from trinity.fluff.org ([89.16.178.74]:33937 "EHLO trinity.fluff.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755470Ab0E1F45 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 May 2010 01:56:57 -0400
In-Reply-To: <1275026212-27510-1-git-send-email-ben-linux@fluff.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org
Cc: Ben Dooks <ben-linux@fluff.org>

Add a function to configure a range of GPIOs function and
pull in one go, mainly for the SDHCI and framebuffer helpers
which tend to do this.

Signed-off-by: Ben Dooks <ben-linux@fluff.org>
---
 arch/arm/plat-samsung/gpio-config.c           |   15 +++++++++++++++
 arch/arm/plat-samsung/include/plat/gpio-cfg.h |   20 ++++++++++++++++++++
 2 files changed, 35 insertions(+), 0 deletions(-)

diff --git a/arch/arm/plat-samsung/gpio-config.c b/arch/arm/plat-samsung/gpio-config.c
index a927dd2..3a02e23 100644
--- a/arch/arm/plat-samsung/gpio-config.c
+++ b/arch/arm/plat-samsung/gpio-config.c
@@ -56,6 +56,21 @@ int s3c_gpio_cfgpin_range(unsigned int start, unsigned int nr,
 }
 EXPORT_SYMBOL_GPL(s3c_gpio_cfgpin_range);
 
+int s3c_gpio_cfgall_range(unsigned int start, unsigned int nr,
+			  unsigned int cfg, s3c_gpio_pull_t pull)
+{
+	int ret;
+
+	for (; nr > 0; nr--, start++) {
+		s3c_gpio_setpull(start, pull);
+		ret = s3c_gpio_cfgpin(start, cfg);
+		if (ret != 0)
+			return ret;
+	}
+
+}
+EXPORT_SYMBOL_GPL(s3c_gpio_cfgall_range);
+
 unsigned s3c_gpio_getcfg(unsigned int pin)
 {
 	struct s3c_gpio_chip *chip = s3c_gpiolib_getchip(pin);
diff --git a/arch/arm/plat-samsung/include/plat/gpio-cfg.h b/arch/arm/plat-samsung/include/plat/gpio-cfg.h
index 8ec9936..bec872f 100644
--- a/arch/arm/plat-samsung/include/plat/gpio-cfg.h
+++ b/arch/arm/plat-samsung/include/plat/gpio-cfg.h
@@ -161,4 +161,24 @@ extern s5p_gpio_drvstr_t s5p_gpio_get_drvstr(unsigned int pin);
 */
 extern int s5p_gpio_set_drvstr(unsigned int pin, s5p_gpio_drvstr_t drvstr);
 
+/* configure `all` aspects of an gpio */
+
+/**
+ * s3c_gpio_cfgall_range() - configure range of gpio functtion and pull.
+ * @gpio: The gpio number to start at.
+ * @size: The number of gpio to configure.
+ * @cfg: The configuration to use
+ * @pull: The pull setting to use.
+ *
+ * Run s3c_gpio_cfgpin() and s3c_gpio_setpull() over the gpio range starting
+ * @gpio and running for @size.
+ *
+ * @sa s3c_gpio_cfgpin
+ * @sa s3c_gpio_setpull
+ * @sa s3c_gpio_cfgpin_range
+ */
+extern int s3c_gpio_cfgall_range(unsigned int pin, unsigned int size,
+				 unsigned int cfg, s3c_gpio_pull_t pull);
+
+
 #endif /* __PLAT_GPIO_CFG_H */
-- 
1.6.3.3
