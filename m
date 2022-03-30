Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE140C43219
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 30 Mar 2022 07:40:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243903AbiC3HmW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 30 Mar 2022 03:42:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243918AbiC3HmU (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 30 Mar 2022 03:42:20 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D20952B20
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Mar 2022 00:40:28 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id dr20so39691284ejc.6
        for <linux-samsung-soc@vger.kernel.org>; Wed, 30 Mar 2022 00:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+fs03Qe5m2CAu5KA7NU3Z7yweF+5+DwbdVq/GJFIlNE=;
        b=ex8tbjLk+0Wdtww3/CDPCbeeyLzltz0XLQc/kTGGTDckS/aAdfHU1y7YDh2lCuBufg
         Ek3B1nIyDJdNsPVUy2NwJrgskAa32uAMMhpUF+ioSNpcoeiIAHavfW2099ojPSgGgGE7
         3wwUH7K1JfxGG5Oh2XaYKHO6HRUlrl/X+HalWZxsta48unjq55f29E/F+qMNNuJ7eoYl
         2Oh4jvG+kTw2UxKDpcbRT31SQQrknt0Vr6BpK8XQ5ksZ20VzYu2SILthbcfonJ5y9j7y
         zdneLGKv9fMRV6s8puMlExF9mMzmdNqwdQKM0fJr9OyZjPVuBcrKUEmVwqQ3UzS2KKhQ
         gqpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+fs03Qe5m2CAu5KA7NU3Z7yweF+5+DwbdVq/GJFIlNE=;
        b=hcvQA+9hB3iSkgcrxbCvK8dkMs9DohVGXuf3XWwBSe6NkeBWKiQeykxCQU+2y3ZEwg
         DDTyXRwnzrsACZUZ2Kerzt3/H9SpGtDhU3xUkwBOuoP2J3uhBkOAGS1012Ud9+TYMYik
         GRZjnvZJiU39MQ/xaCaeJ9avLM3ipPkM6Z/Yhj0bKVeLsRztQitR3fiGiGBcXsC93gm9
         bpToSKabOks0xNyFAgWDIK8rhdagWfsnQndxIdgJ1pi8uJVSk55IJNYfJDKF8IIxS6YY
         gSaZzUKDXfTqwzUeYSRGsEuYpTZxgV4J4u0qP5SxebKWEgGIKe14CXQaDVZp2AX4GDVb
         qV+Q==
X-Gm-Message-State: AOAM532jdr6X7BIDf1VyJqUqph8BIw5sMqS/paf/svtECmv76Ai/enAy
        liBDVwtZzouxZ/FIOciEWPoIX/xohP+gyG75
X-Google-Smtp-Source: ABdhPJyiytUzrzTtKzum6T4/uPQMwS6KDq/FK9+HsYlM+syWEDDFNiRdcVYelGPuda/Y0L8MSc4LVQ==
X-Received: by 2002:a17:907:971c:b0:6e0:dd95:9fc6 with SMTP id jg28-20020a170907971c00b006e0dd959fc6mr2088118ejc.256.1648626026637;
        Wed, 30 Mar 2022 00:40:26 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.gmail.com with ESMTPSA id s20-20020a056402015400b00418f9574a36sm9536640edu.73.2022.03.30.00.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 00:40:26 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-nfc@lists.01.org,
        netdev@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 0/2] MAINTAINERS/dt-bindings: changes to my emails
Date:   Wed, 30 Mar 2022 09:40:14 +0200
Message-Id: <20220330074016.12896-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

From: Krzysztof Kozlowski <krzk@kernel.org>

Hi,

I can take both patches via my Samsung SoC tree, if that's ok.

Best regards,
Krzysztof

