Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A99C001DB
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Aug 2023 18:15:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235359AbjHHSPJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Aug 2023 14:15:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235347AbjHHSOn (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Aug 2023 14:14:43 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26B261775B5
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Aug 2023 10:21:17 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-314172bac25so4514218f8f.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Aug 2023 10:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691515275; x=1692120075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pZH8BihJHBp/DZtT1lzAgFgSWlR+gykQRY/CxVLX/NQ=;
        b=roJ/Hmdr7UKkcO+fqtQrOA6HhnIngpKCmW1n0BXpLCOVGn+AveiaE8dQYXsVyvtPAD
         jQVMOTL1SL/kH1r+0faqtZsPeVWnSyfvbSbBZVeMF7tXicWnkXVVpCoD1SuqCP1gQb+1
         0NCXinOeznohQH73wdWPLs492b4gCvd4rX+8T7lH4RFNKYRlfunlte2argY2oY8s6C1k
         x27UF0P6mnNgbOM/iToUNlz9jGjtmPz+FgVrdrpBUuYGDHv1QzFl17q9hzEcojA/e2kM
         wryehGxNRqfsWEvVSew0u2X/XxDnRl1BobtLdbJ/C7l/fWugbCV2G/ZllffBjNHrwBE8
         xhxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691515275; x=1692120075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pZH8BihJHBp/DZtT1lzAgFgSWlR+gykQRY/CxVLX/NQ=;
        b=LpXMJtqGPBQbS/UYCUnmO3J9mDJEFAJ7y+Nnvlqknthecqz4/qplFoClglOoFCcM9e
         ykQ6AdFPu39h7RWqJvqwBFpm0aDB0HJEZlmScIpz8H6cMta0u3iTu7Zxtee8J3stRsSq
         J205/xQ/kIJv0twjd+7PXhkiRgtEwhiDisvYmFOG+uIFZEnf7/g1R/zovElS/uFmwD5e
         b2QJ/bspVBquTSrfQs2GG1ZaewKQpr+VPJ3FDnc4qNNjJpNtsjV4CQDW19lfh2wc/usL
         OpiHUHjMW02GAEJt3qc6DvWCTVTSS/MC+KonlnqG/GVgRWRIVp9W1JD6LbHj0xDJDkgb
         dMWg==
X-Gm-Message-State: AOJu0YyZBTOyRO1VxwUeDmvxAlRao0zmBNIVvVi/H2umeVTToLzIcwbJ
        rYgLhAfv89DQxu/8qjclBRFPqvsmGs64ettu/8M=
X-Google-Smtp-Source: AGHT+IHxIGUFAD12lJphQeKsQdF3PxwsoN29JQ5BiG4xlGacb03xttiIY8EXVTEebeJ/xuBM044S4Q==
X-Received: by 2002:adf:ce90:0:b0:314:3b02:a8a8 with SMTP id r16-20020adfce90000000b003143b02a8a8mr7447482wrn.55.1691483268603;
        Tue, 08 Aug 2023 01:27:48 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id s18-20020adfeb12000000b0031779a6b451sm12861246wrn.83.2023.08.08.01.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 01:27:47 -0700 (PDT)
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
Subject: [PATCH 03/11] clk: samsung: exynos5250: do not define number of clocks in bindings
Date:   Tue,  8 Aug 2023 10:27:30 +0200
Message-Id: <20230808082738.122804-4-krzysztof.kozlowski@linaro.org>
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
 drivers/clk/samsung/clk-exynos5250.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index 92fb09922f28..8ebe6155d8b7 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -100,6 +100,9 @@
 #define PWR_CTRL2_CORE2_UP_RATIO		(1 << 4)
 #define PWR_CTRL2_CORE1_UP_RATIO		(1 << 0)
 
+/* NOTE: Must be equal to the last clock ID increased by one */
+#define CLKS_NR					(CLK_MOUT_VPLLSRC + 1)
+
 /* list of PLLs to be registered */
 enum exynos5250_plls {
 	apll, mpll, cpll, epll, vpll, gpll, bpll,
@@ -797,7 +800,7 @@ static void __init exynos5250_clk_init(struct device_node *np)
 		panic("%s: unable to determine soc\n", __func__);
 	}
 
-	ctx = samsung_clk_init(NULL, reg_base, CLK_NR_CLKS);
+	ctx = samsung_clk_init(NULL, reg_base, CLKS_NR);
 	hws = ctx->clk_data.hws;
 
 	samsung_clk_of_register_fixed_ext(ctx, exynos5250_fixed_rate_ext_clks,
-- 
2.34.1

