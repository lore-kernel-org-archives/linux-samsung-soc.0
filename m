Return-Path: <SRS0=sb5j=YW=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7063CA9EC0
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 29 Oct 2019 00:48:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8403421835
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 29 Oct 2019 00:48:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="viFgu90+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727154AbfJ2AsN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 28 Oct 2019 20:48:13 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:37741 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725848AbfJ2AsM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 28 Oct 2019 20:48:12 -0400
Received: by mail-pf1-f193.google.com with SMTP id u9so3493322pfn.4
        for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Oct 2019 17:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=gODeM3aIi/CYKQzR/W2C8FoLnpxaKvgYD714WLSE0WU=;
        b=viFgu90+2Po+9d2Nc7w9MoH1LtQP8DqCvIvC5eNy4OHXa9IoLxeTRue5Y3fS/rIwsf
         pgQa67yzk2kclO0YtiuOWiuYVKdoKKwHJBxE0JjUAf6OHRNNCnx/NmHI2jOz2/pLp+FU
         HlbP6NbgsZONzJLGYXv/1qiV/cv8S697BhQ474vT+CmwTZDPVz3liLKn+AF5P49lMgod
         b+r+rXaZ3yHG/7lA1Cc0FutBOaBEDLHuU5ZbteNj0gbhCBSDbPf7Bl6V6r1Xl+d9wa6/
         CFZmnKdBzgY0TZjXWsm0R/XNhlDIp0Z9jIKaJa7eUx2OkyV9gDXAVM4rOulHpPxY/UAS
         P0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=gODeM3aIi/CYKQzR/W2C8FoLnpxaKvgYD714WLSE0WU=;
        b=UZiJbl38N6VWmpVzRMDalYZ5WcSh7uP650f7g7IHOiPIfwRItiJcJJDTK88k+BPt/s
         wx7Ny4/hD6ln7dDu6hJ/PQuGON9CdjV1jT1/FREClDZ1isrRplhuedtD4yYvFsW7YqgI
         uVj9NkvBrM9xuxLvAqA0GHhLCfnQKL28CjzP72fcg4QYxJpgG7XQRANL4Opzb1I8Jzxv
         4psiPdgqhPMd3MPmjjm/4us8VSRnfvcZcLgoxp3j7RGtpMrDipQ/nKEc+2PRDn0rfbt4
         B9KYp3+84Ot//q3jP3hGNEbAMgtHvxhLPP5WMyrahDZUvC2qa4WERluxHkl4wETblREk
         cU3A==
X-Gm-Message-State: APjAAAXX+yFTomV8vZbWL+LiomrdPmfqC1ip09sv0ATDbPefP2Ofb2LM
        a3Z6DrzmfzZoWO+9gNE3IbK/QbQj
X-Google-Smtp-Source: APXvYqx/eDYwY4g52IiUVAmQwIga45Ak404rcMNJZKJonIg9ISCj8JhcErEQ62/MH9ls3QcxkPszPg==
X-Received: by 2002:a17:90a:aa81:: with SMTP id l1mr705211pjq.73.1572310090622;
        Mon, 28 Oct 2019 17:48:10 -0700 (PDT)
Received: from odroid.ad.adelaide.edu.au (staff-249-094.wireless.adelaide.edu.au. [129.127.249.94])
        by smtp.googlemail.com with ESMTPSA id l24sm11794269pff.151.2019.10.28.17.48.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Oct 2019 17:48:10 -0700 (PDT)
From:   Marian Mihailescu <mihailescu2m@gmail.com>
To:     linux-samsung-soc@vger.kernel.org
Cc:     Marian Mihailescu <mihailescu2m@gmail.com>
Subject: [PATCH] clk: samsung: exynos5420: add VPLL rate table
Date:   Tue, 29 Oct 2019 11:17:58 +1030
Message-Id: <20191029004758.4380-1-mihailescu2m@gmail.com>
X-Mailer: git-send-email 2.14.1
Sender: linux-samsung-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add new table rate for VPLL for Exynos 542x SoC required to support
Mali GPU clock frequencies.

Signed-off-by: Marian Mihailescu <mihailescu2m@gmail.com>
---
 drivers/clk/samsung/clk-exynos5420.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 7670cc596c74..f3133ed467c2 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -1414,6 +1414,17 @@ static const struct samsung_pll_rate_table exynos5420_epll_24mhz_tbl[] = {
 	PLL_36XX_RATE(24 * MHZ,  32768001U, 131, 3, 5, 4719),
 };
 
+static const struct samsung_pll_rate_table exynos5420_vpll_24mhz_tbl[] = {
+	PLL_35XX_RATE(24 * MHZ, 600000000U,  200, 2, 2),
+	PLL_35XX_RATE(24 * MHZ, 543000000U,  181, 2, 2),
+	PLL_35XX_RATE(24 * MHZ, 480000000U,  160, 2, 2),
+	PLL_35XX_RATE(24 * MHZ, 420000000U,  140, 2, 2),
+	PLL_35XX_RATE(24 * MHZ, 350000000U,  175, 3, 2),
+	PLL_35XX_RATE(24 * MHZ, 266000000U,  266, 3, 3),
+	PLL_35XX_RATE(24 * MHZ, 177000000U,  118, 2, 3),
+	PLL_35XX_RATE(24 * MHZ, 100000000U,  200, 3, 4),
+};
+
 static struct samsung_pll_clock exynos5x_plls[nr_plls] __initdata = {
 	[apll] = PLL(pll_2550, CLK_FOUT_APLL, "fout_apll", "fin_pll", APLL_LOCK,
 		APLL_CON0, NULL),
@@ -1538,6 +1549,7 @@ static void __init exynos5x_clk_init(struct device_node *np,
 		exynos5x_plls[apll].rate_table = exynos5420_pll2550x_24mhz_tbl;
 		exynos5x_plls[epll].rate_table = exynos5420_epll_24mhz_tbl;
 		exynos5x_plls[kpll].rate_table = exynos5420_pll2550x_24mhz_tbl;
+		exynos5x_plls[vpll].rate_table = exynos5420_vpll_24mhz_tbl;
 	}
 
 	if (soc == EXYNOS5420)
-- 
2.14.1

