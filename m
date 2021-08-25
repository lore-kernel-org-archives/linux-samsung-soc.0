Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F139C4320E
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Aug 2021 18:00:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 86C626023E
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Aug 2021 18:00:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239820AbhHYSBb (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 25 Aug 2021 14:01:31 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:39494 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231231AbhHYSBb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Aug 2021 14:01:31 -0400
Received: by mail-ot1-f42.google.com with SMTP id m7-20020a9d4c87000000b0051875f56b95so60680otf.6;
        Wed, 25 Aug 2021 11:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WRLkkWdhVbgA9lIzx1UEA81kci3Q6/t8zzZgUH4YfZY=;
        b=MLtTgVWaMo45VjppW2+CkAjn+Ydm+zTl1pRGS+s2LCUc4bB2p3i+GlEEW49KcPW+3H
         498iJvV2FdihC3XkTYkh8Juc+cEpx4HOQBCPt9N27reJlZSaf9eWKe0bayV8nauU0968
         FFN2CGCUSWH/da72vQ0dVPlZej2piKs2g4O6D98u00U7KYJVw/MEUvNHfG7mCVz8Urmp
         ldj8aek9lvD7O6ASIc0swdhneCxGU0vtxPyxz3h8mg+ejZEIglF3YYoEaWpxB3+fGrqc
         TfiG4OyHupICOI1Uym/N/gTUjhiPy89AmQdQFAYBVUN3/vJTcj87H3mgy9dvVc94IcMi
         Ph5A==
X-Gm-Message-State: AOAM532LPx/z+v+/Z6hhft/bT2P6lewFPL0RCqphCZeWRAzCHcyvFQM3
        upXN7z6lLFTlww66gfKZKQ==
X-Google-Smtp-Source: ABdhPJwn0kwE5EmNiYGucDrnSTHHoql4e0OiPlVlG3DzumhFmaOIT1Z/y61lWTq8NGXbrWMbNb9Ntw==
X-Received: by 2002:a05:6830:4003:: with SMTP id h3mr34317887ots.56.1629914444758;
        Wed, 25 Aug 2021 11:00:44 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id k19sm106537oiw.49.2021.08.25.11.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 11:00:44 -0700 (PDT)
Received: (nullmailer pid 3023087 invoked by uid 1000);
        Wed, 25 Aug 2021 18:00:43 -0000
Date:   Wed, 25 Aug 2021 13:00:43 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 6/8] dt-bindings: clock: samsung: convert Exynos AudSS
 to dtschema
Message-ID: <YSaFS7W9q798qqq2@robh.at.kernel.org>
References: <20210825134056.219884-6-krzysztof.kozlowski@canonical.com>
 <20210825134251.220098-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210825134251.220098-1-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 25 Aug 2021 15:42:49 +0200, Krzysztof Kozlowski wrote:
> Convert Samsung Exynos Audio SubSystem clock controller bindings to DT
> schema format using json-schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  .../bindings/clock/clk-exynos-audss.txt       | 103 ------------------
>  .../clock/samsung,exynos-audss-clock.yaml     |  80 ++++++++++++++
>  2 files changed, 80 insertions(+), 103 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/clk-exynos-audss.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos-audss-clock.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
