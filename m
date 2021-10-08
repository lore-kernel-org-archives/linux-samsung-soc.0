Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30014C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 15:44:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D10E6101E
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  8 Oct 2021 15:44:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243113AbhJHPqC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 8 Oct 2021 11:46:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243273AbhJHPp5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 8 Oct 2021 11:45:57 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6D15C061570
        for <linux-samsung-soc@vger.kernel.org>; Fri,  8 Oct 2021 08:44:01 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id g8so38067999edt.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 08 Oct 2021 08:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=chYv1ePzDELqnhmYHQGPQeqr7+We1a2rp4WTbrbwbgM=;
        b=N7s40XLVAmQqccqKzun56sKA+k+715zFx8pZHxZykM4NvO5GgM84W94pFj2LHBKylt
         rGg9ZvzXWk4GPNMokPni6rQ5tI3N06kIwNC+/U8W9ZjpsYqfTBE+7mzr0jOaPhHe50cV
         uVhtuBj4Y7Rcu3qOLtfseI5bf0Cd+1nXhRtzZ/ktiB/OVbxM7bbaBnfPfDAHBnD0OfIk
         EPW84tRZtRFh+DwdfaxAwnN7OgfZ9jL4izgp506aaVBsJbzkhNrN1ipdoPaZ0x52W5LC
         UTHYyWHZmlsU4Wjkl3pVGA5r/tgRp3P+TpukB8LdzVCAuiln7PxMVLRQwiDvkAXgnjpX
         x1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=chYv1ePzDELqnhmYHQGPQeqr7+We1a2rp4WTbrbwbgM=;
        b=N7Q9bdff90uKGPDa9HyX5UoV995CwCJjtMheU+oVOFHpRfR9642Mi4UIwJ7uKZJIlc
         MfD0ZDtoRzA+pfDBh/KsHLTgMyAevDinULXFNu62oZWlM7JezLbUqo6cUALQY9xCjqyE
         gDYthybdSboFk9R+xfPpA8mV3qvMjNlrEbGGQczb27ZloJ/ajGlfLVYjp55LFz1pEXuc
         Nxc5vypppmkA+wnABru6h5m6e1fgGc4rI4ua2zZ730defnSiLEz0GDSjuJs+vG9O4Lab
         pfPeysoq1xpmHWX7TqDVKU2p7UOkgK+5GvfGiGSjMDN6EGI8Vx+nNIdh2ILzRMngdaDn
         lzGA==
X-Gm-Message-State: AOAM531TaApiH1wdwi0giXObYjrgFCTaDwTSJzIKnaKCjnSglqgG2SpJ
        mxMSbpZBDzTyS59wmWmhqsO3Yg==
X-Google-Smtp-Source: ABdhPJwQc3PHKsqbYoGqM6ju448/5jHDkHfRUzvefP3EAuCJdFkxmOLfZpovWpqPlY/D8AeBesJZAQ==
X-Received: by 2002:a05:6402:1d2b:: with SMTP id dh11mr15725225edb.276.1633707840177;
        Fri, 08 Oct 2021 08:44:00 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id e11sm1225342edl.70.2021.10.08.08.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 08:43:59 -0700 (PDT)
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
Subject: [PATCH v3 3/5] dt-bindings: clock: Add bindings definitions for Exynos850 CMU
Date:   Fri,  8 Oct 2021 18:43:50 +0300
Message-Id: <20211008154352.19519-4-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008154352.19519-1-semen.protsenko@linaro.org>
References: <20211008154352.19519-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Clock controller driver is designed to have separate instances for each
particular CMU. So clock IDs in this bindings header also start from 1
for each CMU.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Acked-by: Rob Herring <robh@kernel.org>
---
Changes in v3:
  - Changed the license to GPL-2.0-only + BSD-2-Clause

Changes in v2:
  - Added all clock ids
  - Added CLK_ prefix for all clock constants
  - Added R-b tag by Krzysztof Kozlowski
  - Added Ack tag by Rob Herring

 include/dt-bindings/clock/exynos850.h | 141 ++++++++++++++++++++++++++
 1 file changed, 141 insertions(+)
 create mode 100644 include/dt-bindings/clock/exynos850.h

