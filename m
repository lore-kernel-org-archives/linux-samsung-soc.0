Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4342CC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 25 Oct 2021 16:12:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C55260EBD
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 25 Oct 2021 16:12:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230177AbhJYQPU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 25 Oct 2021 12:15:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232069AbhJYQPU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 25 Oct 2021 12:15:20 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D712C061348
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Oct 2021 09:12:57 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 65so8968438ljf.9
        for <linux-samsung-soc@vger.kernel.org>; Mon, 25 Oct 2021 09:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pxxFGzwxjm1fYlK0VDD130fPjlKjYboL+bOCK3r6zMg=;
        b=UAasKWrbVPrNZiVDnYpZcbPTEoN7pUFAqfCwAVt1I3OR9m9Y+c5WLzNokqgCMroHRQ
         2ZzpXng65jYlLkRB8ZzLEzSS2uWDQ8aLsqOqF6Nr06HxGROp81ai1NSnsOLRd1ma5AQ5
         V+hcutSJwiWxHO6/PczoeACI6idc0i2Ev/58WbhibNkCqs/x9YmNHVWapewoIbAbVi+f
         zEUQzqQHWbWi0JjrK2y0UBCPwHJxI0ZwT1J5mbw9aqYjVvHn0ku3RDvB2HeVi/h11yNc
         DlNoq+ywnkHfrmcHFGYSjM8AgXj0pvF/OBG2Ku2L3FIDu5xsO99M3pnsAymbIIPnrjzt
         QQ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pxxFGzwxjm1fYlK0VDD130fPjlKjYboL+bOCK3r6zMg=;
        b=tQ8oFXvxBH9enzF6B/p6KWmAxqrRxtOLEp2lA8MhdJrZ70mTccydoxhgK98zB2Ert7
         Hc0Z3/rkemCUHO08ZQ4JUQkHAqP6ngOHux1v798TcvhFF28C2BERtg6FdyxxzpEQKj4f
         GXZs+MQka/4DoS/EHgQTl8gCpp2jEmSNm77eyFczjDEmx3q+at2Qntqsk9dYjNBzAnCZ
         vMmKD74A4M1tojAe96j4mQpLmR3Soj3QR/e6NnRuYn4VKnxyYuhm6Tn1/Wq60nMu/efu
         gLEQTHxoRbRCalByx/PDn7w29QcwXXScc/WllsiOG+/pcGVBOnSEC6PPYe6MkPKPtwb9
         zlzQ==
X-Gm-Message-State: AOAM532DZSqvgPyBVeIWfXEobhhHlQ4mIyUqeHEnOpUM/EOSdpjYvgnZ
        aOP244ENhIB67R+Dngm+U90czw==
X-Google-Smtp-Source: ABdhPJy7tky8K0acUazaVCci6+tBFLlZHynyY5jZJGvWP+T15lajMJ6bnO7mjeBGTx6rTDHD4jTylQ==
X-Received: by 2002:a05:651c:1024:: with SMTP id w4mr19969693ljm.17.1635178375705;
        Mon, 25 Oct 2021 09:12:55 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id c15sm1678258lff.238.2021.10.25.09.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 09:12:55 -0700 (PDT)
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
Subject: [PATCH v2 1/1] clk: samsung: exynos850: Register clocks early
Date:   Mon, 25 Oct 2021 19:12:54 +0300
Message-Id: <20211025161254.5575-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Some clocks must be registered before init calls. For example MCT clock
(from CMU_PERI) is needed for MCT timer driver, which is registered
with TIMER_OF_DECLARE(). By the time we get to core_initcall() used for
clk-exynos850 platform driver init, it's already too late. Inability to
get "mct" clock in MCT driver leads to kernel panic, as functions
registered with *_OF_DECLARE() can't do deferred calls. MCT timer driver
can't be fixed either, as it's acting as a clock source and it's
essential to register it in start_kernel() -> time_init().

Let's register CMU_PERI clocks early, using CLK_OF_DECLARE_DRIVER(), and
do all stuff relying on "struct dev" object (like runtime PM and
enabling bus clock) later in platform driver probe. Basically
CLK_OF_DECLARE_DRIVER() matches CMU compatible, but clears OF_POPULATED
flag, which allows the same device to be matched again later.

Similar issue was discussed at [1] and addressed in commit 1f7db7bbf031
("clk: renesas: cpg-mssr: Add early clock support"), as well as in
drivers/clk/mediatek/clk-mt2712.c.

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20180829132954.64862-2-chris.brandt@renesas.com/

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - Register only CMU_PERI clocks early

Notes:
  - This patch should be applied on top of CMU_APM series
    (clk: samsung: exynos850: Implement CMU_APM domain)

 drivers/clk/samsung/clk-exynos850.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
index 95e373d17b42..ecffa5c7a081 100644
--- a/drivers/clk/samsung/clk-exynos850.c
+++ b/drivers/clk/samsung/clk-exynos850.c
@@ -753,6 +753,15 @@ static const struct samsung_cmu_info peri_cmu_info __initconst = {
 	.clk_name		= "dout_peri_bus",
 };
 
+static void __init exynos850_cmu_peri_init(struct device_node *np)
+{
+	exynos850_init_clocks(np, peri_clk_regs, ARRAY_SIZE(peri_clk_regs));
+	samsung_cmu_register_one(np, &peri_cmu_info);
+}
+
+CLK_OF_DECLARE_DRIVER(exynos850_cmu_peri, "samsung,exynos850-cmu-peri",
+		      exynos850_cmu_peri_init);
+
 /* ---- CMU_CORE ------------------------------------------------------------ */
 
 /* Register Offset definitions for CMU_CORE (0x12000000) */
@@ -920,8 +929,12 @@ static int __init exynos850_cmu_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 
 	info = of_device_get_match_data(dev);
-	exynos850_init_clocks(np, info->clk_regs, info->nr_clk_regs);
-	samsung_cmu_register_one(np, info);
+
+	/* Early clocks are already registered using CLK_OF_DECLARE_DRIVER() */
+	if (info != &peri_cmu_info) {
+		exynos850_init_clocks(np, info->clk_regs, info->nr_clk_regs);
+		samsung_cmu_register_one(np, info);
+	}
 
 	/* Keep bus clock running, so it's possible to access CMU registers */
 	if (info->clk_name) {
-- 
2.30.2

