Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB6CC47094
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Jun 2021 07:41:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 771A2613BD
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Jun 2021 07:41:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbhFJHnD (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 10 Jun 2021 03:43:03 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:41130 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230113AbhFJHnA (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Jun 2021 03:43:00 -0400
Received: from mail-wm1-f69.google.com ([209.85.128.69])
        by youngberry.canonical.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <krzysztof.kozlowski@canonical.com>)
        id 1lrFJG-0001Ya-Ln
        for linux-samsung-soc@vger.kernel.org; Thu, 10 Jun 2021 07:41:02 +0000
Received: by mail-wm1-f69.google.com with SMTP id g81-20020a1c9d540000b02901a3d4d3f7fcso3527587wme.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Jun 2021 00:41:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e2+wIvEzXuddcIq0HptNZ4S2HwP4Xp1f1Y9ZwuawFc4=;
        b=h2b5CC/M51YI1guB+wvf02a/6xTP5JnMeoo6z8rjjRlh9J8QLWDN7otODgJAo6H+x+
         dFj3HdtLyOcIVaEpGsyO6R/kePHRovhyT/yhmJAN4Ti6Ro8Z2/CAWTww9e+rihrRo5e9
         /VHwoTHCh6qlOhSWbf09vfCWNUjtrhfTr7+kfMNSaIYtGVZfIwXT/+iUJz2eenG3Wg3J
         CQiJLMiKBtGyMXp7tCuJ7YP/sfv4yo5bCPkxfCVSwTfl7QSWI3cXHgMKSqCspZ+5oEAg
         7u/xUmix/z/ZLrVXqkCtP7st1sRt5bz/8y4qyR9Pc4Znm/85xCU3l8Q14yPAI8Qj0/jI
         nEfg==
X-Gm-Message-State: AOAM533ozphet6YPD9YURKr/q3QIv7VsbgsoPyjaCh8FRCChuryH3wqe
        3ZTSiQes8nNmSJQEDfEM0JgMjUaU7Z1eMAqNHaSrLlgQ2tyKucz06h4uJ+M9li/yYFflK6TvKT7
        lmn7gF6FSwdXsD9FLWKswArbZB6++vt9Pk6zFPrI1YrRDUrzw
X-Received: by 2002:a5d:4ecf:: with SMTP id s15mr3761852wrv.80.1623310862385;
        Thu, 10 Jun 2021 00:41:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwZwFM7Mtml6+tDBHWQSvn1Ol2Wwfw1kgdH8lO0D7YcHyNXXoa62MbbMN9e/Cmg+98Wt0tHsw==
X-Received: by 2002:a5d:4ecf:: with SMTP id s15mr3761833wrv.80.1623310862249;
        Thu, 10 Jun 2021 00:41:02 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id k11sm8417229wmj.1.2021.06.10.00.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 00:41:01 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/2] ARM: dts: samsung: pull for v5.14
Date:   Thu, 10 Jun 2021 09:40:54 +0200
Message-Id: <20210610074055.12474-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

Few DTS changes. I will have slightly later also pulls for ARM64 and defconfig.

Best regards,
Krzysztof


The following changes since commit 6efb943b8616ec53a5e444193dccf1af9ad627b5:

  Linux 5.13-rc1 (2021-05-09 14:17:44 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.14

for you to fetch changes up to 135adbbee4c66f89b57519633cbf8c3c35b6c4da:

  ARM: dts: exynos: Disable unused camera input for I9100 (2021-05-31 17:53:00 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.14

1. Several cleanups and alignment with dtschema.  This includes removal
   of unused properties and fixing LED brightness property.
2. Enable PMIC RTC interrupt as a wakeup source (intended to wakeup for
   example from Suspend to RAM where the PMIC RTC's power is still
   supplied).
3. Disable unused/not implemented camera on GT-I9100.

----------------------------------------------------------------
Krzysztof Kozlowski (16):
      ARM: dts: exynos: align Broadcom WiFi with dtschema
      ARM: dts: exynos: replace legacy MMS114 touchscreen x/y properties in GT-N7100
      ARM: dts: exynos: fix PWM LED max brightness on Odroid XU/XU3
      ARM: dts: exynos: fix PWM LED max brightness on Odroid HC1
      ARM: dts: exynos: fix PWM LED max brightness on Odroid XU4
      ARM: dts: s5pv210: remove unused Atmel touchscreen properties in Goni
      ARM: dts: exynos: enable PMIC wakeup from suspend on Itop Core
      ARM: dts: exynos: enable PMIC wakeup from suspend on Origen4412
      ARM: dts: exynos: enable PMIC wakeup from suspend on Arndale
      ARM: dts: exynos: enable PMIC wakeup from suspend on Odroid XU
      ARM: dts: exynos: enable PMIC wakeup from suspend on Midas
      ARM: dts: exynos: enable PMIC wakeup from suspend on Odroid X/U3
      ARM: dts: exynos: enable PMIC wakeup from suspend on P4 Note
      ARM: dts: exynos: enable PMIC wakeup from suspend on Arndale Octa
      ARM: dts: exynos: enable PMIC wakeup from suspend on SMDK5420
      ARM: dts: exynos: enable PMIC wakeup from suspend on Odroid XU3/XU4 family

Timon Baetz (1):
      ARM: dts: exynos: Disable unused camera input for I9100

 arch/arm/boot/dts/exynos3250-rinato.dts         | 2 +-
 arch/arm/boot/dts/exynos4210-i9100.dts          | 8 +++++---
 arch/arm/boot/dts/exynos4210-trats.dts          | 2 +-
 arch/arm/boot/dts/exynos4210-universal_c210.dts | 2 +-
 arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi | 1 +
 arch/arm/boot/dts/exynos4412-midas.dtsi         | 1 +
 arch/arm/boot/dts/exynos4412-n710x.dts          | 4 ++--
 arch/arm/boot/dts/exynos4412-odroid-common.dtsi | 1 +
 arch/arm/boot/dts/exynos4412-origen.dts         | 1 +
 arch/arm/boot/dts/exynos4412-p4note.dtsi        | 1 +
 arch/arm/boot/dts/exynos5250-arndale.dts        | 1 +
 arch/arm/boot/dts/exynos5410-odroidxu.dts       | 1 +
 arch/arm/boot/dts/exynos5420-arndale-octa.dts   | 1 +
 arch/arm/boot/dts/exynos5420-smdk5420.dts       | 1 +
 arch/arm/boot/dts/exynos5422-odroid-core.dtsi   | 1 +
 arch/arm/boot/dts/exynos5422-odroidhc1.dts      | 2 +-
 arch/arm/boot/dts/exynos5422-odroidxu4.dts      | 2 +-
 arch/arm/boot/dts/exynos54xx-odroidxu-leds.dtsi | 4 ++--
 arch/arm/boot/dts/s5pv210-goni.dts              | 9 ---------
 19 files changed, 24 insertions(+), 21 deletions(-)
