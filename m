Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A530C61DA4
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 11 Feb 2023 11:31:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbjBKLbN (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 11 Feb 2023 06:31:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbjBKLbM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 11 Feb 2023 06:31:12 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6BD5303EC
        for <linux-samsung-soc@vger.kernel.org>; Sat, 11 Feb 2023 03:31:09 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id m16-20020a05600c3b1000b003dc4050c94aso5822975wms.4
        for <linux-samsung-soc@vger.kernel.org>; Sat, 11 Feb 2023 03:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uSR8IXziBIMVhSmEufg1SN4JgfbW84fvRPnBN9WPavc=;
        b=llZ1PmrXT6iaZ/VVXG773oV6lIt2qBbjISC1I5Hqo4JFLve1LrZd5wmE9fF9k2U8Ia
         ChNmhncH9r6Sj76ZORUKPHTgWg8cc2EbFPUXXLfIGzH9LPp7hG7cyXIFj+Sq5O6pCte+
         9qRFvftZQTJP6o3LU/NV93/SzEFMuFBs5h1cxuv3j8oL2IfLPEtjpEm8APB1JCYeqKdD
         cD7jhTLBIAA5gASzXSm4uyl7kaegJaTvXACCS7J/0so1T63Gnap5P7nx3+nK3PRL0FNM
         +md7PWH5FIhsKrTFdLENc+NzzvmqKOXhr5IvbuGP43VMnbx3dwJev7AORn1Vmsy68BCR
         Jr1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uSR8IXziBIMVhSmEufg1SN4JgfbW84fvRPnBN9WPavc=;
        b=qypEvNWNezHqktZYXYI/0d6GLch2TpuBUgXULJ+38SU6Dg/qy9xvN5xqtvx3NeIBKx
         L6eI84pA3WSNfJVGPf1P7sFGYDSBVlxX6fhkC8522klPNP2r3nl0IFxHr5cmM7kmHL8+
         gN5Aj8uG5UPDfNqiCOV01uLRdiChK/6LOcBQsxhCr9oNxfnKzCAk2l6NHD8edmBRO/1G
         asP5Rr+aivBM645OKeJjQRHzJmAv06c2AFDyMGD1ke75m1RTG/LF152vysPZWh6VfzYG
         1XAq4/assafxoE4kP9S52vchNRN9ijIZQ0HSWv9yiX2DIVRp0F7Py9s/5MQ2j78WNCWz
         znng==
X-Gm-Message-State: AO0yUKUCbBHfvYIhYKbYIUj6eqmQUt+EK6v3J1N4kaID8HksKiRnTrPL
        iM/uloMKsSKYZ4YMukRHt4sBEA==
X-Google-Smtp-Source: AK7set/rJMtqF6GRUHR9/M1BvLLThNbbHt3y3RnWKuDtmYwLPRB6rtW0jKn4dtbyQJWbDbQnqPvl3Q==
X-Received: by 2002:a05:600c:2b46:b0:3df:12ac:7cc9 with SMTP id e6-20020a05600c2b4600b003df12ac7cc9mr15122532wmf.15.1676115068397;
        Sat, 11 Feb 2023 03:31:08 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id l40-20020a05600c1d2800b003dd1b00bd9asm9033559wms.32.2023.02.11.03.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Feb 2023 03:31:08 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] ARM: dts: samsung: Late DTS for v6.3
Date:   Sat, 11 Feb 2023 12:31:03 +0100
Message-Id: <20230211113103.58894-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Late pull with DTS cleanups and minor fixes for Exynos ARM boards.  I know it
is late in the cycle but:
1. I am really pushing recently towards full DTS compliance with `dtbs_check`
   and I am almost there,
2. All these should be low-risk cleanups or fixes, so I don't expect anything
   broken (previous round of my cleanups affected devfreq/exynos-bus on
   Exynos4412, but this is some weird driver problem which I am still
   investigating).

Best regards,
Krzysztof


The following changes since commit 27be20e3b9d125f2c1b066d1d238c67bf5b89dc3:

  ARM: dts: exynos: add unit address to DWC3 node wrapper in Exynos54xx (2023-01-29 11:34:12 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-6.3-2

for you to fetch changes up to 301d3dd05525e3a046f6cfa6ee4dea6a3b7111ee:

  ARM: dts: exynos: correct max98090 DAI argument in Snow (2023-02-09 12:58:30 +0100)

----------------------------------------------------------------
Samsung DTS ARM changes for v6.3, part two

Several cleanups pointed out by `make dtbs_check`:
1. Align LED status node name with bindings.
2. Drop redundant properties.
3. Move i2c-gpio node out of soc to top-level, as soc node is expected
   to have only MMIO nodes.
4. Correct SPI NOR flash compatible in SMDK5250 and SMDKv310.
5. Align GPIO property names in WM1811-family codec nodes with bindings.
6. Correct MAX98090 codec DAI cells in Snow.

----------------------------------------------------------------
Krzysztof Kozlowski (10):
      ARM: dts: exynos: align status led name with bindings on Origen4210
      ARM: dts: exynos: drop default status from I2C10 on Arndale
      ARM: dts: exynos: drop redundant address/size cells from I2C10 on Arndale
      ARM: dts: exynos: move I2C10 out of soc node on Arndale
      ARM: dts: exynos: correct SPI nor compatible in SMDKv310
      ARM: dts: exynos: correct SPI nor compatible in SMDK5250
      ARM: dts: exynos: add "gpios" suffix to wlf,ldo1ena on Midas
      ARM: dts: exynos: add "gpios" suffix to wlf,ldo1ena on Arndale
      ARM: dts: s5pv210: add "gpios" suffix to wlf,ldo1ena on Aries
      ARM: dts: exynos: correct max98090 DAI argument in Snow

 arch/arm/boot/dts/exynos4210-origen.dts    |  2 +-
 arch/arm/boot/dts/exynos4210-smdkv310.dts  |  2 +-
 arch/arm/boot/dts/exynos4412-midas.dtsi    |  4 ++--
 arch/arm/boot/dts/exynos5250-arndale.dts   | 35 +++++++++++++-----------------
 arch/arm/boot/dts/exynos5250-smdk5250.dts  |  2 +-
 arch/arm/boot/dts/exynos5250-snow-rev5.dts |  4 ++--
 arch/arm/boot/dts/s5pv210-aries.dtsi       |  4 ++--
 7 files changed, 24 insertions(+), 29 deletions(-)
