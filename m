Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB69DC761AF
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  5 Apr 2023 08:05:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237244AbjDEIFD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 5 Apr 2023 04:05:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237321AbjDEIEr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Apr 2023 04:04:47 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FEAC4ED7
        for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Apr 2023 01:04:42 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id y4so139046482edo.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Apr 2023 01:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680681881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZsIZIEr0aAVyFyPyxeatxNJYaoKvpa6MbUjKIWxAf28=;
        b=ANgXPdpRApV231c056euDA+gL6loatGvlGjqnGjJYgmAQ+QPsArouFKfFX4FfyUoxw
         pdxa95dr7h0tQyjXz+1NS0FHmfxuxTX2iaJvfKYfpPmSuZyyZHpsK1Fv/YphfoU56KtM
         Y4GIMwvx9pBx6pvxDqVy7LatPgqfY3ikZxza33IxGJ7lG4GlY2XPsv0K0upLORNGoZQV
         GEW1VNMMdryLNzNniqS1BAybYDyTV20/ODBW1p9DuF3YNTnU1riFMe/8qFCDiR/RnPqg
         FSEjv4S+1za/MxsF5PT+gDDqNtNL/bhDwW2ZEQp96tq6jB4/qixqCpYKxRO5GGpOOfFf
         YQhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680681881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZsIZIEr0aAVyFyPyxeatxNJYaoKvpa6MbUjKIWxAf28=;
        b=obZNCqFmVEDYzinGhOipz6IuzlLZIIFu+5o+3Jj4zrxFk18bxZYf2vsyO5w8MsXJLo
         1eJRG6/wkuZSoerNMb6Gm6yktzAlbmbMXZ7oLlg98g2/k3WBTeHr69wnNMi4RUEnCBWO
         iPignoS5WqHcsCRFL4Fov3UbF8fi8EaxP+Ma6B6ekSMIItR014uU15swLfd6uqoPMbTG
         F29Saiu5sTMgJ2He1XI4+upLm0HLfabC813xN8MucdpxEGAn1t7Kkw6QXzG05sbaDbRA
         px1vHtwcKi9micXm94nZnCQqrVWx0JwHX0qP5A/PNu9b2nLH/cwn3T+kMz/23fIEgL4K
         hdlg==
X-Gm-Message-State: AAQBX9dV1J56Bf/KY80quYcwpRBJOSLe/6gvA8V0pro3AYV6vWILEcOc
        ahHe+pFfPbMtv7kpJCS76Z9pj4cMdP2wX0slKek=
X-Google-Smtp-Source: AKy350anXDNR/biQqZ6JMgQ0aXo/aHS9FfOnnekJMprh7HcLgu+oA0FLUW0pw6l+yYPi78mhpNalBw==
X-Received: by 2002:a17:906:144d:b0:93f:2256:fc05 with SMTP id q13-20020a170906144d00b0093f2256fc05mr2128420ejc.55.1680681881479;
        Wed, 05 Apr 2023 01:04:41 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:3f:6b2:54cd:498e])
        by smtp.gmail.com with ESMTPSA id z21-20020a056402275500b00501d73cfc86sm6845839edd.9.2023.04.05.01.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 01:04:41 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/4] ARM: dts: samsung: dts for v6.4
Date:   Wed,  5 Apr 2023 10:04:37 +0200
Message-Id: <20230405080438.156805-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230405080438.156805-1-krzysztof.kozlowski@linaro.org>
References: <20230405080438.156805-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-6.4

