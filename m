Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D46AC61DA4
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 23 Feb 2023 04:19:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233238AbjBWETm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 22 Feb 2023 23:19:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233200AbjBWETd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 22 Feb 2023 23:19:33 -0500
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7D9D1F490
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Feb 2023 20:19:29 -0800 (PST)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-1724d65d002so6170185fac.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Feb 2023 20:19:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o+4RhquMD5jbxIZBW3zmCgV4RLD7PU4UwzsDD124uC0=;
        b=nArWqXrgCS/zVpYzIRAOM2uoNO77GU4mW0pOwaQ7TTUFxup6W26La3LIHr0+wyIvLS
         UOssk0n+BBvKE/akNkwLO/5lm+PCxuqgCegA7it2s3OIXWSectYFEtgz7vfNoB/OGnz2
         gE8uIwZzU9mYjRi+kLCoWkx+pK5VHTM6eHCa0pyqgU2WQaraf4hShURb7K7GZSGbKYP8
         DGCl2htLS2yztKnFr0+FfjTD9IHj3s44AwnXxqXayZK+7B44ARbwN49XGAlRY561khPd
         /8UHq+Xm3U6x15cVoXorqx6kEeT/kqDPwdiJZ6V6Sx8eBgR5bwJnW6wGUQPY4KmJJPDT
         Vlwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o+4RhquMD5jbxIZBW3zmCgV4RLD7PU4UwzsDD124uC0=;
        b=iOywXAFbL8JWBP0MP5pk+7V1oHXSYMgaksQ1Rc+pN9Fysn1caYDVGTwYXki69XIesG
         1ADidP9WXyDL709gKe8QyPqSMTQUsa3f9e71Xp1/ukz01rthDL1IzCEd+vfPXO9jcY+e
         DjXSxpmr5BzjJZ+pxXOwkc64HqZhxZzUG6fWVHfsGfjy1GAjfZvOGbovQ0N8LShbte8E
         u+u9jB04cZS/xg7C8qgAdmyX0Do0d4eZpHhc6DSyc4VOki5dpEor4+IMjli8cuhcSQAY
         cbUH/1vrla+UucUqGgujbFIcIyNaRuYGzyAnOVc8rOJXa0jHKmJSHF2rYCkJ3EDseBQj
         d3XQ==
X-Gm-Message-State: AO0yUKW/HSpeRX39+1VfqyFHxzYu3V3Qdb/o1cq7DXL9hDCt+UMMQW2h
        LsuLvOMpH75R1K9gUyEWQUWtlQ==
X-Google-Smtp-Source: AK7set/1sHxwH7ZP3YVsiUKAkepX1X+GTjovwPFFq7RBh7uzB7iajpl5KBnnLRYO6lgSG3Sj0YlVHA==
X-Received: by 2002:a05:6870:1494:b0:163:2804:596d with SMTP id k20-20020a056870149400b001632804596dmr10956471oab.19.1677125968093;
        Wed, 22 Feb 2023 20:19:28 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id p189-20020acabfc6000000b0037841fb9a65sm1984675oif.5.2023.02.22.20.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 20:19:27 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/6] clk: samsung: Extract parent clock enabling to common function
Date:   Wed, 22 Feb 2023 22:19:37 -0600
Message-Id: <20230223041938.22732-6-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223041938.22732-1-semen.protsenko@linaro.org>
References: <20230223041938.22732-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Extract parent clock enabling from exynos_arm64_register_cmu() to
dedicated function.

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v3:
  - Rebased on top of latest soc/for-next tree
  - Added Marek's Acked-by tag

Changes in v2:
  - Rebased on top of latest soc/for-next tree
  - Improved English in kernel doc comment
  - Added clk_prepare_enable() return value check
  - Added exynos_arm64_enable_bus_clk() check in
    exynos_arm64_register_cmu()
  - Changed the commit message to reflect code changes

 drivers/clk/samsung/clk-exynos-arm64.c | 51 ++++++++++++++++++--------
 1 file changed, 35 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos-arm64.c b/drivers/clk/samsung/clk-exynos-arm64.c
index b921b9a1134a..2aa3f0a5644e 100644
--- a/drivers/clk/samsung/clk-exynos-arm64.c
+++ b/drivers/clk/samsung/clk-exynos-arm64.c
@@ -56,6 +56,37 @@ static void __init exynos_arm64_init_clocks(struct device_node *np,
 	iounmap(reg_base);
 }
 
+/**
+ * exynos_arm64_enable_bus_clk - Enable parent clock of specified CMU
+ *
+ * @dev:	Device object; may be NULL if this function is not being
+ *		called from platform driver probe function
+ * @np:		CMU device tree node
+ * @cmu:	CMU data
+ *
+ * Keep CMU parent clock running (needed for CMU registers access).
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+static int __init exynos_arm64_enable_bus_clk(struct device *dev,
+		struct device_node *np, const struct samsung_cmu_info *cmu)
+{
+	struct clk *parent_clk;
+
+	if (!cmu->clk_name)
+		return 0;
+
+	if (dev)
+		parent_clk = clk_get(dev, cmu->clk_name);
+	else
+		parent_clk = of_clk_get_by_name(np, cmu->clk_name);
+
+	if (IS_ERR(parent_clk))
+		return PTR_ERR(parent_clk);
+
+	return clk_prepare_enable(parent_clk);
+}
+
 /**
  * exynos_arm64_register_cmu - Register specified Exynos CMU domain
  * @dev:	Device object; may be NULL if this function is not being
@@ -72,23 +103,11 @@ static void __init exynos_arm64_init_clocks(struct device_node *np,
 void __init exynos_arm64_register_cmu(struct device *dev,
 		struct device_node *np, const struct samsung_cmu_info *cmu)
 {
-	/* Keep CMU parent clock running (needed for CMU registers access) */
-	if (cmu->clk_name) {
-		struct clk *parent_clk;
-
-		if (dev)
-			parent_clk = clk_get(dev, cmu->clk_name);
-		else
-			parent_clk = of_clk_get_by_name(np, cmu->clk_name);
-
-		if (IS_ERR(parent_clk)) {
-			pr_err("%s: could not find bus clock %s; err = %ld\n",
-			       __func__, cmu->clk_name, PTR_ERR(parent_clk));
-		} else {
-			clk_prepare_enable(parent_clk);
-		}
-	}
+	int err;
 
+	err = exynos_arm64_enable_bus_clk(dev, np, cmu);
+	if (err)
+		panic("%s: could not enable bus clock\n", __func__);
 	exynos_arm64_init_clocks(np, cmu->clk_regs, cmu->nr_clk_regs);
 	samsung_cmu_register_one(np, cmu);
 }
-- 
2.39.1

