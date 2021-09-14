Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1464C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 14 Sep 2021 15:56:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE8A46124D
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 14 Sep 2021 15:56:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235099AbhINP5j (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 14 Sep 2021 11:57:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235055AbhINP5e (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Sep 2021 11:57:34 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6584C061766
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Sep 2021 08:56:16 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id q21so24828266ljj.6
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Sep 2021 08:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zTnOJ7ylard1/aX3m1VvlpBsqx0IZmAAbb3lV2jCep4=;
        b=BWqrojW7vj7uWDsyXC8kYWJq8jqj8dsEw3Esi0XnFC4kQXcwMUJSdt37ApUyr+fsCI
         btV0JlX8iCULqI/d/R7Ffmwr0WwUKgV5/kbXCmTtH+YvEpNqJs4wiOeJD4usgUOEh0FZ
         vOApzLye/kvi7K3QM2nBeke+e8YNDBjqliWpkjuKHD5nQ0tACUhWq8rAV7bcWZR0KVKW
         IReeZcVdJcWw5Ja1tr3a5WRYZxjS4rpvkMAmpZPbg6lQ4sdW3wfPJPfZMDmh69qc2rzk
         f+W7xPHNvvv6kc1QvwwaDV6k2TIe8cCbtgjs4G0e/IMX4k5YKBJi8n92sg+oD4LSLSVo
         jwUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zTnOJ7ylard1/aX3m1VvlpBsqx0IZmAAbb3lV2jCep4=;
        b=k5m+81b8EPtsuMwPejGHG5upNHpzWZ/6XXKxhE1dNgPme32iwTPyha18kKE7YqZ1Ux
         EHSKWjGeArv1iRyhrNp11hNQ0v/JusqxCc1IrFAo4QeKxBjKtlmrILi2NPQBX2AAcrfT
         omTCoODuTwqwCnH1Y/58Pfo3Y9Ir8TxUHQtQ0Yj6G0M+e11+f/+v5wedAy0mFJxfqRYe
         3xoFcwaMyGYKTjvGn6AlFDIcPAZ1yvSZ1n7FL/i5y3SeB/ln0eNI/AioApDpcNqcnvEV
         MXSWJ5EMesQAR5V2NGnVyVH85PaAJKdx0HqvpnBJvEIBPZJaPptrHBaCbZGtoHxTbKCX
         98uQ==
X-Gm-Message-State: AOAM5314ef/4FqSxc9MnLdkqVSNoqzaogcXDh3G1v3MDoB2VUm6ZffD+
        8/GcAIAL9Wfmp0mIfd21V1jwiw==
X-Google-Smtp-Source: ABdhPJy6wmnT0mbGhg0Gq10Ai4jwQ2Y4H4ezws1HnynI6dvTRAXqjH5vwvyz6r7T3Lpya0Rg0EGtpg==
X-Received: by 2002:a2e:8881:: with SMTP id k1mr16304746lji.443.1631634975350;
        Tue, 14 Sep 2021 08:56:15 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id z4sm1147589lfd.298.2021.09.14.08.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 08:56:14 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Ryu Euiyoul <ryu.real@samsung.com>, Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 4/6] dt-bindings: clock: Add bindings definitions for Exynos850 CMU
Date:   Tue, 14 Sep 2021 18:56:05 +0300
Message-Id: <20210914155607.14122-5-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210914155607.14122-1-semen.protsenko@linaro.org>
References: <20210914155607.14122-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Clock controller driver is designed to have separate instances for each
particular CMU. So clock IDs in this bindings header also start from 1
for each CMU.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 include/dt-bindings/clock/exynos850.h | 72 +++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 include/dt-bindings/clock/exynos850.h

diff --git a/include/dt-bindings/clock/exynos850.h b/include/dt-bindings/clock/exynos850.h
new file mode 100644
index 000000000000..2f0a7f619627
--- /dev/null
+++ b/include/dt-bindings/clock/exynos850.h
@@ -0,0 +1,72 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2021 Linaro Ltd.
+ * Author: Sam Protsenko <semen.protsenko@linaro.org>
+ *
+ * Device Tree binding constants for Exynos850 clock controller.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_EXYNOS_850_H
+#define _DT_BINDINGS_CLOCK_EXYNOS_850_H
+
+/* CMU_TOP */
+#define DOUT_HSI_BUS			1
+#define DOUT_HSI_MMC_CARD		2
+#define DOUT_HSI_USB20DRD		3
+#define DOUT_PERI_BUS			4
+#define DOUT_PERI_UART			5
+#define DOUT_PERI_IP			6
+#define DOUT_CORE_BUS			7
+#define DOUT_CORE_CCI			8
+#define DOUT_CORE_MMC_EMBD		9
+#define DOUT_CORE_SSS			10
+#define TOP_NR_CLK			11
+
+/* CMU_HSI */
+#define GOUT_USB_RTC_CLK		1
+#define GOUT_USB_REF_CLK		2
+#define GOUT_USB_PHY_REF_CLK		3
+#define GOUT_USB_PHY_ACLK		4
+#define GOUT_USB_BUS_EARLY_CLK		5
+#define GOUT_GPIO_HSI_PCLK		6
+#define GOUT_MMC_CARD_ACLK		7
+#define GOUT_MMC_CARD_SDCLKIN		8
+#define GOUT_SYSREG_HSI_PCLK		9
+#define HSI_NR_CLK			10
+
+/* CMU_PERI */
+#define GOUT_GPIO_PERI_PCLK		1
+#define GOUT_HSI2C0_IPCLK		2
+#define GOUT_HSI2C0_PCLK		3
+#define GOUT_HSI2C1_IPCLK		4
+#define GOUT_HSI2C1_PCLK		5
+#define GOUT_HSI2C2_IPCLK		6
+#define GOUT_HSI2C2_PCLK		7
+#define GOUT_I2C0_PCLK			8
+#define GOUT_I2C1_PCLK			9
+#define GOUT_I2C2_PCLK			10
+#define GOUT_I2C3_PCLK			11
+#define GOUT_I2C4_PCLK			12
+#define GOUT_I2C5_PCLK			13
+#define GOUT_I2C6_PCLK			14
+#define GOUT_MCT_PCLK			15
+#define GOUT_PWM_MOTOR_PCLK		16
+#define GOUT_SPI0_IPCLK			17
+#define GOUT_SPI0_PCLK			18
+#define GOUT_SYSREG_PERI_PCLK		19
+#define GOUT_UART_IPCLK			20
+#define GOUT_UART_PCLK			21
+#define GOUT_WDT0_PCLK			22
+#define GOUT_WDT1_PCLK			23
+#define PERI_NR_CLK			24
+
+/* CMU_CORE */
+#define GOUT_CCI_ACLK			1
+#define GOUT_GIC_CLK			2
+#define GOUT_MMC_EMBD_ACLK		3
+#define GOUT_MMC_EMBD_SDCLKIN		4
+#define GOUT_SSS_ACLK			5
+#define GOUT_SSS_PCLK			6
+#define CORE_NR_CLK			7
+
+#endif /* _DT_BINDINGS_CLOCK_EXYNOS_850_H */
-- 
2.30.2