diff --git a/include/dt-bindings/clock/exynos850.h b/include/dt-bindings/clock/exynos850.h
new file mode 100644
index 000000000000..8999184f94a2
--- /dev/null
+++ b/include/dt-bindings/clock/exynos850.h
@@ -0,0 +1,141 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
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
+#define CLK_FOUT_SHARED0_PLL		1
+#define CLK_FOUT_SHARED1_PLL		2
+#define CLK_FOUT_MMC_PLL		3
+#define CLK_MOUT_SHARED0_PLL		4
+#define CLK_MOUT_SHARED1_PLL		5
+#define CLK_MOUT_MMC_PLL		6
+#define CLK_MOUT_CORE_BUS		7
+#define CLK_MOUT_CORE_CCI		8
+#define CLK_MOUT_CORE_MMC_EMBD		9
+#define CLK_MOUT_CORE_SSS		10
+#define CLK_MOUT_DPU			11
+#define CLK_MOUT_HSI_BUS		12
+#define CLK_MOUT_HSI_MMC_CARD		13
+#define CLK_MOUT_HSI_USB20DRD		14
+#define CLK_MOUT_PERI_BUS		15
+#define CLK_MOUT_PERI_UART		16
+#define CLK_MOUT_PERI_IP		17
+#define CLK_DOUT_SHARED0_DIV3		18
+#define CLK_DOUT_SHARED0_DIV2		19
+#define CLK_DOUT_SHARED1_DIV3		20
+#define CLK_DOUT_SHARED1_DIV2		21
+#define CLK_DOUT_SHARED0_DIV4		22
+#define CLK_DOUT_SHARED1_DIV4		23
+#define CLK_DOUT_CORE_BUS		24
+#define CLK_DOUT_CORE_CCI		25
+#define CLK_DOUT_CORE_MMC_EMBD		26
+#define CLK_DOUT_CORE_SSS		27
+#define CLK_DOUT_DPU			28
+#define CLK_DOUT_HSI_BUS		29
+#define CLK_DOUT_HSI_MMC_CARD		30
+#define CLK_DOUT_HSI_USB20DRD		31
+#define CLK_DOUT_PERI_BUS		32
+#define CLK_DOUT_PERI_UART		33
+#define CLK_DOUT_PERI_IP		34
+#define CLK_GOUT_CORE_BUS		35
+#define CLK_GOUT_CORE_CCI		36
+#define CLK_GOUT_CORE_MMC_EMBD		37
+#define CLK_GOUT_CORE_SSS		38
+#define CLK_GOUT_DPU			39
+#define CLK_GOUT_HSI_BUS		40
+#define CLK_GOUT_HSI_MMC_CARD		41
+#define CLK_GOUT_HSI_USB20DRD		42
+#define CLK_GOUT_PERI_BUS		43
+#define CLK_GOUT_PERI_UART		44
+#define CLK_GOUT_PERI_IP		45
+#define TOP_NR_CLK			46
+
+/* CMU_HSI */
+#define CLK_MOUT_HSI_BUS_USER		1
+#define CLK_MOUT_HSI_MMC_CARD_USER	2
+#define CLK_MOUT_HSI_USB20DRD_USER	3
+#define CLK_MOUT_HSI_RTC		4
+#define CLK_GOUT_USB_RTC_CLK		5
+#define CLK_GOUT_USB_REF_CLK		6
+#define CLK_GOUT_USB_PHY_REF_CLK	7
+#define CLK_GOUT_USB_PHY_ACLK		8
+#define CLK_GOUT_USB_BUS_EARLY_CLK	9
+#define CLK_GOUT_GPIO_HSI_PCLK		10
+#define CLK_GOUT_MMC_CARD_ACLK		11
+#define CLK_GOUT_MMC_CARD_SDCLKIN	12
+#define CLK_GOUT_SYSREG_HSI_PCLK	13
+#define HSI_NR_CLK			14
+
+/* CMU_PERI */
+#define CLK_MOUT_PERI_BUS_USER		1
+#define CLK_MOUT_PERI_UART_USER		2
+#define CLK_MOUT_PERI_HSI2C_USER	3
+#define CLK_MOUT_PERI_SPI_USER		4
+#define CLK_DOUT_PERI_HSI2C0		5
+#define CLK_DOUT_PERI_HSI2C1		6
+#define CLK_DOUT_PERI_HSI2C2		7
+#define CLK_DOUT_PERI_SPI0		8
+#define CLK_GOUT_PERI_HSI2C0		9
+#define CLK_GOUT_PERI_HSI2C1		10
+#define CLK_GOUT_PERI_HSI2C2		11
+#define CLK_GOUT_GPIO_PERI_PCLK		12
+#define CLK_GOUT_HSI2C0_IPCLK		13
+#define CLK_GOUT_HSI2C0_PCLK		14
+#define CLK_GOUT_HSI2C1_IPCLK		15
+#define CLK_GOUT_HSI2C1_PCLK		16
+#define CLK_GOUT_HSI2C2_IPCLK		17
+#define CLK_GOUT_HSI2C2_PCLK		18
+#define CLK_GOUT_I2C0_PCLK		19
+#define CLK_GOUT_I2C1_PCLK		20
+#define CLK_GOUT_I2C2_PCLK		21
+#define CLK_GOUT_I2C3_PCLK		22
+#define CLK_GOUT_I2C4_PCLK		23
+#define CLK_GOUT_I2C5_PCLK		24
+#define CLK_GOUT_I2C6_PCLK		25
+#define CLK_GOUT_MCT_PCLK		26
+#define CLK_GOUT_PWM_MOTOR_PCLK		27
+#define CLK_GOUT_SPI0_IPCLK		28
+#define CLK_GOUT_SPI0_PCLK		29
+#define CLK_GOUT_SYSREG_PERI_PCLK	30
+#define CLK_GOUT_UART_IPCLK		31
+#define CLK_GOUT_UART_PCLK		32
+#define CLK_GOUT_WDT0_PCLK		33
+#define CLK_GOUT_WDT1_PCLK		34
+#define PERI_NR_CLK			35
+
+/* CMU_CORE */
+#define CLK_MOUT_CORE_BUS_USER		1
+#define CLK_MOUT_CORE_CCI_USER		2
+#define CLK_MOUT_CORE_MMC_EMBD_USER	3
+#define CLK_MOUT_CORE_SSS_USER		4
+#define CLK_MOUT_CORE_GIC		5
+#define CLK_DOUT_CORE_BUSP		6
+#define CLK_GOUT_CCI_ACLK		7
+#define CLK_GOUT_GIC_CLK		8
+#define CLK_GOUT_MMC_EMBD_ACLK		9
+#define CLK_GOUT_MMC_EMBD_SDCLKIN	10
+#define CLK_GOUT_SSS_ACLK		11
+#define CLK_GOUT_SSS_PCLK		12
+#define CORE_NR_CLK			13
+
+/* CMU_DPU */
+#define CLK_MOUT_DPU_USER		1
+#define CLK_DOUT_DPU_BUSP		2
+#define CLK_GOUT_DPU_CMU_DPU_PCLK	3
+#define CLK_GOUT_DPU_DECON0_ACLK	4
+#define CLK_GOUT_DPU_DMA_ACLK		5
+#define CLK_GOUT_DPU_DPP_ACLK		6
+#define CLK_GOUT_DPU_PPMU_ACLK		7
+#define CLK_GOUT_DPU_PPMU_PCLK		8
+#define CLK_GOUT_DPU_SMMU_CLK		9
+#define CLK_GOUT_DPU_SYSREG_PCLK	10
+#define DPU_NR_CLK			11
+
+#endif /* _DT_BINDINGS_CLOCK_EXYNOS_850_H */
-- 
2.30.2

