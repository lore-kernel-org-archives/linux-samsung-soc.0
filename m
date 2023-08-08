Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8911CC04A6A
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Aug 2023 15:55:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231142AbjHHPz6 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Aug 2023 11:55:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbjHHPyT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Aug 2023 11:54:19 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0A1C59D2
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Aug 2023 08:43:30 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3090d3e9c92so4987218f8f.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Aug 2023 08:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691509392; x=1692114192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WFfvkly3ynKYhnloBAB5Bwm8QGvgmXjPSUsPPXMqNoQ=;
        b=Yjs27tXqYZ9X++USaK747mPsJWCQTmzUrwRcakx0vVD1GgosugIgnCISe0Mdfhsa/d
         DQXQ6xNACXp9LYHqZoxFpg6e3+YVCuGh6zbvVkaYSTKoLpwcWzmsOL7t844XB3XET/v+
         J+3HSBzPG66KLh/k81WSVgupcCRINx2GRwvtRxQlzPZt4mPnJ7oZaJmezZThi0/1ntkE
         l8hZx+cx3zHYsLmvOkoDm8aWpzspT1OHdJE7FXpSgl4/AWeAHC9WqE8X9N8/chTHQI6Z
         ISN/FZObBsR36OPZTZz6fsOhBFnWMQHqgJX+RVjLFiGy48YA9VFG3B35nLv5hxP8Y8Hq
         o0vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691509392; x=1692114192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WFfvkly3ynKYhnloBAB5Bwm8QGvgmXjPSUsPPXMqNoQ=;
        b=OgJQq5Tg43GTqeqEqrQP9Dfm8xbNdRZu9Mf2Wxyu5Fc2no1zkWC/8ok8zcScEpcWQd
         AvMGIBIyMJhufPGtx4luJIPiv7U9EWGorZVGKHZ6f1A1nWUmzedt/VwI7A7+glIzg6eK
         bnuXyQ/Bybudo+Xz2P2GZOypwO4EYzvLE+hvueLq4UonHVCLon7fcY2Mse5NDd9fKpTX
         v+/AnKtXfs5LwklLnrptDslbhwhZK/X8kiVuME9x+JMQ3IhkCERcBm+dzY0xNh5+2Lra
         BmxINgBOM0Twg9qESfVcTF00/cC2Kp7X9PLfI8c9p43HR2b1P+oYkKeBei16y0E130g9
         6v5A==
X-Gm-Message-State: AOJu0YwZgDnPXYh0pwhKGR5Dtobg2FqurnmRHGvRt5h3hN7PAJa11Jee
        QlCzs7oi0gA79mvOzpBAR8a3y3AEGGhF96AGQZ4=
X-Google-Smtp-Source: AGHT+IEx9WFWo3clO7Eu0C3jX65Z+oYsA6+ETiWsFoS588U+BcX6IShcpjIAbekFHeKVH5GDiJCa5A==
X-Received: by 2002:adf:e6cb:0:b0:314:1249:d5d7 with SMTP id y11-20020adfe6cb000000b003141249d5d7mr8311246wrm.16.1691483264463;
        Tue, 08 Aug 2023 01:27:44 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id s18-20020adfeb12000000b0031779a6b451sm12861246wrn.83.2023.08.08.01.27.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 01:27:44 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 01/11] clk: samsung: exynos3250: do not define number of clocks in bindings
Date:   Tue,  8 Aug 2023 10:27:28 +0200
Message-Id: <20230808082738.122804-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808082738.122804-1-krzysztof.kozlowski@linaro.org>
References: <20230808082738.122804-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Number of clocks supported by Linux drivers might vary - sometimes we
add new clocks, not exposed previously.  Therefore this number of clocks
should not be in the bindings, because otherwise we should not change
it.

Define number of clocks per each clock controller inside the driver
directly.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/samsung/clk-exynos3250.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos3250.c b/drivers/clk/samsung/clk-exynos3250.c
index 6cc65ccf867c..a02461667664 100644
--- a/drivers/clk/samsung/clk-exynos3250.c
+++ b/drivers/clk/samsung/clk-exynos3250.c
@@ -100,6 +100,11 @@
 #define PWR_CTRL1_USE_CORE1_WFI			(1 << 1)
 #define PWR_CTRL1_USE_CORE0_WFI			(1 << 0)
 
+/* NOTE: Must be equal to the last clock ID increased by one */
+#define CLKS_NR_MAIN				(CLK_SCLK_MMC2 + 1)
+#define CLKS_NR_DMC				(CLK_DIV_DMCD + 1)
+#define CLKS_NR_ISP				(CLK_SCLK_MPWM_ISP + 1)
+
 static const unsigned long exynos3250_cmu_clk_regs[] __initconst = {
 	SRC_LEFTBUS,
 	DIV_LEFTBUS,
@@ -807,7 +812,7 @@ static const struct samsung_cmu_info cmu_info __initconst = {
 	.nr_fixed_factor_clks	= ARRAY_SIZE(fixed_factor_clks),
 	.cpu_clks		= exynos3250_cpu_clks,
 	.nr_cpu_clks		= ARRAY_SIZE(exynos3250_cpu_clks),
-	.nr_clk_ids		= CLK_NR_CLKS,
+	.nr_clk_ids		= CLKS_NR_MAIN,
 	.clk_regs		= exynos3250_cmu_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(exynos3250_cmu_clk_regs),
 };
@@ -923,7 +928,7 @@ static const struct samsung_cmu_info dmc_cmu_info __initconst = {
 	.nr_mux_clks		= ARRAY_SIZE(dmc_mux_clks),
 	.div_clks		= dmc_div_clks,
 	.nr_div_clks		= ARRAY_SIZE(dmc_div_clks),
-	.nr_clk_ids		= NR_CLKS_DMC,
+	.nr_clk_ids		= CLKS_NR_DMC,
 	.clk_regs		= exynos3250_cmu_dmc_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(exynos3250_cmu_dmc_clk_regs),
 };
@@ -1067,7 +1072,7 @@ static const struct samsung_cmu_info isp_cmu_info __initconst = {
 	.nr_div_clks	= ARRAY_SIZE(isp_div_clks),
 	.gate_clks	= isp_gate_clks,
 	.nr_gate_clks	= ARRAY_SIZE(isp_gate_clks),
-	.nr_clk_ids	= NR_CLKS_ISP,
+	.nr_clk_ids	= CLKS_NR_ISP,
 };
 
 static int __init exynos3250_cmu_isp_probe(struct platform_device *pdev)
-- 
2.34.1

