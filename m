Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E6A7C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 21 Nov 2021 23:27:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229886AbhKUXau (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 21 Nov 2021 18:30:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229735AbhKUXau (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 21 Nov 2021 18:30:50 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 633A5C061714
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Nov 2021 15:27:44 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id y26so72018811lfa.11
        for <linux-samsung-soc@vger.kernel.org>; Sun, 21 Nov 2021 15:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S/y2Kn8oygwVIw9lHmxg8VDs1DipgumUOS8XzTiyOsU=;
        b=eV49/GXY3ZioR5KCVbQdQdb0HGYbBDnWGEI7zVz5iAJxaBoHolB7hBvjl/b+xC6xCc
         EcjjTCKhCfWAzb93zYheTsWA0lt4hPkCLZL9HtQRFZnFcZfYRCoG0ZeNvrM07hwsFoCV
         mGKXU8qXUOtTin1366adw7r5Km6ZsIjf32NKre6QTokEjz92J3Jd6JW9uwHhgeYIdNn8
         Ro7KM34j6ZMdOatdOgzVKAmO8ko6wEGF0+nu2w9wi6dmTudea0kZR0BaNTLxrgGphdJu
         6nhHjaDAhH2nUVG4CB7ZLDEZ7YFTc2utNuC3Tira+a3zbVcAWu+NaEjHV+jWI+IfoWJ7
         qxZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=S/y2Kn8oygwVIw9lHmxg8VDs1DipgumUOS8XzTiyOsU=;
        b=mH2PWR8oDj7G39CJucf4fNWhAFh/65RzxGuEE8TpS/yu8PnCDRAj8/H5iUxsl5F0QJ
         mPqRmsx+gAFsa+ZYcP32t6LK3WLanLrwKzWJqZEQkea1kV1TvRCNVBXm5/SjvV85nrcE
         HR8C2062RG8eSSsSi8T1DabE6pJwGevvd/G29ACyNMd2UOAkQF4E41JflEPfS3vRqF8e
         SBxAls9Wt3xhPDSz6TelnLTe3b7ty1O3s6dX2aAFboCMlOfSixrt3TxH0ACIr28Cv7AP
         qBuK8ixRROkygjFp+ADmT59J3lB1NSQym158YGS9fRXW5md7Z/oVD2osZBoyu0dBt/9b
         4b3Q==
X-Gm-Message-State: AOAM531gY0XBZYPhraFbtNL+98m8Vq1KVzI+gd5sDt2L1rcxKIys3Ay2
        qaiCdBjT2fZn+slnsDxmSkiwqQ==
X-Google-Smtp-Source: ABdhPJwR3sqr8nwxIXnSTyEMLZqeyhXKmPjaWT8w9k9jEqiYszGxV9YsWV6WDGESVr+GY1ln3aaeiQ==
X-Received: by 2002:a05:6512:159d:: with SMTP id bp29mr51450000lfb.257.1637537262579;
        Sun, 21 Nov 2021 15:27:42 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id z3sm780779lfh.17.2021.11.21.15.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Nov 2021 15:27:42 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Virag <virag.david003@gmail.com>,
        =?UTF-8?q?Pawe=C5=82=20Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 0/6] clk: samsung: exynos850: Clock driver improvements
Date:   Mon, 22 Nov 2021 01:27:35 +0200
Message-Id: <20211121232741.6967-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This cumulative series supersedes next patches/series:
  1. CMU_APM domain implementation series [1]
  2. CMU_CMGP domain implementation series [2]
  3. "Register clocks early" patch [3]

with changes as follows:
  - add "Keep some crucial clocks running" patch [6/6]
  - enable CMU_PERI parent clock early
  - move bindings headers changes into bindings doc patches

Tested:
  - CMU_TOP is registered before CMU_PERI
  - CMU_PERI parent clock is enabled early and successfully, and running
    before any access to CMU_PERI registers
  - kernel boots successfully without "clk_ignore_unused" param
  - MCT timer works fine and doesn't panic during bootup

[1] https://lkml.org/lkml/2021/10/22/978
[2] https://lkml.org/lkml/2021/11/9/660
[3] https://lkml.org/lkml/2021/10/25/818

Sam Protsenko (6):
  dt-bindings: clock: Add bindings for Exynos850 CMU_APM
  clk: samsung: exynos850: Implement CMU_APM domain
  dt-bindings: clock: Add bindings for Exynos850 CMU_CMGP
  clk: samsung: exynos850: Implement CMU_CMGP domain
  clk: samsung: exynos850: Register clocks early
  clk: samsung: exynos850: Keep some crucial clocks running

 .../clock/samsung,exynos850-clock.yaml        |  38 ++
 drivers/clk/samsung/clk-exynos850.c           | 327 ++++++++++++++++--
 include/dt-bindings/clock/exynos850.h         |  46 ++-
 3 files changed, 387 insertions(+), 24 deletions(-)

-- 
2.30.2

