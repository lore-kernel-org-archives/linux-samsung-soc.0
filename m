Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05E1BC6379F
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Feb 2023 23:43:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229910AbjBHXnP (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Feb 2023 18:43:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbjBHXnH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Feb 2023 18:43:07 -0500
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com [IPv6:2001:4860:4864:20::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D3F91CF73
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Feb 2023 15:43:04 -0800 (PST)
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-1636eae256cso654715fac.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Feb 2023 15:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u3TQijj1zNEkMgIbB33746rNlmKDxV7N66SIgj0jQUQ=;
        b=r4nQNOWBzVynaqZrRXOi+W5IJ7rgPu8UYjOMJ7CcciSMSGYOewBVZTIL4nbqb9znCz
         6Pplrqd+dG5YTCBaHulkQodV6zHxIhhhMDz2Fz/EhFW9o7sWHEXnyAwg/u8h28RvUY+3
         sfM+WZw7mX4NpYEmF/bPadKseepuZgDD7GhmNZOmGW5yl2wNphCUIwFeP459GjJ64iYs
         4gxIQo4hbJbz2Tfw31seJEcZ+ULccIWGT4v9Dpkbjb+kYFycCcaz+YpCXbOmrHexy2/m
         PrxddhxFE8PRZQ6c4R2aw1gsheQ8UhRjf57QNer5HeKy8Q9mPMP8hUpDxqpAx6LO4cFf
         Hhzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u3TQijj1zNEkMgIbB33746rNlmKDxV7N66SIgj0jQUQ=;
        b=lWP1WKL/w1Wro+bdo+oyD97RvpGpxU2z1Ys6u4oLQLX/rjxdn99FJ6KA2MOTntaZ34
         x/0omGxveh0jScikF56SD7b/YPwLImSRLFLE5ynLM93uEnl3Gcp6fcFL1Twa5w/Elcne
         89PD7Tenf/3z3UuC6/sITosYTT+qQkQ6ZiVM+8G4ysbl1/eiIx704hWFHqdXK5xnDIB+
         j3eQNAJkeSiti8S02dsY9Zt+p6WOCYD4Qrp+ALGig+KzA8ZBG24yCjd/ZbgTwtrx7Rnj
         LK26UdWqPqHts7pBgDGAhzxBJltKReu440zshP/Ce1X0joxiw8hgFVuls0qIB1JqHspY
         GKRw==
X-Gm-Message-State: AO0yUKXqbK8dmTuze6CSLFhqJrFRTm9FjUJ+fRG9LqpXzqJrE0uP5IMf
        6pW/+uj8N3fIl40zTUPAhIiPMA==
X-Google-Smtp-Source: AK7set+KUQwbpmWSnr7ihtxwIRu7Tt3YgvSh2JEZxfJuyvrzzID8ro6gA9F3R3pjxvhzTKPA15Z8wQ==
X-Received: by 2002:a05:6870:783:b0:15b:b523:3299 with SMTP id en3-20020a056870078300b0015bb5233299mr4714452oab.28.1675899783303;
        Wed, 08 Feb 2023 15:43:03 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id zf18-20020a0568716a9200b0016a629e1917sm3672069oab.52.2023.02.08.15.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 15:43:02 -0800 (PST)
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
Subject: [PATCH v2 5/6] clk: samsung: Extract parent clock enabling to common function
Date:   Wed,  8 Feb 2023 17:43:12 -0600
Message-Id: <20230208234313.23863-6-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208234313.23863-1-semen.protsenko@linaro.org>
References: <20230208234313.23863-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Extract parent clock enabling from exynos_arm64_register_cmu() to
dedicated function.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
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

