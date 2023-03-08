Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 550C1C74A4B
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Mar 2023 23:38:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230219AbjCHXie (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Mar 2023 18:38:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229751AbjCHXic (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Mar 2023 18:38:32 -0500
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88C3B5BD9B
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Mar 2023 15:38:28 -0800 (PST)
Received: by mail-ot1-x332.google.com with SMTP id l15-20020a9d7a8f000000b0069447f0db6fso141089otn.4
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Mar 2023 15:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678318708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=woOYONkToPVHYWga31WFD9txV73HBu+FiarlM+DWulI=;
        b=lRsJ3IRNiUqFgrEUYgPttSw5MR8Z9Yh9RHQ9H58mztAYJYPUN5XZ/t1Gl2eOU02Dkp
         LytKW3GxqUFuDM4Hh3yKiGDtDsUEavCb5iIJD8/eOHWJB9G/G9spgqsfLbNfO6n0uAfW
         nveUzUqxgvsRb4KEU+Ty/ovknkLWziy0xmkick+JMXWmd5AWRPVZP9IT8XeYd/iyW7n+
         sKhnlMom+Py8EVkMaE9B1ZhUGQoxL6N508ImCb5NGuhwcIUB02YFijIpsmVjxhDWbRca
         IdU0ZHAjfaRx92tPGYUzOcterNKUIkIbS8DPVhp3IBtHjvZBsSEf7NTTVNEq8eorD68U
         OBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678318708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=woOYONkToPVHYWga31WFD9txV73HBu+FiarlM+DWulI=;
        b=YDEBp4gbVlZGYiGDtUVgNe0Lau6aJgq5AGalZcktfJQRPLePk09TdvPQHm41Io+KtI
         kZv+7vRwW/fbuPh0eaTfPz4Ww75Au9B7er9gAZAEo0nNDfegLePz0G+M3urSDnWhlzKQ
         MXUeeK75gqFi7BHKCITpjlCN0AvqxD7tcoAdW7xqYSjwRlBqEADZ9h0GvlMO1a9f1Vgc
         6EvBQMCMWYHkmCMEFwe2o9dQk5zqzERmuaSrUQJ/tGP7rGDuijS8SGHcioxjxT1lff42
         zIj6vMrWPedTSVDLSnJI6MdXNsS2466uG/RSdGz+iJMwlJ5wjUZC4j4qzbDptjIRd3Qb
         /FlA==
X-Gm-Message-State: AO0yUKWGnR3/KY0jVzSLDqgkC5Yrf7oumEC/zWmj+NQJDTQKyVNSGA65
        0H2FPMSkNvmrOJoGqBh90ZutEA==
X-Google-Smtp-Source: AK7set/sBQMg+Sa7FJqtY3KmdnHRg0UVZJhWENSlY8qIYW07sgauEXFUt9pV/Pb7xM+ywbZPG/xINQ==
X-Received: by 2002:a05:6830:1614:b0:693:c9f9:64ab with SMTP id g20-20020a056830161400b00693c9f964abmr9781546otr.3.1678318707846;
        Wed, 08 Mar 2023 15:38:27 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id x2-20020a9d6282000000b00690eeb8b436sm6899431otk.65.2023.03.08.15.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 15:38:27 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 3/7] clk: samsung: Implement PM SMC calls for ARM64 Exynos SoCs
Date:   Wed,  8 Mar 2023 17:38:18 -0600
Message-Id: <20230308233822.31180-4-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308233822.31180-1-semen.protsenko@linaro.org>
References: <20230308233822.31180-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Exynos850 requires extra TZPC handling to keep CMU registers non-secure
(accessible from the kernel) after PM resume. It's done using a specific
SMC call to the EL3 monitor. Implement corresponding SMC calls in
suspend and resume functions. Perform those calls when the parent (bus)
clock is running to avoid SMC freezes. The "samsung,tzpc" property is
used to specify the TZPC register address for those calls (for each
particular domain). If that property is not provided, SMC calls won't be
performed, thus keeping the compatibility with CMUs and platforms where
that SMC functionality is not needed.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/clk/samsung/clk-exynos-arm64.c | 39 ++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos-arm64.c b/drivers/clk/samsung/clk-exynos-arm64.c
index 7d8937caf22a..57e9bee7ec4d 100644
--- a/drivers/clk/samsung/clk-exynos-arm64.c
+++ b/drivers/clk/samsung/clk-exynos-arm64.c
@@ -8,6 +8,8 @@
  * This file contains shared functions used by some arm64 Exynos SoCs,
  * such as Exynos7885 or Exynos850 to register and init CMUs.
  */
+
+#include <linux/arm-smccc.h>
 #include <linux/clk.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
@@ -24,6 +26,12 @@
 #define GATE_OFF_START		0x2000
 #define GATE_OFF_END		0x2fff
 
+/* Power control SMC command and its parameters */
+#define SMC_CMD_PREPARE_PD_ONOFF		0x82000410
+#define EXYNOS_PD_RUNTIME_PM			2
+#define EXYNOS_GET_IN_PD_DOWN			0
+#define EXYNOS_WAKEUP_PD_DOWN			1
+
 struct exynos_arm64_cmu_data {
 	struct samsung_clk_reg_dump *clk_save;
 	unsigned int nr_clk_save;
@@ -34,6 +42,7 @@ struct exynos_arm64_cmu_data {
 	struct clk **pclks;
 	int nr_pclks;
 
+	unsigned int tzpc_addr;			/* address for PM SMC calls */
 	struct samsung_clk_provider *ctx;
 };
 
@@ -149,6 +158,22 @@ static int __init exynos_arm64_cmu_prepare_pm(struct device *dev,
 	return 0;
 }
 
+static int exynos_arm64_pm_smc(struct device *dev, bool on)
+{
+	struct exynos_arm64_cmu_data *data = dev_get_drvdata(dev);
+	struct arm_smccc_res res;
+	unsigned int pm_arg;
+
+	if (!data->tzpc_addr)
+		return 0;
+
+	pm_arg = on ? EXYNOS_WAKEUP_PD_DOWN : EXYNOS_GET_IN_PD_DOWN;
+	arm_smccc_smc(SMC_CMD_PREPARE_PD_ONOFF, pm_arg, data->tzpc_addr,
+		      EXYNOS_PD_RUNTIME_PM, 0, 0, 0, 0, &res);
+
+	return res.a0;
+}
+
 /**
  * exynos_arm64_register_cmu - Register specified Exynos CMU domain
  * @dev:	Device object; may be NULL if this function is not being
@@ -207,6 +232,8 @@ int __init exynos_arm64_register_cmu_pm(struct platform_device *pdev,
 	if (!data)
 		return -ENOMEM;
 
+	of_property_read_u32(np, "samsung,tzpc", (u32 *)&data->tzpc_addr);
+
 	platform_set_drvdata(pdev, data);
 
 	ret = exynos_arm64_cmu_prepare_pm(dev, cmu);
@@ -251,7 +278,7 @@ int __init exynos_arm64_register_cmu_pm(struct platform_device *pdev,
 int exynos_arm64_cmu_suspend(struct device *dev)
 {
 	struct exynos_arm64_cmu_data *data = dev_get_drvdata(dev);
-	int i;
+	int i, ret;
 
 	samsung_clk_save(data->ctx->reg_base, data->clk_save,
 			 data->nr_clk_save);
@@ -263,6 +290,10 @@ int exynos_arm64_cmu_suspend(struct device *dev)
 	samsung_clk_restore(data->ctx->reg_base, data->clk_suspend,
 			    data->nr_clk_suspend);
 
+	ret = exynos_arm64_pm_smc(dev, false);
+	if (ret)
+		return ret;
+
 	for (i = 0; i < data->nr_pclks; i++)
 		clk_disable_unprepare(data->pclks[i]);
 
@@ -274,13 +305,17 @@ int exynos_arm64_cmu_suspend(struct device *dev)
 int exynos_arm64_cmu_resume(struct device *dev)
 {
 	struct exynos_arm64_cmu_data *data = dev_get_drvdata(dev);
-	int i;
+	int i, ret;
 
 	clk_prepare_enable(data->clk);
 
 	for (i = 0; i < data->nr_pclks; i++)
 		clk_prepare_enable(data->pclks[i]);
 
+	ret = exynos_arm64_pm_smc(dev, true);
+	if (ret)
+		return ret;
+
 	samsung_clk_restore(data->ctx->reg_base, data->clk_save,
 			    data->nr_clk_save);
 
-- 
2.39.2

