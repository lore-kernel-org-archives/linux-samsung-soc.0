Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1074AC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 29 Dec 2021 14:15:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240194AbhL2OPj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 29 Dec 2021 09:15:39 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:36546
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240168AbhL2OPf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 29 Dec 2021 09:15:35 -0500
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 287D5407AB
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Dec 2021 14:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1640787333;
        bh=UlJjLAfS40qt5leudPWhfuRwJJRufaBrjQlrhE6JqdI=;
        h=From:To:Subject:Date:Message-Id:MIME-Version;
        b=fbUWzs3gCad0e67u/90GE275tv/Lnz4IxlIb4CyO8SrX8IEq9qC530qBY2ZtyUyG2
         LbVEUWRAivkfpwXt4XhdkTrI2Scwvqi9FvK9924yot1oxu+QDUGzSTYNlmMTZ3oy4B
         t0BL2e9Z3fULeKUqTaD6deKHMbOribBqCc5HwrscLqOxxwEvQMHJCR0Em55zKYT11e
         Rz0BoQwnNjumO8Z9wn5Kqram3f6+SOgaKjfvR8Dpu9m6Pwg/v5gThyRV+8W3pDSHb2
         Gxt3x9LbVsGtNtRNExee5WJs3rYoBH4ho1gMXqQP/0P981H/tiVIlGv24A41XsJpOb
         TH+ATPhgzt1uQ==
Received: by mail-lj1-f200.google.com with SMTP id y8-20020a2e9788000000b0022df5cf52d1so1641848lji.18
        for <linux-samsung-soc@vger.kernel.org>; Wed, 29 Dec 2021 06:15:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UlJjLAfS40qt5leudPWhfuRwJJRufaBrjQlrhE6JqdI=;
        b=nZF1Ji4WDjIkCYiqU38LbwQy16aOdHAeEFXr9MEv8hMI34a/6sRTnFpP/5WXZN02lZ
         u30hgMFdMWfE3X6qV770v5vN+Lmjskzjx42qHuoZeIi2mzdc5+nsaljh1gg+0bB7rSlJ
         iOu0jEJbiaD154MirmgPAnWJ9UG+fEVarK7cg0ISxWjgCUbHAnqvULD/KHEGVJveNcpz
         /zelrQdPOBGsUziXt5zyQa3crJdcQh1A0Nxxn2cDk207U4ZKfIzPb33fokFSfxQt1ccj
         qOKH4j4p89VLvdvLUa4RkuFlMmFqQ3NOcFDDjtcbmROljijiPw+PrPd81SN8qvpM8jn8
         vhNA==
X-Gm-Message-State: AOAM530C+Thawt4biaeR72mbLgBuNA31McTbt/C04nhXAUIgUqGmu7Uf
        Y/t5z9c4oDprn9Kx/VeWK2ABmYICktLo4wsboWDQtEk+8CW0sc4IlxX43rxxJ1qA2ooGjUdwYBN
        HdL0vRrNn4F+227Rp5d46FJkVthIqQ/3BGxAV73t6qoIJuj6+
X-Received: by 2002:a05:651c:ba8:: with SMTP id bg40mr18007299ljb.276.1640787332068;
        Wed, 29 Dec 2021 06:15:32 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz5TtuMxYfpkf1FSMtnQIraHesCWHTbGXlzooBflaELIyumSIPdU/aIFK3/MPK4jIGTN5L8Vw==
X-Received: by 2002:a05:651c:ba8:: with SMTP id bg40mr18007281ljb.276.1640787331900;
        Wed, 29 Dec 2021 06:15:31 -0800 (PST)
Received: from krzk-bin.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id a16sm1316164ljm.98.2021.12.29.06.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Dec 2021 06:15:31 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sebastian Reichel <sre@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Subject: [PATCH 0/4] mfd/power/regulators: dt-bindings: max14577: convert to dtschema
Date:   Wed, 29 Dec 2021 15:15:20 +0100
Message-Id: <20211229141524.34174-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Dependencies:
1. DTS patch 1/4: nothing depends on it, sending here so Rob's automatic
   checker won't complain about DTS.
   I will take it via Samsung SoC tree.

2. Final MFD patch (4/4) depends on regulator and power, so the last
   patches (2+3+4) should go via same tree.

Best regards,
Krzysztof

Krzysztof Kozlowski (4):
  ARM: dts: exynos: Align MAX77836 nodes with dtschema on Monk and
    Rinato
  dt-bindings: power: supply: maxim,max14577: convert to dtschema
  regulator: dt-bindings: maxim,max14577: convert to dtschema
  dt-bindings: mfd: maxim,max14577: convert to dtschema

 .../devicetree/bindings/mfd/max14577.txt      | 147 -------------
 .../bindings/mfd/maxim,max14577.yaml          | 195 ++++++++++++++++++
 .../bindings/power/supply/maxim,max14577.yaml |  84 ++++++++
 .../bindings/regulator/maxim,max14577.yaml    |  81 ++++++++
 MAINTAINERS                                   |   3 +-
 arch/arm/boot/dts/exynos3250-monk.dts         |   2 +-
 arch/arm/boot/dts/exynos3250-rinato.dts       |   2 +-
 7 files changed, 364 insertions(+), 150 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mfd/max14577.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/maxim,max14577.yaml
 create mode 100644 Documentation/devicetree/bindings/power/supply/maxim,max14577.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max14577.yaml

-- 
2.32.0

