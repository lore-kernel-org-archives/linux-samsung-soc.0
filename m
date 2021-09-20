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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14AA5C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Sep 2021 03:14:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDD6A61050
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Sep 2021 03:14:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231931AbhIUDP6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 20 Sep 2021 23:15:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349457AbhIUC0k (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 20 Sep 2021 22:26:40 -0400
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71590C1E3A4B
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Sep 2021 12:04:38 -0700 (PDT)
Received: by mail-pj1-x104a.google.com with SMTP id v10-20020a17090ac90a00b0019936bc24c7so966628pjt.7
        for <linux-samsung-soc@vger.kernel.org>; Mon, 20 Sep 2021 12:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=qzAEfbo0gBC3by+vg7/mN2onaOGI++gGn1lEWAXL/J0=;
        b=TIvje/75HLPEPbCASCaGqWu63p0aaRi38LtrMRKc79saZRiACJVhAE049lXenxktKF
         oY8RNEVFHwGMjv+xb9uG6X2PRZ95FgyJoLU13e7n8v7En2ZTah47BrPv6slTvVAlSKR+
         vEjDDrojxUzNswpEez0RDopiQJ5o7E8JdkZuaLATohfvuECu8C4z83jzn2lDJ3Aj+FlY
         6ahdoPq9wbqLDFBVqKha8F/5YRH7TeaqgLCEWbswtbTsFq5FHt846Fh701HxlId+mudg
         XeJNGVSQ0E+D0LGbv5AvT265j/Yz4bJgr6jPkGitzmI3GQYO14ITxtGXNouO2q0UIq02
         6l9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=qzAEfbo0gBC3by+vg7/mN2onaOGI++gGn1lEWAXL/J0=;
        b=A37cBabFy9Na+2zbrYAmi2naEvBFyG179b//14M9Mc1BdB6t8Bc4UOxgGlhDSHygRe
         aKzrhG2FpPaDom1a1qdMTA+CYUvAuxTm2lWi80uOaByMM7vYmTeQjlwz6IOArz/kFhYi
         INUQ/lD0B931+saS36MqZ7ReuDmWzdAcwCvOOOFh9Yo8AsErhwUcwzkW+pMpn+Q7GAy2
         jjsJHKmGtv1E3uE72elj5sHEfDo6Hu7iwCQ+iH7VVibV3G4h8AMDBhs0olM3efZodtla
         O9rurAN6IjvfwjINPFGA7NvDM30FSoxaT9pKBGnT3q3jn0e3gHUwH05qBjfBJKiN1+qR
         5U5Q==
X-Gm-Message-State: AOAM533HsxuWECuyWX8HJYMgtPjb2krHxtwZnGiOr47pmvC39ktiPpN3
        JVqGf2kmkkbflCLmIAMkMiW2Hu8Oo0EeFmKiQ+w=
X-Google-Smtp-Source: ABdhPJx2oGjcRxfnoo6TGqBkK3fZFSDMnVL/4q/T0eUkytitMXnCP+uC02k36cXYYDp2tesX0kSgAon1C8VIyEhC1Kc=
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a63:1f45:: with SMTP id
 q5mr24380379pgm.385.1632164677870; Mon, 20 Sep 2021 12:04:37 -0700 (PDT)
Date:   Mon, 20 Sep 2021 19:03:47 +0000
In-Reply-To: <20210920190350.3860821-1-willmcvicker@google.com>
Message-Id: <20210920190350.3860821-3-willmcvicker@google.com>
Mime-Version: 1.0
References: <20210920190350.3860821-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.33.0.464.g1972c5931b-goog
Subject: [PATCH v1 2/4] soc: samsung: change SOC_SAMSUNG default config logic
From:   Will McVicker <willmcvicker@google.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Will McVicker <willmcvicker@google.com>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Switch the default logic to enable SOC_SAMSUNG and it's sub-configs to
be enabled by default via "default y if ARCH_EXYNOS" versus being
selected by the ARCH_EXYNOS config directly. This allows vendors to
disable these configs if they wish and provides additional flexibility
to modularize them in the presence of a generic kernel.

There are no .config differences with this change. The configs
SOC_SAMSUNG, EXYNOS_CHIPID, EXYNOS_PM_DOMAINS, and EXYNOS_PMU still
remain enabled by default.

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 arch/arm64/Kconfig.platforms | 4 ----
 drivers/soc/samsung/Kconfig  | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 3a66ed43088d..6a006490c9b9 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -91,14 +91,10 @@ config ARCH_BRCMSTB
 
 config ARCH_EXYNOS
 	bool "ARMv8 based Samsung Exynos SoC family"
-	select EXYNOS_CHIPID
-	select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
-	select EXYNOS_PMU
 	select HAVE_S3C_RTC if RTC_CLASS
 	select PINCTRL
 	select PINCTRL_EXYNOS
 	select PM_GENERIC_DOMAINS if PM
-	select SOC_SAMSUNG
 	help
 	  This enables support for ARMv8 based Samsung Exynos SoC family.
 
diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
index 5745d7e5908e..9402c02bc9de 100644
--- a/drivers/soc/samsung/Kconfig
+++ b/drivers/soc/samsung/Kconfig
@@ -4,6 +4,7 @@
 #
 menuconfig SOC_SAMSUNG
 	bool "Samsung SoC driver support" if COMPILE_TEST
+	default y if ARCH_EXYNOS
 
 if SOC_SAMSUNG
 
@@ -15,6 +16,7 @@ config EXYNOS_ASV_ARM
 config EXYNOS_CHIPID
 	bool "Exynos ChipID controller and ASV driver" if COMPILE_TEST
 	depends on ARCH_EXYNOS || COMPILE_TEST
+	default y if ARCH_EXYNOS
 	select EXYNOS_ASV_ARM if ARM && ARCH_EXYNOS
 	select MFD_SYSCON
 	select SOC_BUS
@@ -24,6 +26,7 @@ config EXYNOS_CHIPID
 config EXYNOS_PMU
 	bool "Exynos PMU controller driver" if COMPILE_TEST
 	depends on ARCH_EXYNOS || ((ARM || ARM64) && COMPILE_TEST)
+	default y if ARCH_EXYNOS
 	select EXYNOS_PMU_ARM_DRIVERS if ARM && ARCH_EXYNOS
 
 # There is no need to enable these drivers for ARMv8
@@ -34,6 +37,7 @@ config EXYNOS_PMU_ARM_DRIVERS
 config EXYNOS_PM_DOMAINS
 	bool "Exynos PM domains" if COMPILE_TEST
 	depends on (ARCH_EXYNOS && PM_GENERIC_DOMAINS) || COMPILE_TEST
+	default y if (ARCH_EXYNOS && PM_GENERIC_DOMAINS)
 
 config SAMSUNG_PM_DEBUG
 	bool "Samsung PM Suspend debug"
-- 
2.33.0.464.g1972c5931b-goog

