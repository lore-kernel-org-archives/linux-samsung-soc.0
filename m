Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B490CC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 26 Nov 2021 20:42:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241055AbhKZUqA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 26 Nov 2021 15:46:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232675AbhKZUoA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 26 Nov 2021 15:44:00 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF72EC06139E
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Nov 2021 12:36:46 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id bi37so26888860lfb.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 26 Nov 2021 12:36:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wXz38UBl4taXBcxLfhRFr3N5sn1Ic9G7nbmmnBUwKPc=;
        b=Yll4BFOZU6wveYNMEqZf6KhJb45QvubE2UeAcwVGG0IvNvsMQlXh9qYbKm/Xp43M9O
         mqEqxX/Y/FpJAmcxLPoTqL4gV4HxwkYUw2TTVxjt8et7kkddHK5bi1+SseoLTaCBvpRW
         PG/WUVaoX7/Y7xXM5gKnS8zDZzx09HBGztlNtIYWpnCBahaylExdwD6TBeHeDDlmQcsJ
         HKsQ4bp0njINWgNxAWOIBTKQ18+k96O8GY9GW6tmW6joTYS8nrNqb3Opy85/04aZ132E
         vtKFdYuZusPIG+3RGY/X1LXSYSRHlVRfB66NbBquwocp++4fzmvhd6B05OAoYEZzOY8Q
         EEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wXz38UBl4taXBcxLfhRFr3N5sn1Ic9G7nbmmnBUwKPc=;
        b=1HUcK8UZ2xydP8iwPbMLnFpC8oPUAFqhr9ZBO7ih8Je28t3QzL1tdXPw+DsQfLyJeB
         L/2bHHO1MFHz94DVyntIxS8HGvE4xptFPiS2MSE5UxQIWgtCc022PQrqjXorbvXifBPD
         y70ibcBdjJTXz8vv1PY5tSymtKv0A1FyJj81olbBgk8nxllUexqx1HP82YTovqGFbtmQ
         92OEqd07w2x1qBtz8DYXwCIU5JtJOpB5AHPVUaUQkTewZR5zkS37w8W5wuLd65i6g6oF
         lAq8ioCa7amifhLthZoa1v3UTBg4rIveyiCl/CaTj6ylLFuj9B1A4DP3nFHt6ECx83QX
         aYHQ==
X-Gm-Message-State: AOAM532+tX236gC+IWZO2AwtqIcmYNAm4SnlNWJLq2/rtRMl9BjHyGMN
        a3YbXoAU8pIQaKMc9iq10sDxpQ==
X-Google-Smtp-Source: ABdhPJw/ggQdTEk+Uf17oMRSdF14ZNH0lQKo7mH1JzAzo3pUloMI7vi4gFLaNWwWcPJK+9RaAXL0rw==
X-Received: by 2002:a05:6512:2809:: with SMTP id cf9mr30903637lfb.429.1637959004914;
        Fri, 26 Nov 2021 12:36:44 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id q9sm577432lfu.232.2021.11.26.12.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 12:36:44 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Virag <virag.david003@gmail.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 2/2] clk: samsung: exynos850: Add missing sysreg clocks
Date:   Fri, 26 Nov 2021 22:36:41 +0200
Message-Id: <20211126203641.24005-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211126203641.24005-1-semen.protsenko@linaro.org>
References: <20211126203641.24005-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

System Register is used to configure system behavior, like USI protocol,
etc. SYSREG clocks should be provided to corresponding syscon nodes, to
make it possible to modify SYSREG registers.

