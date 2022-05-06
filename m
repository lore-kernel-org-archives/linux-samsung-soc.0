Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 301DCC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 May 2022 08:14:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381277AbiEFISd (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 May 2022 04:18:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379710AbiEFISa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 May 2022 04:18:30 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 856C36831A
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 May 2022 01:14:48 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id w4so8957481wrg.12
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 May 2022 01:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VzjcV3LY0ywTAwJH4JJM1dmdhwuF1gWAWbVhUFafxbE=;
        b=lQnSziesxGwRRS3eLO1dYR2Z6H0chCnrH52wKrTqzXXOk6KOHrMNx4Zc12TICzaZNf
         9RFXRev2QMNjxgjnfB6S3GJ08E5IS5p1/2up/GslTn+1pi5JV63hFcS9zkF5Oo540t+O
         JfOzpp3IOWrKsinXuiA+2bG7M2TTZkysPLh8eM9TeCGdFYIgnrDGoadKPNflKfGLan28
         bTvWvTnvr6jJBWswp6lIEGqFkxdljfxxGh+sTIWyp8QDP4htG3OYiKVCDlvna7mG0Geu
         K7Jo2bkwkS99NUQLgTOxk51IbdSJ6V1hnMlt65vNHOX5uNLTj0rDZy62Gx3LqJobwrXB
         jp3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VzjcV3LY0ywTAwJH4JJM1dmdhwuF1gWAWbVhUFafxbE=;
        b=UmhKeB4deDN9pylo9/IYPsJ6Vb/LJM12r8S/ZKKTbPjN3O/FCfQ8YgHU0U8UdAm2b8
         UwTHDGZy/g1fQMSCtrbnweDE2lwNPPiNBJjLqsyHm3BxCFdHnAhfRHtVivNR+LkZ1aOQ
         uXcCHkjDXI+jGvc6MjWziDTgsDMM2FDWokvXkxJgmHIZikKykejeSgSeOoEWwnhscg6A
         j5u/tufnlRWwZLTmNAEvw6SNl+ZzSekhFgAB3uugav9gSxDnbaLtWc4PtaWpUYbPPP62
         BkO6T/1HZoBtkWqJ1ckFNHyQzU8J2p3iAqOvRA18kL+FvgvhxlYYU9e2VkpzVsYcEqY0
         xyuA==
X-Gm-Message-State: AOAM533eNOdUfrDJeQDHob5yVLwqAVX2P7xONNTb7SStsfqsRUmST9/Y
        WTOLtoaKjnOQK8mTt/lz7nAzrg==
X-Google-Smtp-Source: ABdhPJxIT75VOVNxVrXyV/CpcdD3WcMbUkR3GCMnaYIlEUIcJEiHczmJPK0JN0wQ9LqXLB2M8p2dkg==
X-Received: by 2002:a05:6000:10c4:b0:20a:d4ee:d962 with SMTP id b4-20020a05600010c400b0020ad4eed962mr1662467wrx.649.1651824888080;
        Fri, 06 May 2022 01:14:48 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c14-20020adffb0e000000b0020c6fa5a797sm3059657wrr.91.2022.05.06.01.14.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 01:14:47 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 5/6] arm64: dts: samsung: for v5.19, part two
Date:   Fri,  6 May 2022 10:14:37 +0200
Message-Id: <20220506081438.149192-5-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220506081438.149192-1-krzysztof.kozlowski@linaro.org>
References: <20220506081438.149192-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On top of previous pull.

The clock bindings header, from my tree, was shared also with Samsung clk tree.

Best regards,
Krzysztof


The following changes since commit 22cbcb8f4a17c194d208f686fc3ea37fc860bd71:

  arm64: dts: tesla: add a specific compatible to MCT on FSD (2022-04-04 18:53:08 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.19-2

for you to fetch changes up to 9882948322874b1ffdd559e6887397de4c903440:

  arm64: dts: exynos: switch UFS clock node in ExynosAutov9 (2022-05-05 09:07:36 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v5.19, part two

1. Cleanups: unused and undocumented dma-channels and dma-requests.
2. Add clock controllers to ExynosAutov9.

----------------------------------------------------------------
Chanho Park (5):
      dt-bindings: clock: add clock binding definitions for Exynos Auto v9
      dt-bindings: clock: add Exynos Auto v9 SoC CMU bindings
      arm64: dts: exynos: add initial CMU clock nodes in ExynosAutov9
      arm64: dts: exynos: switch USI clocks in ExynosAutov9
      arm64: dts: exynos: switch UFS clock node in ExynosAutov9

Krzysztof Kozlowski (4):
      arm64: dts: exynos: move XTCXO clock frequency to board in Exynos Auto v9
      arm64: dts: exynos: drop useless 'dma-channels/requests' properties
      arm64: dts: fsd: drop useless 'dma-channels/requests' properties
      Merge tag 'samsung-dt-bindings-clk-exynosautov9-5.19' into next/dt64

 .../bindings/clock/samsung,exynosautov9-clock.yaml | 219 +++++++++++++++
 arch/arm64/boot/dts/exynos/exynos5433.dtsi         |   6 -
 arch/arm64/boot/dts/exynos/exynos7.dtsi            |   4 -
 arch/arm64/boot/dts/exynos/exynosautov9-sadk.dts   |   4 +
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       | 116 ++++++--
 arch/arm64/boot/dts/tesla/fsd.dtsi                 |   8 -
 include/dt-bindings/clock/samsung,exynosautov9.h   | 299 +++++++++++++++++++++
 7 files changed, 612 insertions(+), 44 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynosautov9-clock.yaml
 create mode 100644 include/dt-bindings/clock/samsung,exynosautov9.h
