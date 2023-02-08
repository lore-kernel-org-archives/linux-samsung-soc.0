Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775BFC05027
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Feb 2023 23:43:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbjBHXnN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Feb 2023 18:43:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229830AbjBHXnG (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Feb 2023 18:43:06 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8872F1C7C4
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Feb 2023 15:43:03 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id bx13so232500oib.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Feb 2023 15:43:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWb4xLniEmX+aWkTp2SPNOhVEYOvshRRUAHEhXXIsDk=;
        b=MtlXTC9QR7LQkVwUGxlZJvFnsxfQlHwErlGTzk4en0hUrTFa66zaJxERrMAOsV5mC6
         Vsiv7PmuV0SMUCsRpu5NW1VL/Q9tAAB7K/EnIYQEbKLgBVhbBAufeRwjTfZKYIMr6ts1
         8eCYCyhTfpf1TuZeOZM8YZH7o0MVFJYC5wlmv8qiu6A3t5VVATcBUxMvAcrOZIC8hJsh
         igUTl9owbOUaKnuH6reK53u9vxOdyHaPGACHyb4Do/AfXZK8hPm7OQD9QED/dGhe1rhj
         2mBKxCHiw9fjE9SwVTskkcaxCDAooTN6uqAbfKyvCyBazHpzh6yfShszbRDRz146cH6s
         KCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWb4xLniEmX+aWkTp2SPNOhVEYOvshRRUAHEhXXIsDk=;
        b=mB9qKO56ZH1n1VLaqnyxjW48Cudf9Y6TOYORXayAzVAYp2bLYRbE32YobXFl8BIoEM
         5joufw8NLZ6tFMe33oVKZp07434tbSwmIpYx0eXW4kW18ulXINll7tPX4ukUcb989kjd
         9SwDFSw0Iiiur1CTrtnuvkwQLMkyPVMQ7fIZxHrE3PUq+wSu9lct1jNTvEyrQaWap2Q6
         x/X+9dVWV5IKFGw23sg6gFyFYucIRXquM3LRrR3SmRbjDR2KBPxD4aPjJexKpWLl7Hh5
         rgrUqo+SRShKD6zeHDAk2rYee5qRRXnpO0S0Fe4uuPOGWWsKjHyxmkTdWmXQ82UMRNlL
         x1Aw==
X-Gm-Message-State: AO0yUKWRkmyjX295WhZQknKeTBi+Dx7aaAxM91UE9GsZGvMpmhv4x2Y9
        vIBSNxbW8b73oREmWt5S3JIUeA==
X-Google-Smtp-Source: AK7set8qZ/gZ5VjIpU6HFIYV2AnCDnlTwxC4sxKEMKVd8wyAUcpzOZ4d/yucYwLh1OiZEzMm7PgHog==
X-Received: by 2002:a54:468f:0:b0:378:951d:a13e with SMTP id k15-20020a54468f000000b00378951da13emr3664712oic.27.1675899781283;
        Wed, 08 Feb 2023 15:43:01 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id o131-20020aca4189000000b003786e78f2b5sm47497oia.9.2023.02.08.15.43.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Feb 2023 15:43:00 -0800 (PST)
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
Subject: [PATCH v2 4/6] clk: samsung: Extract clocks registration to common function
Date:   Wed,  8 Feb 2023 17:43:11 -0600
Message-Id: <20230208234313.23863-5-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208234313.23863-1-semen.protsenko@linaro.org>
References: <20230208234313.23863-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

It might be useful to have a separate clocks registration function, so
it can be called from different users. Extract that common code from
samsung_cmu_register_one() to samsung_cmu_register_clocks(). Also make
that new function global as it's going to be used in other modules
further.

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - Rebased on top of latest soc/for-next tree

 drivers/clk/samsung/clk.c | 46 ++++++++++++++++++++++++---------------
 drivers/clk/samsung/clk.h |  2 ++
 2 files changed, 30 insertions(+), 18 deletions(-)

diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
index 912dfbe5ac20..b6701905f254 100644
--- a/drivers/clk/samsung/clk.c
+++ b/drivers/clk/samsung/clk.c
@@ -335,6 +335,33 @@ void samsung_clk_extended_sleep_init(void __iomem *reg_base,
 }
 #endif
 
+/**
+ * samsung_cmu_register_clocks() - Register all clocks provided in CMU object
+ * @ctx: Clock provider object
+ * @cmu: CMU object with clocks to register
+ */
+void __init samsung_cmu_register_clocks(struct samsung_clk_provider *ctx,
+					const struct samsung_cmu_info *cmu)
+{
+	if (cmu->pll_clks)
+		samsung_clk_register_pll(ctx, cmu->pll_clks, cmu->nr_pll_clks);
+	if (cmu->mux_clks)
+		samsung_clk_register_mux(ctx, cmu->mux_clks, cmu->nr_mux_clks);
+	if (cmu->div_clks)
+		samsung_clk_register_div(ctx, cmu->div_clks, cmu->nr_div_clks);
+	if (cmu->gate_clks)
+		samsung_clk_register_gate(ctx, cmu->gate_clks,
+					  cmu->nr_gate_clks);
+	if (cmu->fixed_clks)
+		samsung_clk_register_fixed_rate(ctx, cmu->fixed_clks,
+						cmu->nr_fixed_clks);
+	if (cmu->fixed_factor_clks)
+		samsung_clk_register_fixed_factor(ctx, cmu->fixed_factor_clks,
+						  cmu->nr_fixed_factor_clks);
+	if (cmu->cpu_clks)
+		samsung_clk_register_cpu(ctx, cmu->cpu_clks, cmu->nr_cpu_clks);
+}
+
 /*
  * Common function which registers plls, muxes, dividers and gates
  * for each CMU. It also add CMU register list to register cache.
@@ -353,29 +380,12 @@ struct samsung_clk_provider * __init samsung_cmu_register_one(
 	}
 
 	ctx = samsung_clk_init(NULL, reg_base, cmu->nr_clk_ids);
+	samsung_cmu_register_clocks(ctx, cmu);
 
-	if (cmu->pll_clks)
-		samsung_clk_register_pll(ctx, cmu->pll_clks, cmu->nr_pll_clks);
-	if (cmu->mux_clks)
-		samsung_clk_register_mux(ctx, cmu->mux_clks,
-			cmu->nr_mux_clks);
-	if (cmu->div_clks)
-		samsung_clk_register_div(ctx, cmu->div_clks, cmu->nr_div_clks);
-	if (cmu->gate_clks)
-		samsung_clk_register_gate(ctx, cmu->gate_clks,
-			cmu->nr_gate_clks);
-	if (cmu->fixed_clks)
-		samsung_clk_register_fixed_rate(ctx, cmu->fixed_clks,
-			cmu->nr_fixed_clks);
-	if (cmu->fixed_factor_clks)
-		samsung_clk_register_fixed_factor(ctx, cmu->fixed_factor_clks,
-			cmu->nr_fixed_factor_clks);
 	if (cmu->clk_regs)
 		samsung_clk_extended_sleep_init(reg_base,
 			cmu->clk_regs, cmu->nr_clk_regs,
 			cmu->suspend_regs, cmu->nr_suspend_regs);
-	if (cmu->cpu_clks)
-		samsung_clk_register_cpu(ctx, cmu->cpu_clks, cmu->nr_cpu_clks);
 
 	samsung_clk_of_add_provider(np, ctx);
 
diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
index 3fd6c0868921..ab9c3d7a25b3 100644
--- a/drivers/clk/samsung/clk.h
+++ b/drivers/clk/samsung/clk.h
@@ -377,6 +377,8 @@ void samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 void samsung_clk_register_cpu(struct samsung_clk_provider *ctx,
 		const struct samsung_cpu_clock *list, unsigned int nr_clk);
 
+void samsung_cmu_register_clocks(struct samsung_clk_provider *ctx,
+				 const struct samsung_cmu_info *cmu);
 struct samsung_clk_provider *samsung_cmu_register_one(
 			struct device_node *,
 			const struct samsung_cmu_info *);
-- 
2.39.1

