Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5327AE92FFA
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Oct 2023 09:39:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231373AbjJFJju (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 Oct 2023 05:39:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230498AbjJFJjt (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Oct 2023 05:39:49 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CA7ABE
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Oct 2023 02:39:48 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-99c3c8adb27so332521766b.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Oct 2023 02:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696585187; x=1697189987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zLoSSC1UZ/duJw3hpKoUG62FpPtnA3XGq+6z+gTs89o=;
        b=J0ha7lCAHuwhjTTkdj2i40k+oxl+C42i9rdWFhs4q4NQuiOP7RtM8At1RTsiql8KB+
         2JZrHTENUFsOlpXj+ZPgwZYNhmDlscW7G1a22VeMoOYpI5R9SKLG+68eNr8vCZsfYGap
         I50oiMnYUlVozDswon2f+LoJw/PoqmzQb43nES/pwGUczEu1JT15L+TyvhE7AKEFaOAY
         nWgct/CJ5l3iiqIT7okFHS9I6R0LPnywyP1A3D7EaqkecsgQg3OB1cKvAmz/tOIFNgPU
         0Ls2nbvtfvA/piy93BoRrZo1cNb72WZYaFtwoAE5yrx/CLw2++hH39XO+H3tycVPPMvX
         qO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696585187; x=1697189987;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zLoSSC1UZ/duJw3hpKoUG62FpPtnA3XGq+6z+gTs89o=;
        b=rAbPRRS4iM4/NAm8CMTitB6d2uJ1MjBx6vWC3ucBcosr8KhhrsnizXs/f0aMsSyZLx
         FI1mD4mvAXqTZn/gIAOG7hB420CApypUJlAQCWX9t59HmoVlobUTSyaAcmdoG2rWazLZ
         6WdZimAe1Zry7v74sisBTG/UayBhIUhR+ZmVaRZ0f91Bye7AhchaOnXCX4uBA0ISVWW0
         sIFuZyeI/R89ny0k6Uu4eMKl80diUGtUKJR1lz6Z8pbn6tGdhznwX0dxNVrGPXFewSPd
         9Jpyrh3Ba1m6pOSZiiy3CYVTvAZv4L8dAFzVxEawASlEWSiQSZY2+eJfNNZVaSQYQqfF
         g5Qw==
X-Gm-Message-State: AOJu0YwiOKntMhd2JtdWxBn+sRDHglYoxR60p2lDgitgdL4UNjwY+nui
        lsm+LKgYf7JMi6WsBTwgasPpOA==
X-Google-Smtp-Source: AGHT+IHckojQyurNLeQ/G2riZtqxasLlCFF8XS3S+MkODSkeGkhvnMpArmgxvcKqLy8dfsM2vl/kSg==
X-Received: by 2002:a17:906:518f:b0:9a5:c4c0:2d8a with SMTP id y15-20020a170906518f00b009a5c4c02d8amr6236348ejk.24.1696585186900;
        Fri, 06 Oct 2023 02:39:46 -0700 (PDT)
Received: from krzk-bin.. (5-157-101-10.dyn.eolo.it. [5.157.101.10])
        by smtp.gmail.com with ESMTPSA id gx13-20020a170906f1cd00b009ad8d444be4sm2583412ejb.43.2023.10.06.02.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 02:39:46 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 1/2] arm64: dts: samsung: DTS for v6.7
Date:   Fri,  6 Oct 2023 11:39:42 +0200
Message-Id: <20231006093943.106002-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.7

for you to fetch changes up to f28dde395937e000585ac87c0d1c18885661161d:

  arm64: dts: exynos: remove unused TMU alias (2023-09-14 10:03:47 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.7

1. Exynos850: Add support for USB 2.0 (host and device) and enable it on
   E850-96 board.

2. Exynos5433: Switch sound card to generic audio-routing property,
   supported since previous release for Samsung drivers.  The old
   samsung,audio-routing property is deprecated.

3. Few cleanups.

----------------------------------------------------------------
Jaewon Kim (1):
      arm64: dts: exynos: Use pinctrl macros for exynos5433-tm2

Krzysztof Kozlowski (1):
      arm64: dts: exynos: exynos5433-tm2: switch sound card to audio-routing

Mateusz Majewski (1):
      arm64: dts: exynos: remove unused TMU alias

Sam Protsenko (2):
      arm64: dts: exynos: Enable USB in Exynos850
      arm64: dts: exynos: Enable USB support on E850-96 board

 .../boot/dts/exynos/exynos5433-tm2-common.dtsi     | 23 ++++-----
 arch/arm64/boot/dts/exynos/exynos7.dtsi            |  1 -
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts   | 58 ++++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos850.dtsi          | 30 +++++++++++
 4 files changed, 99 insertions(+), 13 deletions(-)
