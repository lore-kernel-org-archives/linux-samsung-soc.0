Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 036C3C6379F
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 11 Feb 2023 06:40:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbjBKGkE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 11 Feb 2023 01:40:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbjBKGjv (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 11 Feb 2023 01:39:51 -0500
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62C25CA0B
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Feb 2023 22:39:50 -0800 (PST)
Received: by mail-oi1-x235.google.com with SMTP id s17so6239548ois.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 10 Feb 2023 22:39:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zOL/t5qBo5/69OTBXU9K1Tb25sSUsXIonQCXIzPu+54=;
        b=tHzsDq4HNF/rGckcDAHo6fj26lDoOoe8KuraYxDcWmx6Ab6WvmFZNUpMBfyQiBvqgI
         btoJcI59TQYSEby+Gk2LMtpPuYRtCCTyxoAwIEFrHLQYqOWlRBjSBY/JpZPDgVWVm/Gx
         bU9nioRCt9gDLYDPfdFzAVX8za0DNIsaDYU1T/wVrbTpaAeVEcZXDu6FzlKZgE+ONwfz
         Pb1gwRd/I6CPVImHkEIyt/+J8QRcvHsXKZ/2NNStdJMfOitEAq46X8PYgw3ERHh0n3KB
         jiD+fo6MciNYEau+57gvTTE6VfzQ8mRs099+rIlIuDXN7U2x51xcAivUl+qhuMhWx5u5
         59pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zOL/t5qBo5/69OTBXU9K1Tb25sSUsXIonQCXIzPu+54=;
        b=Gjb9sUEfN7e85EYghBORQtj0Q4cbcfFO14mnshdtZoQTsqGxOUAeu6HFOVLOSczU5D
         oqCINarWfCYYzrokl++ndB+CGQJUsW44LNvTqPmP4aWLXvR4Ddq2GxcS3Qbu/z1WhFi0
         1nevOrtzJt7LWN1iizYbDnuBhL8Cs9HCljDpVXBufhdrJGn0ORj/1WaOtxV0HdG+V3b+
         ekdMjBb1CXmQnhcSsIg4SXzWUBbh7kW3L7yonkKp4+5gz8e461iNyowQUu15+pwMfF3R
         a7XMsG7ku/nhXcO7nlSHuUYXVO/A0rO3uJL7c8bydNiYq4y6Ds/w+b8ZnUUe0WTVr5Yz
         R3mg==
X-Gm-Message-State: AO0yUKV93RTG1/RnMsMF6qiJVwzsdBVRvPGoq4ot8E5EYEMAj5Lhk46q
        T4Tkwq0/8vPMRhnxAk3UjdDW3ke2Wi2H10AMzxY=
X-Google-Smtp-Source: AK7set+HnpNlRcQyXbCbbLqOkb0wDhIY0ti/vlL9ybU+Qhg2C9bTqXY/4LfABv+YVA51snNn1EpSTg==
X-Received: by 2002:a05:6808:b13:b0:35e:d30c:e918 with SMTP id s19-20020a0568080b1300b0035ed30ce918mr8027850oij.39.1676097589646;
        Fri, 10 Feb 2023 22:39:49 -0800 (PST)
Received: from localhost ([136.49.140.41])
        by smtp.gmail.com with ESMTPSA id w8-20020aca6208000000b0037832f60518sm2977541oib.14.2023.02.10.22.39.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 22:39:49 -0800 (PST)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     David Virag <virag.david003@gmail.com>,
        Chanho Park <chanho61.park@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/6] clk: samsung: exynos850: Add missing clocks for PM
Date:   Sat, 11 Feb 2023 00:40:00 -0600
Message-Id: <20230211064006.14981-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

As a part of preparation for PM enablement in Exynos850 clock driver,
this patch series implements CMU_G3D, and also main gate clocks for AUD
and HSI CMUs. The series brings corresponding changes to bindings, the
driver and SoC dts file.

Sam Protsenko (6):
  dt-bindings: clock: exynos850: Add Exynos850 CMU_G3D
  dt-bindings: clock: exynos850: Add AUD and HSI main gate clocks
  clk: samsung: clk-pll: Implement pll0818x PLL type
  clk: samsung: exynos850: Implement CMU_G3D domain
  clk: samsung: exynos850: Add AUD and HSI main gate clocks
  arm64: dts: exynos: Add CMU_G3D node for Exynos850 SoC

 .../clock/samsung,exynos850-clock.yaml        |  19 +++
 arch/arm64/boot/dts/exynos/exynos850.dtsi     |   9 ++
 drivers/clk/samsung/clk-exynos850.c           | 139 ++++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |   1 +
 drivers/clk/samsung/clk-pll.h                 |   1 +
 include/dt-bindings/clock/exynos850.h         |  28 +++-
 6 files changed, 194 insertions(+), 3 deletions(-)

-- 
2.39.1

