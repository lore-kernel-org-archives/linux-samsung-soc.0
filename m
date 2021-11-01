Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEC89C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  1 Nov 2021 19:35:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF13060FC4
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  1 Nov 2021 19:35:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230011AbhKATiO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 1 Nov 2021 15:38:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229966AbhKATiJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 1 Nov 2021 15:38:09 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2AA3C061767
        for <linux-samsung-soc@vger.kernel.org>; Mon,  1 Nov 2021 12:35:35 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id f8so46352185edy.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 01 Nov 2021 12:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wrNTYnU5dJFmytnZGsgc4/jUdnhKUI+zJ+eIyY+oL2E=;
        b=rnJus9960Pg11/s7R96Y5kDBk2JWNu5m9t/hd9pG2GmTIF8McsTZCBAP0xyEpYtrLF
         1rpMUgAvicPPP+LFJdYvs6oh5JAU8fruueXFBttNRffG4f0R2mQnBDnhLgaYcvPQALDM
         Kr+gCYHC7zB/HLdry02QMo39np614hlKoCXLDSBQTye8nhGroN8h/wIJ2GKgG+WjsiOj
         V0NI50gL+T5vwNppI962yvOI9OwRjua1f8iguGpEhmzj4tkEf8AAOEX4hMiHEjXuzkhZ
         szacIxt5tZCqUY/5y8qiVYsJPZEebzLHzvw3FrKvRzKx+6aMXBYD0y8e2zArnknusIoS
         D9PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wrNTYnU5dJFmytnZGsgc4/jUdnhKUI+zJ+eIyY+oL2E=;
        b=pDvJ9nBg4O/ZONdy5XOJSVsfKHY/7l4V91RokqsBV7/RKTaodDGVQbip5zBOldcwfj
         JGL7UuseT3JOh7VP+suF4NotXOY19CxG/g18jvk+h5RUov2TBaNqRJ3ak2rkPZd19ccO
         sthnmoEs78doh7jz58M5KixGgwHGOGOEglsbhz2y47MXaQil+KNZFeweaKavylA/8hQx
         bln9tJ7J4AdzO7nZL9fo+DPGILCeQq7o6bczY/AhcIhQwLcadtj1w8/crVj8b31sx7qX
         XU3lZDJ0UjrcLhf241wELDEGknk//Kk0aZt0wXuFwLTsFQB1yJwmjGO23+FrT7FShx+M
         Pl7g==
X-Gm-Message-State: AOAM532RDPntdMjdXCMEYH81v41uJ81HaRRiTTEfgPZ+mGUhxgd+ylXx
        1bdd+BnQaHGZ8zvVoMsrJmxWww==
X-Google-Smtp-Source: ABdhPJzNlTjfMObhgw4jZTyMJ+GtHPE5TorD33wLu6FC0OwZlKsSw0OsCM6bLUBGF6xNnnN3t1CVnA==
X-Received: by 2002:a17:906:6849:: with SMTP id a9mr34358753ejs.370.1635795334570;
        Mon, 01 Nov 2021 12:35:34 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id i6sm7163043ejd.57.2021.11.01.12.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 12:35:34 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 1/2] clocksource: exynos_mct: Refactor resources allocation
Date:   Mon,  1 Nov 2021 21:35:30 +0200
Message-Id: <20211101193531.15078-2-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211101193531.15078-1-semen.protsenko@linaro.org>
References: <20211101193531.15078-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Marek Szyprowski <m.szyprowski@samsung.com>

Move interrupts allocation from exynos4_timer_resources() into separate
function together with the interrupt number parsing code from
mct_init_dt(), so the code for managing interrupts is kept together.
While touching exynos4_timer_resources() function, move of_iomap() to it.
No functional changes.

Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
Tested-by: Chanwoo Choi <cw00.choi@samsung.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/clocksource/exynos_mct.c | 50 +++++++++++++++++++-------------
 1 file changed, 30 insertions(+), 20 deletions(-)

diff --git a/drivers/clocksource/exynos_mct.c b/drivers/clocksource/exynos_mct.c
index 5e3e96d3d1b9..857cf12ebe57 100644
--- a/drivers/clocksource/exynos_mct.c
+++ b/drivers/clocksource/exynos_mct.c
@@ -504,11 +504,14 @@ static int exynos4_mct_dying_cpu(unsigned int cpu)
 	return 0;
 }
 
-static int __init exynos4_timer_resources(struct device_node *np, void __iomem *base)
+static int __init exynos4_timer_resources(struct device_node *np)
 {
-	int err, cpu;
 	struct clk *mct_clk, *tick_clk;
 
+	reg_base = of_iomap(np, 0);
+	if (!reg_base)
+		panic("%s: unable to ioremap mct address space\n", __func__);
+
 	tick_clk = of_clk_get_by_name(np, "fin_pll");
 	if (IS_ERR(tick_clk))
 		panic("%s: unable to determine tick clock rate\n", __func__);
@@ -519,9 +522,27 @@ static int __init exynos4_timer_resources(struct device_node *np, void __iomem *
 		panic("%s: unable to retrieve mct clock instance\n", __func__);
 	clk_prepare_enable(mct_clk);
 
-	reg_base = base;
-	if (!reg_base)
-		panic("%s: unable to ioremap mct address space\n", __func__);
+	return 0;
+}
+
+static int __init exynos4_timer_interrupts(struct device_node *np,
+					   unsigned int int_type)
+{
+	int nr_irqs, i, err, cpu;
+
+	mct_int_type = int_type;
+
+	/* This driver uses only one global timer interrupt */
+	mct_irqs[MCT_G0_IRQ] = irq_of_parse_and_map(np, MCT_G0_IRQ);
+
+	/*
+	 * Find out the number of local irqs specified. The local
+	 * timer irqs are specified after the four global timer
+	 * irqs are specified.
+	 */
+	nr_irqs = of_irq_count(np);
+	for (i = MCT_L0_IRQ; i < nr_irqs; i++)
+		mct_irqs[i] = irq_of_parse_and_map(np, i);
 
 	if (mct_int_type == MCT_INT_PPI) {
 
@@ -581,24 +602,13 @@ static int __init exynos4_timer_resources(struct device_node *np, void __iomem *
 
 static int __init mct_init_dt(struct device_node *np, unsigned int int_type)
 {
-	u32 nr_irqs, i;
 	int ret;
 
-	mct_int_type = int_type;
-
-	/* This driver uses only one global timer interrupt */
-	mct_irqs[MCT_G0_IRQ] = irq_of_parse_and_map(np, MCT_G0_IRQ);
-
-	/*
-	 * Find out the number of local irqs specified. The local
-	 * timer irqs are specified after the four global timer
-	 * irqs are specified.
-	 */
-	nr_irqs = of_irq_count(np);
-	for (i = MCT_L0_IRQ; i < nr_irqs; i++)
-		mct_irqs[i] = irq_of_parse_and_map(np, i);
+	ret = exynos4_timer_resources(np);
+	if (ret)
+		return ret;
 
-	ret = exynos4_timer_resources(np, of_iomap(np, 0));
+	ret = exynos4_timer_interrupts(np, int_type);
 	if (ret)
 		return ret;
 
-- 
2.30.2

