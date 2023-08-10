Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A16C04A6A
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Aug 2023 15:13:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234855AbjHJPNC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 10 Aug 2023 11:13:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234097AbjHJPNB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Aug 2023 11:13:01 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90DF92694
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Aug 2023 08:13:00 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b9e6cc93c6so15734751fa.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Aug 2023 08:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691680379; x=1692285179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sdDT26B+V+vLaTDUp/YfHK3rTLHjJZ5TyquwU+jDUTg=;
        b=hCBkjMlRwOwHdUIZUbK4Vmgot6S0HpOAYovZGCHIe6YVA9w0MSDGsKmvVkibHTVzHD
         skFYcetIYyLbdZhOrEe/ZUZ56ZsdcOk97isqCcEkgpkl3IH733ZKkUtaTPOmNI7MxQHI
         K3sfbL0Lo94H3Qek+jTg0N00aUUhuO6pUulscX8DQjohQjiAuq6PA8n/Il2pa/J+h9F+
         R1KQ/O6HnhQCTCpbHCglSicQoPil3SMygN6Ihefgy0NhjbfVOVMyS6M/+sMUPyizD1hW
         baBazklOaKIWK1qsIwGeW5nEvWgu+K2kkPLLGEbC/cRGtY+faa2qTbLQadM40TFppFOk
         uTlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691680379; x=1692285179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sdDT26B+V+vLaTDUp/YfHK3rTLHjJZ5TyquwU+jDUTg=;
        b=kk8zm+ZefPkkmXraB0B/UbsGKjAaRPBina7cnzZqOZD08Eh/RYHBrnnYYg8YQ/hmdv
         c82jHLBeGrUGRwE6O3utY78adXBGjWGvG4kisyN9wPaXUJNsXKfLRLcGAg5eMP1pqRx2
         xTLHanI3kwi2B/T8XpdEDXj2pLiRV7Zx3kEldaJK36bxai1VhwrTa4PO4SpslIXzx8g2
         1YikAHAb16X8KTpCtpemCuX1gWf8JV5Zo1DKRyoHmWFu2WKX4NurmHlS22LZ7lCmFie9
         7ZkFOcBZ4LohiAplyIWz9BHQPtyZQB0wlP/2SrsiJbX06igYEDjuI5w83PV5yJi2Lgsn
         Eusw==
X-Gm-Message-State: AOJu0YzTp2p4ZQ5WGG6D663jrT9WDG5fg4z2ou/2ZutXc3+iApxu9z7Y
        tc0GXtu8nyUrGf+/UapqysoJxQ==
X-Google-Smtp-Source: AGHT+IGupjKFY36wRNEtTkCoS9n57Wd8DU6a0M9vinXIEc0RwmTcvWIePJIex5oTwUEiMt1H6ZTG/A==
X-Received: by 2002:a2e:9987:0:b0:2ba:3452:a799 with SMTP id w7-20020a2e9987000000b002ba3452a799mr2349401lji.42.1691680378781;
        Thu, 10 Aug 2023 08:12:58 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id 5-20020a05600c020500b003fe29dc0ff2sm2416242wmi.21.2023.08.10.08.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 08:12:58 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 3/3] ARM: dts: samsung: DTS for v6.6
Date:   Thu, 10 Aug 2023 17:12:50 +0200
Message-Id: <20230810151250.220202-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810151250.220202-1-krzysztof.kozlowski@linaro.org>
References: <20230810151250.220202-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-6.6

for you to fetch changes up to 57f706bf73079379a9e9f5490c94c2473077bb2e:

  ARM: dts: samsung: exynos4412-midas: add USB connector and USB OTG (2023-07-26 10:51:41 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v6.6

1. Galaxy S II: correct LCD screen's physical size.
2. Add Samsung Galaxy Tab 3 8.0 boards (Exynos4212).
3. Galaxy S3 family: add USB connector and USB OTG. Full USB OTG still
   seems not to work, but at least HDMI improved and dtbs_check is
   happy.
4. Fix issues pointed out by dtbs_check and W=1: unit addresses, use
   'gpios' suffix over 'gpio', update i2c-arb device node to newer
   binding.
5. Few white-space cleanups.

----------------------------------------------------------------
Artur Weber (1):
      ARM: dts: exynos: Add Samsung Galaxy Tab 3 8.0 boards

Krzysztof Kozlowski (8):
      ARM: dts: exynos: minor whitespace cleanup around '='
      ARM: dts: s5pv210: minor whitespace cleanup around '='
      ARM: dts: samsung: s3c6410-mini6410: correct ethernet reg addresses (split)
      ARM: dts: samsung: s5pv210-smdkv210: correct ethernet reg addresses (split)
      ARM: dts: samsung: fix Exynos4212 Tab3 makefile entries
      ARM: dts: samsung: exynos5250-snow: use 'gpios' suffix for i2c-arb
      ARM: dts: samsung: exynos5250-snow: switch i2c-arb to new child variant
      ARM: dts: samsung: exynos4412-midas: add USB connector and USB OTG

Paul Cercueil (1):
      ARM: dts: samsung: exynos4210-i9100: Fix LCD screen's physical size

 arch/arm/boot/dts/samsung/Makefile                 |    3 +
 arch/arm/boot/dts/samsung/exynos4210-i9100.dts     |    4 +-
 arch/arm/boot/dts/samsung/exynos4210-trats.dts     |    8 +-
 .../boot/dts/samsung/exynos4210-universal_c210.dts |    4 +-
 arch/arm/boot/dts/samsung/exynos4212-tab3-3g8.dts  |   29 +
 arch/arm/boot/dts/samsung/exynos4212-tab3-lte8.dts |   44 +
 .../arm/boot/dts/samsung/exynos4212-tab3-wifi8.dts |   26 +
 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi     | 1310 ++++++++++++++++++++
 arch/arm/boot/dts/samsung/exynos4412-midas.dtsi    |   52 +-
 .../boot/dts/samsung/exynos5250-snow-common.dtsi   |    8 +-
 arch/arm/boot/dts/samsung/s3c6410-mini6410.dts     |    2 +-
 arch/arm/boot/dts/samsung/s5pv210-pinctrl.dtsi     |   12 +-
 arch/arm/boot/dts/samsung/s5pv210-smdkv210.dts     |    2 +-
 13 files changed, 1480 insertions(+), 24 deletions(-)
 create mode 100644 arch/arm/boot/dts/samsung/exynos4212-tab3-3g8.dts
 create mode 100644 arch/arm/boot/dts/samsung/exynos4212-tab3-lte8.dts
 create mode 100644 arch/arm/boot/dts/samsung/exynos4212-tab3-wifi8.dts
 create mode 100644 arch/arm/boot/dts/samsung/exynos4212-tab3.dtsi
