Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A9FC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 11 Jan 2022 20:15:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242397AbiAKUPS (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 11 Jan 2022 15:15:18 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:37690
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S242379AbiAKUPS (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 11 Jan 2022 15:15:18 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9A9033F17B
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2022 20:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641932116;
        bh=lPhJuPIv3O/CdoWKkJQZ8TgTKphU5KVeriAN8qLF+3w=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=KUBP2Ir70IWvqjEXw0EGDTz9JhaWbWSu8CdRwBru0AzZ3qdi9gNvcA1ikSXEnrbuK
         VMHAnnXpO5hdLreCfsgPrIJMeK3vOKQv3ds3Xru0bhlHxsZjmBV0g6uo7EtiKTIQY3
         FD7uz4+P4EHjTOVOOxbqLjD7RIsSSxvz+Uo+VqfkzOdpREBCiGLYeITiIvkfGfTF2s
         SBAEPqhpV8bwsniKmJ+t2clIPY2vu6YVpgbIBrDzMupYIuWjH8T8hBe3+q0L6JeFOo
         OAz4WkcbtnLMBr5QVCIzIiWbzaDHinf9vTLJgTDH+s39FbA9mwrrlO7/3j4UrcLyJu
         N/Gtn8TwKYeFQ==
Received: by mail-ed1-f69.google.com with SMTP id m16-20020a056402431000b003fb60bbe0e2so209137edc.3
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Jan 2022 12:15:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=lPhJuPIv3O/CdoWKkJQZ8TgTKphU5KVeriAN8qLF+3w=;
        b=hq5exMjw9vNqloDb5vNiFmYjOSKgo5usI1d5IOzQ6x2+WWlG9pWktc8PEIO0fxC5HX
         3v24xqWoQ7914GYCYaWkc6HCWlNWHXihE2H8u6T6ytvLdRD0+IRRY6FlfvBj2RtB7zIy
         Fs5h6U7fhBUf4sztTsdM8ldWF59sAZFkKMQs+g9vfg7psVol+9RREWjjPAE5y5NhIt3J
         d4a2FoK1p2jSwG0mTxoSQNIe6Aipz5EZpVesPdDkDKN5PjiA0e1rrnqsUWaL7p3kvaZP
         oyMGvqKJLn+7puFGQ8mOxV4Is/6B1OUfI9m7EulrC2KhNXl7fG+/91yvLugaSF0MAj8q
         qDCw==
X-Gm-Message-State: AOAM531ymQcFXfuJY433jbIM+kw0sA9yRfV4ywg2BW7SoMPjP1XmyMf8
        4BpIKFu2uU0hV6zVg4fv8WwoZAFaGvhRR53lx6fQQVBGqboiVv8BGBMAyWGoLUPEZgVrU+Tf+kh
        CPDrdCEeVlPxW7Z7i2e2Tlu+/+jgFznH132GmQOTXeNOy8Sc2
X-Received: by 2002:a17:906:1405:: with SMTP id p5mr4956195ejc.113.1641932116241;
        Tue, 11 Jan 2022 12:15:16 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwaxUmxBzgzWGTbTGdz1mYjm0oVEAku2/BN2r0BtcEZ2s0exOxr22WH6LCKYnzoXk7FithEBQ==
X-Received: by 2002:a17:906:1405:: with SMTP id p5mr4956173ejc.113.1641932116052;
        Tue, 11 Jan 2022 12:15:16 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id f23sm3852212ejj.128.2022.01.11.12.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 12:15:15 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Tomasz Figa <tomasz.figa@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Alim Akhtar <alim.akhtar@gmail.com>
Subject: [PATCH v2 00/28] pinctrl: dt-bindings: samsung: convert to dtschema
Date:   Tue, 11 Jan 2022 21:13:58 +0100
Message-Id: <20220111201426.326777-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Changes since v1
================
1. Patch #1: add missing pin assignment (Alim).
2. Patch #2: correct double sizeof() (Alim).
3. Patch #7, #8: put label-override in proper patch (Alim).
4. Patch #24: Extend doc, change the 'if' clause for wake-up interrupts.
5. New patches: #25 - #28.
   Exynos850 and ExynosAutov9 seems to be different in pin ctrl interrupt
   handling, so they need their own compatibles.
   Please kindly review and provide feedback on these as I do not have
   details.
6. Add review tags.

Dependencies
============
1. Patch #2 ("pinctrl: samsung: accept GPIO bank nodes with a suffix") is
   necessary for DTS patches.

2. Last patches #27 and #28 depend on patch #26 adding the compatibles.

Best regards,
Krzysztof

Krzysztof Kozlowski (28):
  pinctrl: samsung: drop pin banks references on error paths
  pinctrl: samsung: accept GPIO bank nodes with a suffix
  ARM: dts: exynos: drop unused pinctrl defines in Exynos3250
  ARM: dts: exynos: simplify PMIC DVS pin configuration in Odroid XU
  ARM: dts: exynos: override pins by label in Peach Pit
  ARM: dts: exynos: simplify PMIC DVS pin configuration in Peach Pit
  ARM: dts: exynos: override pins by label in Peach Pi
  ARM: dts: exynos: simplify PMIC DVS pin configuration in Peach Pi
  ARM: dts: s3c64xx: drop unneeded pinctrl wake-up interrupt mapping
  ARM: dts: exynos: align pinctrl with dtschema in Exynos3250
  ARM: dts: exynos: align pinctrl with dtschema in Exynos4210
  ARM: dts: exynos: align pinctrl with dtschema in Exynos4412
  ARM: dts: exynos: align pinctrl with dtschema in Exynos5250
  ARM: dts: exynos: align pinctrl with dtschema in Exynos5260
  ARM: dts: exynos: align pinctrl with dtschema in Exynos5410
  ARM: dts: exynos: align pinctrl with dtschema in Exynos542x/5800
  arm64: dts: exynos: align pinctrl with dtschema in Exynos5433
  arm64: dts: exynos: align pinctrl with dtschema in Exynos7
  arm64: dts: exynos: align pinctrl with dtschema in Exynos850
  arm64: dts: exynos: align pinctrl with dtschema in ExynosAutov9
  ARM: dts: s3c24xx: align pinctrl with dtschema
  ARM: dts: s3c64xx: align pinctrl with dtschema
  ARM: dts: s5pv210: align pinctrl with dtschema
  dt-bindings: pinctrl: samsung: convert to dtschema
  dt-bindings: pinctrl: samsung: describe Exynos850 and ExynosAutov9
    wake-ups
  pinctrl: samsung: add support for Exynos850 and ExynosAutov9 wake-ups
  arm64: dts: exynos: use dedicated wake-up pinctrl compatible in
    Exynos850
  arm64: dts: exynos: use dedicated wake-up pinctrl compatible in
    ExynosAutov9

 .../pinctrl/samsung,pinctrl-gpio-bank.yaml    |  52 +++
 .../pinctrl/samsung,pinctrl-pins-cfg.yaml     |  81 ++++
 .../samsung,pinctrl-wakeup-interrupt.yaml     | 106 +++++
 .../bindings/pinctrl/samsung,pinctrl.yaml     | 392 ++++++++++++++++++
 .../bindings/pinctrl/samsung-pinctrl.txt      | 383 -----------------
 MAINTAINERS                                   |   2 +-
 arch/arm/boot/dts/exynos3250-artik5.dtsi      |  10 +-
 arch/arm/boot/dts/exynos3250-pinctrl.dtsi     | 165 ++++----
 arch/arm/boot/dts/exynos4210-i9100.dts        |  30 +-
 arch/arm/boot/dts/exynos4210-origen.dts       |   2 +-
 arch/arm/boot/dts/exynos4210-pinctrl.dtsi     | 226 +++++-----
 arch/arm/boot/dts/exynos4210-smdkv310.dts     |   4 +-
 arch/arm/boot/dts/exynos4210-trats.dts        |   6 +-
 .../boot/dts/exynos4210-universal_c210.dts    |  12 +-
 arch/arm/boot/dts/exynos4412-galaxy-s3.dtsi   |   4 +-
 arch/arm/boot/dts/exynos4412-itop-elite.dts   |   2 +-
 .../boot/dts/exynos4412-itop-scp-core.dtsi    |   2 +-
 arch/arm/boot/dts/exynos4412-midas.dtsi       |  30 +-
 .../boot/dts/exynos4412-odroid-common.dtsi    |   8 +-
 arch/arm/boot/dts/exynos4412-odroidx.dts      |   2 +-
 arch/arm/boot/dts/exynos4412-origen.dts       |   4 +-
 arch/arm/boot/dts/exynos4412-p4note.dtsi      |  44 +-
 arch/arm/boot/dts/exynos4412-pinctrl.dtsi     | 252 +++++------
 arch/arm/boot/dts/exynos4412-smdk4412.dts     |   4 +-
 arch/arm/boot/dts/exynos5250-arndale.dts      |   2 +-
 arch/arm/boot/dts/exynos5250-pinctrl.dtsi     | 220 +++++-----
 arch/arm/boot/dts/exynos5250-smdk5250.dts     |   2 +-
 arch/arm/boot/dts/exynos5250-snow-common.dtsi |  22 +-
 arch/arm/boot/dts/exynos5250-snow-rev5.dts    |   2 +-
 arch/arm/boot/dts/exynos5250-snow.dts         |   2 +-
 arch/arm/boot/dts/exynos5250-spring.dts       |  20 +-
 arch/arm/boot/dts/exynos5260-pinctrl.dtsi     | 148 +++----
 arch/arm/boot/dts/exynos5260-xyref5260.dts    |   2 +-
 arch/arm/boot/dts/exynos5410-odroidxu.dts     |  22 +-
 arch/arm/boot/dts/exynos5410-pinctrl.dtsi     | 170 ++++----
 arch/arm/boot/dts/exynos5410-smdk5410.dts     |   4 +-
 arch/arm/boot/dts/exynos5420-arndale-octa.dts |   2 +-
 arch/arm/boot/dts/exynos5420-peach-pit.dts    |  89 ++--
 arch/arm/boot/dts/exynos5420-pinctrl.dtsi     | 194 ++++-----
 arch/arm/boot/dts/exynos5420-smdk5420.dts     |   6 +-
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi |   2 +-
 .../boot/dts/exynos5422-odroidxu3-common.dtsi |   6 +-
 arch/arm/boot/dts/exynos5800-peach-pi.dts     |  89 ++--
 arch/arm/boot/dts/s3c2416-pinctrl.dtsi        |  60 +--
 arch/arm/boot/dts/s3c6410-mini6410.dts        |   4 +-
 arch/arm/boot/dts/s3c64xx-pinctrl.dtsi        | 210 +++++-----
 arch/arm/boot/dts/s3c64xx.dtsi                |  16 +-
 arch/arm/boot/dts/s5pv210-aquila.dts          |   2 +-
 arch/arm/boot/dts/s5pv210-aries.dtsi          |  40 +-
 arch/arm/boot/dts/s5pv210-fascinate4g.dts     |  12 +-
 arch/arm/boot/dts/s5pv210-galaxys.dts         |  16 +-
 arch/arm/boot/dts/s5pv210-pinctrl.dtsi        | 226 +++++-----
 .../boot/dts/exynos/exynos5433-pinctrl.dtsi   | 211 +++++-----
 .../dts/exynos/exynos5433-tm2-common.dtsi     | 259 ++++++------
 .../boot/dts/exynos/exynos7-espresso.dts      |   6 +-
 .../boot/dts/exynos/exynos7-pinctrl.dtsi      | 176 ++++----
 .../boot/dts/exynos/exynos850-pinctrl.dtsi    |  52 +--
 arch/arm64/boot/dts/exynos/exynos850.dtsi     |   4 +-
 .../boot/dts/exynos/exynosautov9-pinctrl.dtsi |  50 +--
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi  |   2 +-
 drivers/pinctrl/samsung/pinctrl-exynos.c      |   4 +
 drivers/pinctrl/samsung/pinctrl-samsung.c     |  87 +++-
 62 files changed, 2261 insertions(+), 2003 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-gpio-bank.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-pins-cfg.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl-wakeup-interrupt.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
 delete mode 100644 Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt

-- 
2.32.0

