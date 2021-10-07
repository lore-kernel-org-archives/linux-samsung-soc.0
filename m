Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6416C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Oct 2021 19:41:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CDC6D61038
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  7 Oct 2021 19:41:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232867AbhJGTnT (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 7 Oct 2021 15:43:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232604AbhJGTnL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 7 Oct 2021 15:43:11 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E08CC061760
        for <linux-samsung-soc@vger.kernel.org>; Thu,  7 Oct 2021 12:41:17 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id z11so21043594lfj.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 07 Oct 2021 12:41:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WZ5raaSJ3Kh1m3565MHsi6//vzYo4hkeevp5MNSOJt4=;
        b=AbO00kxEwuBcmi49QesZN1giMt72iFySJuAC6O7CpoMTKLLnWY/Sm5SunfqzMIKY5/
         C1SG32C3bS0r14x8qS4oc8JtpiMTvT9heLEvBMaxgEfvnbQHsHeE13t2MINGg+TV7fg6
         xUdfOK4wwvvDRZ8HAlBsXczfALPPImI5rYrLlXVx2UnKjCHfF+6ibK65xcAMpJv0y8Yv
         dnf6Oo6uPsYNpHAmGfVrtfYY//4eknVUUwg0ddRACIFXA7Wci6Mwtsp+uIp7YH2ULlBJ
         tSfK9kTpDB95S/BRzc6kfCntUuG5GrB98Em6b+GZipoJlmLithRsUAtMMglT4qt/RPq7
         1Ung==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=WZ5raaSJ3Kh1m3565MHsi6//vzYo4hkeevp5MNSOJt4=;
        b=DgoR30hn/lMx/QGIjfwxhG91BqDlSI3ZGLFyJZtWf/Ll0F4Uap5da+EEcpkJbCt7tJ
         nN5l2iIs6Hy/33W8sBZXGur6VXL2M6itYdnxIfbMO3R67mOVd2JKaPSixBSh5Ewj3DhZ
         bjW/dt+7TW2Ci3axHBgVaHn0DQjsYaW4/cnTSWxVEWo3gNs7H9I8iORC74lXt+0JR9iU
         crNv+yELKo4YuSbp7yT4d0sOqi2SVh3QzpVrDo9YFEBW2oQdCEQGbWrSv4mK5elKyKhb
         m3nueczS8fUfQHcZ2gcijc0rDvfIUCNBTu8kmd+ln+Hu8TQxCZSgA7zNhh/msh/o8gtF
         JFhg==
X-Gm-Message-State: AOAM533cgz/1oL7sLW5KvbkROA5+3llIR+r2bJk7GlkAFylIT9Nh17IY
        M3sxlM9+T7ICggE7PW2LyV7G3g==
X-Google-Smtp-Source: ABdhPJx72lBMBm4B023ZywQIdYifb6RLPIYCHYxT2sMbt3Qa4kMZYvce/V4Tfti1jFrhxzvQgWKFgA==
X-Received: by 2002:a05:6512:13a5:: with SMTP id p37mr6066109lfa.403.1633635675174;
        Thu, 07 Oct 2021 12:41:15 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id q8sm23879lfd.126.2021.10.07.12.41.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 12:41:14 -0700 (PDT)
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
Subject: [PATCH v2 0/5] clk: samsung: Introduce Exynos850 SoC clock driver
Date:   Thu,  7 Oct 2021 22:41:08 +0300
Message-Id: <20211007194113.10507-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This patch series provides the implementation for Exynos850 clock
driver, its documentation and corresponding changes for Samsung clock
infrastructure (adds new PLL types used in Exynos850 SoC, following
TRM).

I tried to follow already established design for Samsung clock drivers
(getting most insights from Exynos5433 clock driver), and integrate the
driver into existing infrastructure. The whole driver was implemented
from scratch, using mostly TRM and downstream kernel for clock
dependencies/hierarchy info.

For now only basic clocks are implemented, including next blocks:
  - CMU_TOP
  - CMU_PERI
  - CMU_CORE
  - CMU_HSI
  - CMU_DPU

Some CMUs are still not implemented, but that can be added in future,
when the need arises. The driver also lacks CLKOUT support, PM ops and
automatic clocks control (using Q-Channel protocol). All that can be
added independently later.

Implemented clock tree was tested via UART and MMC drivers, and using
DebugFS clk support (e.g. using 'clk_summary' file). In order to keep
all clocks running I added 'clk_ignore_unused' kernel param in my local
tree, and defined CLOCK_ALLOW_WRITE_DEBUGFS in clk.c for actually
testing the clocks via DebugFS.

Changes in v2:
  - Added CMU_DPU implementation
  - Moved bus clock enablement to clk-exynos850.c
  - See also "v2 changes" list in each particular patch

Sam Protsenko (5):
  clk: samsung: clk-pll: Implement pll0822x PLL type
  clk: samsung: clk-pll: Implement pll0831x PLL type
  dt-bindings: clock: Add bindings definitions for Exynos850 CMU
  dt-bindings: clock: Document Exynos850 CMU bindings
  clk: samsung: Introduce Exynos850 clock driver

 .../clock/samsung,exynos850-clock.yaml        | 185 ++++
 drivers/clk/samsung/Makefile                  |   1 +
 drivers/clk/samsung/clk-exynos850.c           | 835 ++++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 | 196 ++++
 drivers/clk/samsung/clk-pll.h                 |   2 +
 include/dt-bindings/clock/exynos850.h         | 141 +++
 6 files changed, 1360 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-exynos850.c
 create mode 100644 include/dt-bindings/clock/exynos850.h

-- 
2.30.2

