Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15FB5C74A44
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Mar 2023 23:10:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230161AbjCHXKU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Mar 2023 18:10:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230126AbjCHXJn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Mar 2023 18:09:43 -0500
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D82F773032
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Mar 2023 15:09:39 -0800 (PST)
Received: by mail-oi1-x22b.google.com with SMTP id bk32so304640oib.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Mar 2023 15:09:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678316979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PcyN6J8psmsD0AipK3PVomDiouRZnU8VIxAcqRxXEto=;
        b=q3IlJ0PtdTA2WKmAG1d3tU8qg7pF582NBzTvvAggce9S3FSEvf8Gz1eSbYK8GaLQnn
         6L2l9Sf3hNlSlEip7YSk0h/xcJl+Ed7vho0cOw6r7pTJBDMwPj18FOSbZDbSMGgx6VGu
         RfpZTkv8DVSB82/Own1gEy/I1RlVGgYO6k9+mn+kdO5UJMSgL7tSBwUsfV+9OI+WMrEy
         mRfk0RAD/el8kQzsmmsXmjXPj3YV5Iy7eE+rEN3xqqqKeRL9XgsSHMn8wooKY7iXKRbY
         XSLksVHSnubrHoKQmQO/yhDHgAuLvhlUBANYUW53lOO+bskC5Op3QxwZY4WFty3woN9C
         IQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678316979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PcyN6J8psmsD0AipK3PVomDiouRZnU8VIxAcqRxXEto=;
        b=e1U1WHhJ6hsQHlpO4l402XbcPOC9vEbnGPOnmEnj7J6C0BAvDT9fxVV6W4agR6TW9T
         R6nSZLC3Q5r3Mw4ZU/lgZxtyJdZX5jWlhqZFRIW47OC+dqOvoH44RWZNlRQkh4zG/egL
         O+t3lgI9v1tWoYS4luENSQxCX8qQWTbdIqAy1P2b51W9gQCsC/DjsKo+upmiKO8lZtRo
         ntQ0d6wg4SvMmAuAJRA4tS7DF00HgKIQE/wFzQhnqB5kUMtvHDSeO9lEGXN+F2l6EMIQ
         21FERUVVhv6uprvFQnSYvUQ5k3EXualacK2tj+Qv7ibuzgW1ruZVuqOqa8WmnsqM7PVQ
         YPNw==
X-Gm-Message-State: AO0yUKVDQS76v7Alev+iD69xb9zPOfpTzbxRawrjPkGgx5tnkEgXmtfq
        CrVyj/WNhbpjKYdWyXf2pE9k5Q==
X-Google-Smtp-Source: AK7set96vUGZQ9x3seGiIj9aPGfeXEqlsBW10Gzyw7TR94eZbEmXWAiaUl8btBnUMn29SmszXEwL6g==
X-Received: by 2002:aca:240c:0:b0:384:349a:15ef with SMTP id n12-20020aca240c000000b00384349a15efmr9062265oic.36.1678316977577;
        Wed, 08 Mar 2023 15:09:37 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id g10-20020a9d618a000000b006864c8043e0sm6969520otk.61.2023.03.08.15.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 15:09:37 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] soc: samsung: pm_domains: Implement proper I/O operations
Date:   Wed,  8 Mar 2023 17:09:29 -0600
Message-Id: <20230308230931.27261-5-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308230931.27261-1-semen.protsenko@linaro.org>
References: <20230308230931.27261-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Instead of doing in-place readl()/writel() calls fed with magic numbers,
provide dedicated read/write functions which implement proper register
accesses:
  - Get rid of magic numbers by introducing actual constants for PD
    registers
  - Rework the write function to perform a RMW operation, as PD
    registers have some bits markes as "Reserved" in TRM, which
    shouldn't be changed
  - Add helper functions for reading the STATUS reg and writing
    CONFIGURATION reg, to make user code more neat and clean

New functions are designed in such a way that it's easy to rework those
further on top of regmap API.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/soc/samsung/pm_domains.c | 42 +++++++++++++++++++++++++++++---
 1 file changed, 38 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/samsung/pm_domains.c b/drivers/soc/samsung/pm_domains.c
index 522a43005a5a..dd1ec3541e11 100644
--- a/drivers/soc/samsung/pm_domains.c
+++ b/drivers/soc/samsung/pm_domains.c
@@ -18,6 +18,10 @@
 #include <linux/of_platform.h>
 #include <linux/pm_runtime.h>
 
+/* Register offsets inside Power Domain area in PMU */
+#define EXYNOS_PD_CONF		0x0
+#define EXYNOS_PD_STATUS	0x4
+
 struct exynos_pm_domain_config {
 	/* Value for LOCAL_PWR_CFG and STATUS fields for each domain */
 	u32 local_pwr_cfg;
@@ -33,6 +37,37 @@ struct exynos_pm_domain {
 	u32 local_pwr_cfg;
 };
 
+static void exynos_pd_write(struct exynos_pm_domain *pd, unsigned int reg,
+			    unsigned int mask, unsigned int val)
+{
+	u32 v;
+
+	v = readl_relaxed(pd->base + reg);
+	v = (v & ~mask) | val;
+	writel_relaxed(v, pd->base + reg);
+}
+
+static void exynos_pd_read(struct exynos_pm_domain *pd, unsigned int reg,
+			   unsigned int *val)
+{
+	*val = readl_relaxed(pd->base + reg);
+}
+
+static unsigned int exynos_pd_read_status(struct exynos_pm_domain *pd)
+{
+	unsigned int val;
+
+	exynos_pd_read(pd, EXYNOS_PD_STATUS, &val);
+	val &= pd->local_pwr_cfg;
+
+	return val;
+}
+
+static void exynos_pd_write_conf(struct exynos_pm_domain *pd, u32 val)
+{
+	exynos_pd_write(pd, EXYNOS_PD_CONF, pd->local_pwr_cfg, val);
+}
+
 static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 {
 	struct exynos_pm_domain *pd;
@@ -44,12 +79,12 @@ static int exynos_pd_power(struct generic_pm_domain *domain, bool power_on)
 	base = pd->base;
 
 	pwr = power_on ? pd->local_pwr_cfg : 0;
-	writel_relaxed(pwr, base);
+	exynos_pd_write_conf(pd, pwr);
 
 	/* Wait max 1ms */
 	timeout = 10;
 
-	while ((readl_relaxed(base + 0x4) & pd->local_pwr_cfg) != pwr) {
+	while (exynos_pd_read_status(pd) != pwr) {
 		if (!timeout) {
 			op = (power_on) ? "enable" : "disable";
 			pr_err("Power domain %s %s failed\n", domain->name, op);
@@ -135,8 +170,7 @@ static int exynos_pd_probe(struct platform_device *pdev)
 	pd->pd.power_off = exynos_pd_power_off;
 	pd->pd.power_on = exynos_pd_power_on;
 
-	on = readl_relaxed(pd->base + 0x4) & pd->local_pwr_cfg;
-
+	on = exynos_pd_read_status(pd);
 	pm_genpd_init(&pd->pd, NULL, !on);
 	ret = of_genpd_add_provider_simple(np, &pd->pd);
 
-- 
2.39.2

