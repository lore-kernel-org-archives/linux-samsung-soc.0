Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7016BC6FA99
	for <linux-samsung-soc@archiver.kernel.org>; Sun, 12 Mar 2023 17:26:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbjCLR0R (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sun, 12 Mar 2023 13:26:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229754AbjCLR0Q (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sun, 12 Mar 2023 13:26:16 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E675D36689
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 10:26:14 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id z5so10329586ljc.8
        for <linux-samsung-soc@vger.kernel.org>; Sun, 12 Mar 2023 10:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678641973;
        h=subject:in-reply-to:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JtCwiValjsr2h1P8SRv71t+eIe5q6n+42gVTAnSj95M=;
        b=eIY5rJpyzV6ZeZ8iT0ZoDVT1kmKGPFM95g0Nb0ISAQWVMqN4JxjE6851aT6YGf6HNo
         oygENKWWFOSWwovYQV/Ub5F3ohyaMXfLSnOcozhke+CQZeuuzHrD5xeBFYoKHd8HB3Ar
         qBzo4OoDJweA5PoNxfOz1q8rqqAg9a9M/SxJf2EBM5WRwKFbVPf0CFzytf5XlWE3010J
         s5tO3jv5RXkcYPXquoPB6YsdbUq+VUBnkjlMIKlKTTI/xVnpuRAKvm7eHIUnn7oYCgns
         Afo/EYMhFFKb5X/d9Z5JWeABkuQ5ajGBNLIsDUWA0pQtepZdPf/R/BqYgUuusJulZPKU
         vjFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678641973;
        h=subject:in-reply-to:cc:to:from:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JtCwiValjsr2h1P8SRv71t+eIe5q6n+42gVTAnSj95M=;
        b=qCxSOxv1qas/1LvhEziq+Xym7VjZraqXMV8/0mKQF3uQh6Scmg3CuRh3RE7l5s8mF4
         6dg/Qa0HeaoESblYOXnzA4LzFNNRwgTRHR0dRxTuUHzmbSk1pjkhswakY+DfLChSzxy4
         oHO9eP3tHXKMUJYknxT1LvWK/orQ9uV2li1M4LyOHA4HdszLoVuADxUMiKBoVOvjqOvg
         SSC6bdEw8l23hysccK33IceeFUFk3ZwSi49IpHpvacSrV9w2blLCEaOeRrTsLm+yEYva
         hsnH/SdwL25XQ6elTl64hjHFQDaEC4j3HkMFa0vKOo1fnP92x2EF7VSntm7+N3EJvQS7
         fkpw==
X-Gm-Message-State: AO0yUKVy5Rvf2Nbku9a30cwS2nO3l5eexEp6DQOStaPfvaReYQ7ePPrS
        Y8UGvPoSz1B8q3Itta6w+jh6x62NFxcZh7ok
X-Google-Smtp-Source: AK7set+9G7zAze3olDUr76FvwTOqdQM2Ndgl/WFr0468sobmV/5zqiSTAiu8F6sqeNX9S5szD9T11g==
X-Received: by 2002:a2e:3808:0:b0:295:a207:5378 with SMTP id f8-20020a2e3808000000b00295a2075378mr9444570lja.9.1678641972903;
        Sun, 12 Mar 2023 10:26:12 -0700 (PDT)
Received: from letter7.txt (46-138-144-249.dynamic.spd-mgts.ru. [46.138.144.249])
        by smtp.gmail.com with ESMTPSA id x8-20020ac259c8000000b004db9dbe09c6sm716578lfn.89.2023.03.12.10.26.12
        for <linux-samsung-soc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 10:26:12 -0700 (PDT)
Message-ID: <640e0b34.c20a0220.3d73f.19c3@mx.google.com>
Date:   Sun, 12 Mar 2023 10:26:12 -0700 (PDT)
From:   Sergey Lisov <sleirsgoevy@gmail.com>
To:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Jaehoon Chung <jh80.chung@samsung.com>
Cc:     linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <f34ba6e5-4a8d-0812-c334-ea47de7b1d21@linaro.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: exynos-dw-mshc-common: add exynos78xx
 variants
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

> Thanks for letting me know.
> 
> https://elixir.bootlin.com/linux/v6.1-rc1/source/Documentation/devicetree/bindings/writing-bindings.rst#L42

OK, at least its codified somewhere. Still, this results in the opposite
effect: DTBs written for one SoC, using compatibles from other SoCs just
because "they are the same anyway". And doing this properly, well, results
in essentially duplicate compatibles.

And "fallback compatibles" won't solve this case anyway, as there is no
common compatible that denotes "Exynos7 DW-MMC that has the bug".

>>> That's non-bisectable change (also breaking other users of DTS), so you
>>> need to explain in commit msg rationale - devices were never compatible
>>> and using exynos7 does not work in certain cases.

Probably it makes sense to put this patch after the actual implementation,
so that git bisect always gives a working setup.

> BTW, this rationale was only example - you need to come with something real.

Pretty much the only thing that is broken are SDIO cards, because they run
very short transfers (below the DMA threshold) over the data lines. That's
exactly what I stated.

