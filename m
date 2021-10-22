Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39967C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 22 Oct 2021 21:56:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 114AF6103E
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 22 Oct 2021 21:56:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233524AbhJVV65 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 22 Oct 2021 17:58:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232411AbhJVV65 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 22 Oct 2021 17:58:57 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23451C061766
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Oct 2021 14:56:39 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id w23so3760718lje.7
        for <linux-samsung-soc@vger.kernel.org>; Fri, 22 Oct 2021 14:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c/S0fLHh4E/Um2IUn3S1CtO8fr6JIUX0UiE7pO5hmxU=;
        b=fok2A8hrbkCYJaihpc+0cEneI4q4olQw3hRUG9V5cHk+WPqWwl0P+9Xafx9+Ji7a8V
         fo18VlmUZt/afYknnvQAqdNoF2I/yc3f5mMSxjF2BeZ9656gqGJHEfMUBnDYska69gaa
         VSi7PPyxYAxU8s7NRHxeUCMywSV3fC7motTx1NDIY74z2xB6jWToGSPnr50QP3ECCzHs
         LOr9U5S9zzaxdXYUAtdqZpL9baPiF+AIMI7wu9UcC7P3zrod2bb/iYJ1mdsk9ftESbfi
         HrTSiFr/hYRVGBp6r8dP0oehmY+EozgxmmMkoWb7KNDVmyTuyWoETP6tm7PD2mPo/VV2
         sg1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c/S0fLHh4E/Um2IUn3S1CtO8fr6JIUX0UiE7pO5hmxU=;
        b=a5g8qsXGNjakNTufkVXJTfng/N/kkn0pSa/O+7J+SdG3LECqSSdBfmI81KFEZiCEmL
         Y69/tTULq0285tWtXjxI2Aj6tDUJ0IL/vIEm3D8tXKSov+pG6qKMBGEAmQwRKyeIBQaR
         xvHJ40Qs4Z6yZ4c5//8C99Oyz2IX4sntD8gc6ofT+TKLJtukHoMG8azyrEfeXnPNKeQJ
         tHy5W7Nd+2XaqWOwGyoRfL0GrELwuNxrQRvjLCzTIJ0djIkO6bZnWm82tfS7Vlmgj8Dt
         gJQ1v89kv0o+esyTD+GK+DUpjUzvm0G1RPjtmzJl3XLi7Qk/yNF+6Y983WWlPdlaj9lz
         6qaQ==
X-Gm-Message-State: AOAM533HCdSZDBLhCSG/2iPj9qeoxCWYkEuV06Ur5CFlac+PShkOK9wk
        0muxYjg8qW+L8J8TeI1LONQA8g==
X-Google-Smtp-Source: ABdhPJyjyGICLOINCwYr+2QfOuBNs/sfNaeBvRkETbfJEcLDUnMsihC8tZvyyoV70H/1lHPHe8CAFw==
X-Received: by 2002:a2e:b162:: with SMTP id a2mr2525317ljm.440.1634939797048;
        Fri, 22 Oct 2021 14:56:37 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id u27sm840201lfm.275.2021.10.22.14.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 14:56:36 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] clk: samsung: exynos850: Register clocks early
Date:   Sat, 23 Oct 2021 00:56:35 +0300
Message-Id: <20211022215635.31128-1-semen.protsenko@linaro.org>
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

Let's register all Exynos850 clocks early, using
CLK_OF_DECLARE_DRIVER(), and do all stuff relying on "struct dev" object
(like runtime PM and enabling bus clock) later in platform driver probe.
Basically CLK_OF_DECLARE_DRIVER() matches CMU compatible, but clears
OF_POPULATED flag, which allows the same device to be matched again
later.

Similar issue was discussed at [1] and addressed in commit 1f7db7bbf031
("clk: renesas: cpg-mssr: Add early clock support"), as well as in
drivers/clk/mediatek/clk-mt2712.c.

