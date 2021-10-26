Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 748D5C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Oct 2021 11:59:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 467A860F0F
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 26 Oct 2021 11:59:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233897AbhJZMBo (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 26 Oct 2021 08:01:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231495AbhJZMBn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 26 Oct 2021 08:01:43 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1933C061767
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Oct 2021 04:59:19 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id x192so18343530lff.12
        for <linux-samsung-soc@vger.kernel.org>; Tue, 26 Oct 2021 04:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=85BwCPaPUHtT9osJtiBZEBY3ZDasvCEOaM7Ylyi8QL8=;
        b=K60jYV1zHtMnWk3mrz15ZGPS/PTHH3vmMdXuccIwrUnwrgdDxA7/gaelCPgYhQKanQ
         4e9xhffNGbhZQLdGOo1iH4o0ATDrxIq+bEJ2dx4QMNUT+wHKtrc1PIUyWV9HcFGM83zm
         dwAqPwomivHB/5cUlR7Qb+Ha1hgMJrmzHtiAq8uZQyEr3SfHT5Wk4SNSy+zEYmIykxT+
         EQ5vL7GjSD8ggx+rUS49D+Ki7KW2/T1ht0w7hEjG1b7Anqz21X1VJ0mdkMI6nBQ2p+ST
         rI+7bJPO5N3OoTkbmUH6iBHiwBkROhNoxzXJr4sQ3i5onELkeEXm5EbZ1/S+4bbzhgor
         9/cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=85BwCPaPUHtT9osJtiBZEBY3ZDasvCEOaM7Ylyi8QL8=;
        b=N8QfRkX1Cr+6rNDTKmQe6E3U1u2Vl9W3KuQSniWmyEiCDxK9WHUT93MkkQTqVr7f81
         s6A5MWK56rNfbv4rp5cHxMd/zfqC0kqY+1iF5PutIXbR1IFJD92VPU/C4C2l8GmaM+C8
         RX7637hJQUJxoEzuRvJS0CLs+8vaWQ/2NwJpbrLbYSCSeV7lfN1QcJm7E2rcrEu0E3zM
         3Uo6tOEvbq5v/7xB9aa1pwwcZcCM1pOOVM+hqd3XghzBnIaCo34PQBlKZH5r8VRYaaiN
         U0qM6w1niGzlBnPk3o4BdTqA2cc1Yxxjaa/voYYjsN+jV9HBdFsVxyeApbechPJgyyTN
         4zIA==
X-Gm-Message-State: AOAM533MRlSEosDkIlkCdKWtLfUkvIcNKPZkvNsEQ1D2k92S3s23KNkH
        YRticAYp4ruLF0HPe8urnL7JiGQEidEQUZQl
X-Google-Smtp-Source: ABdhPJyBLtrSGYC9ap6Hn68rkt1HPKlNRpB5+PleW5X04PcnTdOWY1ILt3UowmrWrN/pdiLhAQnx4g==
X-Received: by 2002:a05:6512:22c5:: with SMTP id g5mr22417386lfu.646.1635249558087;
        Tue, 26 Oct 2021 04:59:18 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id j26sm459759lfb.84.2021.10.26.04.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Oct 2021 04:59:17 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH] arm64: Kconfig: Enable MCT timer for ARCH_EXYNOS
Date:   Tue, 26 Oct 2021 14:59:16 +0300
Message-Id: <20211026115916.31553-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Some ARM64 Exynos SoCs have MCT timer block, e.g. Exynos850 and
Exynos5433. CLKSRC_EXYNOS_MCT option is not visible unless COMPILE_TEST
is enabled. Select CLKSRC_EXYNOS_MCT option for ARM64 ARCH_EXYNOS like
it's done in arch/arm/mach-exynos/Kconfig, to enable MCT timer support
for ARM64 Exynos SoCs.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 1aa8b7073218..7a6ef7883a0b 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -95,6 +95,7 @@ config ARCH_EXYNOS
 	select PINCTRL_EXYNOS
 	select PM_GENERIC_DOMAINS if PM
 	select SOC_SAMSUNG
+	select CLKSRC_EXYNOS_MCT
 	help
 	  This enables support for ARMv8 based Samsung Exynos SoC family.
 
-- 
2.30.2