for you to fetch changes up to e154a338e16cc3b3bbd54c891253319d22383746:

  dt-bindings: soc: samsung: exynos-pmu: allow phys as child on Exynos3 and Exynos4 (2023-04-05 09:52:11 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v6.4

1. Several cleanups and improvements as a result of dtbs_checks: align
   node names with bindings, drop incorrect properties, fix clock-names,
   add missing "ports" node.
2. Move DP and MIPI phys to PMU node (DTS with binding change).
3. Drop old MSHC aliases (while adding proper mmc-ddr-1_8v which was
   selected by the driver based on the MSHC alias) and add generic MMC
   aliases in each board.  The aliases match known numbering in
   the schematics.

----------------------------------------------------------------
Henrik Grimler (2):
      ARM: dts: exynos: replace mshc0 alias with mmc-ddr-1_8v property
      ARM: dts: exynos: add mmc aliases

Krzysztof Kozlowski (13):
      ARM: dts: exynos: align STMPE ADC node name with bindings in P4 Note
      ARM: dts: exynos: drop fake align STMPE properties in P4 Note
      ARM: dts: exynos: add ports to TC358764 bridge on Arndale
      ARM: dts: exynos: fix WM8960 clock name in Itop Elite
      ARM: dts: exynos: correct whitespace in Midas
      ARM: dts: s5pv210: correct MIPI CSIS clock name
      ARM: dts: exynos: drop unused samsung,camclk-out property in Midas
      ARM: dts: exynos: move MIPI phy to PMU node in Exynos3250
      ARM: dts: exynos: move MIPI phy to PMU node in Exynos4
      ARM: dts: exynos: move DP and MIPI phys to PMU node in Exynos5420
      ARM: dts: exynos: move DP and MIPI phys to PMU node in Exynos5250
      ARM: dts: exynos: fix MCT compatible in Universal C210
      dt-bindings: soc: samsung: exynos-pmu: allow phys as child on Exynos3 and Exynos4

 .../bindings/soc/samsung/exynos-pmu.yaml           | 23 ++++++++++++++++--
 arch/arm/boot/dts/exynos3250-artik5-eval.dts       |  4 ++++
 arch/arm/boot/dts/exynos3250-artik5.dtsi           |  6 +++++
 arch/arm/boot/dts/exynos3250-monk.dts              |  2 ++
 arch/arm/boot/dts/exynos3250-rinato.dts            |  3 +++
 arch/arm/boot/dts/exynos3250.dtsi                  | 14 ++++-------
 arch/arm/boot/dts/exynos4.dtsi                     | 13 +++++-----
 arch/arm/boot/dts/exynos4210-i9100.dts             |  6 +++++
 arch/arm/boot/dts/exynos4210-origen.dts            |  5 ++++
 arch/arm/boot/dts/exynos4210-smdkv310.dts          |  4 ++++
 arch/arm/boot/dts/exynos4210-trats.dts             |  6 +++++
 arch/arm/boot/dts/exynos4210-universal_c210.dts    |  8 ++++++-
 arch/arm/boot/dts/exynos4412-itop-elite.dts        |  6 ++++-
 arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi    |  5 ++++
 arch/arm/boot/dts/exynos4412-midas.dtsi            |  8 ++++---
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi    |  6 +++++
 arch/arm/boot/dts/exynos4412-origen.dts            |  6 +++++
 arch/arm/boot/dts/exynos4412-p4note.dtsi           | 11 ++++++---
 arch/arm/boot/dts/exynos4412-smdk4412.dts          |  4 ++++
 arch/arm/boot/dts/exynos4412-tiny4412.dts          |  4 ++++
 arch/arm/boot/dts/exynos4412.dtsi                  |  3 +--
 arch/arm/boot/dts/exynos5250-arndale.dts           | 21 +++++++++++-----
 arch/arm/boot/dts/exynos5250-smdk5250.dts          |  3 +++
 arch/arm/boot/dts/exynos5250-snow-common.dtsi      |  4 ++++
 arch/arm/boot/dts/exynos5250-spring.dts            |  6 +++++
 arch/arm/boot/dts/exynos5250.dtsi                  | 28 +++++++++-------------
 arch/arm/boot/dts/exynos5260-xyref5260.dts         |  6 +++++
 arch/arm/boot/dts/exynos5410-odroidxu.dts          |  3 +++
 arch/arm/boot/dts/exynos5410-smdk5410.dts          |  6 +++++
 arch/arm/boot/dts/exynos5420-arndale-octa.dts      |  6 +++++
 .../arm/boot/dts/exynos5420-galaxy-tab-common.dtsi |  6 +++++
 arch/arm/boot/dts/exynos5420-peach-pit.dts         |  4 ++++
 arch/arm/boot/dts/exynos5420-smdk5420.dts          |  6 +++++
 arch/arm/boot/dts/exynos5420.dtsi                  | 27 +++++++++------------
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi      |  4 ++++
 arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi |  5 ++++
 arch/arm/boot/dts/exynos5422-samsung-k3g.dts       |  5 ++++
 arch/arm/boot/dts/exynos5800-peach-pi.dts          |  4 ++++
 arch/arm/boot/dts/s5pv210.dtsi                     |  2 +-
 39 files changed, 225 insertions(+), 68 deletions(-)
