Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB6BC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 14 Sep 2021 21:35:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BECD361183
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 14 Sep 2021 21:35:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234245AbhINVgx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 14 Sep 2021 17:36:53 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:37755 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232047AbhINVgx (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 14 Sep 2021 17:36:53 -0400
Received: by mail-ot1-f42.google.com with SMTP id i3-20020a056830210300b0051af5666070so597138otc.4;
        Tue, 14 Sep 2021 14:35:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=nV9xXSrBUTmCzf5AiBkL6FDLbv6dEG3GHOqZwFkkyGw=;
        b=0FSH7vO/CiYKfFUKQCtw65wJmeEnSFxiem01S3pXZXxCktDkcLClrfuGPL9ptzDKK4
         4g9zLsDL/YhroSlItOVstKS3H2h+BGo5FvR/SHLwypSNhnq0rm5ItazFAnd3o5NmVj2X
         VwE7FdUm1WlJVP29gfW2r6mnG0Q7KcC+4fXdBVfq6ZMECfG0qbf2RTou2p0zvcXkQi0O
         6Compn7RoOBUR236eOR6COoOmNDk9v3cxj5ZcYsLvVa3zcAhwKRa1c/TwMQ5onB7ZBmS
         1poaGwqGhK554CxyhTFOvOOphQW2D/uGQdF04sQD1rAKiYpJaaGYU/EOZLp/k/eMAEVr
         ddfQ==
X-Gm-Message-State: AOAM532vtz8wJJrc3geVKqvzXoww3ZirJHzHeQrQYLvJ+XHyOAG2bcMI
        UyDmUGgpFTj1FT8LjbYOBA==
X-Google-Smtp-Source: ABdhPJyaI54mbxvyEqPJ8hb3jhXyeZejVuYhsxqlt4be67wj2aws/2/5Mlq8Sb+XvAJVlxqMGN3YIg==
X-Received: by 2002:a9d:7289:: with SMTP id t9mr16704656otj.273.1631655335239;
        Tue, 14 Sep 2021 14:35:35 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id v11sm2916500oto.22.2021.09.14.14.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Sep 2021 14:35:34 -0700 (PDT)
Received: (nullmailer pid 4008885 invoked by uid 1000);
        Tue, 14 Sep 2021 21:35:33 -0000
From:   Rob Herring <robh@kernel.org>
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Tom Gall <tom.gall@linaro.org>, devicetree@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Amit Pundir <amit.pundir@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        =?utf-8?q?Pawe=C5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
In-Reply-To: <20210914155607.14122-6-semen.protsenko@linaro.org>
References: <20210914155607.14122-1-semen.protsenko@linaro.org> <20210914155607.14122-6-semen.protsenko@linaro.org>
Subject: Re: [PATCH 5/6] dt-bindings: clock: Document Exynos850 CMU bindings
Date:   Tue, 14 Sep 2021 16:35:33 -0500
Message-Id: <1631655333.292425.4008884.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 14 Sep 2021 18:56:06 +0300, Sam Protsenko wrote:
> Provide dt-schema documentation for Exynos850 SoC clock controller.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  .../clock/samsung,exynos850-clock.yaml        | 190 ++++++++++++++++++
>  1 file changed, 190 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos850-clock.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/clock/samsung,exynos850-clock.example.dt.yaml:0:0: /example-2/serial@13820000: failed to match any schema with compatible: ['samsung,exynos850-uart']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1528063

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