[1] https://patchwork.kernel.org/project/linux-renesas-soc/patch/20180829132954.64862-2-chris.brandt@renesas.com/

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Notes:
  - This patch should be applied on top of CMU_APM series
    (clk: samsung: exynos850: Implement CMU_APM domain)
  - I considered introducing some macro to reduce the code duplication
    (actually created one), but decided to go with plain code: this way
    it's easier to understand and navigate
  - Also considered registering only *some* clocks early: won't be
    possible, as leaf clocks (like MCT) depend on the whole clock tree.
    Registering early only *some* CMUs (like CMU_PERI) looks possible,
    but I'm not sure what is the best way to implement this, and that
    won't be consistent with other CMUs (too much code variation as for
    my taste)

 drivers/clk/samsung/clk-exynos850.c | 48 +++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
index 95e373d17b42..255bc2bcf709 100644
--- a/drivers/clk/samsung/clk-exynos850.c
+++ b/drivers/clk/samsung/clk-exynos850.c
@@ -492,6 +492,15 @@ static const struct samsung_cmu_info apm_cmu_info __initconst = {
 	.clk_name		= "dout_clkcmu_apm_bus",
 };
 
+static void __init exynos850_cmu_apm_init(struct device_node *np)
+{
+	exynos850_init_clocks(np, apm_clk_regs, ARRAY_SIZE(apm_clk_regs));
+	samsung_cmu_register_one(np, &apm_cmu_info);
+}
+
+CLK_OF_DECLARE_DRIVER(exynos850_cmu_apm, "samsung,exynos850-cmu-apm",
+		      exynos850_cmu_apm_init);
+
 /* ---- CMU_HSI ------------------------------------------------------------- */
 
 /* Register Offset definitions for CMU_HSI (0x13400000) */
@@ -579,6 +588,15 @@ static const struct samsung_cmu_info hsi_cmu_info __initconst = {
 	.clk_name		= "dout_hsi_bus",
 };
 
+static void __init exynos850_cmu_hsi_init(struct device_node *np)
+{
+	exynos850_init_clocks(np, hsi_clk_regs, ARRAY_SIZE(hsi_clk_regs));
+	samsung_cmu_register_one(np, &hsi_cmu_info);
+}
+
+CLK_OF_DECLARE_DRIVER(exynos850_cmu_hsi, "samsung,exynos850-cmu-hsi",
+		      exynos850_cmu_hsi_init);
+
 /* ---- CMU_PERI ------------------------------------------------------------ */
 
 /* Register Offset definitions for CMU_PERI (0x10030000) */
@@ -753,6 +771,15 @@ static const struct samsung_cmu_info peri_cmu_info __initconst = {
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
@@ -839,6 +866,15 @@ static const struct samsung_cmu_info core_cmu_info __initconst = {
 	.clk_name		= "dout_core_bus",
 };
 
+static void __init exynos850_cmu_core_init(struct device_node *np)
+{
+	exynos850_init_clocks(np, core_clk_regs, ARRAY_SIZE(core_clk_regs));
+	samsung_cmu_register_one(np, &core_cmu_info);
+}
+
+CLK_OF_DECLARE_DRIVER(exynos850_cmu_core, "samsung,exynos850-cmu-core",
+		      exynos850_cmu_core_init);
+
 /* ---- CMU_DPU ------------------------------------------------------------- */
 
 /* Register Offset definitions for CMU_DPU (0x13000000) */
@@ -911,17 +947,23 @@ static const struct samsung_cmu_info dpu_cmu_info __initconst = {
 	.clk_name		= "dout_dpu",
 };
 
+static void __init exynos850_cmu_dpu_init(struct device_node *np)
+{
+	exynos850_init_clocks(np, dpu_clk_regs, ARRAY_SIZE(dpu_clk_regs));
+	samsung_cmu_register_one(np, &dpu_cmu_info);
+}
+
+CLK_OF_DECLARE_DRIVER(exynos850_cmu_dpu, "samsung,exynos850-cmu-dpu",
+		      exynos850_cmu_dpu_init);
+
 /* ---- platform_driver ----------------------------------------------------- */
 
 static int __init exynos850_cmu_probe(struct platform_device *pdev)
 {
 	const struct samsung_cmu_info *info;
 	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
 
 	info = of_device_get_match_data(dev);
-	exynos850_init_clocks(np, info->clk_regs, info->nr_clk_regs);
-	samsung_cmu_register_one(np, info);
 
 	/* Keep bus clock running, so it's possible to access CMU registers */
 	if (info->clk_name) {
-- 
2.30.2

