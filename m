Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D808CC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Sep 2021 13:37:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BA52B60F4C
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Sep 2021 13:37:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346649AbhIXNik (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 24 Sep 2021 09:38:40 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:38072
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346762AbhIXNid (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 24 Sep 2021 09:38:33 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 19F23402D9
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Sep 2021 13:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632490619;
        bh=90LQqsSK32tSFh91aPRZL+TZq8U0f1YD/IqlXackaD4=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=DBzeGI4+DiY/y7wrEPo4VqyOc6XVnodZlGnpyFWVC/LOVLPEA9dClr6DOFtBN4Evq
         IbvJ22NMJu7zvMYqn8h2o6i+m+mifRhYLIRy4GBIroueEp1hmUwFxyhJi2QWXml4lN
         +XMK8QgTxjHSDXaw+SHbb/bEbcJsdXZa/VcFutX/EmOktl+rfUQNaxQR+NA46GBndP
         k8FeTQBsHjB4VcHC1bo6vhGTAXTRJtCwcA191SXU8CyblfNEgaFAeMWdOX+Wz3c3cm
         2Ni6SuBmu/lv9upvzDqnFTl0Z44p+8HB8sHnNjG/AamVPQ/wFnXP2Y067d3K9RMM4k
         b+iPyf/czzIpA==
Received: by mail-wr1-f71.google.com with SMTP id s13-20020a5d69cd000000b00159d49442cbso8091388wrw.13
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Sep 2021 06:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=90LQqsSK32tSFh91aPRZL+TZq8U0f1YD/IqlXackaD4=;
        b=SI1cdvwmP2QXT5vko45hBHEaABHXSa7JkHxnwPIvcMF4e0rbM2ZmlKhtf/odBi0fNZ
         zYthDAlidV9oXMCZmvRkZ4Z0tXbTpZbTuzIsgGXpiuIJJkzionDSk0gG8El8SQMjdc6t
         09oXhimSF0pFEfEWvl8jMkJWlHOSD2uOW46FwrPGPZqI4W48++cN15MW1y28W6GGYVn0
         Uqva2h2eWs0+SO1DoWJ4jzC1LEIabE8oquiia6FS4L4kir6yXGDyeXTRUBskF/JZYYl8
         OhZnObYpHrGGVUrodQRHXDIcD/g3Z9E9qsX0xwl7pHtDwjsC+Njbw2QZC7IB3EihACMt
         l4QQ==
X-Gm-Message-State: AOAM531aOt25fYFMpQI6m3mHqX9/8VhuxgdKEH0JanS2X9k7/9FzTnT2
        hUlBzcj7rrg1HWtQPrKfWrSn/40Ctp3uUleIr75AObhAB2Iin361hzOgddKFzd6H2zfmHnDU2H9
        oaBvXSpGhAkNGMCRf8V4ZnM9BnpS6+j62e+uUKXQJRaKlfGFO
X-Received: by 2002:a05:600c:4106:: with SMTP id j6mr2248100wmi.99.1632490618455;
        Fri, 24 Sep 2021 06:36:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOzWcfCKTUfPBl8cAWjFiXGRe8fe974eq3o4JN39+VEZHWSXwMJ+8CTcRTSWPLHrokroGXgw==
X-Received: by 2002:a05:600c:4106:: with SMTP id j6mr2248085wmi.99.1632490618319;
        Fri, 24 Sep 2021 06:36:58 -0700 (PDT)
Received: from localhost.localdomain (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id j19sm8122245wra.92.2021.09.24.06.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 06:36:57 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: [PATCH] clk: samsung: describe drivers in KConfig
Date:   Fri, 24 Sep 2021 15:36:24 +0200
Message-Id: <20210924133624.112593-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Describe better which driver applies to which SoC, to make configuring
kernel for Samsung SoC easier.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/clk/samsung/Kconfig | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/drivers/clk/samsung/Kconfig b/drivers/clk/samsung/Kconfig
index 0441c4f73ac9..0e18d6ff2916 100644
--- a/drivers/clk/samsung/Kconfig
+++ b/drivers/clk/samsung/Kconfig
@@ -67,7 +67,8 @@ config EXYNOS_5420_COMMON_CLK
 	depends on COMMON_CLK_SAMSUNG
 	help
 	  Support for the clock controller present on the Samsung
-	  Exynos5420 SoCs. Choose Y here only if you build for this SoC.
+	  Exynos5420/Exynos5422/Exynos5800 SoCs. Choose Y here only if you
+	  build for this SoC.
 
 config EXYNOS_ARM64_COMMON_CLK
 	bool "Samsung Exynos ARMv8-family clock controller support" if COMPILE_TEST
@@ -79,38 +80,47 @@ config EXYNOS_AUDSS_CLK_CON
 	default y if ARCH_EXYNOS
 	help
 	  Support for the Audio Subsystem CLKCON clock controller present
-	  on some Exynos SoC variants. Choose M or Y here if you want to
-	  use audio devices such as I2S, PCM, etc.
+	  on some Samsung Exynos SoC variants. Choose M or Y here if you want
+	  to use audio devices such as I2S, PCM, etc.
 
 config EXYNOS_CLKOUT
 	tristate "Samsung Exynos clock output driver"
 	depends on COMMON_CLK_SAMSUNG
 	default y if ARCH_EXYNOS
 	help
-	  Support for the clock output (XCLKOUT) present on some of Exynos SoC
-	  variants. Usually the XCLKOUT is used to monitor the status of the
-	  certains clocks from SoC, but it could also be tied to other devices
-	  as an input clock.
+	  Support for the clock output (XCLKOUT) present on some of Samsung
+	  Exynos SoC variants. Usually the XCLKOUT is used to monitor the
+	  status of the certains clocks from SoC, but it could also be tied to
+	  other devices as an input clock.
 
 # For S3C24XX platforms, select following symbols:
 config S3C2410_COMMON_CLK
 	bool "Samsung S3C2410 clock controller support" if COMPILE_TEST
 	select COMMON_CLK_SAMSUNG
 	help
-	  Build the s3c2410 clock driver based on the common clock framework.
+	  Support for the clock controller present on the Samsung
+	  S3C2410/S3C2440/S3C2442 SoCs. Choose Y here only if you build for
+	  this SoC.
 
 config S3C2410_COMMON_DCLK
 	bool
 	select COMMON_CLK_SAMSUNG
 	select REGMAP_MMIO
 	help
-	  Temporary symbol to build the dclk driver based on the common clock
-	  framework.
+	  Support for the dclk clock controller present on the Samsung
+	  S3C2410/S3C2412/S3C2440/S3C2443 SoCs. Choose Y here only if you build
+	  for this SoC.
 
 config S3C2412_COMMON_CLK
 	bool "Samsung S3C2412 clock controller support" if COMPILE_TEST
 	select COMMON_CLK_SAMSUNG
+	help
+	  Support for the clock controller present on the Samsung S3C2412 SoCs.
+	  Choose Y here only if you build for this SoC.
 
 config S3C2443_COMMON_CLK
 	bool "Samsung S3C2443 clock controller support" if COMPILE_TEST
 	select COMMON_CLK_SAMSUNG
+	help
+	  Support for the clock controller present on the Samsung
+	  S3C2416/S3C2443 SoCs. Choose Y here only if you build for this SoC.
-- 
2.30.2

