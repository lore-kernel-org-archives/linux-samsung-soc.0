Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34770C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 21 Nov 2021 23:27:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232057AbhKUXbB (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 21 Nov 2021 18:31:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231778AbhKUXa5 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 21 Nov 2021 18:30:57 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F91AC061714
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Nov 2021 15:27:51 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id z34so72193078lfu.8
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Nov 2021 15:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9RWfUaVEvOe/xqbTnGEBAz8g1kePABZzY6Rf9OiwS5c=;
        b=gky5GxE5+UtVWY6Zyjf6DSJUaB5VVRbBFP0Ioh09RvLqHYEOS7J7d6lalLpxpcKZ3L
         6B8rEja+Q/T3KKl4nwSsFQcuoByf/rYOW4qgSGm5UKXWRo6+QnqTAdhSKPH88SapINxU
         paymxp5+DSALgmb5wxmO4sg9eNRdU0rPLv7lRGiFJiO6AFtSQpj9JCsWO/6z6ELwDf71
         TRt322mUM9luQfDu4XqfkRONsjjoxEJLd+56FmfRbRtrmU/DNByzfZakK5xdiSZubW3M
         JVTWU3HayLjNH6rd7YWIWNd/OHXB2hytMHniqh+C+H/sv/sV9/ugm9EkRHHKb/G0uyno
         0LhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9RWfUaVEvOe/xqbTnGEBAz8g1kePABZzY6Rf9OiwS5c=;
        b=Q+uQ/tMKmCWH5Kft+qTWQEP1jsJ8akV261MI6jRaor/njH54Cl8HjGFEMt1hMr90gU
         i8WAQ1dheP1uRR5Ol1d0B/bbUh/jx2XXI8jo57HwGUkOAe8Tsik+3/IwIhevgdC8Qx/W
         QWnIQ1N1EQB6NWnmY5TSKNbGGpnQlZ3SVabne/7qDs8w1pI4vX1nRX7WoTVicu4TLOWr
         0uL/DqOO9PXDph+GJMpTQYAJCAkoDlTMPKdn9ylygft9q9aRuxyP2sLU90tF/RFmK95h
         G0/Uwna6wqpkRra+JjUQ7b3c25PHH/awdCdbvfLDzo5dZLEdh63qjYjgEMjy5byL9KAu
         uw8w==
X-Gm-Message-State: AOAM532uh++EM/Kh0J3KRL2WJMgdyJ5tRcC4ET2KnOZuCkUzSANfuaRI
        WRz8c3eMJknYOyNXcnf7mX8yqQ==
X-Google-Smtp-Source: ABdhPJz4V33QDr/AZEulkm9hC1UnIzeC1C53dQdhj2EnZo3HqHgFC+Z53VIweZ6dNdpsjOx8FnY/og==
X-Received: by 2002:a05:6512:3a8d:: with SMTP id q13mr49222206lfu.73.1637537269900;
        Sun, 21 Nov 2021 15:27:49 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id c25sm730518lja.38.2021.11.21.15.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 15:27:49 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Virag <virag.david003@gmail.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 4/6] clk: samsung: exynos850: Implement CMU_CMGP domain
Date:   Mon, 22 Nov 2021 01:27:39 +0200
Message-Id: <20211121232741.6967-5-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211121232741.6967-1-semen.protsenko@linaro.org>
References: <20211121232741.6967-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

CMU_CMGP clock domain provides clocks for CMGP IP-core (Common GPIO).
CMGP module encapsulates next blocks:
  - 8 GPIO lines
  - 1 GPADC
  - 2 USI blocks, each can be configured to provide one of
    UART/SPI/HSI2C serial interfaces

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 drivers/clk/samsung/clk-exynos850.c | 100 ++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
index 95e373d17b42..0eab7a115b44 100644
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
@@ -943,6 +1040,9 @@ static const struct of_device_id exynos850_cmu_of_match[] = {
 	{
 		.compatible = "samsung,exynos850-cmu-apm",
 		.data = &apm_cmu_info,
+	}, {
+		.compatible = "samsung,exynos850-cmu-cmgp",
+		.data = &cmgp_cmu_info,
 	}, {
 		.compatible = "samsung,exynos850-cmu-hsi",
 		.data = &hsi_cmu_info,
-- 
2.30.2

