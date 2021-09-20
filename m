Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-25.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HK_RANDOM_FROM,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,USER_IN_DEF_DKIM_WL
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA464C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Sep 2021 03:14:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8EBE861159
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Sep 2021 03:14:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231929AbhIUDP5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Sep 2021 23:15:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349441AbhIUC0g (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Sep 2021 22:26:36 -0400
Received: from mail-pf1-x449.google.com (mail-pf1-x449.google.com [IPv6:2607:f8b0:4864:20::449])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36B66C1E327F
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Sep 2021 12:04:36 -0700 (PDT)
Received: by mail-pf1-x449.google.com with SMTP id i20-20020aa796f4000000b00447c2f4d37bso2460068pfq.22
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Sep 2021 12:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=1U1dAkNma+fdm4jSudwakO8vMm1r2kh0beegFJljEIo=;
        b=TsHSnvzBbN84En7oW+PCc/zCFk/EPvWEaZq3R1414WOF/Lxq87g7OGRzKBHv1TXrEv
         DnOEaQs30DS/YggJ9M5f2Bxr6hCk6cr8OHjuawahsXa3C8m/XumaVTwCS+HDzWDxwjoq
         qhDO+FXCI6890cJfK227EBAhEmryB1vMgIhniqlQ6moP2UMDhqnALwM+GfNmkHe9t50A
         m2SHFLSFPlLr2mtr99EItwUsHR96QBKFNiQzORKb7ioLjWDnO1hoar2F9Ezj+aL0Mogf
         l8Dfu6cR7c5kTvkVTjyBRsrZLeAd010VW19y91ZT+dIV6hFh62OxcrN2I7k8ekicrUBe
         gByg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=1U1dAkNma+fdm4jSudwakO8vMm1r2kh0beegFJljEIo=;
        b=v8wzdZirRTpB6CFvav80+A6/QjmT8dHPW6jtSfqCPB5UK77NswmMU11icZdOSAMyxA
         jXN6Stm4xY+fxR52hJhr5e8Zy+NWUDSuUE8wHmbzvWH0iLJVuO1p1QEIHx7MonRBcBPx
         YfHpsbqNzkmPfjvzSO5C8So8cWNo1FfqtRMuprIelRkIWGmHTgQNo1+ZsGd+6hz/F4d9
         fMmutcEig67GJrHBJc3zZ52omxt8rkVfaKz2Do6JRaBIiiWqBk8biy/cRk456hCiKLHO
         03ratOlMnZNvJscVeV2yIdIxuTxj2L+04CSWGfbqk9Cy7KhL+TzJiBPI0MGRV9jCh7v3
         2kwA==
X-Gm-Message-State: AOAM5320wbFtDRndULEu8kve9ripL78IKyGQ8f+ZDgizrZ6wcZog8Uf+
        f494sjLQZahRFwR5SehJVgQL4CjV89qeuK7qE6c=
X-Google-Smtp-Source: ABdhPJwgy8dNNqo0W9D+WwgAi9NSG0PA3TseGreGWU8Y0X9DDCX1gdgvL88O56C484HZUhvjjZWM2GLGCjv/Xb7H9XA=
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a05:6a00:16ca:b0:413:d3f7:646f with
 SMTP id l10-20020a056a0016ca00b00413d3f7646fmr26187055pfc.7.1632164675704;
 Mon, 20 Sep 2021 12:04:35 -0700 (PDT)
Date:   Mon, 20 Sep 2021 19:03:46 +0000
In-Reply-To: <20210920190350.3860821-1-willmcvicker@google.com>
Message-Id: <20210920190350.3860821-2-willmcvicker@google.com>
Mime-Version: 1.0
References: <20210920190350.3860821-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.33.0.464.g1972c5931b-goog
Subject: [PATCH v1 1/4] clk: samsung: change COMMON_CLK_SAMSUNG default config logic
From:   Will McVicker <willmcvicker@google.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Will McVicker <willmcvicker@google.com>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

COMMON_CLK_SAMSUNG is selected by ARCH_EXYNOS which forces this config
to be built-in when ARCH_EXYNOS is enabled. Switch the logic to use a
"default y if ARCH_EXYNOS" to provide flexibilty for vendors to disable
or modularize this driver.

I verified the .config is identical with and without this change.

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 arch/arm64/Kconfig.platforms | 1 -
 drivers/clk/samsung/Kconfig  | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index b0ce18d4cc98..3a66ed43088d 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -91,7 +91,6 @@ config ARCH_BRCMSTB
 
 config ARCH_EXYNOS
 	bool "ARMv8 based Samsung Exynos SoC family"
-	select COMMON_CLK_SAMSUNG
 	select EXYNOS_CHIPID
 	select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
 	select EXYNOS_PMU
diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
index 0441c4f73ac9..f3e189a06b03 100644
--- a/drivers/clk/samsung/Kconfig
+++ b/drivers/clk/samsung/Kconfig
@@ -2,6 +2,7 @@
 # Recent Exynos platforms should just select COMMON_CLK_SAMSUNG:
 config COMMON_CLK_SAMSUNG
 	bool "Samsung Exynos clock controller support" if COMPILE_TEST
+	default y if ARCH_EXYNOS
 	select S3C64XX_COMMON_CLK if ARM && ARCH_S3C64XX
 	select S5PV210_COMMON_CLK if ARM && ARCH_S5PV210
 	select EXYNOS_3250_COMMON_CLK if ARM && SOC_EXYNOS3250
-- 
2.33.0.464.g1972c5931b-goog

