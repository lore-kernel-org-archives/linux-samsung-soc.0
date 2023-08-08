Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A29C001B0
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Aug 2023 18:27:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235852AbjHHS1y (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Aug 2023 14:27:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235855AbjHHS1d (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Aug 2023 14:27:33 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA2D5A29F4
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Aug 2023 10:43:12 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fe4a89e7efso35177455e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Aug 2023 10:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691516591; x=1692121391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6MmEGhsWcyV2tJiWGbgG48WJpgMlPeUsMr9lr8DHG50=;
        b=tMlndwvu6ORnb5Qt99IRd+Y0FfXZvrG+eWy1pmcZj5wKOAHnnSlLtq2WJAfoX8hoRl
         F8drAAGlVffzN0PocUjuMEc4bc1ix7OjBaC/kt2ug62kmVh3AYr4SKoYGigU0WCme/7t
         xym/dzNd31Gb/x1OeXpuqylkiv3m1S71d3UCL5GA6oLdthWogbN7gN60sE/ucD05/IpJ
         8gmWCLwksZZSIe4FtD6hp5hsW5wls2lPm6i/592zICLtJX9GWwCSeMfeUxD2IchgGl5F
         s9kbtnzWDM3STGdU3Nahb/iZDnjPfGAswSFLiMf6Kn/VXlZYuCCnb56Xix1Ae/2rPIVZ
         fyGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691516591; x=1692121391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6MmEGhsWcyV2tJiWGbgG48WJpgMlPeUsMr9lr8DHG50=;
        b=gKgBFbTXAdp/fahAW56Rn1ZTSsxZEcsK17+hW7IPrOmL6nc9pNtcBB0IUuPAlZD+Ks
         lppKhYSv0ZKcbftCOA5Ns3mmRvom517ct/Xzd7UQ2L0Mt9mUJUeRGsSjwEqLpFuPkDIm
         3xznzcso29h+dVyWWgUB+wxOh9maPKz2QQYEdDLMRLb3oRrHrC9RmXOFu8opIXoHG5DJ
         9cdOVGic6BPzrRmTbZ9st7pfeMZxqJHjO+c/iKLW7ObF7J0UgE37IiA2z3QJL/eT2FhG
         Pj6bU7H+2p2XwCYcZFwPQT0n+yA+vPxrl4riX0vFO+MuT5C6vJlfEgXWNh8rt1Hxr50P
         p7Ug==
X-Gm-Message-State: AOJu0YzSyLiB2o74VAcv9KVG5PNor9Tlt29CWfSKrXfDcYqKptv9BGW2
        aehVjtZk3T+1fvWOqkiVdZ4OSaphK//iWLiZl3Y=
X-Google-Smtp-Source: AGHT+IHKz5Zsyb9uLFLG9UFYYyG8FqN+IRe8yffZvnZAPP1i84HeUdZsdHqQNw+tO7uYnme50hdlgw==
X-Received: by 2002:a5d:5253:0:b0:317:cff4:7357 with SMTP id k19-20020a5d5253000000b00317cff47357mr7262024wrc.20.1691483266358;
        Tue, 08 Aug 2023 01:27:46 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id s18-20020adfeb12000000b0031779a6b451sm12861246wrn.83.2023.08.08.01.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 01:27:45 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 02/11] clk: samsung: exynos4: do not define number of clocks in bindings
Date:   Tue,  8 Aug 2023 10:27:29 +0200
Message-Id: <20230808082738.122804-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808082738.122804-1-krzysztof.kozlowski@linaro.org>
References: <20230808082738.122804-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Number of clocks supported by Linux drivers might vary - sometimes we
add new clocks, not exposed previously.  Therefore this number of clocks
should not be in the bindings, because otherwise we should not change
it.

Define number of clocks per each clock controller inside the driver
directly.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/samsung/clk-exynos4.c        | 5 ++++-
 drivers/clk/samsung/clk-exynos4412-isp.c | 5 ++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
index 43207257a9cc..4ec41221e68f 100644
--- a/drivers/clk/samsung/clk-exynos4.c
+++ b/drivers/clk/samsung/clk-exynos4.c
@@ -135,6 +135,9 @@
 #define PWR_CTRL1_USE_CORE1_WFI			(1 << 1)
 #define PWR_CTRL1_USE_CORE0_WFI			(1 << 0)
 
+/* NOTE: Must be equal to the last clock ID increased by one */
+#define CLKS_NR					(CLK_DIV_CORE2 + 1)
+
 /* the exynos4 soc type */
 enum exynos4_soc {
 	EXYNOS4210,
@@ -1275,7 +1278,7 @@ static void __init exynos4_clk_init(struct device_node *np,
 	if (!reg_base)
 		panic("%s: failed to map registers\n", __func__);
 
-	ctx = samsung_clk_init(NULL, reg_base, CLK_NR_CLKS);
+	ctx = samsung_clk_init(NULL, reg_base, CLKS_NR);
 	hws = ctx->clk_data.hws;
 
 	samsung_clk_of_register_fixed_ext(ctx, exynos4_fixed_rate_ext_clks,
diff --git a/drivers/clk/samsung/clk-exynos4412-isp.c b/drivers/clk/samsung/clk-exynos4412-isp.c
index 1470c15e95da..a70c2b06a61a 100644
--- a/drivers/clk/samsung/clk-exynos4412-isp.c
+++ b/drivers/clk/samsung/clk-exynos4412-isp.c
@@ -22,6 +22,9 @@
 #define E4X12_GATE_ISP0		0x0800
 #define E4X12_GATE_ISP1		0x0804
 
+/* NOTE: Must be equal to the last clock ID increased by one */
+#define CLKS_NR_ISP		(CLK_ISP_DIV_MCUISP1 + 1)
+
 /*
  * Support for CMU save/restore across system suspends
  */
@@ -121,7 +124,7 @@ static int __init exynos4x12_isp_clk_probe(struct platform_device *pdev)
 	if (!exynos4x12_save_isp)
 		return -ENOMEM;
 
-	ctx = samsung_clk_init(dev, reg_base, CLK_NR_ISP_CLKS);
+	ctx = samsung_clk_init(dev, reg_base, CLKS_NR_ISP);
 
 	platform_set_drvdata(pdev, ctx);
 
-- 
2.34.1

