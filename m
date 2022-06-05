Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F733C43334
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  5 Jun 2022 16:05:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345737AbiFEQF2 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 5 Jun 2022 12:05:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345727AbiFEQF2 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 5 Jun 2022 12:05:28 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFDA0270B
        for <linux-samsung-soc@vger.kernel.org>; Sun,  5 Jun 2022 09:05:26 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id kq6so11694246ejb.11
        for <linux-samsung-soc@vger.kernel.org>; Sun, 05 Jun 2022 09:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZBtsLQEQHzTdEyPI6jY4pM50JcSmWWFR9nMexAxpXUs=;
        b=ZjK8hRDmAYk37fChJDrX2TVhKN9iYnckQA+KCVGiaZhXDD0FiqLu196SVgAMKVF7N/
         DE3IqhXR2XVgG7iDRojxz6P4/CAQf1Fjt9+vZnYI9xiGql40ABMRT9RnCOpt4owDJIJe
         0Ju+V9Wxf57naDpqMCEg44I395yQvbz7qamLSeMo3ectZ0B+/kB0sRScqoqzycwXycZi
         S9AAFmPLPK70rBoyhEdYBCpA0aSlqlj/zMsLPXb43jteUxWrMegiRB5s8QvRYIcO4aUE
         tov5Dzi3SGYSdbnYVS6eO46vfBYnzRuhYo8lV7EZesBKqv//fvqW8H59lj38bh6n0Wck
         tguQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZBtsLQEQHzTdEyPI6jY4pM50JcSmWWFR9nMexAxpXUs=;
        b=0FtGXKqnwji9npKPIB7qZtMACQQEtFVdBixOPC4zhUyTneX1hXNwe0nEdIkOpWnAYm
         Owm/n65eTpr4kS7abScflMI9jn/jvtfytv6xkjugg9D18/H799fQyagmAT6I5uZszg8g
         LKCKCl1uBjw/a1CSrG/c/UYCzV3MYqYvswqdaTG0hackuL2YLUXR8Bz2hzJZS2wzOsqJ
         37PCXY3Z7Qevoy8IqKUQ+pF/1h5wV0Unf47rsF3bFavilqkON8n8r51hca9W30/R470N
         6uhuVUwYhpTUOOHy3E/eEiPOIoFejR3uDLwCR4r4yILwDUdKRth+KJ53/8xc5u6XRvzN
         Y6ZA==
X-Gm-Message-State: AOAM530mQgkY3e1TyYYcJnkAZo52Ssx4b7bSEfqbjr9vvfT/jPOtwoJ7
        +VBcrbB6tOeEonBg8cAYLh8LwQ==
X-Google-Smtp-Source: ABdhPJxXgmPpebfDBf4KEbegfOnc3qUW/+ZYYW1lWdkmDO3QAZoTKZ44ibT9JQC2M9RRTcWh/ha5cg==
X-Received: by 2002:a17:906:1257:b0:710:14e9:31a8 with SMTP id u23-20020a170906125700b0071014e931a8mr8996162eja.638.1654445125295;
        Sun, 05 Jun 2022 09:05:25 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id x18-20020a170906805200b0070b7875aa6asm3969963ejw.166.2022.06.05.09.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 09:05:24 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 0/8] pinctrl/arm: dt-bindings: deprecate header with register constants
Date:   Sun,  5 Jun 2022 18:05:00 +0200
Message-Id: <20220605160508.134075-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Merging
=======
1. I plan to take the DTS changes (patches 1-6) via Samsung SoC tree.
2. The driver change (patch 7) can go independently via pinctrl tree or via my
   Samsung pinctrl tree.
3. The final bindings patch 8 will wait for next release, to avoid any cross
   tree merges or warnings.

Changes since v2
================
1. Split last bindings patch per driver changes and bindings.
2. Add tags.

Changes since v1
================
1. Correct title (in the comment) of each header (Chanho).
2. Patch #7: Adjust warning message.
3. Add tags.

Description
===========
The Samsung pin controller drivers were always expecting DTS to use raw
register values for pin configuration (e.g. pull up/down, drive strength).  DTS
had these values hard-coded all over, so at some point we decided for
convenience to move them to dt-bindings header.  Less code duplication, some
meaning added to raw number, etc.

However these constants do not fit the purpose of bindings.  They do not
provide any abstraction, any hardware and driver independent ID.  With minor
exceptions, the Linux drivers actually do not use the bindings header at
all.  Because of this "dt-bindings ID" approach, these constants were re-used
between chips, e.g. Exynos ones in S5PV210.  These does not make much sense
because the values between Exynos and S5PV210 (or S3C24xx) are not related.  If
it was an abstraction ID, this would be fine. But it's not.

