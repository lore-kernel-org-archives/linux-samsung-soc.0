Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27B3FC04FE2
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Aug 2023 19:17:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233630AbjHHTRd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Aug 2023 15:17:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236056AbjHHTRJ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Aug 2023 15:17:09 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9154B14A72
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Aug 2023 09:39:59 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4fe7e67cc77so527649e87.2
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Aug 2023 09:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691512794; x=1692117594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R/ysiPNWLR7wpbVD7YtHSC9xvbZhsi6ZL4lXHxj1M6c=;
        b=RoFAB1QIXawZh5eE3wITpm9051CI7GQ/HRl2Sj1mXALhEvCeK274Qlreti1S9NGsCV
         KdlbltV6ZDIQtz8WQObQpxzz/s3jUsONBisIhA+fiu0baQ6Z5szsDvdZ2+CPHFMKZTG+
         uXx/ykHzdT9ljXUBpZIk0JXgQGjB2Uj389q+4+9criwDMkTfZItABWKOgb/CBwbQMpFy
         bgquD6qqXBOF8g9bseyxH4loeknBIuPCwIJ6muVGpOgKAXlJUhwUK5V+JH+GSLbWIFbM
         26GgY2caB2UShZteES8MVjEcLJ1ahiKP6uwCaOrIEPf6I/7syNPQ4K+bPw/X0D34qp+M
         uTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691512794; x=1692117594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R/ysiPNWLR7wpbVD7YtHSC9xvbZhsi6ZL4lXHxj1M6c=;
        b=NHqVBf/MH4SS1TZYBB3bxDPNgK/5gul3toRBaLKdmnCAnXvL0FrvR4MtTIEbqwnnrs
         pZlaXF6TU6ObYjXQmK8IIp+WvRTC6GRU3KqjFV6OVUbPIjNyxG4z21UziGwUbqeORLtt
         Ae8fWhoMLtZ8nm0GIOAByO4sPcdFAxWa58PF7cbEOa2s+mvPB1ibroB+g0SyiteSFR/1
         5K7/UWcWLhv4goZBdfdheFmPYd90yAKYacmg/OyXK2kPuh1UkV2C0s5soC4p7hFyQuyI
         n9b36SwiJwUiUFc3g7eqPXGShTrKeYa5B7+/p+SfZ5bzXo8m78q1YvuR7rh376f6tgtd
         XxIQ==
X-Gm-Message-State: AOJu0YwjACs0IM4Y+TIO3KUZq9XxKoEh23aOvFfxab2WQNC0fN/XYbne
        4yiKavJBbpJtyqUkDCqrrVVvmRtKTNBvBqABFEc=
X-Google-Smtp-Source: AGHT+IFQ1+reGKbu7+VQxeellkzInKFEL4NfkTVROJIeIltY/tZlYlFyqdoEIWGGNtTNFwjonuVnVw==
X-Received: by 2002:a05:6512:2347:b0:4f9:5580:1894 with SMTP id p7-20020a056512234700b004f955801894mr8212298lfu.15.1691483274184;
        Tue, 08 Aug 2023 01:27:54 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id s18-20020adfeb12000000b0031779a6b451sm12861246wrn.83.2023.08.08.01.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 01:27:53 -0700 (PDT)
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
Subject: [PATCH 06/11] clk: samsung: exynos5420: do not define number of clocks in bindings
Date:   Tue,  8 Aug 2023 10:27:33 +0200
Message-Id: <20230808082738.122804-7-krzysztof.kozlowski@linaro.org>
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
 drivers/clk/samsung/clk-exynos5420.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5420.c b/drivers/clk/samsung/clk-exynos5420.c
index 1e0cbf762408..199843f12ae5 100644
--- a/drivers/clk/samsung/clk-exynos5420.c
+++ b/drivers/clk/samsung/clk-exynos5420.c
@@ -139,6 +139,9 @@
 #define SRC_KFC			0x28200
 #define DIV_KFC0		0x28500
 
+/* NOTE: Must be equal to the last clock ID increased by one */
+#define CLKS_NR			(CLK_DOUT_PCLK_DREX1 + 1)
+
 /* Exynos5x SoC type */
 enum exynos5x_soc {
 	EXYNOS5420,
@@ -1587,7 +1590,7 @@ static void __init exynos5x_clk_init(struct device_node *np,
 
 	exynos5x_soc = soc;
 
-	ctx = samsung_clk_init(NULL, reg_base, CLK_NR_CLKS);
+	ctx = samsung_clk_init(NULL, reg_base, CLKS_NR);
 	hws = ctx->clk_data.hws;
 
 	samsung_clk_of_register_fixed_ext(ctx, exynos5x_fixed_rate_ext_clks,
-- 
2.34.1

