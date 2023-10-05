Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DACA4E9273D
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Oct 2023 16:05:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236827AbjJEQFG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Oct 2023 12:05:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237198AbjJEQD7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Oct 2023 12:03:59 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D03AA87223
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Oct 2023 08:57:38 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-32483535e51so1174839f8f.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Oct 2023 08:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696521457; x=1697126257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQQEqZ6dgoMIiE150E7fSsiHYzKXaQCMbIzJ/S4ZYh0=;
        b=gCDzUgoGnRiM+ARNjj+9qPWYmacwg5ohZ1fKUdPb3L23S2fECFE2E8xQfrBHr7axwo
         gIz1yemXGLgorCSLbenlSYrPIZwnxJuFQzVOpu/U7LX5CHm8TOgxRHhSp0tkrJEHNskU
         9d8zdPVd8LU21Bmg+pcACSDqPoi9LjitbwkOMHtBYCmjRURDpFgZdTWVPCvIfRM8UVXu
         CK6sUtXI4xY+HYiC90CyPOAG+AFZ0qLVVvvndSSI4rxITtc0dfnJvKj1Y/5NT2YLoKSp
         ykp99j9jwtHqynQ2dpRy9YvWIVeI2EIdcbG1JGpRoK4049iH+foaAojurpSEviQId2YW
         ovDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696521457; x=1697126257;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQQEqZ6dgoMIiE150E7fSsiHYzKXaQCMbIzJ/S4ZYh0=;
        b=cI8fnayqZ3PnXEoCV1gxKO/T88R3mmowkgfSMYaC+n7xVWbnuS+ucFI9VJyFH/aa2X
         Dn4MCDlZ+Baj0PbnJdc16wAFV7En78spmtlANYJK/XmWeTU6SpqV0btCErI4LpWOCO0E
         CEectJ96AGoXJXenapEfvhzkZWRF3hZMFGFOTgpOsOgw5+LyBuf/6OUtXhHqOUi27oSn
         HLUnnUE8PTp50Eg0VKIjl4f3O+t+hGBYGYWMzTBMI1MuBJUidRd4D0TtCANwGYzhHyYQ
         FjJU5LtA74d7s7aIDpUvzmb89W4gu4vUoo2NvTXfvd3hY50CYsz7AmWaahqFGOHlhkfh
         wCpg==
X-Gm-Message-State: AOJu0YxTDTcztFZTNvGdeeV/fueTIQFFxH9twlAAfBnTBPFXQsezq/Tw
        kC3A/rBwDdseSF7ODEUf+5TC2Q==
X-Google-Smtp-Source: AGHT+IF/lcHc9XUltM5UGXmSAYqRcd/8VSrf26P8R3iLwmpTL9VeuYYzrZE6bmpvvFoO8WJJ0m9ktQ==
X-Received: by 2002:a5d:6909:0:b0:314:dc0:2fca with SMTP id t9-20020a5d6909000000b003140dc02fcamr5280803wru.29.1696521457202;
        Thu, 05 Oct 2023 08:57:37 -0700 (PDT)
Received: from gpeter-l.lan (host-92-12-225-146.as13285.net. [92.12.225.146])
        by smtp.gmail.com with ESMTPSA id t9-20020a5d4609000000b0031f8a59dbeasm2084336wrq.62.2023.10.05.08.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 08:57:36 -0700 (PDT)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, cw00.choi@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: [PATCH 12/21] clk: samsung: clk-pll: Add support for pll_{0516,0517,518}
Date:   Thu,  5 Oct 2023 16:56:09 +0100
Message-ID: <20231005155618.700312-13-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.42.0.582.g8ccd20d70d-goog
In-Reply-To: <20231005155618.700312-1-peter.griffin@linaro.org>
References: <20231005155618.700312-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Thesee plls are found in the Tensor gs101 SoC found in the Pixel 6.

pll0516x: Integrer PLL with high frequency
pll0517x: Integrer PLL with middle frequency
pll0518x: Integrer PLL with low frequency

PLL0516x
FOUT = (MDIV * 2 * FIN)/PDIV * 2^SDIV)

PLL0517x and PLL0518x
FOUT = (MDIV * FIN)/PDIV*2^SDIV)

The PLLs are similar enough to pll_0822x that the same code can handle
both. The main difference is the change in the fout formula for the
high frequency 0516 pll.

Locktime for 516,517 & 518 is 150 the same as the pll_0822x lock factor.
MDIV, SDIV PDIV masks and bit shifts are also the same as 0822x.

When defining the PLL the "con" parameter should be set to CON3
register, like this

PLL(pll_0517x, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
    PLL_LOCKTIME_PLL_SHARED0, PLL_CON3_PLL_SHARED0,
    NULL),

Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 drivers/clk/samsung/clk-pll.c | 9 ++++++++-
 drivers/clk/samsung/clk-pll.h | 3 +++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
index 74934c6182ce..4ef9fea2a425 100644
--- a/drivers/clk/samsung/clk-pll.c
+++ b/drivers/clk/samsung/clk-pll.c
@@ -442,7 +442,11 @@ static unsigned long samsung_pll0822x_recalc_rate(struct clk_hw *hw,
 	pdiv = (pll_con3 >> PLL0822X_PDIV_SHIFT) & PLL0822X_PDIV_MASK;
 	sdiv = (pll_con3 >> PLL0822X_SDIV_SHIFT) & PLL0822X_SDIV_MASK;
 
-	fvco *= mdiv;
+	if (pll->type == pll_0516x)
+		fvco = fvco * 2 * mdiv;
+	else
+		fvco *= mdiv;
+
 	do_div(fvco, (pdiv << sdiv));
 
 	return (unsigned long)fvco;
@@ -1316,6 +1320,9 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
 	case pll_1417x:
 	case pll_0818x:
 	case pll_0822x:
+	case pll_0516x:
+	case pll_0517x:
+	case pll_0518x:
 		pll->enable_offs = PLL0822X_ENABLE_SHIFT;
 		pll->lock_offs = PLL0822X_LOCK_STAT_SHIFT;
 		if (!pll->rate_table)
diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
index 0725d485c6ee..ffd3d52c0dec 100644
--- a/drivers/clk/samsung/clk-pll.h
+++ b/drivers/clk/samsung/clk-pll.h
@@ -38,6 +38,9 @@ enum samsung_pll_type {
 	pll_0822x,
 	pll_0831x,
 	pll_142xx,
+	pll_0516x,
+	pll_0517x,
+	pll_0518x,
 };
 
 #define PLL_RATE(_fin, _m, _p, _s, _k, _ks) \
-- 
2.42.0.582.g8ccd20d70d-goog

