Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A9B3C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  9 Nov 2021 16:44:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 44C11610C8
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  9 Nov 2021 16:44:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237156AbhKIQrb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 9 Nov 2021 11:47:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238283AbhKIQra (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 9 Nov 2021 11:47:30 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41B74C0613F5
        for <linux-samsung-soc@vger.kernel.org>; Tue,  9 Nov 2021 08:44:44 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id h11so37538307ljk.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 09 Nov 2021 08:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zbEeFT9w836IBoUS4GyHRkWfg1L5EahnC9mnhgRpa3s=;
        b=O/Xk2B4gCaBgszZRqe5iECJPVDp9fgs4np5MIxs6v9rBORhGS6rUWSA/UBp6OvZeNf
         9rCKhDC3T6UMxauO1Mr2tCrnrQnDQRQwLdjfPStGf2Pv1P8L0WID+i8VXtUHtQmq0QvS
         GMng+YAE6gQtqBir21OG7ztaOJAUEYsU/4UefVts4Y3XdYXn1lqQZVa+WUQGjrbHwUHf
         YqIv9W1vdoQ90SOQVrZv99lUsWneQ9vBcUyPSRok0pQyT9voLldbOEG8ZllIJtwiPToM
         v2sOYJNebzOOorfNiXdWfRJ2YEhghgMmL5tv2jj/dWf8L8dDx+3ftHUOC9jio0udaM/X
         DkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zbEeFT9w836IBoUS4GyHRkWfg1L5EahnC9mnhgRpa3s=;
        b=ppTCQPHqQ9olgmNPhP94qiUSPloWbpmur2+UF/9f9f2E8+mtJafRxgNW4QCMcN94D5
         xQmuB1T+f1iiD+RUIM26j8nRmyGzkoA9e43QIVoKBtibzhvi85JDlsxjSVp+NB+Wh0NG
         8a9vXL3Eie0fwlwZhHOo2xmDI4e51Eo7gR4fHsPfxbgy+GvCKYiDv5sGPowS0FFujHoB
         W62jbLZaCBGNjqefeKF6LOngxmicx/8qOYedHlUh0tvWGui2NBL5RncvzqPoVtJc2W7A
         ZAesRavkpYqCpnPV5/kB4A/IiaOQGa6iV/BGtyfLMc+7iXqq/JmqOMbhLVbSo+RGSQvV
         EPYQ==
X-Gm-Message-State: AOAM532CnnkYens26ePlsSFtlnx897+7MO0ya7XdLlyrTE7KGV4Z2O19
        GfdBcA7LGyoZD5igbw+8/PRzbg==
X-Google-Smtp-Source: ABdhPJyzTBHeQ8PnKC2U7iuglUGCvnD+FFnA9QpJYme7wrZeYt+Q7U2OEsjuI9Wxy55/GZ1kmtUVUw==
X-Received: by 2002:a2e:b013:: with SMTP id y19mr9034035ljk.132.1636476281128;
        Tue, 09 Nov 2021 08:44:41 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id p3sm737647lfo.162.2021.11.09.08.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Nov 2021 08:44:40 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Sumit Semwal <sumit.semwal@linaro.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Subject: [PATCH 2/2] clk: samsung: exynos850: Implement CMU_CMGP domain
Date:   Tue,  9 Nov 2021 18:44:36 +0200
Message-Id: <20211109164436.11098-3-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211109164436.11098-1-semen.protsenko@linaro.org>
References: <20211109164436.11098-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

CMU_CMGP clock domain provides clocks for CMGP IP-core (Common GPIO).
CMGP module incapsulates next blocks:
  - 8 GPIO lines
  - 1 GPADC
  - 2 USI blocks, each can be configured to provide one of
    UART/SPI/HSI2C serial interfaces

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/clk/samsung/clk-exynos850.c   | 100 ++++++++++++++++++++++++++
 include/dt-bindings/clock/exynos850.h |  17 +++++
 2 files changed, 117 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
index ecffa5c7a081..6965e1b44d24 100644
--- a/drivers/clk/samsung/clk-exynos850.c
+++ b/drivers/clk/samsung/clk-exynos850.c
@@ -492,6 +492,103 @@ static const struct samsung_cmu_info apm_cmu_info __initconst = {
 	.clk_name		= "dout_clkcmu_apm_bus",
 };
 
+/* ---- CMU_CMGP ------------------------------------------------------------ */
+
+/* Register Offset definitions for CMU_CMGP (0x11c00000) */
+#define CLK_CON_MUX_CLK_CMGP_ADC		0x1000
+#define CLK_CON_MUX_MUX_CLK_CMGP_USI_CMGP0	0x1004
+#define CLK_CON_MUX_MUX_CLK_CMGP_USI_CMGP1	0x1008
+#define CLK_CON_DIV_DIV_CLK_CMGP_ADC		0x1800
+#define CLK_CON_DIV_DIV_CLK_CMGP_USI_CMGP0	0x1804
+#define CLK_CON_DIV_DIV_CLK_CMGP_USI_CMGP1	0x1808
+#define CLK_CON_GAT_GOUT_CMGP_ADC_PCLK_S0	0x200c
+#define CLK_CON_GAT_GOUT_CMGP_ADC_PCLK_S1	0x2010
+#define CLK_CON_GAT_GOUT_CMGP_GPIO_PCLK		0x2018
+#define CLK_CON_GAT_GOUT_CMGP_USI_CMGP0_IPCLK	0x2044
+#define CLK_CON_GAT_GOUT_CMGP_USI_CMGP0_PCLK	0x2048
+#define CLK_CON_GAT_GOUT_CMGP_USI_CMGP1_IPCLK	0x204c
+#define CLK_CON_GAT_GOUT_CMGP_USI_CMGP1_PCLK	0x2050
+
+static const unsigned long cmgp_clk_regs[] __initconst = {
+	CLK_CON_MUX_CLK_CMGP_ADC,
+	CLK_CON_MUX_MUX_CLK_CMGP_USI_CMGP0,
+	CLK_CON_MUX_MUX_CLK_CMGP_USI_CMGP1,
+	CLK_CON_DIV_DIV_CLK_CMGP_ADC,
+	CLK_CON_DIV_DIV_CLK_CMGP_USI_CMGP0,
+	CLK_CON_DIV_DIV_CLK_CMGP_USI_CMGP1,
+	CLK_CON_GAT_GOUT_CMGP_ADC_PCLK_S0,
+	CLK_CON_GAT_GOUT_CMGP_ADC_PCLK_S1,
+	CLK_CON_GAT_GOUT_CMGP_GPIO_PCLK,
+	CLK_CON_GAT_GOUT_CMGP_USI_CMGP0_IPCLK,
+	CLK_CON_GAT_GOUT_CMGP_USI_CMGP0_PCLK,
+	CLK_CON_GAT_GOUT_CMGP_USI_CMGP1_IPCLK,
+	CLK_CON_GAT_GOUT_CMGP_USI_CMGP1_PCLK,
+};
+
+/* List of parent clocks for Muxes in CMU_CMGP */
+PNAME(mout_cmgp_usi0_p)	= { "clk_rco_cmgp", "gout_clkcmu_cmgp_bus" };
+PNAME(mout_cmgp_usi1_p)	= { "clk_rco_cmgp", "gout_clkcmu_cmgp_bus" };
+PNAME(mout_cmgp_adc_p)	= { "oscclk", "dout_cmgp_adc" };
+
+static const struct samsung_fixed_rate_clock cmgp_fixed_clks[] __initconst = {
+	FRATE(CLK_RCO_CMGP, "clk_rco_cmgp", NULL, 0, 49152000),
+};
+
+static const struct samsung_mux_clock cmgp_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_CMGP_ADC, "mout_cmgp_adc", mout_cmgp_adc_p,
+	    CLK_CON_MUX_CLK_CMGP_ADC, 0, 1),
+	MUX(CLK_MOUT_CMGP_USI0, "mout_cmgp_usi0", mout_cmgp_usi0_p,
+	    CLK_CON_MUX_MUX_CLK_CMGP_USI_CMGP0, 0, 1),
+	MUX(CLK_MOUT_CMGP_USI1, "mout_cmgp_usi1", mout_cmgp_usi1_p,
+	    CLK_CON_MUX_MUX_CLK_CMGP_USI_CMGP1, 0, 1),
+};
+
+static const struct samsung_div_clock cmgp_div_clks[] __initconst = {
+	DIV(CLK_DOUT_CMGP_ADC, "dout_cmgp_adc", "gout_clkcmu_cmgp_bus",
+	    CLK_CON_DIV_DIV_CLK_CMGP_ADC, 0, 4),
+	DIV(CLK_DOUT_CMGP_USI0, "dout_cmgp_usi0", "mout_cmgp_usi0",
+	    CLK_CON_DIV_DIV_CLK_CMGP_USI_CMGP0, 0, 5),
+	DIV(CLK_DOUT_CMGP_USI1, "dout_cmgp_usi1", "mout_cmgp_usi1",
+	    CLK_CON_DIV_DIV_CLK_CMGP_USI_CMGP1, 0, 5),
+};
+
+static const struct samsung_gate_clock cmgp_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_CMGP_ADC_S0_PCLK, "gout_adc_s0_pclk",
+	     "gout_clkcmu_cmgp_bus",
+	     CLK_CON_GAT_GOUT_CMGP_ADC_PCLK_S0, 21, 0, 0),
+	GATE(CLK_GOUT_CMGP_ADC_S1_PCLK, "gout_adc_s1_pclk",
+	     "gout_clkcmu_cmgp_bus",
+	     CLK_CON_GAT_GOUT_CMGP_ADC_PCLK_S1, 21, 0, 0),
+	GATE(CLK_GOUT_CMGP_GPIO_PCLK, "gout_gpio_cmgp_pclk",
+	     "gout_clkcmu_cmgp_bus",
+	     CLK_CON_GAT_GOUT_CMGP_GPIO_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_CMGP_USI0_IPCLK, "gout_cmgp_usi0_ipclk", "dout_cmgp_usi0",
+	     CLK_CON_GAT_GOUT_CMGP_USI_CMGP0_IPCLK, 21, 0, 0),
+	GATE(CLK_GOUT_CMGP_USI0_PCLK, "gout_cmgp_usi0_pclk",
+	     "gout_clkcmu_cmgp_bus",
+	     CLK_CON_GAT_GOUT_CMGP_USI_CMGP0_PCLK, 21, 0, 0),
+	GATE(CLK_GOUT_CMGP_USI1_IPCLK, "gout_cmgp_usi1_ipclk", "dout_cmgp_usi1",
+	     CLK_CON_GAT_GOUT_CMGP_USI_CMGP1_IPCLK, 21, 0, 0),
+	GATE(CLK_GOUT_CMGP_USI1_PCLK, "gout_cmgp_usi1_pclk",
+	     "gout_clkcmu_cmgp_bus",
+	     CLK_CON_GAT_GOUT_CMGP_USI_CMGP1_PCLK, 21, 0, 0),
+};
+
+static const struct samsung_cmu_info cmgp_cmu_info __initconst = {
+	.mux_clks		= cmgp_mux_clks,
+	.nr_mux_clks		= ARRAY_SIZE(cmgp_mux_clks),
+	.div_clks		= cmgp_div_clks,
+	.nr_div_clks		= ARRAY_SIZE(cmgp_div_clks),
+	.gate_clks		= cmgp_gate_clks,
+	.nr_gate_clks		= ARRAY_SIZE(cmgp_gate_clks),
+	.fixed_clks		= cmgp_fixed_clks,
+	.nr_fixed_clks		= ARRAY_SIZE(cmgp_fixed_clks),
+	.nr_clk_ids		= CMGP_NR_CLK,
+	.clk_regs		= cmgp_clk_regs,
+	.nr_clk_regs		= ARRAY_SIZE(cmgp_clk_regs),
+	.clk_name		= "gout_clkcmu_cmgp_bus",
+};
+
 /* ---- CMU_HSI ------------------------------------------------------------- */
 
 /* Register Offset definitions for CMU_HSI (0x13400000) */