Clean this up by:
1. Moving the constants to DTS-local headers.
2. Deprecating the bindings header.

Tested by comparing DTBs (dtx_diff, fdtdump).

Best regards,
Krzysztof

Krzysztof Kozlowski (8):
  ARM: dts: s3c2410: use local header for pinctrl register values
  ARM: dts: s3c64xx: use local header for pinctrl register values
  ARM: dts: s5pv210: use local header for pinctrl register values
  ARM: dts: exynos: use local header for pinctrl register values
  arm64: dts: exynos: use local header for pinctrl register values
  arm64: dts: fsd: use local header for pinctrl register values
  pinctrl: samsung: do not use bindings header with constants
  dt-bindings: pinctrl: samsung: deprecate header with register
    constants

 arch/arm/boot/dts/exynos-pinctrl.h            |  55 ++
 arch/arm/boot/dts/exynos3250-pinctrl.dtsi     |   2 +-
 arch/arm/boot/dts/exynos4210-pinctrl.dtsi     |   2 +-
 arch/arm/boot/dts/exynos4412-midas.dtsi       |   3 +-
 arch/arm/boot/dts/exynos4412-p4note.dtsi      |   2 +-
 arch/arm/boot/dts/exynos4412-pinctrl.dtsi     |   2 +-
 arch/arm/boot/dts/exynos5250-pinctrl.dtsi     |   2 +-
 arch/arm/boot/dts/exynos5260-pinctrl.dtsi     |   2 +-
 arch/arm/boot/dts/exynos5410-pinctrl.dtsi     |   2 +-
 arch/arm/boot/dts/exynos5420-pinctrl.dtsi     |   2 +-
 arch/arm/boot/dts/s3c2410-pinctrl.h           |  19 +
 arch/arm/boot/dts/s3c2416-pinctrl.dtsi        |  38 +-
 arch/arm/boot/dts/s3c64xx-pinctrl.dtsi        | 178 +++----
 arch/arm/boot/dts/s3c64xx-pinctrl.h           |  27 +
 arch/arm/boot/dts/s5pv210-aquila.dts          |   4 +-
 arch/arm/boot/dts/s5pv210-aries.dtsi          | 134 ++---
 arch/arm/boot/dts/s5pv210-fascinate4g.dts     |  22 +-
 arch/arm/boot/dts/s5pv210-galaxys.dts         |  34 +-
 arch/arm/boot/dts/s5pv210-pinctrl.dtsi        | 480 +++++++++---------
 arch/arm/boot/dts/s5pv210-pinctrl.h           |  39 ++
 arch/arm64/boot/dts/exynos/exynos-pinctrl.h   |  79 +++
 .../boot/dts/exynos/exynos5433-pinctrl.dtsi   |   2 +-
 .../boot/dts/exynos/exynos7-espresso.dts      |   6 +-
 .../boot/dts/exynos/exynos7-pinctrl.dtsi      |  72 +--
 .../boot/dts/exynos/exynos7885-pinctrl.dtsi   |   2 +-
 .../boot/dts/exynos/exynos850-pinctrl.dtsi    |   2 +-
 .../boot/dts/exynos/exynosautov9-pinctrl.dtsi |   2 +-
 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi    |  92 ++--
 arch/arm64/boot/dts/tesla/fsd-pinctrl.h       |  33 ++
 drivers/pinctrl/samsung/pinctrl-exynos.c      |   6 +-
 drivers/pinctrl/samsung/pinctrl-exynos.h      |   3 +
 drivers/pinctrl/samsung/pinctrl-samsung.c     |   4 +-
 drivers/pinctrl/samsung/pinctrl-samsung.h     |   8 +
 include/dt-bindings/pinctrl/samsung.h         |   7 +
 34 files changed, 817 insertions(+), 550 deletions(-)
 create mode 100644 arch/arm/boot/dts/exynos-pinctrl.h
 create mode 100644 arch/arm/boot/dts/s3c2410-pinctrl.h
 create mode 100644 arch/arm/boot/dts/s3c64xx-pinctrl.h
 create mode 100644 arch/arm/boot/dts/s5pv210-pinctrl.h
 create mode 100644 arch/arm64/boot/dts/exynos/exynos-pinctrl.h
 create mode 100644 arch/arm64/boot/dts/tesla/fsd-pinctrl.h

-- 
2.34.1

