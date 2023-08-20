Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B21C4EE49A5
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 20 Aug 2023 07:35:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbjHTHfV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 20 Aug 2023 03:35:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbjHTHfV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 20 Aug 2023 03:35:21 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42A91E1
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Aug 2023 00:34:34 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4ff9b389677so3379853e87.3
        for <linux-samsung-soc@vger.kernel.org>; Sun, 20 Aug 2023 00:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692516872; x=1693121672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I6tLuLD++BQvtPqr+6W85PTyjvuOfHBFRdTsdV0IpdU=;
        b=e7nzwYaFWQx61iKPJENX92vHtkW2gMXKzGibwJSliKlUyjxeCqSOHfxPtlcCTmdSYX
         aAL/wOyV0kM64RplgZelyFqCkZq4zQNBv9WrYTQp0poEfBuEBPafl7z/9d4C8JX+9z45
         xmw3A0hKmcNe1DHFr+ydynsfPYAOoOmEEHAodnthnOW7yWfJ+qEA0T44PP5jZzCsxdIm
         h2V2QDlcFSCI2BOCvTv+aaictNI9KJQltG7HXNNk/ZBSyffs0C7J9zIuOFvcFQlEY4t2
         6+IsqK8SBkcr3cgbsdrjoTIQWdKzQR/1S5k8GOuULgNuiwOZPpEFls7IOP+o+dcQOTFl
         +r4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692516872; x=1693121672;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I6tLuLD++BQvtPqr+6W85PTyjvuOfHBFRdTsdV0IpdU=;
        b=X+zN+nbpkHWcRfBazxuXsJQDVZvt9QczdkSDlD7LdiukP0hum/WNscj6MTHgLKE3/K
         GRjD5KMrvMN9IOh+XlXxqTrpixG8V7S3lNCef1CpmhaRFczKUb0u/WMXmJyvEatZ7FPc
         UABA0o/1ZzK05Zd7sjFgSEZ0RxvLIZJwTw/frNflTm+64AltuKWS4uvphOcoeJ3yRpju
         xFWesD7rsJ+jXKJNihn6bTAz/AIQMJZKauYgcHRdp3O9tzziNuNt3xLMbJZSm8DYbEyo
         fhoEMCXPwE0VGSMUCKwL29NieGwZA0cJE9ehH3Iy6+GFTJehHaCvuPjhUFnbBvnPSkv6
         9vEA==
X-Gm-Message-State: AOJu0YxPptpgf3aTzKQQbYJstNdhz/mPebTdXJn6Lef2RB2pESx2oald
        s/KGzupsL6WNCO7JspVfoQKh3g==
X-Google-Smtp-Source: AGHT+IGTlwDtllwhmcd3CgyHAJvbhZrkf+x4N/xPpPA8SZhot/IZi3eQMY8owGPvMR9WrGsk4rylVw==
X-Received: by 2002:a05:6512:2305:b0:4fe:c98:789a with SMTP id o5-20020a056512230500b004fe0c98789amr3440222lfu.37.1692516872535;
        Sun, 20 Aug 2023 00:34:32 -0700 (PDT)
Received: from krzk-bin.. ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id k9-20020a056402048900b0052540e85390sm3792062edv.43.2023.08.20.00.34.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Aug 2023 00:34:31 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] clk: samsung: drivers for v6.6
Date:   Sun, 20 Aug 2023 09:34:29 +0200
Message-Id: <20230820073429.9069-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Few commits for Samsung clock drivers.

Best regards,
Krzysztof


The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-6.6

for you to fetch changes up to b3f9581affb03ed28ff1905b649e66904f29b9e4:

  dt-bindings: clock: samsung: remove define with number of clocks (2023-08-15 07:50:15 +0200)

----------------------------------------------------------------
Samsung SoC clock drivers changes for 6.6

Remove from the bindings the #defines with number of clocks supported by
each clock controller driver.  This number can vary, e.g. when we
implement more clocks in the driver.  Having the number in the bindings
prevents changing it.  Instead, this should be just a #define inside the
driver.

----------------------------------------------------------------
Krzysztof Kozlowski (11):
      clk: samsung: exynos3250: do not define number of clocks in bindings
      clk: samsung: exynos4: do not define number of clocks in bindings
      clk: samsung: exynos5250: do not define number of clocks in bindings
      clk: samsung: exynos5260: do not define number of clocks in bindings
      clk: samsung: exynos5410: do not define number of clocks in bindings
      clk: samsung: exynos5420: do not define number of clocks in bindings
      clk: samsung: exynos5433: do not define number of clocks in bindings
      clk: samsung: exynos7885: do not define number of clocks in bindings
      clk: samsung: exynos850: do not define number of clocks in bindings
      clk: samsung: exynoautov9: do not define number of clocks in bindings
      dt-bindings: clock: samsung: remove define with number of clocks

 drivers/clk/samsung/clk-exynos3250.c             | 11 ++--
 drivers/clk/samsung/clk-exynos4.c                |  5 +-
 drivers/clk/samsung/clk-exynos4412-isp.c         |  5 +-
 drivers/clk/samsung/clk-exynos5250.c             |  5 +-
 drivers/clk/samsung/clk-exynos5260.c             | 41 ++++++++++-----
 drivers/clk/samsung/clk-exynos5410.c             |  5 +-
 drivers/clk/samsung/clk-exynos5420.c             |  5 +-
 drivers/clk/samsung/clk-exynos5433.c             | 65 ++++++++++++++++--------
 drivers/clk/samsung/clk-exynos7885.c             | 14 +++--
 drivers/clk/samsung/clk-exynos850.c              | 35 +++++++++----
 drivers/clk/samsung/clk-exynosautov9.c           | 29 +++++++----
 include/dt-bindings/clock/exynos3250.h           | 18 -------
 include/dt-bindings/clock/exynos4.h              |  5 --
 include/dt-bindings/clock/exynos5250.h           |  3 --
 include/dt-bindings/clock/exynos5260-clk.h       | 25 ---------
 include/dt-bindings/clock/exynos5410.h           |  2 -
 include/dt-bindings/clock/exynos5420.h           |  3 --
 include/dt-bindings/clock/exynos5433.h           | 42 ---------------
 include/dt-bindings/clock/exynos7885.h           |  4 --
 include/dt-bindings/clock/exynos850.h            | 10 ----
 include/dt-bindings/clock/samsung,exynosautov9.h | 18 -------
 21 files changed, 154 insertions(+), 196 deletions(-)