Krzysztof Kozlowski (2):
  dt-bindings: update Krzysztof Kozlowski's email
  MAINTAINERS: update Krzysztof Kozlowski's email to Linaro

 .../clock/samsung,exynos-audss-clock.yaml     |  2 +-
 .../bindings/clock/samsung,exynos-clock.yaml  |  2 +-
 .../clock/samsung,exynos-ext-clock.yaml       |  2 +-
 .../clock/samsung,exynos4412-isp-clock.yaml   |  2 +-
 .../clock/samsung,exynos5260-clock.yaml       |  2 +-
 .../clock/samsung,exynos5410-clock.yaml       |  2 +-
 .../clock/samsung,exynos5433-clock.yaml       |  2 +-
 .../bindings/clock/samsung,exynos7-clock.yaml |  2 +-
 .../clock/samsung,exynos7885-clock.yaml       |  2 +-
 .../clock/samsung,exynos850-clock.yaml        |  2 +-
 .../bindings/clock/samsung,s2mps11.yaml       |  2 +-
 .../clock/samsung,s5pv210-audss-clock.yaml    |  2 +-
 .../bindings/clock/samsung,s5pv210-clock.yaml |  2 +-
 .../devfreq/event/samsung,exynos-nocp.yaml    |  2 +-
 .../devfreq/event/samsung,exynos-ppmu.yaml    |  2 +-
 .../samsung/samsung,exynos-hdmi-ddc.yaml      |  2 +-
 .../display/samsung/samsung,exynos-hdmi.yaml  |  2 +-
 .../display/samsung/samsung,exynos-mixer.yaml |  2 +-
 .../samsung/samsung,exynos5433-decon.yaml     |  2 +-
 .../samsung/samsung,exynos5433-mic.yaml       |  2 +-
 .../samsung/samsung,exynos7-decon.yaml        |  2 +-
 .../display/samsung/samsung,fimd.yaml         |  2 +-
 .../bindings/extcon/maxim,max77843.yaml       |  2 +-
 .../bindings/hwmon/lltc,ltc4151.yaml          |  2 +-
 .../bindings/hwmon/microchip,mcp3021.yaml     |  2 +-
 .../bindings/hwmon/sensirion,sht15.yaml       |  2 +-
 .../devicetree/bindings/hwmon/ti,tmp102.yaml  |  2 +-
 .../devicetree/bindings/hwmon/ti,tmp108.yaml  |  2 +-
 .../devicetree/bindings/i2c/i2c-exynos5.yaml  |  2 +-
 .../bindings/i2c/samsung,s3c2410-i2c.yaml     |  2 +-
 .../samsung,exynos4210-combiner.yaml          |  2 +-
 .../bindings/leds/maxim,max77693.yaml         |  2 +-
 .../memory-controllers/brcm,dpfe-cpu.yaml     |  2 +-
 .../ddr/jedec,lpddr2-timings.yaml             |  2 +-
 .../memory-controllers/ddr/jedec,lpddr2.yaml  |  2 +-
 .../ddr/jedec,lpddr3-timings.yaml             |  2 +-
 .../memory-controllers/ddr/jedec,lpddr3.yaml  |  2 +-
 .../marvell,mvebu-sdram-controller.yaml       |  2 +-
 .../qca,ath79-ddr-controller.yaml             |  2 +-
 .../memory-controllers/renesas,h8300-bsc.yaml |  2 +-
 .../samsung,exynos5422-dmc.yaml               |  2 +-
 .../memory-controllers/synopsys,ddrc-ecc.yaml |  2 +-
 .../memory-controllers/ti,da8xx-ddrctl.yaml   |  2 +-
 .../bindings/mfd/maxim,max14577.yaml          |  2 +-
 .../bindings/mfd/maxim,max77686.yaml          |  2 +-
 .../bindings/mfd/maxim,max77693.yaml          |  2 +-
 .../bindings/mfd/maxim,max77802.yaml          |  2 +-
 .../bindings/mfd/maxim,max77843.yaml          |  2 +-
 .../mfd/samsung,exynos5433-lpass.yaml         |  2 +-
 .../bindings/mfd/samsung,s2mpa01.yaml         |  2 +-
 .../bindings/mfd/samsung,s2mps11.yaml         |  2 +-
 .../bindings/mfd/samsung,s5m8767.yaml         |  2 +-
 .../bindings/net/nfc/marvell,nci.yaml         |  2 +-
 .../devicetree/bindings/net/nfc/nxp,nci.yaml  |  2 +-
 .../bindings/net/nfc/nxp,pn532.yaml           |  2 +-
 .../bindings/net/nfc/nxp,pn544.yaml           |  2 +-
 .../bindings/net/nfc/st,st-nci.yaml           |  2 +-
 .../bindings/net/nfc/st,st21nfca.yaml         |  2 +-
 .../bindings/net/nfc/st,st95hf.yaml           |  2 +-
 .../bindings/net/nfc/ti,trf7970a.yaml         |  2 +-
 .../bindings/phy/samsung,dp-video-phy.yaml    |  2 +-
 .../bindings/phy/samsung,exynos-hdmi-phy.yaml |  2 +-
 .../phy/samsung,exynos5250-sata-phy.yaml      |  2 +-
 .../bindings/phy/samsung,mipi-video-phy.yaml  |  2 +-
 .../bindings/phy/samsung,usb2-phy.yaml        |  2 +-
 .../bindings/phy/samsung,usb3-drd-phy.yaml    |  2 +-
 .../pinctrl/samsung,pinctrl-gpio-bank.yaml    |  2 +-
 .../pinctrl/samsung,pinctrl-pins-cfg.yaml     |  2 +-
 .../samsung,pinctrl-wakeup-interrupt.yaml     |  2 +-
 .../bindings/pinctrl/samsung,pinctrl.yaml     |  2 +-
 .../bindings/power/supply/maxim,max14577.yaml |  2 +-
 .../bindings/power/supply/maxim,max77693.yaml |  2 +-
 .../bindings/regulator/maxim,max14577.yaml    |  2 +-
 .../bindings/regulator/maxim,max77686.yaml    |  2 +-
 .../bindings/regulator/maxim,max77693.yaml    |  2 +-
 .../bindings/regulator/maxim,max77802.yaml    |  2 +-
 .../bindings/regulator/maxim,max77843.yaml    |  2 +-
 .../bindings/regulator/maxim,max8952.yaml     |  2 +-
 .../bindings/regulator/maxim,max8973.yaml     |  2 +-
 .../bindings/regulator/maxim,max8997.yaml     |  2 +-
 .../bindings/regulator/samsung,s2mpa01.yaml   |  2 +-
 .../bindings/regulator/samsung,s2mps11.yaml   |  2 +-
 .../bindings/regulator/samsung,s2mps13.yaml   |  2 +-
 .../bindings/regulator/samsung,s2mps14.yaml   |  2 +-
 .../bindings/regulator/samsung,s2mps15.yaml   |  2 +-
 .../bindings/regulator/samsung,s2mpu02.yaml   |  2 +-
 .../bindings/regulator/samsung,s5m8767.yaml   |  2 +-
 .../bindings/rng/samsung,exynos5250-trng.yaml |  2 +-
 .../bindings/rng/timeriomem_rng.yaml          |  2 +-
 .../bindings/soc/samsung/exynos-usi.yaml      |  2 +-
 .../bindings/sound/samsung,arndale.yaml       |  2 +-
 .../bindings/sound/samsung,smdk5250.yaml      |  2 +-
 .../bindings/sound/samsung,snow.yaml          |  2 +-
 .../bindings/sound/samsung,tm2.yaml           |  2 +-
 .../spi/samsung,spi-peripheral-props.yaml     |  2 +-
 .../devicetree/bindings/spi/samsung,spi.yaml  |  2 +-
 .../thermal/samsung,exynos-thermal.yaml       |  2 +-
 .../bindings/usb/samsung,exynos-dwc3.yaml     |  2 +-
 .../bindings/usb/samsung,exynos-usb2.yaml     |  2 +-
 MAINTAINERS                                   | 36 +++++++++----------
 100 files changed, 117 insertions(+), 117 deletions(-)

-- 
2.32.0

