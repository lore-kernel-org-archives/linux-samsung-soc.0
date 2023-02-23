Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7DFCC61DA4
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 23 Feb 2023 04:23:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233254AbjBWEX3 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 22 Feb 2023 23:23:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233044AbjBWEWn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 22 Feb 2023 23:22:43 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3468A498A7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Feb 2023 20:21:34 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id e21so10641313oie.1
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Feb 2023 20:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qk+E8cQ29D74eb0oXLgwbQz1y9cU//DH5Xrbr3L15Lc=;
        b=oYgLn0k/fyNBXXm+U0YhuKAt2fJVD3YkOwTzTrx1UQgBe9KUfTyU/aTxgc7MvpNvIi
         NOAQXYMn+979TvN0M2KQIPVVkZIqSioQr4E1bI5l0EPJHKgu1us7JZagK/8xEbfhH3S0
         QX5Jn/DQGGKLNyr2VWWQQOsaEmM3lYtGKaD7lvN2LSVnEmhAYcVZEyzKLa0tvMKtuIWs
         jpTArOMtyg7/VM/xHhQA+GgPw3fPltA3vUmUJ4sc6/Hdf6LfFcUjJSNxgRgKmC8vOiG8
         PR0xqNua62eYbw2wgaXBYG6ADgN2cmCdc+gYYSKp2JnX8StrMZ78sJ46Hhzg4G2RXE8O
         BfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qk+E8cQ29D74eb0oXLgwbQz1y9cU//DH5Xrbr3L15Lc=;
        b=EwabsJLrx6HHCeoZ+liMp7+QHefS9MvnvPZsJQRYwQ2LiB+TLbyQDPH2O7wHmIjJ7Y
         /hOcBuXHAih8fCndfCJZZhwopA3jFlSY4wq9ocSp1JFurIWpk1ZK96MMbKGNBhGtLht7
         00TGDZNorc75GYvumWIxjmFva9xOM07FdbYu5FjQsNpw8np/5yBfdnV5qnIPLhrCK4Fx
         H1rqNFxcusTLw06QzuywGAZjsjA+zx4CBXIYAhvcmhHYGKdMcimoFZqVF5c3qWmCiJy+
         hegtXiwYHrvQB6y+xYbytsbGALd2+BhSNILGKckmSuaHI+F4qjO+fp2UdDrbAt5O1zz8
         DS/g==
X-Gm-Message-State: AO0yUKXCgZV/qd+o3IRDO9Rcz7RWZVT0SVoR2snbbi/J6iK54KziOYg0
        l5aLUQnfLHyCut9UHvT7tYIf3pqY+IYnGL73C6Y=
X-Google-Smtp-Source: AK7set9j6lalehujVDNI/Sm/zk3EK4VMFfdLYd4mugm9iTkRx4gajq5daN8dVFJPHzfqWiKXiHhceA==
X-Received: by 2002:a05:6808:105:b0:37d:5cee:6484 with SMTP id b5-20020a056808010500b0037d5cee6484mr1159385oie.46.1677126084114;
        Wed, 22 Feb 2023 20:21:24 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id q127-20020acac085000000b0037d813cd612sm1988674oif.43.2023.02.22.20.21.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 20:21:23 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     David Virag <virag.david003@gmail.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 5/6] clk: samsung: exynos850: Add AUD and HSI main gate clocks
Date:   Wed, 22 Feb 2023 22:21:32 -0600
Message-Id: <20230223042133.26551-6-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223042133.26551-1-semen.protsenko@linaro.org>
References: <20230223042133.26551-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add main gate clocks for controlling AUD and HSI CMUs:
  - gout_aud_cmu_aud_pclk
  - gout_hsi_cmu_hsi_pclk

Those clocks were marked as CLK_IGNORE_UNUSED, as system hangs on
boot otherwise.

While at it, add missing PPMU (Performance Profiling Monitor Unit)
clocks for CMU_HSI.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - Rebased on top of most recent soc/for-next tree
  - Added comment for CLK_IGNORE_UNUSED flag usage

 drivers/clk/samsung/clk-exynos850.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
