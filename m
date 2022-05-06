Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97EA7C4332F
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 May 2022 08:14:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351853AbiEFISe (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 May 2022 04:18:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376981AbiEFISa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 May 2022 04:18:30 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C2E067D29
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 May 2022 01:14:48 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id d5so8977985wrb.6
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 May 2022 01:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LPR6X1/5iNCBXtbnX66uCQIutWnYnxxfF1cQKI0F89Q=;
        b=WkgG6WSI+10URWnnxADk2gnFNJ7bptdLwRVp9djlHAJC/eaWKg+rXuPJzFeQPcUeHl
         SHeiu6I3qjq+3S2C3cHTMGmjMtaSjtzM6AUGz3j+6feJSWcS1V8tocQrlzRQiPUWCZPj
         A4QMzUMgK4vgIxb6Th1x+SuKo3MpBBoYOqPE973ci0+XE2odjSfElW+xsTMCEn1MB/51
         z3kSIDhW+Oogj9KYFayjIRwjW+sWf3slUb0V5Nhw9MGo4H4pyI8Z7PBDrtrRb2d3WMg6
         30Ro0MpSLWlBluimv7AU1fxMvVbfFx+avJzVYX/n8Co07R48PseO7Q2FxwI4lOfupNM2
         u8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LPR6X1/5iNCBXtbnX66uCQIutWnYnxxfF1cQKI0F89Q=;
        b=7n/0wPTzgvg+zQSaGCmbzuKG5cJ3to+ijRP2M+GhcqQFsz1TlXf9JNgYaFNVtgzYxX
         IQnd1Q2SJU/nejoDTNfcqmZZlHo9N6oNBEJVfywV+xiRt6FJHxJZPzOAAT+G1mfs5ncj
         XHYow4IfScWVlDmxUEfdayInyEn6c/k9kw8bJdNkXkaGBw/Y5Yeme9EUTUsTQaRK7+Js
         FlpZvtnjhu1EyH9GTzcvR4tkImDjeSc63wXZKyvnIbbIBugQOXRLvJaTxB0Bdhkhzh1E
         fbjtC5Ma1XpCarLHviOwQK+SpkCb+Ed94BMu13dbfwEM1IHlHUuKQ65eAHbr5pnEqSI7
         Vu4g==
X-Gm-Message-State: AOAM5315CmOSA3QSGsXiZ1tRx1HBC2PLQy2QdYrybrfJgdu0HOWAbpOY
        G04JQnMd9676aOVjZUgE/1zOIg==
X-Google-Smtp-Source: ABdhPJxCwSWKm1pKbetAWMNdn/ekJKOLq/QpcIQOJBTr93TqXwZyP5/HYHS/ZW6GosYHPQbbllOCgQ==
X-Received: by 2002:adf:dc0e:0:b0:20c:8a3f:b523 with SMTP id t14-20020adfdc0e000000b0020c8a3fb523mr1673836wri.201.1651824887180;
        Fri, 06 May 2022 01:14:47 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id c14-20020adffb0e000000b0020c6fa5a797sm3059657wrr.91.2022.05.06.01.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 01:14:46 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 4/6] ARM: dts: samsung: pull for v5.19, part two
Date:   Fri,  6 May 2022 10:14:36 +0200
Message-Id: <20220506081438.149192-4-krzysztof.kozlowski@linaro.org>
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

Best regards,
Krzysztof


The following changes since commit 9e916fb9bc3d16066286f19fc9c51d26a6aec6bd:

  ARM: dts: s5pv210: align DMA channels with dtschema (2022-04-09 18:50:05 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt-5.19-2

for you to fetch changes up to d414b7a3f370d640cff544a3aa3a41abf34fd5d6:

  ARM: dts: exynos: drop useless 'dma-channels/requests' properties (2022-05-04 10:23:27 +0200)

----------------------------------------------------------------
Samsung DTS ARM changes for v5.19, part two

1. Cleanups: unused and undocumented dma-channels and dma-requests.
2. Correct compatible of Samsung EEPROM on S5PV210.

----------------------------------------------------------------
Krzysztof Kozlowski (3):
      ARM: dts: exynos: add atmel,24c128 fallback to Samsung EEPROM
      ARM: dts: s5pv210: drop useless 'dma-channels/requests' properties
      ARM: dts: exynos: drop useless 'dma-channels/requests' properties

 arch/arm/boot/dts/exynos3250.dtsi               |  4 ----
 arch/arm/boot/dts/exynos4.dtsi                  |  6 ------
 arch/arm/boot/dts/exynos4210-universal_c210.dts |  2 --
 arch/arm/boot/dts/exynos5250-smdk5250.dts       |  4 ++--
 arch/arm/boot/dts/exynos5250.dtsi               |  8 --------
 arch/arm/boot/dts/exynos5410.dtsi               |  4 ----
 arch/arm/boot/dts/exynos5420.dtsi               | 10 ----------
 arch/arm/boot/dts/s5pv210.dtsi                  |  6 ------
 8 files changed, 2 insertions(+), 42 deletions(-)
