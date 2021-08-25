Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C8B0C4320A
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Aug 2021 18:00:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C4E6610E8
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Aug 2021 18:00:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241387AbhHYSBG (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 25 Aug 2021 14:01:06 -0400
Received: from mail-oi1-f180.google.com ([209.85.167.180]:38909 "EHLO
        mail-oi1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242390AbhHYSBD (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Aug 2021 14:01:03 -0400
Received: by mail-oi1-f180.google.com with SMTP id u25so532381oiv.5;
        Wed, 25 Aug 2021 11:00:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SjZYAc+CzBfvGwYehqHA5XhyFyAkvf3Xf4yLc1LCyO8=;
        b=s2eNTXv3jPVQ2b8NHftLfnNL+DHuYzVrtVNRryTVi30p9mhl0lbqIwe4k5bmV81qnx
         5Ys0aRapgPX7EAcCeBwr5WUoGQ3bw43k4YytPAQWQTlO1wry1sypwsZazXre/+IAdf0t
         favBWxbOs0YzzLhgKeay4RxkyaVRc6lsYzY4gRVts9J4c0LBviPprhuuTqGiADrW3nZG
         rJpuxTt4W60XxWr7IChiJGwp7ZfaTG+CYlm+9GrfRAq2R/qmVFTTrqWy1R4wOQvEnePG
         VzjVrljG2OKQvpCpCrurAw6sAScxnHIjByXZmTZTpX5pPFgUTfoLDjJbbdCzCBaOH//t
         sMZw==
X-Gm-Message-State: AOAM530QlgZzKt3oqmGWDAmb3pxgKIGTI7rtQFQrr0w2jF5Lvm5B7jhg
        Ud/Sufk+JhtuTKjhvzuDlw==
X-Google-Smtp-Source: ABdhPJwo5HsTSMzhVqr1Q1tJm/ToYs8A0NU8qfnSGGNhFZbGy2QDRsXrg7LexVTV0gskBRPeZON6dA==
X-Received: by 2002:a05:6808:1586:: with SMTP id t6mr7871039oiw.83.1629914417392;
        Wed, 25 Aug 2021 11:00:17 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id v126sm123609oig.2.2021.08.25.11.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 11:00:16 -0700 (PDT)
Received: (nullmailer pid 3022375 invoked by uid 1000);
        Wed, 25 Aug 2021 18:00:15 -0000
Date:   Wed, 25 Aug 2021 13:00:15 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        devicetree@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 5/8] dt-bindings: clock: samsung: convert Exynos4 to
 dtschema
Message-ID: <YSaFL6maujTOnSh3@robh.at.kernel.org>
References: <20210825134056.219884-1-krzysztof.kozlowski@canonical.com>
 <20210825134056.219884-6-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210825134056.219884-6-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 25 Aug 2021 15:40:53 +0200, Krzysztof Kozlowski wrote:
> Merge Exynos4210 and Exynos4412 clock controller bindings to existing DT
> schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/clock/exynos4-clock.txt          | 86 -------------------
>  .../bindings/clock/samsung,exynos-clock.yaml  |  3 +
>  .../clock/samsung,exynos4412-isp-clock.yaml   | 64 ++++++++++++++
>  3 files changed, 67 insertions(+), 86 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/exynos4-clock.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos4412-isp-clock.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
