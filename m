Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9BAEC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 14 Sep 2021 15:56:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9E0861163
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 14 Sep 2021 15:56:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232986AbhINP52 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 14 Sep 2021 11:57:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232800AbhINP52 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Sep 2021 11:57:28 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 529F1C061762
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Sep 2021 08:56:10 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id p29so2952568lfa.11
        for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Sep 2021 08:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D9r7vZTFmt+HJczJ26/VRGmSIRdn9r2Ig6CHBFrDqyQ=;
        b=WGEzzSuuYjdTtafp7Eu81tLCmpgrr+gXYtUri5DNqI5NCgL24GFjf73a/e2jyLt9mG
         odsKhpJeEdR3FB9k9Ien6pDJYoUHRHuid0YNZ7TbOAJHb8OyBtWer7iWwSW1u14BXOTW
         +YgaPZ7iP6bLgkmX18uF8UKm4iFPdCtC9yRbpl7jVdskqTbpu7KwRYteuWz8ZFnqgxxD
         AfUt/CUakcI47R7HCq1Pt53OXxONCeJvCnNSqyqa5DLS2EJx9dyrtL6MmKj8Qeogi/2k
         W2fxnWN2DrZhVF2sMisO5VmdDX4hiiHjtj7uYz6E7yZ96NmYUpdC25W3LF6dushrEzbY
         GW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D9r7vZTFmt+HJczJ26/VRGmSIRdn9r2Ig6CHBFrDqyQ=;
        b=5WrQ/1dUd3nycwtmXORVGGS5fqz/xdL3jHRKp2bhjn0xFqFB1uZrfm0NBDZ5oNNdaB
         uN+mxSG6H6spOKOaqx/6JBCio3EjUJdH13uIeSUkJNQ1FSL6sISOWlghCvQ2jZL9qn8Q
         /nA7rX6XOc386bJYiUMeZ6m+LUlv/vQzePGXax5mATPUNBCWj3sXo7cdTT6NNo2k2GvL
         aL3Y0GwMRXDKMbQI0ESPUKSisttpyAM41e44oas9rN7H+wWfb8Oos0gDWCFJ8eKoD28D
         H/RmDmT/j61TkbmJL5wvuuoYGmReUR1agkZ4Ey6IH9xGQdotfvVCZuzaf1B2gFngMJxI
         MjUQ==
X-Gm-Message-State: AOAM533AMfU3ocYfrTffU/958GCgCHtoqUHf6AKNCAL4ECKKLS7NS300
        iND8WmRvWodRwuAj2opF0FNZwg==
X-Google-Smtp-Source: ABdhPJxyinnxHmfXKBVGde0Dv5bF8T5/S0h3LFk8Is4k0D1dXCGfavlZhTNu/0Ze4Zz34a+lhodbWQ==
X-Received: by 2002:ac2:5b07:: with SMTP id v7mr586587lfn.113.1631634968690;
        Tue, 14 Sep 2021 08:56:08 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id 26sm603801lfz.40.2021.09.14.08.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 08:56:08 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Ryu Euiyoul <ryu.real@samsung.com>, Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 0/6] clk: samsung: Introduce Exynos850 SoC clock driver
Date:   Tue, 14 Sep 2021 18:56:01 +0300
Message-Id: <20210914155607.14122-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This patch series provides the implementation for Exynos850 clock
driver, its documentation and corresponding changes for Samsung clock
infrastructure:
  - Adds new PLL types used in Exynos850 SoC, following TRM
  - Enables bus clock for each registered CMU, if it's provided

I tried to follow already established design for Samsung clock drivers
(getting most insights from Exynos7 and Exynos5433 clock drivers), and
integrate the driver in existing infrastructure. The whole driver was
implemented from scratch, using mostly TRM.

For now only basic clocks are implemented, including next blocks:
  - CMU_TOP
  - CMU_PERI
  - CMU_CORE
  - CMU_HSI

Some CMUs are still not implemented, but that can be added in future,
when the need arises. The driver also lacks CLKOUT support, PM ops and
automatic clocks control (using Q-Channel protocol). All that can be
added independently later.

Implemented clock tree was tested via UART and MMC drivers, and using
DebugFS clk support (e.g. using 'clk_summary' file). In order to keep
all clocks running I added 'clk_ignore_unused' kernel param in my local
tree, and defined CLOCK_ALLOW_WRITE_DEBUGFS in clk.c for actually
testing clocks via DebugFS.

Sam Protsenko (6):
  clk: samsung: Enable bus clock on init
  clk: samsung: clk-pll: Implement pll0822x PLL type
  clk: samsung: clk-pll: Implement pll0831x PLL type
  dt-bindings: clock: Add bindings definitions for Exynos850 CMU
  dt-bindings: clock: Document Exynos850 CMU bindings
  clk: samsung: Introduce Exynos850 clock driver

 .../clock/samsung,exynos850-clock.yaml        | 190 +++++
 drivers/clk/samsung/Makefile                  |   1 +
 drivers/clk/samsung/clk-exynos850.c           | 700 ++++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 | 196 +++++
 drivers/clk/samsung/clk-pll.h                 |   2 +
 drivers/clk/samsung/clk.c                     |  13 +
 include/dt-bindings/clock/exynos850.h         |  72 ++
 7 files changed, 1174 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-exynos850.c
 create mode 100644 include/dt-bindings/clock/exynos850.h

-- 
2.30.2

