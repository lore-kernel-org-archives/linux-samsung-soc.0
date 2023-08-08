Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE276C001B0
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  8 Aug 2023 18:54:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232910AbjHHSyr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 8 Aug 2023 14:54:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46188 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232936AbjHHSya (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 8 Aug 2023 14:54:30 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 41E60676B3
        for <linux-samsung-soc@vger.kernel.org>; Tue,  8 Aug 2023 10:12:01 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fe4ad22eb0so40360655e9.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 08 Aug 2023 10:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691514720; x=1692119520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SMzXqqe28IQY+hzgVA8sdRyW99nsQbJZiTRlRSVrT6A=;
        b=kZJVgy5L5kOMeJKw+YVBYTiDywTeEm5kEKOks5/0hXSUBDcqnI3FpbSkHPLC2e/bhO
         M+TRMpj1Dd+0KX1c6pbieOBd8puE7wPq/rJ9bI4OI4BEvy5mSNZpDTo/LTqG6xPlySto
         EczaK3JCuIb9O//prUbJVtKGVIsrFJG9kfxVDyfAbfW+evFZ2TuK7E9P7s61rUfW/fqs
         CmJQoXwgUKgfvlfdWTzkMRSwb5+YCw+M/linettJjcfjbXneXMup9lG0qFMdsxUY9iX0
         9fG6NYBle+CRCw3t+LtKQRPByf5Q4q46o2EuQQc1C0a7HD01FSKteiynGj3ZjwzAYFOo
         Bt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691514720; x=1692119520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SMzXqqe28IQY+hzgVA8sdRyW99nsQbJZiTRlRSVrT6A=;
        b=euDk9uo8MrYGKzzHqwJ4gonRxfNlVN8chAZsAvAQElRhwHEm+ZaKgTmMwX93+UPxN0
         97ai+31a4tOirJXrUq8gTHza07aeaNwgCnDtYg9xk52NFZfDr81vdojBsxZUZF0zHmRt
         KL/nRviHoiJ1PV0LZNROAlAaza9jBqpIQEHXefdW6WYRj16v9XOe98/TlHHiVFRjpyBn
         9f5tuTTy6ngDcJy66tU25HE4decb+veyggrRMCYQgEQfcwWVVTKyKev9yWATOg19S6b5
         3ryzT4LxZH2GTebqULc3xE948yt3t+4jMDI3VA5WJSoykNS0aM7nCpx4RWhfqB0wbjoj
         nm9w==
X-Gm-Message-State: AOJu0YxvSqmxOuKlTGMHJBqHjtwcR7w9UuqGsnJTy0HHxU3iqeTqGbYP
        wtHpli+t+bkAhff1sdPbOFXivD3b2EvTBZxxJoM=
X-Google-Smtp-Source: AGHT+IE8JZGO5AJlHB0gVlpfgqATSBJHgAWyKC6QKwkPaljKOyd6RoW2fJ5F/H5/4XrPqd1hvBYD1Q==
X-Received: by 2002:a5d:5257:0:b0:314:4a15:e557 with SMTP id k23-20020a5d5257000000b003144a15e557mr8567311wrc.5.1691483272362;
        Tue, 08 Aug 2023 01:27:52 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id s18-20020adfeb12000000b0031779a6b451sm12861246wrn.83.2023.08.08.01.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Aug 2023 01:27:51 -0700 (PDT)
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
Subject: [PATCH 05/11] clk: samsung: exynos5410: do not define number of clocks in bindings
Date:   Tue,  8 Aug 2023 10:27:32 +0200
Message-Id: <20230808082738.122804-6-krzysztof.kozlowski@linaro.org>
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
 drivers/clk/samsung/clk-exynos5410.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/samsung/clk-exynos5410.c b/drivers/clk/samsung/clk-exynos5410.c
index d67d67a519a4..2654077211e7 100644
--- a/drivers/clk/samsung/clk-exynos5410.c
+++ b/drivers/clk/samsung/clk-exynos5410.c
@@ -56,6 +56,9 @@
 #define SRC_KFC			0x28200
 #define DIV_KFC0		0x28500
 
+/* NOTE: Must be equal to the last clock ID increased by one */
+#define CLKS_NR			512
+
 /* list of PLLs */
 enum exynos5410_plls {
 	apll, cpll, epll, mpll,
@@ -260,7 +263,7 @@ static const struct samsung_cmu_info cmu __initconst = {
 	.nr_div_clks	= ARRAY_SIZE(exynos5410_div_clks),
 	.gate_clks	= exynos5410_gate_clks,
 	.nr_gate_clks	= ARRAY_SIZE(exynos5410_gate_clks),
-	.nr_clk_ids	= CLK_NR_CLKS,
+	.nr_clk_ids	= CLKS_NR,
 };
 
 /* register exynos5410 clocks */
-- 
2.34.1

