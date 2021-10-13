Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3061C433FE
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 13 Oct 2021 16:24:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 844EE60551
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 13 Oct 2021 16:24:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbhJMQ0d (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 13 Oct 2021 12:26:33 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:35428
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229529AbhJMQ0b (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 13 Oct 2021 12:26:31 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1E4673FFEE
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Oct 2021 16:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634142264;
        bh=8hqDFlw7QAqCClE2bspMVwGa558c3XYDAHMGeAZ8O74=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=as71Kdc64OWRd5Ec7u2lh83K7h011+DHoW5BiFkGQ2lxDt8AcFCUIpOoI8ZkVmthb
         n2MJp5VFdtQkwHDKu+h0i7QWK1WZ59PVTOJmn29NKF+2fx6n+6Z+AOlanXzNSZV41V
         V/342G9UHqitRFb9HPrRa/iax63OEZVNFWbxcROdAaorG2/9G4+/rWgRq7bVa5zO5y
         frg/B06/FogZaBNJSWKvF3v/PJrKZWQjVUiO67CvBE6coDQ78MK0o0beWw66sbPsjs
         ACHBe4qbhvb2GOb9sWaIeRXcD6LrnmpaSWSzN0AgCzimsARHaNHZwypmNT5kE0m79S
         hro00Tk715idA==
Received: by mail-lf1-f69.google.com with SMTP id p42-20020a05651213aa00b003fd8935b8d6so2404209lfa.10
        for <linux-samsung-soc@vger.kernel.org>; Wed, 13 Oct 2021 09:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=8hqDFlw7QAqCClE2bspMVwGa558c3XYDAHMGeAZ8O74=;
        b=2p0OYRsnsQ8aCjv0cc5ZalLVIQJeMHYZuGDPIy03ft9RzsdnUbtxN/oXdTFPBgtRql
         gh6kiowdQANxfJrlKc+bF4B9Vkoe8SU175lQYjdgZhdy9PX4D61HqRBfDKEg0+q1lvGB
         4hTBNnKIV+TpLjYw1QEN1+HOGSgAUdyjegax/LO4yoUxTX+BBPcBk5/0Wp5d5yFUphJG
         jnq5aqMJt6kldlKmU9zvDgNB7K6jZ8d+stsScDQG/FDovHms0c9QU72GBk6+ML7dq09/
         sHfuWEQ+jwL2oEjzEoiNsAFcmKjkKZwM84pIycqUWrUarK9VAaacGCkkpz2aLAlyCutB
         XuMw==
X-Gm-Message-State: AOAM53332zE0GbrOocuDmYh/Tq6IkjPDHDAQnt2hoVrrQ4vZK0anXJUx
        VkLWa+jUqI9d5SjN1ED7skb7sdyJUQmdjZ0eBuVrOhs1rnsVnQSqzx8PojcntMOS0J94PgI4Hxp
        1jPn5heyOcNIHPnnjh+rUNq5F2aTuKjBBA8X8WSsK23T908ik
X-Received: by 2002:a05:6512:3e11:: with SMTP id i17mr42098289lfv.613.1634142263622;
        Wed, 13 Oct 2021 09:24:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHolWBkWOXzX0f51ubgW0eqGFbNEBJQRBguxvNwraBslq04UV0jSTXrux+0AdM94v1s4Wm+w==
X-Received: by 2002:a05:6512:3e11:: with SMTP id i17mr42098266lfv.613.1634142263460;
        Wed, 13 Oct 2021 09:24:23 -0700 (PDT)
Received: from kozik-lap.lan (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id r3sm1372281lfc.169.2021.10.13.09.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Oct 2021 09:24:22 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
List-Id: <soc.lore.kernel.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/2] arm64: dts: samsung: dts64 for v5.16
Date:   Wed, 13 Oct 2021 18:24:18 +0200
Message-Id: <20211013162418.43072-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211013162418.43072-1-krzysztof.kozlowski@canonical.com>
References: <20211013162418.43072-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.16

for you to fetch changes up to 2b663ae7152f785732d35ce38ad20ad10aca3116:

  arm64: dts: exynos: add minimal support for exynosautov9 sadk board (2021-10-12 14:20:57 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v5.16

1. Match Exynos5433 DTS with dtschema.
2. Add an Exynos Auto v9 SoC and SADK board. The Exynos Auto v9 is a
   design for automotive for In-vehicle Infotainments (IVI) and Advanced
   Driver-Assistance Systems (ADAS).
   This pull request brings very basic support (pinctrl, UART and UFS
   storage) with a development SADK (Samsung Automotive Development Kit)
   board.

----------------------------------------------------------------
Chanho Park (2):
      arm64: dts: exynos: add initial support for exynosautov9 SoC
      arm64: dts: exynos: add minimal support for exynosautov9 sadk board

Krzysztof Kozlowski (2):
      arm64: dts: exynos: align operating-points table name with dtschema in Exynos5433
      arm64: dts: exynos: add proper comaptible FSYS syscon in Exynos5433

 .../bindings/arm/samsung/samsung-boards.yaml       |    6 +
 arch/arm64/boot/dts/exynos/Makefile                |    3 +-
 arch/arm64/boot/dts/exynos/exynos5433-bus.dtsi     |   10 +-
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         |    6 +-
 .../boot/dts/exynos/exynosautov9-pinctrl.dtsi      | 1189 ++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts   |   56 +
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       |  301 +++++
 7 files changed, 1562 insertions(+), 9 deletions(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynosautov9.dtsi
