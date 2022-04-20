Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5E6BC43217
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 20 Apr 2022 07:22:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359686AbiDTHYt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 20 Apr 2022 03:24:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359688AbiDTHYr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Apr 2022 03:24:47 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 099CB3B010
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Apr 2022 00:21:59 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id z99so1096572ede.5
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Apr 2022 00:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h6Yd9N7wbWEw54Sdiq3zmnk3cJ49/izp1UT6h3P+NWU=;
        b=swuD2twFKnyevnlN32QlModZGN5PERaIW4JGMVzwbnuR/F06sZTBIOCgthcxjyimsl
         dWY4lsDVRFyFXvcsl9FXzTQATjFk3K6HtaVHPrBr7C5RdSGJpVj/23+vDScn2U9blmnF
         RJ4DquD5AF4bPory6XJnHZwJb+8ulaktewnjJFHPAnBDWOsJ/pBDjvyGqYudS9lAVhGQ
         Yd92ykUG7miGgUXE/Qn1PrMFd4e85Owxp3pRPNqIfjvZG2iRkHpF2VLMn8gC+EK4RnkB
         zKCQFdAwF+xuZQ3vtGvmujFRaudoad5ewwjypKwNkWz9irUbiZxXSoc1regQk/HpGoOJ
         Okdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h6Yd9N7wbWEw54Sdiq3zmnk3cJ49/izp1UT6h3P+NWU=;
        b=RolV3ySyedtIHW3VNSN3hrwA/QqEa/mRzbTMQo1XT0HYnyRMZsEBFOAdieQUQdo5xY
         OtT1YXG9hvu4RRmeOpQnVRMN/yDznfrkvF12uOOCMKH0xrGj//AbTC6/AgzOzSy90vzq
         kAQXibeQBO8fGZ0KoiHiXlK1QdtBAPpHQIJKxxQ1+2hQLi+JoYhvX3nd8MCuj1Sv8wkT
         JZabvFubsVobb4Msr78u0Xf7w5Mbgs4g0KS0NXmnONP+qF7lo8e3NCaAcKW8KU3a/ejC
         RUEo6rvymePSTTfKa5DIrR7shSIwi5HA+NCbYe+An3ziFbypy9u4XFK7+iCxE142cyO9
         7ioA==
X-Gm-Message-State: AOAM532Kw9SFEAtD6RuSUuz1MsKDQiQpN/kEZm10B0xMxIrUaYOhuqE0
        jXgWV1ISLYiENBVckenZofGRsA==
X-Google-Smtp-Source: ABdhPJxGVrhfaOD5JDiROq+//GQCbSajTSv47RqHe//JFBr/9MrnkpwOtHu3ycSFCpWPnSAl5aXaXg==
X-Received: by 2002:a05:6402:3584:b0:423:e4d0:34f with SMTP id y4-20020a056402358400b00423e4d0034fmr15250992edc.72.1650439317609;
        Wed, 20 Apr 2022 00:21:57 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id a1-20020a1709063e8100b006ce06ed8aa7sm6492106ejj.142.2022.04.20.00.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 00:21:57 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/3] ARM: dts: samsung: dts for v5.19
Date:   Wed, 20 Apr 2022 09:21:51 +0200
Message-Id: <20220420072152.11696-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220420072152.11696-1-krzysztof.kozlowski@linaro.org>
References: <20220420072152.11696-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.19

for you to fetch changes up to 9e916fb9bc3d16066286f19fc9c51d26a6aec6bd:

  ARM: dts: s5pv210: align DMA channels with dtschema (2022-04-09 18:50:05 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.19

1. Several DT schema related changes to make DTBs passing schema checks:
   EHCI/OHCI/DMA/Ethernet node names, DMA channels order, USB-like
   compatibles.
2. Add specific compatibles to Multi Core Timer to allow stricter DT
   schema matching.
3. Cleanup from deprecated bindings:
   - Remove deprecated unit-address workaround for Exynos5422 Odroid XU3
     LPDDR3 memory timings.
   - Do not use unit-address (and SFR region) in Exynos5250 MIPI phy in
     favor of syscon node (unit-address deprecated in 2016).
   - Use standard generic PHYs for EHCI/OHCI device in S5PV210.
4. Fix inverted SPI CS (thus blank panel) on S5PV210 Aries boards.
5. Correct Bluetooth interupt name on S5PV210 Aries boards.

----------------------------------------------------------------
Jonathan Bakker (4):
      ARM: dts: s5pv210: Remove spi-cs-high on panel in Aries
      ARM: dts: s5pv210: Correct interrupt name for bluetooth in Aries
      ARM: dts: s5pv210: Adjust memory reg entries to match spec
      ARM: dts: s5pv210: Adjust DMA node names to match spec

Krzysztof Kozlowski (7):
      ARM: dts: exynos: remove deprecated unit address for LPDDR3 timings on Odroid
      ARM: dts: exynos: add a specific compatible to MCT
      ARM: dts: exynos: drop deprecated SFR region from MIPI phy
      ARM: dts: exynos: align EHCI/OHCI nodes with dtschema on Exynos4
      ARM: dts: s5pv210: align EHCI/OHCI nodes with dtschema
      ARM: dts: s5pv210: Use standard arrays of generic PHYs for EHCI/OHCI device
      ARM: dts: s5pv210: align DMA channels with dtschema

Oleksij Rempel (2):
      ARM: dts: exynos: fix ethernet node name for different odroid boards
      ARM: dts: exynos: fix compatible strings for Ethernet USB devices

 arch/arm/boot/dts/exynos3250.dtsi               |  3 +-
 arch/arm/boot/dts/exynos4.dtsi                  |  4 +--
 arch/arm/boot/dts/exynos4412-odroidu3.dts       |  4 +--
 arch/arm/boot/dts/exynos4412-odroidx.dts        |  8 ++---
 arch/arm/boot/dts/exynos5250.dtsi               |  8 ++---
 arch/arm/boot/dts/exynos5260.dtsi               |  3 +-
 arch/arm/boot/dts/exynos5410-odroidxu.dts       |  4 +--
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi   |  7 ++---
 arch/arm/boot/dts/exynos5422-odroidxu3-lite.dts |  6 ++--
 arch/arm/boot/dts/exynos5422-odroidxu3.dts      |  6 ++--
 arch/arm/boot/dts/exynos54xx.dtsi               |  3 +-
 arch/arm/boot/dts/s5pv210-aquila.dts            |  3 +-
 arch/arm/boot/dts/s5pv210-aries.dtsi            | 11 ++++---
 arch/arm/boot/dts/s5pv210-goni.dts              |  6 ++--
 arch/arm/boot/dts/s5pv210.dtsi                  | 40 ++++++++++---------------
 15 files changed, 52 insertions(+), 64 deletions(-)
