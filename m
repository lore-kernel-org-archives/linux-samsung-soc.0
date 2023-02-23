Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ACE2C64ED8
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 23 Feb 2023 04:23:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233303AbjBWEXA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 22 Feb 2023 23:23:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233179AbjBWEWc (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 22 Feb 2023 23:22:32 -0500
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D581D48E0E
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Feb 2023 20:21:22 -0800 (PST)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-17213c961dfso12337569fac.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 22 Feb 2023 20:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AP/utragEALezW3Ha75no5d74aFMJt+dhmrs5kxzbYM=;
        b=trwPlfAaZmqWVHbqG56+BQQgrz4to+s36ShbBlqZxc1IYWDQeIdikgrVQnjZLhgMcE
         I5u19YbZglTI7Od7NffsaMdUmiYzWSLGVvjmhuABb5W3PkTTgFmDL4J78BjzQOYb66eY
         Nlg3/hmcJuchXHUzFMDAQCZOOXBlQxLSuZoZB1b353xmylnQIYOVGkv/rjKF3SyCb4Fe
         F/bcZaQwfvZSzR1gmlurEFGSgQRU+0oxKUgVxoN5JjJEUHILpaoH4X3JtT06vTeHq6BS
         OJlIny5z43/C5nUzRafzM8lFsCNjUesAI85J04MqX4gzLot1diujtBsYdYPYpGFqEgP7
         TXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AP/utragEALezW3Ha75no5d74aFMJt+dhmrs5kxzbYM=;
        b=saWz5/EJ/laI9P5cw3l3O1gBVlfRRrH18hEqplad2BYpbPoMAsAReu+fxaliwYEuUi
         ohoPLJX8SYyZWTLvTs4jDQ9Ru1e9i6VAQLp6lfvue/HZU7+cAwEdajqMSLVrRLljR5MC
         14kdqNKsBjjHoqlH7klNDgIgnGpyADbxESL7tx7lkMMq7u6bOXwGFdN9qO/0YBaqwicb
         RKLE3HKFvNErcSTthQgvLx329uLC6eky+CvDE/A8Llt2+2Con+rgNQGOCHb/g2yoawNR
         mCW2mEA8PHSRzG95yegWbdgXj02gFgM8kD2kRD2xBDBC9B3fwuzPP/OrxoV3rLZx6YKP
         rB6A==
X-Gm-Message-State: AO0yUKUnmB3VGT3hQ4OK38/NtRr7OpJYe6Y5D1CRJYHoRGMSYrn9Fffs
        DKH7bVfJTaI5bl5Inr/JVi2OQQ==
X-Google-Smtp-Source: AK7set8OI207kgdyNYqKRL+J02jkEgjZ2aDTnLjWbJFGcw8gU+Xa69jUDpGbKyLsnH/EHUz4FQGP1w==
X-Received: by 2002:a05:6870:6586:b0:16d:ea08:cd96 with SMTP id fp6-20020a056870658600b0016dea08cd96mr9717419oab.43.1677126078469;
        Wed, 22 Feb 2023 20:21:18 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id p3-20020a056870a54300b0016a37572d17sm5807383oal.2.2023.02.22.20.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 20:21:18 -0800 (PST)
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
Subject: [PATCH v2 0/6] clk: samsung: exynos850: Add missing clocks for PM
Date:   Wed, 22 Feb 2023 22:21:27 -0600
Message-Id: <20230223042133.26551-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

As a part of preparation for PM enablement in Exynos850 clock driver,
this patch series implements CMU_G3D, and also main gate clocks for AUD
and HSI CMUs. The series brings corresponding changes to bindings, the
driver and SoC dts file.

Changes in v2:
  - Rebased all patches on top of the most recent soc/for-next tree
  - Added A-b and R-b tags
  - Minor fixes

Sam Protsenko (6):
  dt-bindings: clock: exynos850: Add Exynos850 CMU_G3D
  dt-bindings: clock: exynos850: Add AUD and HSI main gate clocks
  clk: samsung: clk-pll: Implement pll0818x PLL type
  clk: samsung: exynos850: Implement CMU_G3D domain
  clk: samsung: exynos850: Add AUD and HSI main gate clocks
  arm64: dts: exynos: Add CMU_G3D node for Exynos850 SoC

 .../clock/samsung,exynos850-clock.yaml        |  19 +++
 arch/arm64/boot/dts/exynos/exynos850.dtsi     |   9 ++
 drivers/clk/samsung/clk-exynos850.c           | 139 ++++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |   1 +
 drivers/clk/samsung/clk-pll.h                 |   1 +
 include/dt-bindings/clock/exynos850.h         |  28 +++-
 6 files changed, 194 insertions(+), 3 deletions(-)

-- 
2.39.1

