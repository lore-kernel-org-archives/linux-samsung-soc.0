Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A50E6C742A7
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Mar 2023 23:38:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230185AbjCHXic (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Mar 2023 18:38:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbjCHXic (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Mar 2023 18:38:32 -0500
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com [IPv6:2001:4860:4864:20::29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB0445F220
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Mar 2023 15:38:29 -0800 (PST)
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-176261d7f45so519019fac.11
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Mar 2023 15:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678318709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xIF+TzoNCpNgaaPFRZQkOEM2aIrfReHqLZ5t062NKS8=;
        b=Ltdx//bI8+EcfFFzVD0xzgZ4Q9JkiCo8HulKF9GyblSCbeO0M/DRcxuu8WKR+GRUt9
         6rkQSewqo20alox3EQ+oRwG64/ER6XRoEI5koKP+nd5pPV78gPeSp4lGf2DN5/bCpSVY
         UJXMb/luPG/27tbLPKu93kXMaa/V/kRtyHs6FCuQFYAfe6z9WSTqiELHdh+jywdC3Xi9
         /SmYl5EyeUI02L1KMc8YjRjPQ9DJ6vAPhbRAiNAsR6cVUPZA/4Ge9azkkf0yoRDl7gAX
         HjzXlRtiCn4bzKRnerkvp3AwZTvxIHWPNfegjOTCQvix4WHDgZkfqcl1OftcgReOrEQX
         aCKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678318709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xIF+TzoNCpNgaaPFRZQkOEM2aIrfReHqLZ5t062NKS8=;
        b=fSBg5CUZgmyNy8Xo2VzcNaF422Q1/AZVlF1klimEiaKymvkDG34AU1pMtF7OUFjduR
         CTjF5+zUPaBAGz0cp8AxPsP5QWQdIYwV0VxTy2Hpi5jpu0PeG3IAQDHOH4SImMeuQQMB
         GAOBL+Fs+7/ZKnapBPrai2jZtrdRoOgncmdqZIUTFpjbRS+DSil3F+2j80DFRUY6HMbO
         7pGQaCb74bMT30B6cmgX87Q5NxchrmgroPnFM26TPPd4c2VoTGNoJQqBi0BEfefEcZ3S
         msmwT3rChw+MgPghBaIjwCydBWMfwKSDBYmSnaazGY8R+eHY+GE1IMXGH2rJSQXJBPzJ
         e1ZQ==
X-Gm-Message-State: AO0yUKVP89OZYURU/pCtkj6F38hmFnhS+//UAogQk9h7BJe4j6K30TiY
        dyEw9lcjy1CeaE4HlzhFFr44aQ==
X-Google-Smtp-Source: AK7set9VYwr+T8z+k6L0BS4GEK0pru9L4q1IR9HnAm4ODTR2MOgjxtRbVtTujQn6EOwctOvNq02Lpg==
X-Received: by 2002:a05:6870:5703:b0:16e:9056:4a03 with SMTP id k3-20020a056870570300b0016e90564a03mr1788575oap.47.1678318709176;
        Wed, 08 Mar 2023 15:38:29 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id m41-20020a4a952c000000b0051ff746e2b2sm6714646ooi.8.2023.03.08.15.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 15:38:28 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] clk: samsung: exynos850: Make PMU_ALIVE_PCLK critical
Date:   Wed,  8 Mar 2023 17:38:19 -0600
Message-Id: <20230308233822.31180-5-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308233822.31180-1-semen.protsenko@linaro.org>
References: <20230308233822.31180-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

PMU_ALIVE_PCLK is needed for PMU registers access, and it must be always
running, as not only the kernel accesses PMU registers. Make it critical
to ensure that.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/clk/samsung/clk-exynos850.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
index 6ab5fa8c2ef3..98b23af7324d 100644
--- a/drivers/clk/samsung/clk-exynos850.c
+++ b/drivers/clk/samsung/clk-exynos850.c
@@ -612,7 +612,7 @@ static const struct samsung_gate_clock apm_gate_clks[] __initconst = {
 	     CLK_CON_GAT_GOUT_APM_APBIF_GPIO_ALIVE_PCLK, 21, CLK_IGNORE_UNUSED,
 	     0),
 	GATE(CLK_GOUT_PMU_ALIVE_PCLK, "gout_pmu_alive_pclk", "dout_apm_bus",
-	     CLK_CON_GAT_GOUT_APM_APBIF_PMU_ALIVE_PCLK, 21, 0, 0),
+	     CLK_CON_GAT_GOUT_APM_APBIF_PMU_ALIVE_PCLK, 21, CLK_IS_CRITICAL, 0),
 	GATE(CLK_GOUT_SYSREG_APM_PCLK, "gout_sysreg_apm_pclk", "dout_apm_bus",
 	     CLK_CON_GAT_GOUT_APM_SYSREG_APM_PCLK, 21, 0, 0),
 };
-- 
2.39.2

