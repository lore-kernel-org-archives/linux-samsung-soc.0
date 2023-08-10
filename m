Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 091EDC04FE0
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 10 Aug 2023 15:13:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236039AbjHJPM7 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 10 Aug 2023 11:12:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236037AbjHJPM7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 10 Aug 2023 11:12:59 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BB482694
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Aug 2023 08:12:58 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3fe4ad22eb0so9052945e9.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 10 Aug 2023 08:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691680377; x=1692285177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ihehJxrTNK++d1PA1IF6JXA5I34hdQPx/lmWfAqYS0A=;
        b=zwRAzjdKw5Uh7/H/QGM4/xh5m+K71vN1qXj+4jCP0zPQr0q/vev4zD5LhpVy/KCyRf
         woeTNCiAOQBGoS20pnwwtLRbZ1F4JgvEpTLZupE4V1IOj6LhL0Rm61uWFBACMuqdWCsU
         Om2FD2ffPV14yvg7Hx4RcUX2ORnptVgmHHWixFrXZ6L0nMaFieTSDU1kJolzSgg3/yOl
         HSOQNNhks1e+B1ixM5XXfbQTm+mCA6hazx9ZY9yUeNatanM/p4gTisHFQ+eWjiG6lMHM
         41iaqXYqk+3cQdfXhj2tEJCR9quprc6Ho7Gu+5GE9dKx+GJmvlr0/g3qlJS1wZbfFj8z
         y8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691680377; x=1692285177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihehJxrTNK++d1PA1IF6JXA5I34hdQPx/lmWfAqYS0A=;
        b=SriARpiZVATaNLRxtiIoVhUqUyv9ryN5c9+v1oiUgJXdn/9o4hT/93JXXNfdpWyY9e
         890mWNXHhQedbQZeR4i/Z8AgLLRXyT8+qK7ff591VOWnB4gAOaBxW52Y05EmWgd2V6Go
         qmchVbiTF8D8I/DWJ5K3QcaO922SQ79oOszuBdCS+MvSt5aTo9fjrJRcPwGn0Yp8CIhz
         5/j/3HbdEU90XZxD6CC0BNTeH08M9GdCHFb1/SrdRGvxHYWOzJB1pvFh/rH5j5GSyOJ4
         xA0BESH9mmydKwtFflJq01FYNFLZfcl2iPb+1RSMR99E0ZoXLQYJLZ1SstB2INxWzTKL
         hCRA==
X-Gm-Message-State: AOJu0YxH19VnTnDibeFhIssSPNr5fO7f64QNYC0Ragy4gXmtOJzojyOu
        jpe6/Sia08TXzcdBXVY6YxBH1w==
X-Google-Smtp-Source: AGHT+IFHMAVzT051cf++Anz0qtU1svuxejGcPcBz1h7lnMWe48wUCEK4q+TCvF2P2ZCCdXgg00KGbw==
X-Received: by 2002:adf:e843:0:b0:313:e8b6:1699 with SMTP id d3-20020adfe843000000b00313e8b61699mr2218576wrn.55.1691680377133;
        Thu, 10 Aug 2023 08:12:57 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id 5-20020a05600c020500b003fe29dc0ff2sm2416242wmi.21.2023.08.10.08.12.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Aug 2023 08:12:56 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/3] arm64: dts: samsung: DTS for v6.6
Date:   Thu, 10 Aug 2023 17:12:49 +0200
Message-Id: <20230810151250.220202-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230810151250.220202-1-krzysztof.kozlowski@linaro.org>
References: <20230810151250.220202-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The following changes since commit 06c2afb862f9da8dc5efa4b6076a0e48c3fbaaa5:

  Linux 6.5-rc1 (2023-07-09 13:53:13 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.6

for you to fetch changes up to d157d43754582f3981b7eefc691abc4d865430e1:

  arm64: dts: exynos: exynos5433-tm2: drop redundant status=okay (2023-08-06 17:42:22 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.6

1. Add dedicated compatibles for PWM block.
2. Add PWM to ExynosAutov9 SADK board.
3. Few white-space and other cleanups.

----------------------------------------------------------------
Jaewon Kim (2):
      dt-bindings: pwm: samsung: add exynosautov9 compatible
      arm64: dts: exynos: add pwm node for exynosautov9-sadk

Krzysztof Kozlowski (4):
      arm64: dts: exynos: add missing space before {
      arm64: dts: exynos: minor whitespace cleanup around '='
      arm64: dts: fsd: minor whitespace cleanup around '='
      arm64: dts: exynos: exynos5433-tm2: drop redundant status=okay

 Documentation/devicetree/bindings/pwm/pwm-samsung.yaml | 17 +++++++++++------
 arch/arm64/boot/dts/exynos/exynos5433-tm2-common.dtsi  |  1 -
 arch/arm64/boot/dts/exynos/exynos7.dtsi                |  8 ++++----
 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts       |  6 ++++++
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi           | 13 ++++++++++++-
 arch/arm64/boot/dts/tesla/fsd.dtsi                     |  4 ++--
 6 files changed, 35 insertions(+), 14 deletions(-)
