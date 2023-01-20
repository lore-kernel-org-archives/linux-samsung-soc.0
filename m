Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D667C27C7C
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 20 Jan 2023 15:54:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbjATPyQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 20 Jan 2023 10:54:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231461AbjATPyP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 20 Jan 2023 10:54:15 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFB373D928
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 07:54:13 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id f19-20020a1c6a13000000b003db0ef4dedcso6131379wmc.4
        for <linux-samsung-soc@vger.kernel.org>; Fri, 20 Jan 2023 07:54:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fYA4TDerTEPu0uOx/k/JJ5VSwwliulVHoGh0Vp6r6Rk=;
        b=zHKN8pbtWA2Zqvq9gaapyz7cjUAOaBQVkJzV2ALDFYlFH7Y25PoyNzUt/VTLeHFI0N
         fpsb2jlwphYB4KIuFCWrY8gFFlO147FaLV02o/vjYgDjStMRoXWh/2PMbJ0bJOfbh2fS
         gzip0iNFbLmB8Bl5kO9Rro5GEtPtA5nTgQv5xCgmeJwMtNR5voV9yC4x3w/8M/oICwYM
         DGSSzW8e15fnVxCW/I76yahZwdTgeLIVFTzoKbGjx+PN7IiVRJQj9q+XbF1MiBM2JjCw
         qLLZkjmgww7fcXCKK5F95lpMInOyJ+KWs2zPlRjBL+oPTeFHGophtnuYgum6dpkaq1LF
         j6Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fYA4TDerTEPu0uOx/k/JJ5VSwwliulVHoGh0Vp6r6Rk=;
        b=gN7EY2X/eZebzgT6qN3NeLjoI16myfplOg2bD0tqD4iXaOQNOgI7OxyzUVGN+9izXg
         UMJpXY6d1RNhSAGSQdrw/jxsp+47XLMuVUjOsoT0Coor2jzSYZroSiM5omRU+vD7iAv+
         Hr/NInlIG4KTiK4v9PBV8wdGMvAYVYlTxDEfogQw+XJmLbrNHCF1WLVT9/UCUmyhmBTV
         zrhF4gPzNNp9dbaX2jh9R9gS4MhHYfNGDlpvfmFOl0xMuUaPM6KeB77rQV8OkA542QJm
         BX1Clknjs9bzvMt5OU7TQ1UvuwYKBVa7hmOWQ9fWwCAfyDabp14a+c5a3PISCTzUDma9
         zI8Q==
X-Gm-Message-State: AFqh2kpH4PlbMeqXizLI8pA/iodXVeMtqB5sHMWXmvjYz9eL376gFYGi
        AUX9cyykHNH4uKZRkPMSttXdtQ==
X-Google-Smtp-Source: AMrXdXv1YSLi5DL1n7Xx7HbG0BIrl4VhteBFDFaaeV12J9RJGifNm6gjmal2YvG/LbHh71Skx9oMYQ==
X-Received: by 2002:a05:600c:5028:b0:3db:1dea:75c9 with SMTP id n40-20020a05600c502800b003db1dea75c9mr6888614wmr.28.1674230052515;
        Fri, 20 Jan 2023 07:54:12 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n42-20020a05600c3baa00b003d96efd09b7sm3349596wms.19.2023.01.20.07.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 07:54:12 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Kukjin Kim <kgene@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     replicant@osuosl.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        =?UTF-8?q?Martin=20J=C3=BCcker?= <martin.juecker@gmail.com>,
        Henrik Grimler <henrik@grimler.se>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/11] ARM: dts: exynos: DT schema fixes
Date:   Fri, 20 Jan 2023 16:53:53 +0100
Message-Id: <20230120155404.323386-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

With this set of fixes (and few other earlier), all Exynos ARMv7 boards
successfully pass DT Schema checks! All! Hurray!

Please kindly test if I did not break any boards...

Best regards,
Krzysztof

Krzysztof Kozlowski (11):
  ARM: dts: exynos: correct wr-active property in Exynos3250 Rinato
  ARM: dts: exynos: drop unsupported desc-num in Exynos3250
  ARM: dts: exynos: correct cd-gpios property in Exynos4412 Itop Elite
  ARM: dts: exynos: align pin node names in Exynos4412
  ARM: dts: exynos: add ports in HDMI bridge in Exynos4412 Midas
  ARM: dts: exynos: add panel supply in Tiny4412
  ARM: dts: exynos: add backlight supply in P4 Note
  ARM: dts: exynos: align HSOTG/USB node names
  ARM: dts: exynos: correct SATA clocks in Exynos5250
  ARM: dts: exynos: correct HS200 property in Exynos5260
  ARM: dts: exynos: correct HSI2C properties in Exynos5410 Odroid XU

 arch/arm/boot/dts/exynos3250-monk.dts       |  1 -
 arch/arm/boot/dts/exynos3250-rinato.dts     |  3 +--
 arch/arm/boot/dts/exynos3250.dtsi           |  2 +-
 arch/arm/boot/dts/exynos4.dtsi              |  2 +-
 arch/arm/boot/dts/exynos4412-itop-elite.dts |  2 +-
 arch/arm/boot/dts/exynos4412-midas.dtsi     | 13 ++++++++++---
 arch/arm/boot/dts/exynos4412-p4note.dtsi    |  1 +
 arch/arm/boot/dts/exynos4412-pinctrl.dtsi   |  2 +-
 arch/arm/boot/dts/exynos4412-tiny4412.dts   |  8 ++++++++
 arch/arm/boot/dts/exynos5250.dtsi           |  2 +-
 arch/arm/boot/dts/exynos5260-xyref5260.dts  |  2 +-
 arch/arm/boot/dts/exynos5410-odroidxu.dts   |  3 +--
 12 files changed, 27 insertions(+), 14 deletions(-)

-- 
2.34.1

