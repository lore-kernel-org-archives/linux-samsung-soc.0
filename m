Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50DD0C001DE
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Aug 2023 16:43:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233299AbjHHQni (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Aug 2023 12:43:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232557AbjHHQms (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Aug 2023 12:42:48 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 844821656B
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Aug 2023 08:55:27 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-99c0290f0a8so765769966b.1
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Aug 2023 08:55:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691510106; x=1692114906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qv5+yldfcLl5F50y6SpkVFOO6DSopWazKZ9tTkvj/KI=;
        b=g1bU1TUUKFyHOpTHeIYFI+Q+B/DXO92zyFdjoZvZDIiZjKKIvXy6R58Dn3n12hmD61
         dZY6icpFsb+miHIW1fKcXrzSWg9Uy2hnXReyYGjrS90FUF03HshRMV3JpMJQhPD1Bw1H
         qTw8qBXX1od5ekS6XaZp+tUceWU0qF/XLZsQ4Dvz2rQ3agNnEkbCpkkffMxTsAD3nfjK
         /7xvW6KMuJIBBUsqR4g0/Q0cfKrQUQAo/Qfn4EfgFTQRJqHOLR8WL8diTvCvcicZ0s+2
         jZkYECw8KwtdEdbu7p1KAGhfANw8pGFkgwT3FCJ1E6FaWjMV6d49rIth5m4k3xVanexQ
         D9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691510106; x=1692114906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qv5+yldfcLl5F50y6SpkVFOO6DSopWazKZ9tTkvj/KI=;
        b=JHGE3hYDqswHJJ6dueF1habQqTq9Pel5+TY/UGOL+q3E42pDUytr2YV7We/8e5LBCU
         FVtnJ8R/UuUAJZYt0nB24rTfI7wSm9/SgD1xd83AuI960v4mhr2oEfLNrjGFqvmN9SqC
         wM2QFzEQvjwngSCDI472GQwkU66c5HlJL8WETXuTnkLxOD0xlR5OrFF/0xZvRBAsS5rI
         XxJY24c9LFe9S8h/egu/RxChyfynERgBTgWADgPUDTiOMONpl3Eu8MTgr5Gpf0ARS+Ib
         5onDOLjSUAULQhqcB2lX2sviWXPJgRWGJtkp8w+Fvp6iE9YDbJJP4EdCfDhSEQ4eNS/G
         dYsg==
X-Gm-Message-State: AOJu0YwMtu5lNwsQnuBMu9he5/OyizustpURQEGhOKPne8Vnq6GLgRIJ
        6izIa6MCcqgTg2UN6SRlla8hbriRfEfe5jgQq2Y=
X-Google-Smtp-Source: AGHT+IE1JwtFdnFB8Qb2FMa0lT19XJl5y0OhOFfz9ix5xSzooJBHWR588byfQs4NsD0XnfPqprVNBg==
X-Received: by 2002:a05:6512:39d6:b0:4f8:71bf:a259 with SMTP id k22-20020a05651239d600b004f871bfa259mr7889276lfu.67.1691483278062;
        Tue, 08 Aug 2023 01:27:58 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id s18-20020adfeb12000000b0031779a6b451sm12861246wrn.83.2023.08.08.01.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 01:27:57 -0700 (PDT)
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
Subject: [PATCH 08/11] clk: samsung: exynos7885: do not define number of clocks in bindings
Date:   Tue,  8 Aug 2023 10:27:35 +0200
Message-Id: <20230808082738.122804-9-krzysztof.kozlowski@linaro.org>
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
 drivers/clk/samsung/clk-exynos7885.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos7885.c b/drivers/clk/samsung/clk-exynos7885.c
index 0c6a84764f7a..f7d7427a558b 100644
--- a/drivers/clk/samsung/clk-exynos7885.c
+++ b/drivers/clk/samsung/clk-exynos7885.c
@@ -16,6 +16,12 @@
 #include "clk.h"
 #include "clk-exynos-arm64.h"
 
+/* NOTE: Must be equal to the last clock ID increased by one */
+#define CLKS_NR_TOP			(CLK_GOUT_FSYS_USB30DRD + 1)
+#define CLKS_NR_CORE			(CLK_GOUT_TREX_P_CORE_PCLK_P_CORE + 1)
+#define CLKS_NR_PERI			(CLK_GOUT_WDT1_PCLK + 1)
+#define CLKS_NR_FSYS			(CLK_GOUT_MMC_SDIO_SDCLKIN + 1)
+
 /* ---- CMU_TOP ------------------------------------------------------------- */
 
 /* Register Offset definitions for CMU_TOP (0x12060000) */
@@ -333,7 +339,7 @@ static const struct samsung_cmu_info top_cmu_info __initconst = {
 	.nr_div_clks		= ARRAY_SIZE(top_div_clks),
 	.gate_clks		= top_gate_clks,
 	.nr_gate_clks		= ARRAY_SIZE(top_gate_clks),
-	.nr_clk_ids		= TOP_NR_CLK,
+	.nr_clk_ids		= CLKS_NR_TOP,
 	.clk_regs		= top_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(top_clk_regs),
 };
@@ -552,7 +558,7 @@ static const struct samsung_cmu_info peri_cmu_info __initconst = {
 	.nr_mux_clks		= ARRAY_SIZE(peri_mux_clks),
 	.gate_clks		= peri_gate_clks,
 	.nr_gate_clks		= ARRAY_SIZE(peri_gate_clks),
-	.nr_clk_ids		= PERI_NR_CLK,
+	.nr_clk_ids		= CLKS_NR_PERI,
 	.clk_regs		= peri_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(peri_clk_regs),
 	.clk_name		= "dout_peri_bus",
@@ -661,7 +667,7 @@ static const struct samsung_cmu_info core_cmu_info __initconst = {
 	.nr_div_clks		= ARRAY_SIZE(core_div_clks),
 	.gate_clks		= core_gate_clks,
 	.nr_gate_clks		= ARRAY_SIZE(core_gate_clks),
-	.nr_clk_ids		= CORE_NR_CLK,
+	.nr_clk_ids		= CLKS_NR_CORE,
 	.clk_regs		= core_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(core_clk_regs),
 	.clk_name		= "dout_core_bus",
@@ -743,7 +749,7 @@ static const struct samsung_cmu_info fsys_cmu_info __initconst = {
 	.nr_mux_clks		= ARRAY_SIZE(fsys_mux_clks),
 	.gate_clks		= fsys_gate_clks,
 	.nr_gate_clks		= ARRAY_SIZE(fsys_gate_clks),
-	.nr_clk_ids		= FSYS_NR_CLK,
+	.nr_clk_ids		= CLKS_NR_FSYS,
 	.clk_regs		= fsys_clk_regs,
 	.nr_clk_regs		= ARRAY_SIZE(fsys_clk_regs),
 	.clk_name		= "dout_fsys_bus",
-- 
2.34.1

