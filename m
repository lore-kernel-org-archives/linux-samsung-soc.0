Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0A48C64ED6
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 23 Feb 2023 04:23:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233279AbjBWEXH (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 22 Feb 2023 23:23:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233125AbjBWEWg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 22 Feb 2023 23:22:36 -0500
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1911049889
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Feb 2023 20:21:26 -0800 (PST)
Received: by mail-ot1-x32d.google.com with SMTP id l13-20020a0568301d6d00b0068f24f576c5so1968203oti.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Feb 2023 20:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3rOeT+TlXHq+kYJRcc5stz7RolNpClrKSBYxv7SYDZo=;
        b=yhCAsDnjDQXPkSq2JXGYxr7DKODT6rJDVT7ABVTz0LPZCGng/9MX6BjredcfQt86+r
         H0e3oKJlyTqJ8MrCHvdLKdt5cQM+ypPuS7PTlEmHRkv1bzO9NeD9/gfJWLbsd8uwVku8
         jBbwhFjSJKYkmjjAldFM/FL26FJ64Nven8w7H2pS1N0rxYXApxgTwMLNOqfK7aLorV92
         v7OMXYVOziguas23Ag+hc9wMz9oBefPlB4NdDV0+5aCEeewAr9GjIPPyskus6RDaeZ97
         b92jROQUjLr9tCGUPuIXN+wienWQ7dZV5Dt3PLRc3rZr2q8fv0UV6Jes8npHCy6r7jyd
         IXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3rOeT+TlXHq+kYJRcc5stz7RolNpClrKSBYxv7SYDZo=;
        b=EHnI/rQsdKzRRDOGz62Ug5nLMdjZnSXJJJogstmO5knz2Zijs+wkvRU/rYAWXTHSmT
         pQaMkiyuGUT7P9TrBAB0XuFnBEk41rV1Q78OXAEhKpXqZwBvEhTO0D/Tycc/JlEnbMEd
         UoU2JpkK5HPJiD62CoUNYSgDxkWn6ultk+231IugZv+Os0fjFf2FCDKR/ERQVTdnio3d
         gN6aDd/PShbpkiRVguFRxTxkx7Wuq3g3jrouilQJpPJHlyolrzWoizAPnmt80C6whMAJ
         ML9AM9WC5MjPs8cVNzRLqb/PmmqoT1+FlCCvUkDMnm4893Gvn1vocj5Yx2HLCeQAT03g
         bmlA==
X-Gm-Message-State: AO0yUKW4ecTZbqyix857yNGfNzspf8blH/KWZD53V2UC4RiMiLS6uJsV
        /Wh1y6bJrJMR3YGpKFm5D+F6Zw==
X-Google-Smtp-Source: AK7set+lh60j/dD/b3OYUa4K/o8jntVzHLjpfTyTwS2d2UmMik103hQoAN8BIUNLOjLX6bvbM40Jlw==
X-Received: by 2002:a05:6830:550:b0:68b:c938:878a with SMTP id l16-20020a056830055000b0068bc938878amr1440059otb.16.1677126082172;
        Wed, 22 Feb 2023 20:21:22 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id y7-20020a9d5187000000b0068bb7bd2668sm2225332otg.73.2023.02.22.20.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 20:21:21 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     David Virag <virag.david003@gmail.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/6] clk: samsung: clk-pll: Implement pll0818x PLL type
Date:   Wed, 22 Feb 2023 22:21:30 -0600
Message-Id: <20230223042133.26551-4-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223042133.26551-1-semen.protsenko@linaro.org>
References: <20230223042133.26551-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

pll0818x PLL is used in Exynos850 SoC for CMU_G3D PLL. Operation-wise,
pll0818x is the same as pll0822x. The only difference is:
  - pl0822x is integer PLL with Middle FVCO (950 to 2400 MHz)
  - pl0818x is integer PLL with Low FVCO (600 to 1200 MHz)

Add pll0818x type as an alias to pll0822x.

Reviewed-by: Chanho Park <chanho61.park@samsung.com>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - Rebased on top of most recent soc/for-next tree
  - Added Chanho Park Reviewed-by tag

 drivers/clk/samsung/clk-pll.c | 1 +
 drivers/clk/samsung/clk-pll.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 5ceac4c25c1c..74934c6182ce 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -1314,6 +1314,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 			init.ops = &samsung_pll35xx_clk_ops;
 		break;
 	case pll_1417x:
+	case pll_0818x:
 	case pll_0822x:
 		pll->enable_offs = PLL0822X_ENABLE_SHIFT;
 		pll->lock_offs = PLL0822X_LOCK_STAT_SHIFT;
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 5d5a58d40e7e..0725d485c6ee 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -34,6 +34,7 @@ enum samsung_pll_type {
 	pll_1451x,
 	pll_1452x,
 	pll_1460x,
+	pll_0818x,
 	pll_0822x,
 	pll_0831x,
 	pll_142xx,
-- 
2.39.1

