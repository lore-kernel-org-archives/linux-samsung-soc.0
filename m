Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B35FC4320E
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 30 Jul 2021 14:49:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 55E4460FE7
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 30 Jul 2021 14:49:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239341AbhG3Otc (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 30 Jul 2021 10:49:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239286AbhG3Otb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 30 Jul 2021 10:49:31 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B69BC0613C1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Jul 2021 07:49:25 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id da26so13581568edb.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Jul 2021 07:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5PHkR+YSvqa36gxNmyyX6WoOgZM8UVlxbzCVysbca2U=;
        b=ppXxSci0wZJY7XnVRY4yu+4+WjQPwflcLFwiLy+QQ2ntOFZXb3dYBrtgAZwQGOi+NV
         8ryr8dUU1x3Pk72hg5RJMDLvQ6HSfUlWQ8EhsjLq8MHTWl9lHdDa4QV/YXWlXDc0UCNe
         memZ6BED5+EO4wvTQgR1+L8lXlCDQ5+LPoltjuRKc5UlGaxNzX9gLhdJYS/OBhee8/Vc
         vF93q4YTSPaGqnxeDvez4Id9seJG7z85l00ime4MS8Q4naLZzzVDb/iC/jBEJatL+c+8
         imSkgBkD7IX3F6D//6uXm7OsGe26LDkBDkshApcHXIjIpdAH4bgPtgEvxKRogza7ZtXh
         y8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5PHkR+YSvqa36gxNmyyX6WoOgZM8UVlxbzCVysbca2U=;
        b=IgSp4xHe7GThOURTnNt++cH843aNntD1x7HEXl24VjhrP5icy/H40t0k8HXl+zYhnc
         iEvI2mVmtBfbJ2vab2rEpapEV0mfbF6bN0/hITZYlqdfWzlpe2NKUIBgxwovwx/gunUT
         rigRey6qQqfhvemA/R9Gcw9U7fVQVDYMN7AhE3QFsBGI7xKNu/eYQ9HyXgyML6/ob5jV
         9c5SR8PU/cmChBJwyi8UtRQ4wel0gIHgrT1ssIUSdegC/wV9vghl5eTqoWRuPskn4jQb
         FgMpySZekZs73T5Jc6rISpdDURxVcCw4a0mOLeQGbhEcximnofoh4VM1ShJZ8Lco1H/h
         tFMQ==
X-Gm-Message-State: AOAM532h8uWywCKZYoDQWjyJbJo74P6RStW1xdSDrcbk5u/2ovYyi2R5
        lRcPmAzuCsrvFYwnwc4dtRZQHA==
X-Google-Smtp-Source: ABdhPJwdxvjBr38jNA7cLuHBawxASA9D/0kL5M54NafNl/0JLAWo7243dU/nVXHaEZWEexPUYsyDJw==
X-Received: by 2002:a05:6402:49a:: with SMTP id k26mr3291469edv.279.1627656564172;
        Fri, 30 Jul 2021 07:49:24 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id p16sm785006eds.73.2021.07.30.07.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 07:49:23 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: [PATCH 00/12] Add minimal support for Exynos850 SoC
Date:   Fri, 30 Jul 2021 17:49:10 +0300
Message-Id: <20210730144922.29111-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

This patch series adds initial platform support for Samsung Exynos850
SoC [1]. With this patchset it's possible to run the kernel with BusyBox
rootfs as a RAM disk. More advanced platform support (like MMC driver
additions) will be added later. The idea is to keep the first submission
minimal to ease the review, and then build up on top of that.

[1] https://www.samsung.com/semiconductor/minisite/exynos/products/mobileprocessor/exynos-850/

Jaehyoung Choi (1):
  pinctrl: samsung: Fix pinctrl bank pin count

Sam Protsenko (11):
  pinctrl: samsung: Add Exynos850 SoC specific data
  dt-bindings: pinctrl: samsung: Add Exynos850 doc
  tty: serial: samsung: Init USI to keep clocks running
  tty: serial: samsung: Fix driver data macros style
  tty: serial: samsung: Add Exynos850 SoC data
  dt-bindings: serial: samsung: Add Exynos850 doc
  MAINTAINERS: Cover Samsung clock YAML bindings
  dt-bindings: clock: Add bindings for Exynos850 clock controller
  clk: samsung: Add Exynos850 clock driver stub
  dt-bindings: interrupt-controller: Add IRQ constants for Exynos850
  arm64: dts: exynos: Add Exynos850 SoC support

 .../bindings/clock/exynos850-clock.yaml       |  70 ++
 .../bindings/pinctrl/samsung-pinctrl.txt      |   1 +
 .../bindings/serial/samsung_uart.yaml         |   1 +
 MAINTAINERS                                   |   3 +-
 .../boot/dts/exynos/exynos850-pinctrl.dtsi    | 782 ++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos850-usi.dtsi |  30 +
 arch/arm64/boot/dts/exynos/exynos850.dtsi     | 245 ++++++
 drivers/clk/samsung/Makefile                  |   1 +
 drivers/clk/samsung/clk-exynos850.c           |  63 ++
 .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 129 +++
 drivers/pinctrl/samsung/pinctrl-exynos.h      |  29 +
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   4 +-
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   1 +
 drivers/tty/serial/samsung_tty.c              |  50 +-
 include/dt-bindings/clock/exynos850.h         | 267 ++++++
 .../interrupt-controller/exynos850.h          | 290 +++++++
 include/linux/serial_s3c.h                    |   9 +
 17 files changed, 1970 insertions(+), 5 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/exynos850-clock.yaml
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850-usi.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos850.dtsi
 create mode 100644 drivers/clk/samsung/clk-exynos850.c
 create mode 100644 include/dt-bindings/clock/exynos850.h
 create mode 100644 include/dt-bindings/interrupt-controller/exynos850.h

-- 
2.30.2

