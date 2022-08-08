Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F0E3C25B08
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Aug 2022 18:16:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243532AbiHHSQQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 8 Aug 2022 14:16:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244216AbiHHSQK (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 8 Aug 2022 14:16:10 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 807EA12AB3
        for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Aug 2022 11:16:04 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id a11so5183679wmq.3
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Aug 2022 11:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=JCpSNlLLZPCNByyaJJ8bDLMhynHswvT5YpgsApwtx0s=;
        b=dUZFFCl7554xqPEFkFQak0oDLlu70nAxMQbPsM3ONpiKqMar3VY0LRMzOQ7Lgnx1Vl
         W6s2/UpX8NUyQORwW0CCw1GKhOafkSZI4RmUKXz2Yy8rtWyDXXl3WwhlsK45YD3ZWyrS
         GZMEH0YhDVz1XhH9goQsbBcD3Bk2wCupIIR0syHmxl8HjrLV6Z6j9DLBheHvtxHjrSVz
         3fj11dOh/TymGTMOWy45DWx0iJmUdkEpIysPy34vBU3YWYDNBYZFJk+CEcrDNNOE4Eol
         hBv1lyhKI710RKjCD4vQQuH63hKSURmMh+u+s7w0T9dzTP0T1JF4RUOQnIEqPYppCgRw
         3Fww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=JCpSNlLLZPCNByyaJJ8bDLMhynHswvT5YpgsApwtx0s=;
        b=2MlxUYZAaX64NgEa8DdHZvncBQF7F4AGPfDm+8T50uT1NLhE6wBsiMLq6ISRxljHcV
         ZPdyAbv9HYF5+ZwwW/b38MJ7UoPdD5eVR5Opc5bMOTwQ6EcuaK8nZY+gZe5tqEpz7KDW
         RR3D3eKIaCOqRfkWCj48OjltdlwhEQkRJOIKkFYmK6k1WseHwK6mdq6LsfvY1YIF1DMe
         TrSOh9gNsuCCxE231J/lZAq79rBfG0qH53hlF9PilQczEjXw4kFLH36hPTprJl3SWZez
         d5Vhon3sLOer8q+0r3tPQH2JUFMBfWbSorcl1NENV3vCSw875X+WEjxh05XCwdUrUyMy
         vLUQ==
X-Gm-Message-State: ACgBeo12MuAq3rqWtgBE2EtvoESHYPur8iQOdRCWLwNkTmZWOapMafPc
        uDHv8A4J0rG6Y2fOc/56YINUYw==
X-Google-Smtp-Source: AA6agR6CfvYjOPTWPPgSiBJmd0D8NCfnfjuIUif6YDmpzrgFWiCw3iy4Hgj3B94jq8imLnNCZs8aIw==
X-Received: by 2002:a05:600c:3586:b0:3a3:2c03:1088 with SMTP id p6-20020a05600c358600b003a32c031088mr13960192wmq.64.1659982562834;
        Mon, 08 Aug 2022 11:16:02 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id p22-20020a05600c359600b003a31ca9dfb6sm21166283wmq.32.2022.08.08.11.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Aug 2022 11:16:02 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/7] clk: samsung: exynos850: Style fixes
Date:   Mon,  8 Aug 2022 21:16:01 +0300
Message-Id: <20220808181601.10543-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Fix some typos in comments and do small coding style improvements.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 drivers/clk/samsung/clk-exynos850.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos850.c b/drivers/clk/samsung/clk-exynos850.c
index cd9725f1dbf7..ef32546d3090 100644
--- a/drivers/clk/samsung/clk-exynos850.c
+++ b/drivers/clk/samsung/clk-exynos850.c
@@ -173,7 +173,6 @@ PNAME(mout_peri_uart_p)		= { "oscclk", "dout_shared0_div4",
 				    "dout_shared1_div4", "oscclk" };
 PNAME(mout_peri_ip_p)		= { "oscclk", "dout_shared0_div4",
 				    "dout_shared1_div4", "oscclk" };
-
 /* List of parent clocks for Muxes in CMU_TOP: for CMU_DPU */
 PNAME(mout_dpu_p)		= { "dout_shared0_div3", "dout_shared1_div3",
 				    "dout_shared0_div4", "dout_shared1_div4" };
@@ -599,7 +598,7 @@ static const unsigned long hsi_clk_regs[] __initconst = {
 	CLK_CON_GAT_GOUT_HSI_USB20DRD_TOP_BUS_CLK_EARLY,
 };
 
-/* List of parent clocks for Muxes in CMU_PERI */
+/* List of parent clocks for Muxes in CMU_HSI */
 PNAME(mout_hsi_bus_user_p)	= { "oscclk", "dout_hsi_bus" };
 PNAME(mout_hsi_mmc_card_user_p)	= { "oscclk", "dout_hsi_mmc_card" };
 PNAME(mout_hsi_usb20drd_user_p)	= { "oscclk", "dout_hsi_usb20drd" };
@@ -963,7 +962,7 @@ static const unsigned long dpu_clk_regs[] __initconst = {
 	CLK_CON_GAT_GOUT_DPU_SYSREG_PCLK,
 };
 
-/* List of parent clocks for Muxes in CMU_CORE */
+/* List of parent clocks for Muxes in CMU_DPU */
 PNAME(mout_dpu_user_p)		= { "oscclk", "dout_dpu" };
 
 static const struct samsung_mux_clock dpu_mux_clks[] __initconst = {
-- 
2.30.2

