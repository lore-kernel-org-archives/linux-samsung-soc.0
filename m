Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3822BC7EE23
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 17 May 2023 13:13:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231520AbjEQNNe (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 17 May 2023 09:13:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232016AbjEQNNa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 17 May 2023 09:13:30 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84BF53A9C
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 May 2023 06:13:06 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-510d0e40c6eso989027a12.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 17 May 2023 06:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684329185; x=1686921185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IkIVFj4R5Q+55a1je0LcDz57182aKaTQ7taUpc1g5Fw=;
        b=wXQFPuEw70b2+bXUVsYgNP0/1Dn8YFk/Q/HjvBi9uDmSKbij6FIQWShVu5d16LMfTR
         ErnCY1WVDNcWEuSWfRfW05nDGd4fVC9sw8Kf3unBB58rKWX23MCevz4V6tirWmIvjwUg
         afpghlDIPJJZhdysxT3UAqXUj/G8Rd53QtIMpFpYDsjfJ7ZttFv2fFNx5QZM3xmddHRN
         M+nS5u62yleBce4GjlQL/ry9wq9vdxEiUd4eMVgeBBOeBM/cmDzX0qiibPgtNolNfnU8
         Ksn3TFnGNVjjnV3Zo48pq1cY4yvWZJqlcP8x5QwAA/T68RvjxYJyNd86gLjWNozW+WhW
         LRog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684329185; x=1686921185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IkIVFj4R5Q+55a1je0LcDz57182aKaTQ7taUpc1g5Fw=;
        b=Yex5R1XDA1TT9pxUyc/ahNfXKZeSs5Hf2FOEbIAAXEm1yjpLY3s6v/9dr22BUAQL2t
         cCZNA0SL2RUdjsDlwqG6HxjjSQZjhsNAWS9hCuHKEmkinoDu9VgpJmQXf0FP9fpsTrBm
         +aQvbGD+yTE79GqT0Oy6tJfkZzIDqXeD1QaSaSzxNvAmQucJcNLbIx/QtsajTS6AXOIK
         1Cex3D+kp6aWDiDhNMPr8vw8Uk2EISB60Ant7CgOwr8xSUhQdMO1SaVxujhXjsaKWt7m
         MprL1Ju7meZsD+Qt/bAtwvQ9l8UTMXo234tEAdzNJ5eM9kdWnrz+s57Me4kEB+4fpTzh
         R7VQ==
X-Gm-Message-State: AC+VfDwOc0/DNhcBF7QJ+IDX3ak5E+5PtmIF9UKNfyvFDDvqQIzKpGlu
        CBw/cxbRcvuUsV42qJOH/KJIEg==
X-Google-Smtp-Source: ACHHUZ4VW+5Xqgt7SOM2d9kyGd2bMdASGdzmtGWMx6Czs6SkbiJzsQKBgir8aNyg+gNbGiHeMQVChw==
X-Received: by 2002:a17:907:9488:b0:96a:a0fd:d43e with SMTP id dm8-20020a170907948800b0096aa0fdd43emr17519873ejc.49.1684329184900;
        Wed, 17 May 2023 06:13:04 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id hs32-20020a1709073ea000b009534211cc97sm12291184ejc.159.2023.05.17.06.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 06:13:04 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com
Subject: [GIT PULL 1/2] arm64: dts: cleanup and fixes for v6.5
Date:   Wed, 17 May 2023 15:12:54 +0200
Message-Id: <20230517131255.471002-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Few usual cleanups from me and few other fixes/cleanups from Michael
and Robert. To clarify - I don't want to step on someone's toes, so
me picking up other patches is rather exception. It's just sad when
someone's work gets lost.

There is ongoing discussion how to improve a bit Microchip ARM64 SparX-5 patch
handling process, so the contributions won't get lost.

Best regards,
Krzysztof


The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-dt.git tags/dt64-cleanup-6.5

for you to fetch changes up to d5e64404e77c19ec5bd687b34a11eec0263f1aa8:

  arm64: dts: sparx5: rename pinctrl nodes (2023-05-17 14:16:13 +0200)

----------------------------------------------------------------
Minor improvements in ARM64 DTS for v6.5

Mostly minor improvements to fix dtbs_check warnings:
1. mba6ulx: use non-deprecated property for GPIO keys wake-up,
2. Add missing cache properties (APM, Amazon, HiSilicon, Realtek,
   Synaptics, AllWinner, Microchip).

Few older minor and major fixes which were waiting on mailing lists for
longer time for Microchip SparX-5:
1. Fix secondary CPU bring-up and crash when talking to PSCI on reference
   boards (Robert Marko),
2. Simplify CPU address-cells (Robert Marko),
3. Align pinctrl node names with bindings (Michael Walle).

----------------------------------------------------------------
Krzysztof Kozlowski (8):
      arm64: dts: mba6ulx: correct GPIO keys wakeup
      arm64: dts: apm: add missing cache properties
      arm64: dts: amazon: add missing cache properties
      arm64: dts: hisilicon: add missing cache properties
      arm64: dts: realtek: add missing cache properties
      arm64: dts: synaptics: add missing cache properties
      arm64: dts: allwinner: a64: add missing cache properties
      arm64: dts: microchip: add missing cache properties

Michael Walle (1):
      arm64: dts: sparx5: rename pinctrl nodes

Robert Marko (2):
      arm64: dts: microchip: sparx5: do not use PSCI on reference boards
      arm64: dts: microchip: sparx5: correct CPU address-cells

 arch/arm/boot/dts/mba6ulx.dtsi                     |  2 +-
 arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi      |  1 +
 arch/arm64/boot/dts/amazon/alpine-v3.dtsi          |  4 ++++
 arch/arm64/boot/dts/apm/apm-shadowcat.dtsi         |  8 +++++++
 arch/arm64/boot/dts/apm/apm-storm.dtsi             |  8 +++++++
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi          |  2 ++
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi          |  2 ++
 arch/arm64/boot/dts/hisilicon/hip05.dtsi           |  4 ++++
 arch/arm64/boot/dts/hisilicon/hip06.dtsi           |  4 ++++
 arch/arm64/boot/dts/hisilicon/hip07.dtsi           | 16 +++++++++++++
 arch/arm64/boot/dts/microchip/sparx5.dtsi          | 10 +++++----
 .../boot/dts/microchip/sparx5_pcb134_board.dtsi    | 26 +++++++++++-----------
 .../boot/dts/microchip/sparx5_pcb135_board.dtsi    | 10 ++++-----
 .../boot/dts/microchip/sparx5_pcb_common.dtsi      | 12 ++++++++++
 arch/arm64/boot/dts/realtek/rtd1293.dtsi           |  2 ++
 arch/arm64/boot/dts/realtek/rtd1295.dtsi           |  2 ++
 arch/arm64/boot/dts/realtek/rtd1296.dtsi           |  2 ++
 arch/arm64/boot/dts/realtek/rtd1395.dtsi           |  2 ++
 arch/arm64/boot/dts/realtek/rtd16xx.dtsi           |  4 ++++
 arch/arm64/boot/dts/synaptics/berlin4ct.dtsi       |  2 ++
 20 files changed, 100 insertions(+), 23 deletions(-)
