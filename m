Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F27A0C636CD
	for <linux-samsung-soc@archiver.kernel.org>; Sun,  5 Feb 2023 14:47:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229538AbjBEOrF (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 5 Feb 2023 09:47:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjBEOrD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 5 Feb 2023 09:47:03 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F9E74EE1
        for <linux-samsung-soc@vger.kernel.org>; Sun,  5 Feb 2023 06:47:02 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id j25so4777287wrc.4
        for <linux-samsung-soc@vger.kernel.org>; Sun, 05 Feb 2023 06:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HR0gJobSHL9vE+BsCSIkgEZdXYIv6WLpvlg39qHg3YM=;
        b=ue25OXS3a4CzuB1vxQMLp9XWz3vHa0DLAQwEfEaPMjMEx4GVzObfh3kmR1W5nmzz4/
         G5vn82FlMVMJ04KGY3UmaZJmsqfQpAQGu/JR1++eJGvbLmsNaTC3/NfbgUnEmB7o7Xkc
         bTdBYzqBvMyPJCltpbgCDPQaqxcNuNwvdPSTt+emWYuZOI3hUia4aWEdw6SpvNIllN4j
         SikVCtmFO4fb2+8zaa8fgn5O+VX/EPJbHkQdnnF6GgT8F4bqSXHMwYZDseV1MnC4gwTI
         coZl3AgLT4qLxFW5DoWYUDJ1hJaDeOhtMuFQeOm6xeO+xObw6F2uUh3ZRHWSpAhCtsb9
         Otxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HR0gJobSHL9vE+BsCSIkgEZdXYIv6WLpvlg39qHg3YM=;
        b=5u+w7ppzsyGZrQ4SezHHsDkueVyWY5L6/aunuZ/FY67/dc78uNpqfLY1GXYG89jVxu
         tZSoEyUJ2U2lY7Vx9TKeBh4WelZBsZh24V7IkaSSvaWbvLmoJrwXZzLyKeMsKB9kOeTw
         W79PmZwnRQMJcW4eiDQ2Zo5fkPV0B7FHKWWj9R1fsmv/GJXOhmUtUyWAAwG7scKFgN5O
         qUmgpPLhEo4Pz8+oKbowF5VUTszboThr/pi0uGm5N9spegifp7HGZM5T9SHU1M9SlW2Z
         neV9RNESYQtuM/tUisgqNu1NULXJTZwwOJcWTRH9fooOe9i4iUDqJhFxLXPNg/yqDqXh
         oe3w==
X-Gm-Message-State: AO0yUKUyhESMhKLLFeZ8JxL/RV8kuiJ4bP5gVwUO5c3888tx0Qfvokro
        On6dTEcEyAF1bgaeTNrkAsrb3Q==
X-Google-Smtp-Source: AK7set+F72M3wUCPpeFvd7+ejV4iEMUfZ+8nDmcg4bm7tKjZoJBQtCmQ2ecj/huPz2vyjS6ubTPI+g==
X-Received: by 2002:a05:6000:988:b0:2bf:d88b:7b45 with SMTP id by8-20020a056000098800b002bfd88b7b45mr17833434wrb.67.1675608420767;
        Sun, 05 Feb 2023 06:47:00 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q8-20020adfea08000000b002c3ddcf4f3asm4072354wrm.0.2023.02.05.06.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Feb 2023 06:47:00 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] samsung: drivers: secoond pull for v6.3
Date:   Sun,  5 Feb 2023 15:46:57 +0100
Message-Id: <20230205144657.951749-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On top of previous pull request.

The phy patches were acked by phy maintainer and are necessary to fix warning
in my next/soc branch (already pulled).  That was an ordering issue.

Best regards,
Krzysztof


The following changes since commit 5e487164afbcd917225fb701e8956f388f43b601:

  MAINTAINERS: arm64: tesla: correct pattern for directory (2023-01-15 12:17:44 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-drivers-6.3-2

for you to fetch changes up to 7ecd4e5f5de23022d1a1c92058949ddf1a2113ff:

  phy: samsung,mipi-video-phy: deprecate syscon phandle (2023-02-03 20:21:26 +0100)

----------------------------------------------------------------
Samsung SoC driver changes for v6.3

Deprecate syscon phandle to the PMU node in MIPI and DP video phy
drivers in favor of putting the device nodes directly under the PMU
nodes.  This better reflects device hierarchy and allows later to solve
dtc W=1 and dtbs_check warnings.

----------------------------------------------------------------
Krzysztof Kozlowski (4):
      dt-bindings: phy: samsung,dp-video-phy: deprecate syscon phandle
      dt-bindings: phy: samsung,mipi-video-phy: deprecate syscon phandle
      phy: samsung,dp-video-phy: deprecate syscon phandle
      phy: samsung,mipi-video-phy: deprecate syscon phandle

 .../devicetree/bindings/phy/samsung,dp-video-phy.yaml         |  5 ++---
 .../devicetree/bindings/phy/samsung,mipi-video-phy.yaml       | 11 +++++------
 drivers/phy/samsung/phy-exynos-dp-video.c                     |  7 +++++--
 drivers/phy/samsung/phy-exynos-mipi-video.c                   |  7 +++++--
 4 files changed, 17 insertions(+), 13 deletions(-)
