Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D484C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 17 Dec 2021 01:46:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231966AbhLQBqS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 16 Dec 2021 20:46:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231955AbhLQBqR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 16 Dec 2021 20:46:17 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B106AC061574
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Dec 2021 17:46:16 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id v15so1026404ljc.0
        for <linux-samsung-soc@vger.kernel.org>; Thu, 16 Dec 2021 17:46:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1+A8y/ivr44BnX1V6wtimd44XZ8qKCTqhJv4qwuRTXQ=;
        b=GQmwXqURYeoXihrPdmq6zV2xgjfD8rHD4WLhhs+8ow8yJ463jXj9dd3YgarWTfofw4
         u6T41MIWx2j/n0nht+tgJnd1i5ofVUdREt9W01IC29zllzCDK4MZjharB1uYrHWY25TN
         mLy9h3NqH+3fQIt4UxvEkqxxxAcdlmwEMh6v9IgZJ8z6cIEQ8EXsyVWvXEsmvs9gnnEy
         lHu7A5Uro/6xWGr8i0KXJJPu9vRB6ogYPIw6exJkGYqdb2rLiU2tMffINYjn5hkeJAKf
         qkToet0P3rvBq5NA5HZGPpT4lkU0fSKSsob4EPhN+c4+frwbPXRDh9Qm4WFEskS30E4X
         FZPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1+A8y/ivr44BnX1V6wtimd44XZ8qKCTqhJv4qwuRTXQ=;
        b=iLrTkf+e36GK3G5KkVM+C0bxZgMGNMdJ5DQnOML6hkTpuyZ0uOD7Xz6t1uLKw1uKdq
         GgII8IDRUIz/srtZND867u9nNE6bbEQ0+DW1k/+czUPThrdiueCyF0TjzMDlpiFdYSCs
         8AKtMlsnca/nOkii+fnEVhgUOjrimUPaIrZyWgw07ha/MuYnAHkq88DusX1qBTedBXec
         tDddOdteiib18j21fuCMQmhRAwsQbAGOtu4ov6y0tbJznSiyUfpzZyAkefJ9z9QFMkEA
         PASAiY2jSYK9fnHeDiYezMdL63F8P16YKa7Vz1+U1o4rUqV1lrpMratESaCyia/m/0Rm
         X1hQ==
X-Gm-Message-State: AOAM533MMlfyWwRAgIUjkppXB9vVgfefUs4la+AQkfvs6CY0M4GGlqnW
        5XGWhD4mKtF/rEyCZR/V00mPGA==
X-Google-Smtp-Source: ABdhPJzrKyurNAGxwCw/Em4HH2vg7qswqnOiuJQJb16rlsrAasj3b56NrclMQcJ5AoeJJ6nNCUZASA==
X-Received: by 2002:a2e:a4b0:: with SMTP id g16mr767297ljm.462.1639705575004;
        Thu, 16 Dec 2021 17:46:15 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id bp41sm1139098lfb.129.2021.12.16.17.46.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Dec 2021 17:46:14 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Hao Fang <fanghao11@huawei.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v3 0/7] arm64: dts: exynos: Add E850-96 board support
Date:   Fri, 17 Dec 2021 03:46:06 +0200
Message-Id: <20211217014613.15203-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

WinLink's E850-96 is a dev board based on Exynos850 SoC [1]. The board's
design follows 96boards specifications, hence it's compatible with
96boards mezzanines [2].

This patch series adds the initial support for E850-96 board and
Exynos850 SoC, along with corresponding bindings. Only basic platform
components are enabled at the moment (like serial, I2C, eMMC, RTC, WDT,
clock driver, etc). Right now with this patch series it's possible to
run the kernel with BusyBox rootfs as a RAM disk. More features are
coming soon.

[1] https://www.samsung.com/semiconductor/minisite/exynos/products/mobileprocessor/exynos-850/
[2] https://www.96boards.org/products/mezzanine/

Changes in v3:
  - Ordered the pinctrl_alive phandle alphabetically (patch 7/7)
  - No other changes in v3

Changes in v2:
  - Rebased on krzk/linux.git (for-next), to account for Exynos7885
    changes
  - Added missing and new tags (R-b and Ack)
  - Addressed all comments for v1

Sam Protsenko (7):
  dt-bindings: clock: exynos850: Add bindings for Exynos850 sysreg
    clocks
  clk: samsung: exynos850: Add missing sysreg clocks
  dt-bindings: Add vendor prefix for WinLink
  dt-bindings: arm: samsung: Document E850-96 board binding
  dt-bindings: pinctrl: samsung: Add pin drive definitions for Exynos850
  arm64: dts: exynos: Add initial Exynos850 SoC support
  arm64: dts: exynos: Add initial E850-96 board support

 .../bindings/arm/samsung/samsung-boards.yaml  |   6 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/exynos/Makefile           |   1 +
 .../boot/dts/exynos/exynos850-e850-96.dts     | 175 ++++
 .../boot/dts/exynos/exynos850-pinctrl.dtsi    | 713 +++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos850.dtsi     | 753 ++++++++++++++++++
 drivers/clk/samsung/clk-exynos850.c           |  29 +
 include/dt-bindings/clock/exynos850.h         |  12 +-
 include/dt-bindings/pinctrl/samsung.h         |  13 +-
 9 files changed, 1700 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850.dtsi

-- 
2.30.2

