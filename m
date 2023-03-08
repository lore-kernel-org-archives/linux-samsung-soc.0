Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19521C678D5
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  8 Mar 2023 23:39:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230321AbjCHXjE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 8 Mar 2023 18:39:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjCHXih (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 8 Mar 2023 18:38:37 -0500
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AA6E65C5E
        for <linux-samsung-soc@vger.kernel.org>; Wed,  8 Mar 2023 15:38:34 -0800 (PST)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-176b48a9a05so617466fac.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 08 Mar 2023 15:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678318713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59RnUUeXUSnsMfT51jFg2QQnLPiQn/N+3fHwfoGuKl0=;
        b=pF1RglZCkn5XIyOdWnyrmL8yTgBs1+95aNqxPg2mjlZQLm4EI99ZyCF4ldmppwfY7m
         SasK2e3cl9aIuv9zdQTbmuso94/gVRjDw6jWdUERQkAAXL9apO+VWMzkOrgFIqE1R/oE
         HcAp8jLvUWFPE/I744zd/Yaq51nSaZC413gL8BSvdQ6+2Eva13dMptuK2LvPsvaYj3dm
         BCdH/rGisBSwjztRqyj4WqXu+hr9/dQJXBye8LZ7PES1L0heGNKxMfQmQTU8wdhJF23J
         M1E0z2xB2rnNkGoTqMTTkeXqAsMtWXKmzeTV79if8Cnj3q6Nv6LAk4YxntEpCsXyPbZi
         pOBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678318713;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=59RnUUeXUSnsMfT51jFg2QQnLPiQn/N+3fHwfoGuKl0=;
        b=Naoyv365Dp7gZA+tyEAFPLpMy1jHcRspdiHWDYxAR4BqStwbY5yg8KcH0lFkwhB9On
         CwTL0NXHA4Q8s6i/QMHVO1C5VGnPISRoEsBK3x+7cBFxS1E8XZ13p844LDQzl7acTCQh
         f0cpvvym7xj8Z9txH0NH4RljSvygfKuTXN0QWuEC07bzQ99oTh8FuOr8YEGVHQXTY1us
         /CjJdrETlqWqKztiTCPLrceDewxz+IqahrQ6MmXjgaiJZD4dn19UQiy0ZEuKVlQBDf47
         UYag5qySYCSuBLD/7d0PbOK7tNtokuAJ/hiygAMCwYVW60ZGAyUW6Z+DOyU48UoqLOjV
         lopw==
X-Gm-Message-State: AO0yUKWvBZmCYSsokCuqqSfm4SNuJsQRAumO4krbChJWsHyFrG74+6g4
        0OmrUF0BNELCOvnMRuvpPDweXg==
X-Google-Smtp-Source: AK7set8plTEasFR06vuaD6t4Lm3l0XcW1Bwx+tNAfbenG0REitnea0SJSCX6JNlqc4IDv6vB7Dd2Mg==
X-Received: by 2002:a05:6870:d1c3:b0:172:36ce:91d0 with SMTP id b3-20020a056870d1c300b0017236ce91d0mr2341540oac.38.1678318713251;
        Wed, 08 Mar 2023 15:38:33 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id ax39-20020a05687c022700b0016b0369f08fsm6735660oac.15.2023.03.08.15.38.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 15:38:32 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] arm64: dts: exynos: Remove clock from Exynos850 pmu_system_controller
Date:   Wed,  8 Mar 2023 17:38:22 -0600
Message-Id: <20230308233822.31180-8-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308233822.31180-1-semen.protsenko@linaro.org>
References: <20230308233822.31180-1-semen.protsenko@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

As described in the corresponding binding documentation for
"samsung,exynos850-pmu", the "clocks" property should be used for
specifying CLKOUT mux inputs. Therefore, the clock provided to exynos850
pmu_system_controller is incorrect and should be removed. Instead of
making syscon regmap keep that clock running for PMU accesses, it should
be made always running in the clock driver, because the kernel is not
the only software accessing PMU registers on Exynos850 platform.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
---
 arch/arm64/boot/dts/exynos/exynos850.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/dts/exynos/exynos850.dtsi
index d67e98120313..aa077008b3be 100644
--- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
+++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
@@ -200,7 +200,6 @@ gic: interrupt-controller@12a01000 {
 		pmu_system_controller: system-controller@11860000 {
 			compatible = "samsung,exynos850-pmu", "syscon";
 			reg = <0x11860000 0x10000>;
-			clocks = <&cmu_apm CLK_GOUT_PMU_ALIVE_PCLK>;
 
 			reboot: syscon-reboot {
 				compatible = "syscon-reboot";
-- 
2.39.2

