Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE16AC2B9F8
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 25 May 2021 18:47:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 88DEA61409
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 25 May 2021 18:47:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbhEYSs7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 25 May 2021 14:48:59 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:60316 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbhEYSs6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 25 May 2021 14:48:58 -0400
Received: from mail-ua1-f71.google.com ([209.85.222.71])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1llc5Q-0002MF-0i
        for linux-samsung-soc@vger.kernel.org; Tue, 25 May 2021 18:47:28 +0000
Received: by mail-ua1-f71.google.com with SMTP id m11-20020a9f3fcb0000b029021dec910e95so6217424uaj.13
        for <linux-samsung-soc@vger.kernel.org>; Tue, 25 May 2021 11:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gcWgt1ET73NMcTCnJjiaPx5gb4lT9PoaXsd+kPCRPqY=;
        b=f6YImX6jg6DyicQGiDQQ8I+cpGifhSmXj6airlCESTnqehWBlJYgRzKSM7BzH3PUOa
         0LQXGgjsfK8j/SP1lI3zek+DZKZFOtZkZD2pcB9bBbF9de8g7j1hgYwEzYMNeAqqzPBg
         xbxAUdOU1A59b6PpCNETQ91cKRCKLLKIslGWOotpdmSOJy/P3/3uKMpQYpXhoe5WsidK
         WDutI+rJLdMYtjJb87FPxWuWgQGROTPU+wZXiJeEoPVW4ehQoZM+Xqm2zp7cqWkcTGYa
         e8Lc/MOZ0Ujlbb2D3dElRYabsmdlNxI6RZe14YzXErV1jBAcfIIdFS5hvqZ3EmeX7eFL
         CxTg==
X-Gm-Message-State: AOAM533/y29WztCuUJ4Coj/6+INQpiFVAjuDFyG+3wllbucYSQFieFhj
        CsJGUlZrxnPxcKvRRUF8UjfJL4cg15ZFypLrTnoaGwZ8roq6dCBDKs9iiE+fMDRbHuc5PU4AFFl
        D/tDuGDsvbdIMwdkv7br6dM783xJyi7AcByAuE1/Odmlov+Eh
X-Received: by 2002:a9f:2124:: with SMTP id 33mr28761560uab.134.1621968446517;
        Tue, 25 May 2021 11:47:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyDkZP8DPZJi2iv00dSIvvmqyX3P/sg0KsioFp8aLP7djkpx9wc7wtWOIe4/JpLHzBJA0h3Ig==
X-Received: by 2002:a9f:2124:: with SMTP id 33mr28761540uab.134.1621968446301;
        Tue, 25 May 2021 11:47:26 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.3])
        by smtp.gmail.com with ESMTPSA id t18sm1602491vke.3.2021.05.25.11.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 11:47:25 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Alim Akhtar <alim.akhtar@gmail.com>
Subject: [PATCH v2] soc: samsung: pmu: drop EXYNOS_CENTRAL_SEQ_OPTION defines
Date:   Tue, 25 May 2021 14:47:16 -0400
Message-Id: <20210525184716.119663-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The defines for Exynos5 CENTRAL_SEQ_OPTION (e.g.
EXYNOS5_USE_STANDBYWFI_ARM_CORE1) are not used.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes since v1:
1. Drop defines instead of fixing typo.
---
 include/linux/soc/samsung/exynos-regs-pmu.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index fc9250fb3133..aa840ed043e1 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -611,12 +611,6 @@
 #define EXYNOS5420_FSYS2_OPTION					0x4168
 #define EXYNOS5420_PSGEN_OPTION					0x4188
 
-/* For EXYNOS_CENTRAL_SEQ_OPTION */
-#define EXYNOS5_USE_STANDBYWFI_ARM_CORE0			BIT(16)
-#define EXYNOS5_USE_STANDBYWFI_ARM_CORE1			BUT(17)
-#define EXYNOS5_USE_STANDBYWFE_ARM_CORE0			BIT(24)
-#define EXYNOS5_USE_STANDBYWFE_ARM_CORE1			BIT(25)
-
 #define EXYNOS5420_ARM_USE_STANDBY_WFI0				BIT(4)
 #define EXYNOS5420_ARM_USE_STANDBY_WFI1				BIT(5)
 #define EXYNOS5420_ARM_USE_STANDBY_WFI2				BIT(6)
-- 
2.27.0