index 601fe05e8555..6ab5fa8c2ef3 100644
--- a/drivers/clk/samsung/clk-exynos850.c
+++ b/drivers/clk/samsung/clk-exynos850.c
@@ -674,6 +674,7 @@ static const struct samsung_cmu_info apm_cmu_info __initconst = {
 #define CLK_CON_GAT_GOUT_AUD_ABOX_BCLK_UAIF4	0x2014
 #define CLK_CON_GAT_GOUT_AUD_ABOX_BCLK_UAIF5	0x2018
 #define CLK_CON_GAT_GOUT_AUD_ABOX_BCLK_UAIF6	0x201c
+#define CLK_CON_GAT_CLK_AUD_CMU_AUD_PCLK	0x2020
 #define CLK_CON_GAT_GOUT_AUD_ABOX_ACLK		0x2048
 #define CLK_CON_GAT_GOUT_AUD_ABOX_BCLK_SPDY	0x204c
 #define CLK_CON_GAT_GOUT_AUD_ABOX_CCLK_ASB	0x2050
@@ -729,6 +730,7 @@ static const unsigned long aud_clk_regs[] __initconst = {
 	CLK_CON_GAT_GOUT_AUD_ABOX_BCLK_UAIF4,
 	CLK_CON_GAT_GOUT_AUD_ABOX_BCLK_UAIF5,
 	CLK_CON_GAT_GOUT_AUD_ABOX_BCLK_UAIF6,
+	CLK_CON_GAT_CLK_AUD_CMU_AUD_PCLK,
 	CLK_CON_GAT_GOUT_AUD_ABOX_ACLK,
 	CLK_CON_GAT_GOUT_AUD_ABOX_BCLK_SPDY,
 	CLK_CON_GAT_GOUT_AUD_ABOX_CCLK_ASB,
@@ -848,6 +850,9 @@ static const struct samsung_div_clock aud_div_clks[] __initconst = {
 };
 
 static const struct samsung_gate_clock aud_gate_clks[] __initconst = {
+	GATE(CLK_GOUT_AUD_CMU_AUD_PCLK, "gout_aud_cmu_aud_pclk",
+	     "dout_aud_busd",
+	     CLK_CON_GAT_CLK_AUD_CMU_AUD_PCLK, 21, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_GOUT_AUD_CA32_CCLK, "gout_aud_ca32_cclk", "mout_aud_cpu_hch",
 	     CLK_CON_GAT_GOUT_AUD_ABOX_CCLK_CA32, 21, 0, 0),
 	GATE(CLK_GOUT_AUD_ASB_CCLK, "gout_aud_asb_cclk", "dout_aud_cpu_aclk",
@@ -1116,12 +1121,15 @@ static const struct samsung_cmu_info g3d_cmu_info __initconst = {
 #define PLL_CON0_MUX_CLKCMU_HSI_MMC_CARD_USER			0x0610
 #define PLL_CON0_MUX_CLKCMU_HSI_USB20DRD_USER			0x0620
 #define CLK_CON_MUX_MUX_CLK_HSI_RTC				0x1000
+#define CLK_CON_GAT_CLK_HSI_CMU_HSI_PCLK			0x2000
 #define CLK_CON_GAT_HSI_USB20DRD_TOP_I_RTC_CLK__ALV		0x2008
 #define CLK_CON_GAT_HSI_USB20DRD_TOP_I_REF_CLK_50		0x200c
 #define CLK_CON_GAT_HSI_USB20DRD_TOP_I_PHY_REFCLK_26		0x2010
 #define CLK_CON_GAT_GOUT_HSI_GPIO_HSI_PCLK			0x2018
 #define CLK_CON_GAT_GOUT_HSI_MMC_CARD_I_ACLK			0x2024
 #define CLK_CON_GAT_GOUT_HSI_MMC_CARD_SDCLKIN			0x2028
+#define CLK_CON_GAT_GOUT_HSI_PPMU_ACLK				0x202c
+#define CLK_CON_GAT_GOUT_HSI_PPMU_PCLK				0x2030
 #define CLK_CON_GAT_GOUT_HSI_SYSREG_HSI_PCLK			0x2038
 #define CLK_CON_GAT_GOUT_HSI_USB20DRD_TOP_ACLK_PHYCTRL_20	0x203c
 #define CLK_CON_GAT_GOUT_HSI_USB20DRD_TOP_BUS_CLK_EARLY		0x2040
@@ -1131,12 +1139,15 @@ static const unsigned long hsi_clk_regs[] __initconst = {
 	PLL_CON0_MUX_CLKCMU_HSI_MMC_CARD_USER,
 	PLL_CON0_MUX_CLKCMU_HSI_USB20DRD_USER,
 	CLK_CON_MUX_MUX_CLK_HSI_RTC,
+	CLK_CON_GAT_CLK_HSI_CMU_HSI_PCLK,
 	CLK_CON_GAT_HSI_USB20DRD_TOP_I_RTC_CLK__ALV,
 	CLK_CON_GAT_HSI_USB20DRD_TOP_I_REF_CLK_50,
 	CLK_CON_GAT_HSI_USB20DRD_TOP_I_PHY_REFCLK_26,
 	CLK_CON_GAT_GOUT_HSI_GPIO_HSI_PCLK,
 	CLK_CON_GAT_GOUT_HSI_MMC_CARD_I_ACLK,
 	CLK_CON_GAT_GOUT_HSI_MMC_CARD_SDCLKIN,
+	CLK_CON_GAT_GOUT_HSI_PPMU_ACLK,
+	CLK_CON_GAT_GOUT_HSI_PPMU_PCLK,
 	CLK_CON_GAT_GOUT_HSI_SYSREG_HSI_PCLK,
 	CLK_CON_GAT_GOUT_HSI_USB20DRD_TOP_ACLK_PHYCTRL_20,
 	CLK_CON_GAT_GOUT_HSI_USB20DRD_TOP_BUS_CLK_EARLY,
@@ -1162,6 +1173,10 @@ static const struct samsung_mux_clock hsi_mux_clks[] __initconst = {
 };
 
 static const struct samsung_gate_clock hsi_gate_clks[] __initconst = {
+	/* TODO: Should be enabled in corresponding driver */
+	GATE(CLK_GOUT_HSI_CMU_HSI_PCLK, "gout_hsi_cmu_hsi_pclk",
+	     "mout_hsi_bus_user",
+	     CLK_CON_GAT_CLK_HSI_CMU_HSI_PCLK, 21, CLK_IGNORE_UNUSED, 0),
 	GATE(CLK_GOUT_USB_RTC_CLK, "gout_usb_rtc", "mout_hsi_rtc",
 	     CLK_CON_GAT_HSI_USB20DRD_TOP_I_RTC_CLK__ALV, 21, 0, 0),
 	GATE(CLK_GOUT_USB_REF_CLK, "gout_usb_ref", "mout_hsi_usb20drd_user",
@@ -1176,6 +1191,10 @@ static const struct samsung_gate_clock hsi_gate_clks[] __initconst = {
 	GATE(CLK_GOUT_MMC_CARD_SDCLKIN, "gout_mmc_card_sdclkin",
 	     "mout_hsi_mmc_card_user",
 	     CLK_CON_GAT_GOUT_HSI_MMC_CARD_SDCLKIN, 21, CLK_SET_RATE_PARENT, 0),
+	GATE(CLK_GOUT_HSI_PPMU_ACLK, "gout_hsi_ppmu_aclk", "mout_hsi_bus_user",
+	     CLK_CON_GAT_GOUT_HSI_PPMU_ACLK, 21, 0, 0),
+	GATE(CLK_GOUT_HSI_PPMU_PCLK, "gout_hsi_ppmu_pclk", "mout_hsi_bus_user",
+	     CLK_CON_GAT_GOUT_HSI_PPMU_PCLK, 21, 0, 0),
 	GATE(CLK_GOUT_SYSREG_HSI_PCLK, "gout_sysreg_hsi_pclk",
 	     "mout_hsi_bus_user",
 	     CLK_CON_GAT_GOUT_HSI_SYSREG_HSI_PCLK, 21, 0, 0),
-- 
2.39.1

