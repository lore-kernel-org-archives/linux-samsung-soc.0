Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C4EFC001DC
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 20 Jul 2023 19:00:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229785AbjGTTAY (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 20 Jul 2023 15:00:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbjGTTAX (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 20 Jul 2023 15:00:23 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D30D81999
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jul 2023 12:00:21 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fbc0314a7bso1769143e87.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 20 Jul 2023 12:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689879620; x=1690484420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xQomNpUaX8uEuBKLwEgdMw8BMnEp+ihhGySSLvfuPvQ=;
        b=FX36kePffn8oO/SylinhQV1prpyYkkLn9n2P8LG0ylZBgKM3nAkDCr2A3WA8E8tsvS
         EkBwldvEyv7aUsH0n2fJ/4BfNbMgKXrawRNMUYZlEV1FfuERM4sdYzweYiaDYkyJIhcn
         tuHSiH2gbTl+vZ62o1YwSsCwrWmogoiPU5qetOHYW1Pnfdd6WTY4bS8taVa60ulpA5Aw
         neIqhOMvInzdr86rRkxMiDpTy4gz22OfTFWKaZQu7tYQxBQbpVYJgUnuRmdCMvjiuvZm
         DQqwaP/IhEBTa6+XMOx00eIFoVwFFjoTcQx7y/p05H7QWXvMKsqf8hnGk0kR1YofGPVY
         APhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689879620; x=1690484420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xQomNpUaX8uEuBKLwEgdMw8BMnEp+ihhGySSLvfuPvQ=;
        b=WiCwCtJlYSBpSl/QUAEusk/T772xQuuGVGDNDUKZ/o3NZk1jNy+J+429jAX8uODwlB
         i0ATG0eD0E2VJjGJZ14oG9aoQYQPoa5almQTexYlL3dYntueodMR0H1pFBOcggjjWqjT
         0w+T7+6b9bjqpPzpMGefUIZ8vd4aJmPjK5rFx4Mik4tu8ufLTqVTZjx0k3M7TedYiCWb
         pb04SowiYuRm6e/3NgBLzeq9mryl7XkqRBpClSbO1nnmvq7axQvJIHdMjpRN1cID0Yp0
         gwnDLn1XRUR3MD5NzrEVBdVLhpocw9cCxQvTosH1A2ZnTIidajQukoMvzJQ2clo934+l
         rFvw==
X-Gm-Message-State: ABy/qLacZTVFX+ye+oanFPTsBr0QMZnTaStVK6ayBR1e79TdtQA+nhhS
        ts1EdCjAcqeewRhMDYT+h4Rusw==
X-Google-Smtp-Source: APBJJlHNK5A0jQzfJn/iSThb8HvAs7//k63YuMJ5ypEXy0+a4A09R0hYl+8G2OlfcGYXLF756Zzz2g==
X-Received: by 2002:a05:6512:5d0:b0:4fb:90c6:c31a with SMTP id o16-20020a05651205d000b004fb90c6c31amr2096440lfo.14.1689879620147;
        Thu, 20 Jul 2023 12:00:20 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id s22-20020aa7d796000000b0051e2a5d9290sm1104842edq.77.2023.07.20.12.00.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 12:00:19 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Russell King <linux@armlinux.org.uk>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh@kernel.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: s5pv210: Explicitly include correct DT includes
Date:   Thu, 20 Jul 2023 21:00:15 +0200
Message-Id: <168987960900.215967.3313655352230014454.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230720172751.2918776-1-robh@kernel.org>
References: <20230720172751.2918776-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On Thu, 20 Jul 2023 11:27:51 -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it was merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> [...]

Applied, thanks!

[1/1] ARM: s5pv210: Explicitly include correct DT includes
      https://git.kernel.org/krzk/linux/c/3027df7e739c4f3768690bc59f022a0af8e6712c

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
