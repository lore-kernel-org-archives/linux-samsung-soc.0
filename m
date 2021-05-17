Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8602DC433B4
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 17 May 2021 14:14:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 696C8616E9
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 17 May 2021 14:14:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238629AbhEQOQK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 17 May 2021 10:16:10 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:41761 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238835AbhEQOOM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 17 May 2021 10:14:12 -0400
Received: from mail-qk1-f198.google.com ([209.85.222.198])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lidzK-0005R1-Sa
        for linux-samsung-soc@vger.kernel.org; Mon, 17 May 2021 14:12:54 +0000
Received: by mail-qk1-f198.google.com with SMTP id n2-20020a37a4020000b02902e9aef597f7so4779701qke.21
        for <linux-samsung-soc@vger.kernel.org>; Mon, 17 May 2021 07:12:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=zAZsnEd2I8dmVTyQC9mn90iTZNFb90By5nrttFT+170=;
        b=h2emRf5+zK6xDbzL/Wh1f4rSY8Tjv2X84H5XSLNAm0PMtRHOv8KwDMhIkfUr6SnBHE
         aXY3yhvgGLxzsvXfHCxhofC0799CPTu1Wo/V5WdZnzYaLDG4XxJZbv7slOZKAbGchKz0
         GoEw7YLh7J60lqfU8Az7qjkeA55797jcIK7Q51hgPPbnIFHEzNY8crdGgLsSYTOBk6Gi
         zq6w0G7MQXvy3Nrb3SL9hhsclGTDnDygsDuiQIOA+2osM6xmKFFFoach+WNn/OzLJrzA
         Rft4jJGxmMRJIwNSItGno9h02Ey4j9mqmYNa/XCfcRQOS3j572e3JKbYQGfjjKJLvXxb
         09lQ==
X-Gm-Message-State: AOAM533f49y/1l4cYIWTnmggGM5wkumh9lwmxt7vkY1W21Uj/G1wNDeA
        Hz2hIvpHwxyCE1GJBVAZL8flxzwNqy2AWGUPcmbQnN/i+OAlhXJSk5BVMusWFDfhJwp9/0+0wY4
        5TCCo6sqQAzpezSnbW3iVMOvn91Sc3FiR/iF9bMleVf44VuWt
X-Received: by 2002:ac8:7303:: with SMTP id x3mr57042166qto.271.1621260774057;
        Mon, 17 May 2021 07:12:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYjs9gmXg+QZtFzveAdjVILbpJtsmY19SLw8BW1TsYwHE9JtfKQXjGtTtcQi3H+Qixwtg/IQ==
X-Received: by 2002:ac8:7303:: with SMTP id x3mr57042150qto.271.1621260773888;
        Mon, 17 May 2021 07:12:53 -0700 (PDT)
Received: from localhost.localdomain ([45.237.48.5])
        by smtp.gmail.com with ESMTPSA id r9sm10440990qtf.62.2021.05.17.07.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 07:12:53 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] soc: samsung: pmu: fix BUT->BIT macro typo
Date:   Mon, 17 May 2021 10:12:50 -0400
Message-Id: <20210517141250.55655-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The macro EXYNOS5_USE_STANDBYWFI_ARM_CORE1 should use BIT, not BUT.  Fix
does not have real effect as the macro is not used in the code.

Fixes: af2e0a0754ac ("ARM: EXYNOS: Add PMU support for exynos5420")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 include/linux/soc/samsung/exynos-regs-pmu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/soc/samsung/exynos-regs-pmu.h
index fc9250fb3133..4bfd9a210da2 100644
--- a/include/linux/soc/samsung/exynos-regs-pmu.h
+++ b/include/linux/soc/samsung/exynos-regs-pmu.h
@@ -613,7 +613,7 @@
 
 /* For EXYNOS_CENTRAL_SEQ_OPTION */
 #define EXYNOS5_USE_STANDBYWFI_ARM_CORE0			BIT(16)
-#define EXYNOS5_USE_STANDBYWFI_ARM_CORE1			BUT(17)
+#define EXYNOS5_USE_STANDBYWFI_ARM_CORE1			BIT(17)
 #define EXYNOS5_USE_STANDBYWFE_ARM_CORE0			BIT(24)
 #define EXYNOS5_USE_STANDBYWFE_ARM_CORE1			BIT(25)
 
-- 
2.27.0

