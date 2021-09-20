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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F587C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Sep 2021 03:14:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42F3061159
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Sep 2021 03:14:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231933AbhIUDP6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Sep 2021 23:15:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349472AbhIUC0k (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Sep 2021 22:26:40 -0400
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com [IPv6:2607:f8b0:4864:20::749])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1390BC1E3A51
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Sep 2021 12:04:42 -0700 (PDT)
Received: by mail-qk1-x749.google.com with SMTP id bi14-20020a05620a318e00b00432f0915dd6so83155245qkb.6
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Sep 2021 12:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=341NPsK1ybPLUbD5QtJe4YMBG0Z2roU4z5iQWq3CxjE=;
        b=PY2KzdrPPFD4VV7+T49T1pYsHJHNpfX+Yb4N83tMgwWRKpG8VTQwwypwHR0xTEaO7Y
         KujqtZxRb/QqvZU6nzLfNz9z4pP3L1tn9ERsb3qyD+jlkqruHiN9FUGcAAsQxCIVzLYT
         N4XNEC8hiDrDVWHw3FvjQuhLg0lhIRW4tL6IN3R39HF3CnpkS7X7Oh9gveDpBWz0Ljx7
         BhqR2Q1avZIE30a24d5cL23W+EUIfhZJeRE60EVAL31bOCo+CQg5RyC+d6oCzrNz1FKQ
         T8hELjPZC1TTzhG+n0yG2rg+8XaFhavT9So4+d1utCeW0j8DGOQBtyZ52O9yD5gwZGMF
         8o3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=341NPsK1ybPLUbD5QtJe4YMBG0Z2roU4z5iQWq3CxjE=;
        b=e/9kJhO6PDDxgw6BgRIyXrlfgPNedUEV7y1c8F3OrvMIJ9L4w8Rsg709CP3y8Kl1IO
         om9suklL+OSpSC8X2yRH4kORLlNq9Bi3SzLD86MKGIqh1c4FO2/lCyM4xVoq4SIAesJB
         pDb+9rUO4nZn2ypMERCyAKLKBil2ACm0HHgfXp7s2sRG66H0wMWL4hJy/pJ2yBErovTz
         jqVxNvN+NyLJh+5xFKFIjc/VSVOvPhkaT7Kpqkgct58OhQNNLtQUPRwcsruwZp0Or5oE
         5unUUlziU3ZLI2p9gYnQimgO8n6SyzEzRLxo34rQROl3MY5Rby1QzYQsAU5qtU+Zavpu
         ercA==
X-Gm-Message-State: AOAM533gFPBG8sUuiZVL5FdqMvR2IAPxFKg+vzI1PgXZKrOec59ltVzq
        mH0TZ1KGRfOAHNBz1Du/nTdztd3h8hEbDkD7RCU=
X-Google-Smtp-Source: ABdhPJx92NOBqmltQd2ehK4f/WwOBUNSGREkXv8mTXpax7NQQDNXJUOgCnldX1b1QMJdT+igRJpcRZgk+LTJWoLX5qA=
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a05:6214:12af:: with SMTP id
 w15mr17401131qvu.66.1632164680013; Mon, 20 Sep 2021 12:04:40 -0700 (PDT)
Date:   Mon, 20 Sep 2021 19:03:48 +0000
In-Reply-To: <20210920190350.3860821-1-willmcvicker@google.com>
Message-Id: <20210920190350.3860821-4-willmcvicker@google.com>
Mime-Version: 1.0
References: <20210920190350.3860821-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.33.0.464.g1972c5931b-goog
Subject: [PATCH v1 3/4] pinctrl: samsung: change PINCTRL_EXYNOS default config logic
From:   Will McVicker <willmcvicker@google.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Will McVicker <willmcvicker@google.com>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Switching the default config logic of PINCTRL_EXYNOS to use "default
y if ARCH_EXYNOS" versus having ARCH_EXYNOS directly select the config.
This gives vendors the flexibility to disable the config or modularize
it in the presence of a generic kernel.

Verified this change doesn't effect the .config.

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 arch/arm64/Kconfig.platforms    | 1 -
 drivers/pinctrl/samsung/Kconfig | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 6a006490c9b9..a884e5da8b0f 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -93,7 +93,6 @@ config ARCH_EXYNOS
 	bool "ARMv8 based Samsung Exynos SoC family"
 	select HAVE_S3C_RTC if RTC_CLASS
 	select PINCTRL
-	select PINCTRL_EXYNOS
 	select PM_GENERIC_DOMAINS if PM
 	help
 	  This enables support for ARMv8 based Samsung Exynos SoC family.
diff --git a/drivers/pinctrl/samsung/Kconfig b/drivers/pinctrl/samsung/Kconfig
index dfd805e76862..483acb8ac1f6 100644
--- a/drivers/pinctrl/samsung/Kconfig
+++ b/drivers/pinctrl/samsung/Kconfig
@@ -12,6 +12,7 @@ config PINCTRL_EXYNOS
 	bool "Pinctrl common driver part for Samsung Exynos SoCs"
 	depends on OF_GPIO
 	depends on ARCH_EXYNOS || ARCH_S5PV210 || COMPILE_TEST
+	default y if ARCH_EXYNOS
 	select PINCTRL_SAMSUNG
 	select PINCTRL_EXYNOS_ARM if ARM && (ARCH_EXYNOS || ARCH_S5PV210)
 	select PINCTRL_EXYNOS_ARM64 if ARM64 && ARCH_EXYNOS
-- 
2.33.0.464.g1972c5931b-goog

