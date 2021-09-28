Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72255C43217
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Sep 2021 08:50:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C57261058
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 28 Sep 2021 08:50:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239728AbhI1Ivj (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 28 Sep 2021 04:51:39 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:48132
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239679AbhI1Ivh (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 28 Sep 2021 04:51:37 -0400
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CEE054082A
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Sep 2021 08:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632818996;
        bh=s/Q8X9tuIBqeJqxr1KTOjGxG6s4RwMm6kPUpqoiWcFw=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=hIZGMO+28FDel4/QGHRVHnaoUZlCUAJeowvarUmXSTr0io6Cku2qn+PMNnyN7L2UY
         5yPBaNdHmKdaG/JYTyXXGj7JZLcjNrvnnrmHVjh8I78OQefPzoH+J/K24ZzyVF+V5c
         QFRKcC3dChDsiDNTWEa1w+8zNNYC5xcuNpbSc2ANGl1i0r1Nm1gIVEQj+Wr27gZvvs
         mMEMjhSQUrETzwMExFdKwUaQTUOCDuJCP+xftZmr++jL8aUAT4IQ6AGTySd+fc+rnW
         7dG2EJqS8sqEWbbjsQ5+d4rFpDY/SdUrCow0T6tCMupYQPalaLUM5HfDbfKO//L6Qc
         r6xrzPOYwUMOA==
Received: by mail-lf1-f71.google.com with SMTP id bp11-20020a056512158b00b003fc7d722819so18680969lfb.7
        for <linux-samsung-soc@vger.kernel.org>; Tue, 28 Sep 2021 01:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s/Q8X9tuIBqeJqxr1KTOjGxG6s4RwMm6kPUpqoiWcFw=;
        b=YzjA2LT5FaKlQ/e2S5ioLsrEeMSJvArm+VKjxUv958WYjCiPLnfcAADA5SwHuP7b8f
         DLJhzzdJvZ1ii8XR/izD8yqZtQ8E9PgVuXzpILJoG6qKxqf1uJEIp8us+TQioOi+hTPm
         QmDV7q8EE/kFc+KNWkMkMI9nqdKMSICioCrSLPOAoYuMFDTOCzEr8dAL+ujoQj5e9/ig
         gWG99oO58VhtIzLHT48FdsMk54LiJwPEBm86oJf//YM05sX7AbY3iTWkRkOtfCOYnSfb
         JdOP+pRIFMsqhQGBto+jc6FyFHcOoPyMePEjD6eDImHEtv6qri/sLWm4JA3VWIFpcYxr
         m2CA==
X-Gm-Message-State: AOAM5336gzqd8t2UkJRJHHzi9jv5GsV6aquQVeOb2JOEsnsM0Fn1venD
        47ahoPHzQW4aR95Dsa4U5gm+V+f8LaRLwA7K9mnvk1iBT+jnhFazDTHLAIBS3Oimtakquot5cmY
        9SE7a1Vgwgb1wFpok+LERQqgw+ezLBdqhv6wjfulTm74b2SzN
X-Received: by 2002:a05:651c:1250:: with SMTP id h16mr4907823ljh.68.1632818995657;
        Tue, 28 Sep 2021 01:49:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLgIFok3M8wHeXKvUfpBG7iVnXNDTkyYLNs+KpjnVUJr1BonlXY3GAb1NKN7cupAWULjWsdg==
X-Received: by 2002:a05:651c:1250:: with SMTP id h16mr4907802ljh.68.1632818995449;
        Tue, 28 Sep 2021 01:49:55 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h13sm1848419lfl.205.2021.09.28.01.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 01:49:55 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>
Subject: [PATCH 00/12] regulator/mfd/clock: dt-bindings: Samsung S2M and S5M to dtschema
Date:   Tue, 28 Sep 2021 10:49:37 +0200
Message-Id: <20210928084949.27939-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi All,


Intro
=====
This patchset converts all devicetree bindings of Samsung S2M and S5M
PMIC devices from txt to dtschema.

It includes also two fixes which are included here at beginning because
later conversion depends on it (contextually).


Merging/dependencies
====================
1. Regulator related binding changes depend on first two commits (the
   fixes), because of context.
2. The mfd bindings depend on clock and regulator bindings.
3. The DTS changes (patches 11 and 12) are independent (including here
   only to provide some context) and I will take them via samsung-soc.

Therefore the fixes and bindings changes (patches 1-10) should go via
the same tree.  For example regulator or mfd tree.  I propose the
regulator tree, since it will have also one driver change (the fix,
first commit).


Overview of devices
===================
Essentially all Samsung S2M and S5M PMICs are very similar devices. They
provide the same functionality: regulators, RTC, 2 or 3 clocks and main
power management (e.g. power cut to SoC).

The differences are mostly in registry layout and number of regulators.

The drivers are built around one common part, mfd/sec-core.c, and share
some drivers between devices:
1. MFD sec-core for all devices,
1. one clock driver for most of devices,
2. one RTC driver for all devices,
3. three regulator drivers.

The regulator drivers were implementing slightly different features,
therefore one regulator binding for all devices does not make much
sense.  However the clock device binding can be shared.

The final dtschema bindings try to implement this - share only the clock
bindings.

Best regards,
Krzysztof


Krzysztof Kozlowski (12):
  regulator: s5m8767: do not use reset value as DVS voltage if GPIO DVS
    is disabled
  regulator: dt-bindings: samsung,s5m8767: correct
    s5m8767,pmic-buck-default-dvs-idx property
  clock: dt-bindings: samsung,s2mps11: convert to dtschema
  regulator: dt-bindings: samsung,s2m: convert to dtschema
  regulator: dt-bindings: samsung,s2mpa01: convert to dtschema
  regulator: dt-bindings: samsung,s5m8767: convert to dtschema
  mfd: dt-bindings: samsung,s2mps11: convert to dtschema
  mfd: dt-bindings: samsung,s2mpa01: convert to dtschema
  mfd: dt-bindings: samsung,s5m8767: convert to dtschema
  mfd: dt-bindings: samsung,s5m8767: document buck and LDO supplies
  ARM: dts: exynos: remove unneeded DVS voltages from PMIC on Arndale
  ARM: dts: exynos: use spaces instead of tabs around '='

 .../bindings/clock/samsung,s2mps11.txt        |  49 ---
 .../bindings/clock/samsung,s2mps11.yaml       |  45 +++
 .../bindings/mfd/samsung,s2mpa01.yaml         |  91 ++++++
 .../bindings/mfd/samsung,s2mps11.yaml         | 267 +++++++++++++++
 .../bindings/mfd/samsung,s5m8767.yaml         | 307 ++++++++++++++++++
 .../bindings/mfd/samsung,sec-core.txt         |  86 -----
 .../bindings/regulator/samsung,s2mpa01.txt    |  79 -----
 .../bindings/regulator/samsung,s2mpa01.yaml   |  69 ++++
 .../bindings/regulator/samsung,s2mps11.txt    | 102 ------
 .../bindings/regulator/samsung,s2mps11.yaml   |  52 +++
 .../bindings/regulator/samsung,s2mps13.yaml   |  52 +++
 .../bindings/regulator/samsung,s2mps14.yaml   |  52 +++
 .../bindings/regulator/samsung,s2mps15.yaml   |  52 +++
 .../bindings/regulator/samsung,s2mpu02.yaml   |  52 +++
 .../bindings/regulator/samsung,s5m8767.txt    |  46 +--
 .../bindings/regulator/samsung,s5m8767.yaml   |  83 +++++
 MAINTAINERS                                   |   9 +-
 arch/arm/boot/dts/exynos4210-origen.dts       |  24 +-
 arch/arm/boot/dts/exynos4412-origen.dts       |  14 +-
 arch/arm/boot/dts/exynos5250-arndale.dts      |   3 -
 drivers/regulator/s5m8767.c                   |  21 +-
 21 files changed, 1165 insertions(+), 390 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/samsung,s2mps11.txt
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/samsung,s2mpa01.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml
 delete mode 100644 Documentation/devicetree/bindings/mfd/samsung,sec-core.txt
 delete mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mpa01.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mpa01.yaml
 delete mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps11.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps11.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps13.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps14.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps15.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mpu02.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s5m8767.yaml

-- 
2.30.2

