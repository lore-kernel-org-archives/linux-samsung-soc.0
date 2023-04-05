Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 673C8C7619A
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  5 Apr 2023 08:05:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237288AbjDEIFC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 5 Apr 2023 04:05:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237317AbjDEIEo (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 5 Apr 2023 04:04:44 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4036B4C10
        for <linux-samsung-soc@vger.kernel.org>; Wed,  5 Apr 2023 01:04:42 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-501df529967so270812a12.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 05 Apr 2023 01:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680681880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wi5FMUcuNcmNWMrhurZ3bybGg/p7Cg429nUa1gNhErw=;
        b=zEOqPfjaaL2uWzxMd+MxD7UmgoolMd3GIiKxj1lKrzUPpeLR98UNKKTPj6QVyYlwgd
         2oco99MNtndOMABSvfzFa+hkfzI6+Iinva90oq35eGWDEqQKAOzRSqd3Zggdb7qeNQb2
         Y8NPBYS5jxtEvqqf6imr1f+6EmlnHdSHlGE7Tp7a1hF8cHnFsNIummg57ga3I9kL5GNf
         4KgwiNfUjPeIc/J5nWDifRjFWiCu0/oL6rHrFgipybSNBdeWmkQkfnOgLKFoG5NhxFlf
         ho2Yx4VI4FuwTCnPwXvyVWJTXzy2U8oZWNx6waFmTKx9SdQMsOJAyFHoSKgusLOh5e+S
         qPTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680681880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wi5FMUcuNcmNWMrhurZ3bybGg/p7Cg429nUa1gNhErw=;
        b=5oDrckiOd3Uk65KV9U2KjdVQCXW/5PgSRGv3A8Mg0E64NBpqBqsYW72BaNYR6dL+tW
         gWR5Fn7Rntvun5ZdMAnsDodHcjrarpx395Gcsc9dYKak57ndB7NwHQAwQrcVKABv3/i1
         9UVFOQ7+kc1SMoXrUDauYvecqWZY2afCch/ucGhe0MJnl/U/FcDsQxH3KXH7T1hX3BNh
         DACSHTkXk7vkbo6CGFMY0rTM56klT6MX4TP6eS/H8mGWkU0kLuTK3puDRfT8EIfLzU6d
         9sNlzRIBs89bLGM5nEueAsElg2Vn4YWGicSDu9CKq2K0wLYJruVToS9KOHnuMptS0iXF
         wnyQ==
X-Gm-Message-State: AAQBX9cKL1NLrz2SPiB5MdelGV0bOXWL2aabiyJrHdSuMW0E0qu1/r1T
        aae2+xDl7gpApRG4qs4j7EE3rQ==
X-Google-Smtp-Source: AKy350Ypl3SjcaA4rvPosLM+UbI2XKDgKUe1Kw/yQlqS1oKhDE7dlDYsvmIvMQG1dCeDpE7XboeEcA==
X-Received: by 2002:aa7:c40c:0:b0:500:50f6:dd30 with SMTP id j12-20020aa7c40c000000b0050050f6dd30mr1231622edq.15.1680681880521;
        Wed, 05 Apr 2023 01:04:40 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:3f:6b2:54cd:498e])
        by smtp.gmail.com with ESMTPSA id z21-20020a056402275500b00501d73cfc86sm6845839edd.9.2023.04.05.01.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 01:04:40 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/3] arm64: dts: samsung: dts64 for v6.4
Date:   Wed,  5 Apr 2023 10:04:36 +0200
Message-Id: <20230405080438.156805-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.4

for you to fetch changes up to 5f67124757464d632f0e5288e0ba48e3ff5531a9:

  arm64: dts: exynos: add mmc aliases (2023-03-17 13:45:02 +0100)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.4

1. Exynos850: add headers with AUD, G3D and HSI clock controller clock
   IDs. Add G3D (GPU) clock controller node.
2. Exynos5433: fixes for dtbs_check: move MIPI phy to PMU node.
3. Drop old MSHC aliases (while adding proper mmc-ddr-1_8v which was
   selected by the driver based on the MSHC alias) and add generic MMC
   aliases in each board.  The aliases match known numbering in
   the schematics.

----------------------------------------------------------------
Henrik Grimler (2):
      arm64: dts: exynos: drop mshc aliases
      arm64: dts: exynos: add mmc aliases

Krzysztof Kozlowski (1):
      arm64: dts: exynos: move MIPI phy to PMU node in Exynos5433

Sam Protsenko (3):
      dt-bindings: clock: exynos850: Add Exynos850 CMU_G3D
      dt-bindings: clock: exynos850: Add AUD and HSI main gate clocks
      arm64: dts: exynos: Add CMU_G3D node for Exynos850 SoC

 .../bindings/clock/samsung,exynos850-clock.yaml    | 19 +++++++++++++++
 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     |  5 ++--
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         | 19 +++++++--------
 arch/arm64/boot/dts/exynos/exynos7-espresso.dts    |  5 ++--
 .../boot/dts/exynos/exynos7885-jackpotlte.dts      |  1 +
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |  9 +++++++
 include/dt-bindings/clock/exynos850.h              | 28 +++++++++++++++++++---
 7 files changed, 69 insertions(+), 17 deletions(-)