@@ -956,6 +1053,9 @@ static const struct of_device_id exynos850_cmu_of_match[] = {
 	{
 		.compatible = "samsung,exynos850-cmu-apm",
 		.data = &apm_cmu_info,
+	}, {
+		.compatible = "samsung,exynos850-cmu-cmgp",
+		.data = &cmgp_cmu_info,
 	}, {
 		.compatible = "samsung,exynos850-cmu-hsi",
 		.data = &hsi_cmu_info,
diff --git a/include/dt-bindings/clock/exynos850.h b/include/dt-bindings/clock/exynos850.h
index df3978b58304..8aa5e82af0d3 100644
--- a/include/dt-bindings/clock/exynos850.h
+++ b/include/dt-bindings/clock/exynos850.h
@@ -84,6 +84,23 @@
 #define CLK_GOUT_SPEEDY_PCLK		21
 #define APM_NR_CLK			22
 
+/* CMU_CMGP */
+#define CLK_RCO_CMGP			1
+#define CLK_MOUT_CMGP_ADC		2
+#define CLK_MOUT_CMGP_USI0		3
+#define CLK_MOUT_CMGP_USI1		4
+#define CLK_DOUT_CMGP_ADC		5
+#define CLK_DOUT_CMGP_USI0		6
+#define CLK_DOUT_CMGP_USI1		7
+#define CLK_GOUT_CMGP_ADC_S0_PCLK	8
+#define CLK_GOUT_CMGP_ADC_S1_PCLK	9
+#define CLK_GOUT_CMGP_GPIO_PCLK		10
+#define CLK_GOUT_CMGP_USI0_IPCLK	11
+#define CLK_GOUT_CMGP_USI0_PCLK		12
+#define CLK_GOUT_CMGP_USI1_IPCLK	13
+#define CLK_GOUT_CMGP_USI1_PCLK		14
+#define CMGP_NR_CLK			15
+
 /* CMU_HSI */
 #define CLK_MOUT_HSI_BUS_USER		1
 #define CLK_MOUT_HSI_MMC_CARD_USER	2
-- 
2.30.2

