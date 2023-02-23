Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5133CC636D7
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 23 Feb 2023 04:23:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232207AbjBWEXa (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 22 Feb 2023 23:23:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233233AbjBWEWp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 22 Feb 2023 23:22:45 -0500
Received: from mail-oa1-x31.google.com (mail-oa1-x31.google.com [IPv6:2001:4860:4864:20::31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 219A7498AF
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Feb 2023 20:21:38 -0800 (PST)
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-1720887dfcdso12964095fac.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Feb 2023 20:21:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGmInqCeyC0bjSGfaYON7cbBzHggVKyExnI0LnVwOZk=;
        b=hNnuU66qswnxXZ0Idb5rbGFkzOFnNXYz5+rS69cLgSK2qhJnyOxCAb+a/K1ng7Ery+
         Oiu7dlI07t0q88hPYgDmmCeSi8kWHhnKuxbnNGL+PfJKxIq7ZUREcEFotPM1VcW16BBQ
         hJwbTgqdciscJUSHy3C4XS02LrgFopp3ZWV/LkqHleC1tfZ8XaWAaMu8C5v+0lpxJCUz
         ea51+3BDeU2E+s2O/BSvcZ1xFqRIAcT0xI4H48+h+3oRFt3xlaLuk2FGpgRGm+qI2CD3
         hYtNsp2YezZy9AGbfzSD7OnAAgcjdmZcQoG/73mtSjODuhXxLwWlCIULx3ciz80S4wyR
         hRRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TGmInqCeyC0bjSGfaYON7cbBzHggVKyExnI0LnVwOZk=;
        b=VrMGQoqLAjR97VjwQiYorHhBnFDJKLT7GMV/0nPuZueJeymU3j83H0YJrf7Yiixj0L
         7JSnvM3rv/C4XPif3a2jhlmymQ71q5K69ubCwHrDb2KQ4VEofka4OGSP3xSZidja7Sce
         uBZyE09Pg439ZCYdufpIjGqeYdB8+2gZPKBql9uh73qbZwRIeiBYbR+xPqD7Hstw46sM
         4akUd7Mp4jQJrdxgpe0FO7tEILj5XcenuR18njhKPWrfddqH5SZUpLdUMOZVcjzfoDUF
         mm3vVsD/21tvYghOgiSQ8tsSOa4wQIn2W11k7IwB6nMK9h0GzTRGBt4dOSnXn+f1/Q5t
         qMtg==
X-Gm-Message-State: AO0yUKXs6DtZOQ3g+vxGLvD+3o0wPMqhoFkkOm15xP8pkGYjvIUW3H73
        9Ko1uUwifIGpLil+TQB/sZJtIg==
X-Google-Smtp-Source: AK7set+Q+laDbcJvzvJZwI/eLi1W2mIUWl6/M4aafhL5u6VMJfb7rqnt2jDqGrEPu0Bqol5tlCb5pw==
X-Received: by 2002:a05:6870:64ab:b0:172:5036:1dcc with SMTP id cz43-20020a05687064ab00b0017250361dccmr2606154oab.5.1677126085205;
        Wed, 22 Feb 2023 20:21:25 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id w130-20020aca6288000000b0037832f60518sm1154464oib.14.2023.02.22.20.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 20:21:24 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     David Virag <virag.david003@gmail.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/6] arm64: dts: exynos: Add CMU_G3D node for Exynos850 SoC
Date:   Wed, 22 Feb 2023 22:21:33 -0600
Message-Id: <20230223042133.26551-7-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223042133.26551-1-semen.protsenko@linaro.org>
References: <20230223042133.26551-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Add missing G3D clock domain to Exynos850 SoC device tree.

Reviewed-by: Chanho Park <chanho61.park@samsung.com>
Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
Changes in v2:
  - Rebased on top of most recent soc/for-next tree
  - Added Chanho Park Reviewed-by tag

 arch/arm64/boot/dts/exynos/exynos850.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index a38fe5129937..d67e98120313 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -245,6 +245,15 @@ cmu_peri: clock-controller@10030000 {
 				      "dout_peri_uart", "dout_peri_ip";
 		};
 
+		cmu_g3d: clock-controller@11400000 {
+			compatible = "samsung,exynos850-cmu-g3d";
+			reg = <0x11400000 0x8000>;
+			#clock-cells = <1>;
+
+			clocks = <&oscclk>, <&cmu_top CLK_DOUT_G3D_SWITCH>;
+			clock-names = "oscclk", "dout_g3d_switch";
+		};
+
 		cmu_apm: clock-controller@11800000 {
 			compatible = "samsung,exynos850-cmu-apm";
 			reg = <0x11800000 0x8000>;
-- 
2.39.1

