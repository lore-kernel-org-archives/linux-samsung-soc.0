Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F3C0C64EC4
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Mar 2023 23:09:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230093AbjCHXJk (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Mar 2023 18:09:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230101AbjCHXJh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Mar 2023 18:09:37 -0500
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9592562860
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Mar 2023 15:09:36 -0800 (PST)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-176d93cd0daso494349fac.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Mar 2023 15:09:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678316976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCgoAAph+CJJQ/HXPDLlsZa6JDKmYlP9bMJP4xpZGTc=;
        b=ipb8NHtUtwLc9dxs8eFwm36R1+cjKR4a1WtnYtAuOVzgQSe1pUwRVCLF5dRVhyzMic
         N+DH+iurQ3clHBolZUJCOTWhArA9ZgJ6lhDZYHNPEO0XUA2Dc+fJBo/9+3q7VmWvz81j
         ymAC45KTfTfanXJoe4JPZJxHTxdIMrlpefmtXPUi2x9Sex1XSfgQt3qj7LX8dWY0fY/c
         wmzEMM2hs6LYkG9F6i7CfSkX7ZKUs7HtDkhTH1WQR6sPxUy/F5WATBSaq26d1bYVIUYH
         T1e+NZK1694QqTLm/oKJSC9zWPZ6F2rzYqNr4DJMfbpmT0fbEmh5j8RPKOHDxYG/DYN2
         qD1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678316976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCgoAAph+CJJQ/HXPDLlsZa6JDKmYlP9bMJP4xpZGTc=;
        b=pWe5uXNz1GuvjIXSL7m+ugLV3HN/k1+T6pWLyRGLLrvhPrMVtvWYVuSUsXCnmtwgex
         vlLDZg00aoyO9XF++LMX1lTE+F6nb86hfRVYrBum/8hylhX8q3xxcVRqHueNNVkSVEen
         p35WuGodIXS2D0cokazStL+SMmHbP1cHL2r8v88rsHbzkATc1vO7PHn1HP3KVxkxG8WK
         Kwz4w+qbmIyGvX/7lqMUWR+sA3W31vGHN58JbRWoS7k8h4rv7/aWatT6YkSmT+f3zLGm
         /+xCUePRCfbEUkRbT0KD8Do03qwGFg8iNnn+xvb6PY60ZvVniTKum5U3ui6zHTh9EvMO
         MqYw==
X-Gm-Message-State: AO0yUKWjvZ5O8djfCb+4g76xYNmGgVQ0+uKE7iWKe0kISQKIxvbEMllN
        ZXfZ+VPZ/5+PIPreJKfNOdz9yg==
X-Google-Smtp-Source: AK7set9SbpiNCtT5Bu/YFGwhpd/OImP2SC1fW1w2Pjpy8utXilwnFH7Qw//TyEQfQYfv5mXgwr/czA==
X-Received: by 2002:a05:6870:20e:b0:163:595e:3655 with SMTP id j14-20020a056870020e00b00163595e3655mr12008494oad.12.1678316976311;
        Wed, 08 Mar 2023 15:09:36 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id s6-20020a056870ea8600b0016e49af5815sm6716829oap.51.2023.03.08.15.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 15:09:36 -0800 (PST)
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
Subject: [PATCH 3/6] soc: samsung: pm_domains: Extract DT handling into a separate function
Date:   Wed,  8 Mar 2023 17:09:28 -0600
Message-Id: <20230308230931.27261-4-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308230931.27261-1-semen.protsenko@linaro.org>
References: <20230308230931.27261-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

As DT parsing code tends to grow with time, make it a separate routine.
While at it, replace kstrdup_const() with devm_kstrdup_const() in order
to avoid manual memory management and simplify the error path.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/soc/samsung/pm_domains.c | 39 +++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 16 deletions(-)

diff --git a/drivers/soc/samsung/pm_domains.c b/drivers/soc/samsung/pm_domains.c
index d07f3c9d6903..522a43005a5a 100644
--- a/drivers/soc/samsung/pm_domains.c
+++ b/drivers/soc/samsung/pm_domains.c
@@ -27,6 +27,7 @@ struct exynos_pm_domain_config {
  * Exynos specific wrapper around the generic power domain
  */
 struct exynos_pm_domain {
+	struct device *dev;
 	void __iomem *base;
 	struct generic_pm_domain pd;
 	u32 local_pwr_cfg;
@@ -91,42 +92,48 @@ static const struct of_device_id exynos_pm_domain_of_match[] = {
 	{ },
 };
 
-static const char *exynos_get_domain_name(struct device_node *node)
+static int exynos_pd_parse_dt(struct exynos_pm_domain *pd)
 {
+	const struct exynos_pm_domain_config *variant;
+	struct device *dev = pd->dev;
+	struct device_node *np = dev->of_node;
 	const char *name;
 
-	if (of_property_read_string(node, "label", &name) < 0)
-		name = kbasename(node->full_name);
-	return kstrdup_const(name, GFP_KERNEL);
+	variant = of_device_get_match_data(dev);
+	pd->local_pwr_cfg = variant->local_pwr_cfg;
+
+	if (of_property_read_string(np, "label", &name) < 0)
+		name = kbasename(np->full_name);
+	pd->pd.name = devm_kstrdup_const(dev, name, GFP_KERNEL);
+	if (!pd->pd.name)
+		return -ENOMEM;
+
+	pd->base = of_iomap(np, 0);
+	if (!pd->base)
+		return -ENODEV;
+
+	return 0;
 }
 
 static int exynos_pd_probe(struct platform_device *pdev)
 {
-	const struct exynos_pm_domain_config *pm_domain_cfg;
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev->of_node;
 	struct of_phandle_args child, parent;
 	struct exynos_pm_domain *pd;
 	int on, ret;
 
-	pm_domain_cfg = of_device_get_match_data(dev);
 	pd = devm_kzalloc(dev, sizeof(*pd), GFP_KERNEL);
 	if (!pd)
 		return -ENOMEM;
 
-	pd->pd.name = exynos_get_domain_name(np);
-	if (!pd->pd.name)
-		return -ENOMEM;
-
-	pd->base = of_iomap(np, 0);
-	if (!pd->base) {
-		kfree_const(pd->pd.name);
-		return -ENODEV;
-	}
+	pd->dev = dev;
+	ret = exynos_pd_parse_dt(pd);
+	if (ret)
+		return ret;
 
 	pd->pd.power_off = exynos_pd_power_off;
 	pd->pd.power_on = exynos_pd_power_on;
-	pd->local_pwr_cfg = pm_domain_cfg->local_pwr_cfg;
 
 	on = readl_relaxed(pd->base + 0x4) & pd->local_pwr_cfg;
 
-- 
2.39.2

