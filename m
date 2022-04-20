Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AFAFC43219
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 20 Apr 2022 07:22:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359689AbiDTHYu (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 20 Apr 2022 03:24:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359690AbiDTHYr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 20 Apr 2022 03:24:47 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 207543AA78
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Apr 2022 00:22:00 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id y10so1617243ejw.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Apr 2022 00:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5bhHmkNynxArCaTA/7bZ7/hQVWgPWdbqpkbJXO91I6o=;
        b=V3BsCCRe/dmD5vyspIiiwnvVRGjTw9phFS+Deblji7ZMzkzb5GRm14IBNskkzUYr6i
         koMqOflEWfWXuj7c4vmEwAZtWkhCR8hk6SuDMVs+7TNfHQAt/r5fKrBeCFcVtJPzJzl8
         jm1t2FYtqyIkzxUGEtEVq/yXcOQqqlsW1s+jOL47F3pFti0iLq5r9S28TL6vjk0Iyj8t
         xuZq3DQD2y/BQJDVo/66/I+rDTTuGNoIBNy7pSYpg2pHBq/57iG1ZjZnPecQ1LpyC6oL
         xz+h3p4HDqngQKdFN/UhCEBglc/b4Yp5guIIMAAE+pjqVeTwvUb3hhFCoy4Na0lA6eJY
         F1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5bhHmkNynxArCaTA/7bZ7/hQVWgPWdbqpkbJXO91I6o=;
        b=bNszFZkPuqaE+QEk9vrTGTJy2CKtFNmYB1t/fHKtIdHKNg1MvJLWmFfH/RpKb44o79
         oCuauxlVgwg3kr7YM5P7BZg4ctToTHxtqJy7jpjCJemaRtApy/3XpHhUk8gqdPZ63Qyq
         uBvlo8IKdA+oCAfwgj1xZSeeTHnv3KONrm2e3Aijmmy3g0XPL0t+nniJcaxQRiYmPo0S
         iuOEFO1bz3svYHkuwyIT2S8YEIJdRJoTk+CY9Zv0G3tZlRD/r5HqaTkNQXNYt3fTtITO
         oGFVnOhzicBuh0wbnEbCa0aRuBiUT9mW/uYc862e0qOSCu0YBfEc0k4q7yIP8LegwNLY
         uyQQ==
X-Gm-Message-State: AOAM533uvEobX2OdW0hkIyyEwbGVnjaJ0EytyzSlAcKCnci/cRD5kC58
        DeYb1ceHBhXW6STcjnSN6C0PKQ==
X-Google-Smtp-Source: ABdhPJyDYc5gwpPbK9kabmfq2DveJYHoUheuzGxUxOm+QOQqAKm0THRZRPtHRpizJ2fraH1+pUxO8Q==
X-Received: by 2002:a17:906:c110:b0:6e8:3a96:996a with SMTP id do16-20020a170906c11000b006e83a96996amr17040723ejc.216.1650439318749;
        Wed, 20 Apr 2022 00:21:58 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id a1-20020a1709063e8100b006ce06ed8aa7sm6492106ejj.142.2022.04.20.00.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 00:21:58 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 3/3] arm64: dts: samsung: dts for v5.19
Date:   Wed, 20 Apr 2022 09:21:52 +0200
Message-Id: <20220420072152.11696-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220420072152.11696-1-krzysztof.kozlowski@linaro.org>
References: <20220420072152.11696-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-5.19

for you to fetch changes up to 22cbcb8f4a17c194d208f686fc3ea37fc860bd71:

  arm64: dts: tesla: add a specific compatible to MCT on FSD (2022-04-04 18:53:08 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v5.19

1. Cleanup: move aliases of board-related features to board in
   Exynos850.
2. Add specific compatibles to Multi Core Timer to allow stricter DT
   schema matching.

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      arm64: dts: exynos: move aliases to board in Exynos850
      arm64: dts: exynos: add a specific compatible to MCT
      arm64: dts: tesla: add a specific compatible to MCT on FSD

 arch/arm64/boot/dts/exynos/exynos5433.dtsi       |  3 ++-
 arch/arm64/boot/dts/exynos/exynos850-e850-96.dts |  5 +++++
 arch/arm64/boot/dts/exynos/exynos850.dtsi        | 19 ++-----------------
 arch/arm64/boot/dts/tesla/fsd.dtsi               |  2 +-
 4 files changed, 10 insertions(+), 19 deletions(-)
