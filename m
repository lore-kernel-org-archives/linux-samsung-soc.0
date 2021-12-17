Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC928C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 17 Dec 2021 16:15:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238925AbhLQQPx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 17 Dec 2021 11:15:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbhLQQPx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 17 Dec 2021 11:15:53 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D4FEC06173E
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Dec 2021 08:15:52 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id b22so5641028lfb.9
        for <linux-samsung-soc@vger.kernel.org>; Fri, 17 Dec 2021 08:15:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SGIO3bUbOyLAGLDGNDrVtdjpSJVfbgrhp+VoDayZdrk=;
        b=TmoqaDCxyyJi03kZKNb6qgmFdHHqq0uvGuzh+zRXdJf+NIPgakylfVxINqTUj0gWnr
         irgX8tiRgh8EaQRfjyGBCNLuJNWSjlonyJBfAXjptr8JRmP4pNee5UpL2DvUYbyuTUo9
         pBRKmQTCYVObcdWYI82YWG7CHpgJsMHY1AnD35R1fpggwg1Q7og49BLXnu76zCz4ROmO
         9bYsLy2/6n3wicuHVvUOXI09qMN1Ybj+G8dkexO3ab6rKle8YKqijJH0kayHaXBnE7VV
         yoPiT0Nzq/k+sd8YyW31/38GJC6mfj7HcivceXBpoKjjXZgIdvjNzIbW0XjIYqGmuzqp
         FS/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SGIO3bUbOyLAGLDGNDrVtdjpSJVfbgrhp+VoDayZdrk=;
        b=wL8xv/3UQvPJLwL022pEtczWy5y27ZVQIElf23IwcQX4dbXWNmC5GmJu3iIRwgI7Bl
         UduMc48Z82m9moIw6t0PNHvxHlrJRzBt+GCidUVSzu8argrSm2aOxdmWeWG0Oo5Bm2Sw
         ul0hYqwXg+LPdRbShJ+UaWhZbtDlV+Kos7qyIOgvk5MfRAs0AeS1kKq+Y0jefvNq7UXB
         bT7F1i7ILuu/qRT4DLAfm28P4oUcTjOJECoxtPjA/c11sR/moq84pmEBbiXZflvIVYwx
         UEYQO8Cs4pdcg9OJ39JHTFX7D7zIryAWo+2keqGC0bkno2XwpjO5Sum9ts53B6w87CA1
         O1+Q==
X-Gm-Message-State: AOAM5313RGp4DrW66/5lL7iNou4gkKoxZrFEAx3LA20evnff/uzNwIFw
        w0SDmHXxJvK6p9NnwSdje/Xs9w==
X-Google-Smtp-Source: ABdhPJwAkXX5v3eIXx7quTKRqHz6jqdTRtrSxcGiIlzEa97n8FLx2pK0A1N73AVgaI9SOjje9iGvcg==
X-Received: by 2002:a19:fc01:: with SMTP id a1mr3369591lfi.594.1639757750762;
        Fri, 17 Dec 2021 08:15:50 -0800 (PST)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id t4sm1452171lfe.220.2021.12.17.08.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Dec 2021 08:15:50 -0800 (PST)
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
Subject: [PATCH v4 0/7] arm64: dts: exynos: Add E850-96 board support
Date:   Fri, 17 Dec 2021 18:15:42 +0200
Message-Id: <20211217161549.24836-1-semen.protsenko@linaro.org>
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

Changes in v4:
  - Removed slew_rate pin nodes
  - Moved rtcclk clock to board dts file

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
 .../boot/dts/exynos/exynos850-e850-96.dts     | 195 +++++
 .../boot/dts/exynos/exynos850-pinctrl.dtsi    | 643 +++++++++++++++
 arch/arm64/boot/dts/exynos/exynos850.dtsi     | 741 ++++++++++++++++++
 drivers/clk/samsung/clk-exynos850.c           |  29 +
 include/dt-bindings/clock/exynos850.h         |  12 +-
 include/dt-bindings/pinctrl/samsung.h         |  13 +-
 9 files changed, 1638 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850.dtsi

-- 
2.30.2

