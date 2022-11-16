Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 862DCC43217
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 16 Nov 2022 09:30:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232401AbiKPJaQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 16 Nov 2022 04:30:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232082AbiKPJaP (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 16 Nov 2022 04:30:15 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0228312ACB
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Nov 2022 01:30:15 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id c1so28568567lfi.7
        for <linux-samsung-soc@vger.kernel.org>; Wed, 16 Nov 2022 01:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3xDpe3WqLIJ4vWlNtEKnmXozr/q5qKt2awRyjeyGr8=;
        b=cKDokkgwNoTPGUU+9LGCv0aFdwy+mxnCu2is5Bw7otXZunpg4GbYBPW4ePEkZlyk+5
         V6OlzN61lg3bDAI6B9Qq6TlYwGyW7V8T8dpoD/szCqC3TLiqQZDbJqGgJh7NDczxG1FQ
         6QkSKI8yseUr0XhAo0IRZll5XLQu86Ud7f0xCXASoWvvFZeadtraDvskBkK9VlBZrmpI
         /MArBfL2AVRDL2VfJk15aqyMDXS0IJnorn0EPBvCepJBRomkkfENamNHrf/lrd4JcT22
         NCIzvluLHjCN2UO05Gd6bzSoGIordncKC5qBj5L2PzjpuYJQXPtlbg5pm3sE0GZqVT69
         8anQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W3xDpe3WqLIJ4vWlNtEKnmXozr/q5qKt2awRyjeyGr8=;
        b=LmFMbYrTYvij2xPsrhz0IcNIfyZlhiSVCB4PrB8KLghh4sivLdANCGq8cjvWOc86x1
         g4Vx81wAmnm7NuJQYmHH6zvnFhKZkkKyLjHPhs+96fgPr0HERGM/UFERAb8d0YrHwVy7
         k96K3lkHTPeOGfMK4OhKdbn5lftTHuchCI7zgCMDhwrfaeg6oG9LSTwRgjcyJezyopMZ
         DGg8Brzl4Tyc7twt2bV6XxS+0XyXwDMquXHDwgU1hk02sX8k3V3JVT+qJofYnUmwnflf
         YyJh+MlXMXxYAEZbpIhhJx0A+69J+t81KmF1sfLaAGFkVJUAk4qJU6K5s5U4ez1l0FZ5
         pdww==
X-Gm-Message-State: ANoB5pkwBZ0GsA6G5s25AuXFAlwMaxaIRePsYWt3tSjvdDbhWWPQz14R
        8Ttc3sQ+1BxXYT7s/cpOXtKmKA==
X-Google-Smtp-Source: AA0mqf6FXWk24nAVgpV7mXl+2LnsfzbOAjXFhyukT+R5ZHoVyTJf0CF1npAn/gGfDcYBSiK6aftIHQ==
X-Received: by 2002:a05:6512:360e:b0:4a2:6907:98d8 with SMTP id f14-20020a056512360e00b004a2690798d8mr6515285lfs.28.1668591013337;
        Wed, 16 Nov 2022 01:30:13 -0800 (PST)
Received: from krzk-bin.NAT.warszawa.vectranet.pl (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s18-20020a197712000000b004b18830af7asm2517325lfc.54.2022.11.16.01.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 01:30:13 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        arm@kernel.org, soc@kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/2] arm64: dts: samsung: Pull for v6.2
Date:   Wed, 16 Nov 2022 10:30:10 +0100
Message-Id: <20221116093010.18515-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221116093010.18515-1-krzysztof.kozlowski@linaro.org>
References: <20221116093010.18515-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.2

for you to fetch changes up to 21f6546e8bf68a847601e2710378e2224bf49704:

  arm64: dts: fsd: fix drive strength values as per FSD HW UM (2022-10-18 09:24:00 -0400)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.2

Correct pin drive strength macros (names) and values used on Tesla FSD
SoC.

----------------------------------------------------------------
Padmanabhan Rajanbabu (2):
      arm64: dts: fsd: fix drive strength macros as per FSD HW UM
      arm64: dts: fsd: fix drive strength values as per FSD HW UM

 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi | 34 +++++++++++++++---------------
 arch/arm64/boot/dts/tesla/fsd-pinctrl.h    |  6 +++---
 2 files changed, 20 insertions(+), 20 deletions(-)
