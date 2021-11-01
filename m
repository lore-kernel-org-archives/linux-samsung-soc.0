Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB72FC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  1 Nov 2021 19:35:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D426360187
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  1 Nov 2021 19:35:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbhKATiO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 1 Nov 2021 15:38:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbhKATiL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 1 Nov 2021 15:38:11 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B057BC0613B9
        for <linux-samsung-soc@vger.kernel.org>; Mon,  1 Nov 2021 12:35:37 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id w15so68044515edc.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 01 Nov 2021 12:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jJg2E2PZjjgu+8s1D3x+r4IQ/mozouniDkUsuWAbOxQ=;
        b=wYtr7iadpvUwY/TMc/2Q8HPKNi/z9n/VMDQEK0Cc0nvTIe6jwIoif8ptsdeuAl/DiK
         FMpHQTB7+3bVpB5IMWJX0E/5LhqTOKkScZNwI2LRBC6TqF+zu6ADbTs/KqtanEue8QlK
         QarqGB1wZ1333V4wqsg8ycyG1l9IA1vYl19vR+TLdxSCIZ8ZfP91hFgcvTgCpww4HVTq
         f9yXnnI/9TsrXIJE4Ov50FwA13Q3/LXji5XdIFmqFM6NFwzruO+TIa1BElDZVLhXgg6X
         HK1ArYqwcb3qB1U48C60BlGGYQN2Xrnnba1Y8RJKgEwLsdN+fhxJOUPvN3Lt7zl17vAi
         Xw7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jJg2E2PZjjgu+8s1D3x+r4IQ/mozouniDkUsuWAbOxQ=;
        b=umZkwvacAy3YVZ8PmRlbkUfwr1d17X7JjMlcTzFf8wDuhDfifQVurP2oW5NMh7x2LC
         JMoFtQhRAfeulPFA2MM3Zp1qltJicDYRwBTlAe85Hbp2d5a6s/hwwc1M0xpzDoPyHUaf
         n6UC8B5AtfhQO3EdGt3DCvz4gXZYdORZPKA3oDcGgjuWIkKAzfYHNA2NlqiP5NAif/aW
         NdZ8eoVyGn08z9MxVDL3to47REYrHzL9ffRIUVuTyi1JJT4kPR4RTE7OPqrgKHNljvRa
         0QjMoRMJ8iBld7QMM0JTq7xVyWDUJgEtJQCTgHmdUUSHz+5M5khO+NpN65emb1RdHkf3
         yLgg==
X-Gm-Message-State: AOAM5312kDQ0L4N+NrLthX1vzhfTeD8if4nRqdLcf4Cw1FulnqDzMQf/
        Ez6liRV5RHjjnt/Xbctpx7m79Q==
X-Google-Smtp-Source: ABdhPJxDe2EhUvzms0LEnj7lbftyQ/puvq2iCIoQ3jxubRDZpjngPJln0CQPd8jLz24nRtLkaC7PzQ==
X-Received: by 2002:a17:906:1749:: with SMTP id d9mr38637143eje.178.1635795336283;
        Mon, 01 Nov 2021 12:35:36 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id pw14sm2336124ejb.108.2021.11.01.12.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 12:35:35 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 2/2] arm64: platform: Enable Exynos Multi-Core Timer driver
Date:   Mon,  1 Nov 2021 21:35:31 +0200
Message-Id: <20211101193531.15078-3-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211101193531.15078-1-semen.protsenko@linaro.org>
References: <20211101193531.15078-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Marek Szyprowski <m.szyprowski@samsung.com>

Some ARM64 Exynos SoCs have MCT timer block, e.g. Exynos850 and
Exynos5433. CLKSRC_EXYNOS_MCT option is not visible unless COMPILE_TEST
is enabled. Select CLKSRC_EXYNOS_MCT option for ARM64 ARCH_EXYNOS like
it's done in arch/arm/mach-exynos/Kconfig, to enable MCT timer support
for ARM64 Exynos SoCs.

Even though ARM architected timer is available on all ARM64 SoCs, and
used for managing timer hardware and clock source events, MCT timer
still can be used as a wakeup source, as stated in commitae460fd9164b
("clocksource/drivers/exynos_mct: Prioritise Arm arch timer on arm64").
It's also nice to be able to test available MCT IP-core.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 1aa8b7073218..91f5e9568122 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -89,6 +89,7 @@ config ARCH_BRCMSTB
 config ARCH_EXYNOS
 	bool "ARMv8 based Samsung Exynos SoC family"
 	select COMMON_CLK_SAMSUNG
+	select CLKSRC_EXYNOS_MCT
 	select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
 	select EXYNOS_PMU
 	select PINCTRL
-- 
2.30.2

