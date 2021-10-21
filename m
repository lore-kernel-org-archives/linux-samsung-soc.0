Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A680CC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 06:35:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8C5D261372
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 06:35:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231238AbhJUGh3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Oct 2021 02:37:29 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:38394
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231208AbhJUGhU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 02:37:20 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CFFAB3F4BA
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 06:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634798103;
        bh=FmJ0rjr2j5+lZ1GrbJW3m6QcUxRmDvBVeUC/Lqmm3nw=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=WP18SOrx0BOOrHMAnutPxgIoglAs7Q5n7IJP0y53xk0WtLc4558xkVBkwFTLhDDLF
         iI5xyjIRDR7htOcux+KRNo/MMF9Pq9ETFbTQyyhLRPh3MRNPUOVFXYGuWNopzXdUcb
         uO0Up+0pByPgJbejYYF2UOJWMMAlNr7ldEmVZaTWhMv40DUrj7mV9FsdbNNcbw5uZT
         Lws3VUT/lHyDrhnHFpcWhka74kZqj5klysqMS6Olg/yyshWZfu0EMJzD0B1wCev9d9
         I/CWmcIydhpbTidXeVk3zWs8RMUESU/V3NWZ5wOIk+mASfg34BH81qkLb7VbCV/seN
         Q4G0tKlPpvUxA==
Received: by mail-lf1-f69.google.com with SMTP id f6-20020a056512228600b003fdc9741438so4227659lfu.18
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Oct 2021 23:35:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FmJ0rjr2j5+lZ1GrbJW3m6QcUxRmDvBVeUC/Lqmm3nw=;
        b=qtGTAtiP1ow9uKtw3zCSS0x/XBgxOcxnleqPS2MrDEvbGt4qMduaF3EF7ZWTr+EVDX
         bnAHv+epSZ237FmjX7v7SqH0sywMBmfpkBUe/aeDTi1fwomEUtx78Jvs1kMMUikInAJ6
         QV1oz3+3+2HK5/NXljwD5cTiDKovufNT5k102kii9X3xSoyISe3be2+UC68cAmvlljYB
         k10PhnmNB7vH+ZhJ1CYXTS9mCllfFXl0f4Rfsm5cX+M/PRuKinqhom7MDaqF+eusWDsT
         17oK9bhmQEUL6Sp0eHhhaBM5wER01tcqUCpxxJNIRsR+1nn5uS8YwMOdQb9QwxVO3KN5
         Qq+A==
X-Gm-Message-State: AOAM532cX5wrR5Z1Cp96+/oSIUs+Sb4KRzeUMJT+Jz2jYWiKuOYuCAGj
        dosF1BT7fp0IJo9YKGMmKWbTg6+qoTznrBNypnEwFXKvfBARXueaiQwoYpgDzry3cpSrxMu/apv
        l77ur7gQzPn56gOlZfHm8BnMHV1MtYyl5+N2h75KLEOoF5cnw
X-Received: by 2002:ac2:5210:: with SMTP id a16mr3742221lfl.279.1634798103081;
        Wed, 20 Oct 2021 23:35:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJza9ue2pg33DwBqRkVK1XuyGjUU2kIoIrQ+EuluMtZxge5KEKRL9s/NaBB4FHMl7nmgQnaK6w==
X-Received: by 2002:ac2:5210:: with SMTP id a16mr3742195lfl.279.1634798102828;
        Wed, 20 Oct 2021 23:35:02 -0700 (PDT)
Received: from kozik-lap.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id q20sm423805ljp.61.2021.10.20.23.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Oct 2021 23:35:02 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH] clocksource/drivers: depend on sub-architecture for Exynos MCT and Samsung PWM
Date:   Thu, 21 Oct 2021 08:35:00 +0200
Message-Id: <20211021063500.39314-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The Exynos MCT and Samsung PWM Timer clocksource drivers are not usable
on anything else than Samsung Exynos, S3C or S5P SoC platforms.  These
are integral parts of a SoC.  Even though the drivers are not user
selectable, still document the hardware architecture explicitly with
depends on ARCH_EXYNOS and others.  This also serves a purpose of
documenting use-case, if someone ever wonders whether to select the
driver for his platform.  No functional change, because drivers are
already selected by the platform described in depends. We follow similar
approach also for other SoC-specific drivers.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/clocksource/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clocksource/Kconfig b/drivers/clocksource/Kconfig
index 0f5e3983951a..3ff6e1f87246 100644
--- a/drivers/clocksource/Kconfig
+++ b/drivers/clocksource/Kconfig
@@ -418,12 +418,14 @@ config ATMEL_TCB_CLKSRC
 config CLKSRC_EXYNOS_MCT
 	bool "Exynos multi core timer driver" if COMPILE_TEST
 	depends on ARM || ARM64
+	depends on ARCH_EXYNOS || COMPILE_TEST
 	help
 	  Support for Multi Core Timer controller on Exynos SoCs.
 
 config CLKSRC_SAMSUNG_PWM
 	bool "PWM timer driver for Samsung S3C, S5P" if COMPILE_TEST
 	depends on HAS_IOMEM
+	depends on ARCH_EXYNOS || ARCH_S3C24XX || ARCH_S3C64XX || ARCH_S5PV210 || COMPILE_TEST
 	help
 	  This is a new clocksource driver for the PWM timer found in
 	  Samsung S3C, S5P and Exynos SoCs, replacing an earlier driver
-- 
2.30.2