While at it, add also missing PMU and GPIO clocks, which looks necessary
and might be needed for corresponding Exynos850 features soon.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/clk/samsung/clk-exynos850.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
index 5d83388d8c8e..b644bc3d0de1 100644
--- a/drivers/clk/samsung/clk-exynos850.c
+++ b/drivers/clk/samsung/clk-exynos850.c
@@ -426,11 +426,14 @@ CLK_OF_DECLARE(exynos850_cmu_top, "samsung,exynos850-cmu-top",
 #define CLK_CON_DIV_DIV_CLK_APM_I3C			0x1808
 #define CLK_CON_GAT_CLKCMU_CMGP_BUS			0x2000
 #define CLK_CON_GAT_GATE_CLKCMU_CHUB_BUS		0x2014
+#define CLK_CON_GAT_GOUT_APM_APBIF_GPIO_ALIVE_PCLK	0x2018
+#define CLK_CON_GAT_GOUT_APM_APBIF_PMU_ALIVE_PCLK	0x2020
 #define CLK_CON_GAT_GOUT_APM_APBIF_RTC_PCLK		0x2024
 #define CLK_CON_GAT_GOUT_APM_APBIF_TOP_RTC_PCLK		0x2028
 #define CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_PCLK	0x2034
 #define CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_SCLK	0x2038
 #define CLK_CON_GAT_GOUT_APM_SPEEDY_APM_PCLK		0x20bc
+#define CLK_CON_GAT_GOUT_APM_SYSREG_APM_PCLK		0x20c0
 
 static const unsigned long apm_clk_regs[] __initconst = {
 	PLL_CON0_MUX_CLKCMU_APM_BUS_USER,
@@ -445,11 +448,14 @@ static const unsigned long apm_clk_regs[] __initconst = {
 	CLK_CON_DIV_DIV_CLK_APM_I3C,
 	CLK_CON_GAT_CLKCMU_CMGP_BUS,
 	CLK_CON_GAT_GATE_CLKCMU_CHUB_BUS,
+	CLK_CON_GAT_GOUT_APM_APBIF_GPIO_ALIVE_PCLK,
+	CLK_CON_GAT_GOUT_APM_APBIF_PMU_ALIVE_PCLK,
 	CLK_CON_GAT_GOUT_APM_APBIF_RTC_PCLK,
 	CLK_CON_GAT_GOUT_APM_APBIF_TOP_RTC_PCLK,
 	CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_PCLK,
 	CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_SCLK,
 	CLK_CON_GAT_GOUT_APM_SPEEDY_APM_PCLK,
+	CLK_CON_GAT_GOUT_APM_SYSREG_APM_PCLK,
 };
 
 /* List of parent clocks for Muxes in CMU_APM */
@@ -512,6 +518,14 @@ static const struct samsung_gate_clock apm_gate_clks[] __initconst = {
 	     CLK_CON_GAT_GOUT_APM_I3C_APM_PMIC_I_SCLK, 21, 0, 0),
 	GATE(CLK_GOUT_SPEEDY_PCLK, "gout_speedy_pclk", "dout_apm_bus",
 	     CLK_CON_GAT_GOUT_APM_SPEEDY_APM_PCLK, 21, 0, 0),
+	/* TODO: Should be enabled in GPIO driver (or made CLK_IS_CRITICAL) */
+	GATE(CLK_GOUT_GPIO_ALIVE_PCLK, "gout_gpio_alive_pclk", "dout_apm_bus",
+	     CLK_CON_GAT_GOUT_APM_APBIF_GPIO_ALIVE_PCLK, 21, CLK_IGNORE_UNUSED,
+	     0),
+	GATE(CLK_GOUT_PMU_ALIVE_PCLK, "gout_pmu_alive_pclk", "dout_apm_bus",
+	     CLK_CON_GAT_GOUT_APM_APBIF_PMU_ALIVE_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_SYSREG_APM_PCLK, "gout_sysreg_apm_pclk", "dout_apm_bus",
+	     CLK_CON_GAT_GOUT_APM_SYSREG_APM_PCLK, 21, 0, 0),
 };
 
 static const struct samsung_cmu_info apm_cmu_info __initconst = {
@@ -541,6 +555,7 @@ static const struct samsung_cmu_info apm_cmu_info __initconst = {
 #define CLK_CON_GAT_GOUT_CMGP_ADC_PCLK_S0	0x200c
 #define CLK_CON_GAT_GOUT_CMGP_ADC_PCLK_S1	0x2010
 #define CLK_CON_GAT_GOUT_CMGP_GPIO_PCLK		0x2018
+#define CLK_CON_GAT_GOUT_CMGP_SYSREG_CMGP_PCLK	0x2040
 #define CLK_CON_GAT_GOUT_CMGP_USI_CMGP0_IPCLK	0x2044
 #define CLK_CON_GAT_GOUT_CMGP_USI_CMGP0_PCLK	0x2048
 #define CLK_CON_GAT_GOUT_CMGP_USI_CMGP1_IPCLK	0x204c
@@ -556,6 +571,7 @@ static const unsigned long cmgp_clk_regs[] __initconst = {
 	CLK_CON_GAT_GOUT_CMGP_ADC_PCLK_S0,
 	CLK_CON_GAT_GOUT_CMGP_ADC_PCLK_S1,
 	CLK_CON_GAT_GOUT_CMGP_GPIO_PCLK,
+	CLK_CON_GAT_GOUT_CMGP_SYSREG_CMGP_PCLK,
 	CLK_CON_GAT_GOUT_CMGP_USI_CMGP0_IPCLK,
 	CLK_CON_GAT_GOUT_CMGP_USI_CMGP0_PCLK,
 	CLK_CON_GAT_GOUT_CMGP_USI_CMGP1_IPCLK,
@@ -610,6 +626,9 @@ static const struct samsung_gate_clock cmgp_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_CMGP_USI1_PCLK, "gout_cmgp_usi1_pclk",
 	     "gout_clkcmu_cmgp_bus",
 	     CLK_CON_GAT_GOUT_CMGP_USI_CMGP1_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_SYSREG_CMGP_PCLK, "gout_sysreg_cmgp_pclk",
+	     "gout_clkcmu_cmgp_bus",
+	     CLK_CON_GAT_GOUT_CMGP_SYSREG_CMGP_PCLK, 21, 0, 0),
 };
 
 static const struct samsung_cmu_info cmgp_cmu_info __initconst = {
@@ -910,10 +929,12 @@ CLK_OF_DECLARE(exynos850_cmu_peri, "samsung,exynos850-cmu-peri",
 #define CLK_CON_DIV_DIV_CLK_CORE_BUSP		0x1800
 #define CLK_CON_GAT_GOUT_CORE_CCI_550_ACLK	0x2038
 #define CLK_CON_GAT_GOUT_CORE_GIC_CLK		0x2040
+#define CLK_CON_GAT_GOUT_CORE_GPIO_CORE_PCLK	0x2044
 #define CLK_CON_GAT_GOUT_CORE_MMC_EMBD_I_ACLK	0x20e8
 #define CLK_CON_GAT_GOUT_CORE_MMC_EMBD_SDCLKIN	0x20ec
 #define CLK_CON_GAT_GOUT_CORE_SSS_I_ACLK	0x2128
 #define CLK_CON_GAT_GOUT_CORE_SSS_I_PCLK	0x212c
+#define CLK_CON_GAT_GOUT_CORE_SYSREG_CORE_PCLK	0x2130
 
 static const unsigned long core_clk_regs[] __initconst = {
 	PLL_CON0_MUX_CLKCMU_CORE_BUS_USER,
@@ -924,10 +945,12 @@ static const unsigned long core_clk_regs[] __initconst = {
 	CLK_CON_DIV_DIV_CLK_CORE_BUSP,
 	CLK_CON_GAT_GOUT_CORE_CCI_550_ACLK,
 	CLK_CON_GAT_GOUT_CORE_GIC_CLK,
+	CLK_CON_GAT_GOUT_CORE_GPIO_CORE_PCLK,
 	CLK_CON_GAT_GOUT_CORE_MMC_EMBD_I_ACLK,
 	CLK_CON_GAT_GOUT_CORE_MMC_EMBD_SDCLKIN,
 	CLK_CON_GAT_GOUT_CORE_SSS_I_ACLK,
 	CLK_CON_GAT_GOUT_CORE_SSS_I_PCLK,
+	CLK_CON_GAT_GOUT_CORE_SYSREG_CORE_PCLK,
 };
 
 /* List of parent clocks for Muxes in CMU_CORE */
@@ -972,6 +995,12 @@ static const struct samsung_gate_clock core_gate_clks[] __initconst = {
 	     CLK_CON_GAT_GOUT_CORE_SSS_I_ACLK, 21, 0, 0),
 	GATE(CLK_GOUT_SSS_PCLK, "gout_sss_pclk", "dout_core_busp",
 	     CLK_CON_GAT_GOUT_CORE_SSS_I_PCLK, 21, 0, 0),
+	/* TODO: Should be enabled in GPIO driver (or made CLK_IS_CRITICAL) */
+	GATE(CLK_GOUT_GPIO_CORE_PCLK, "gout_gpio_core_pclk", "dout_core_busp",
+	     CLK_CON_GAT_GOUT_CORE_GPIO_CORE_PCLK, 21, CLK_IGNORE_UNUSED, 0),
+	GATE(CLK_GOUT_SYSREG_CORE_PCLK, "gout_sysreg_core_pclk",
+	     "dout_core_busp",
+	     CLK_CON_GAT_GOUT_CORE_SYSREG_CORE_PCLK, 21, 0, 0),
 };
 
 static const struct samsung_cmu_info core_cmu_info __initconst = {
-- 
2.30.2

