Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A701C4320A
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 17 Aug 2021 20:19:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3503361058
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 17 Aug 2021 20:19:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236518AbhHQUUA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 17 Aug 2021 16:20:00 -0400
Received: from mail-oi1-f172.google.com ([209.85.167.172]:45584 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236938AbhHQUSY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 17 Aug 2021 16:18:24 -0400
Received: by mail-oi1-f172.google.com with SMTP id o20so883010oiw.12;
        Tue, 17 Aug 2021 13:17:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BRV4zmXn5jTTvavh3m20YKmUEK6C6ibq+natBfMZOAY=;
        b=MkBXD233upJx16jnXtm1JRTgDkap/bKVqZ6vbC1cUAh1KGSaF1IGuIBBfeer/PKBya
         YlO1Vm0/+BKE2xUIbjpjpH6KDXlZesDkC+Y5qq7tTTbfqxFLlgvSeKD55agEJoDbPPjz
         S1dANB2I40deezxMNnrNnyO0b+vgFAa4Bm14Id0TfLvEPIjUj1OkXT8qmvzNXJhSUnpr
         lMWBpyAlC2l21oQe9a34dHvWVcvj4ngxUDK6xM1hfwsMnGiQnsfcJOcWmdvw4n77LLHh
         bTSEa8JcvNeq1j2nj/iXSy1nAIOVjn4Q5zgqZkgA7Vcobq/3L8vgQVgZuFe9eNyp2ljI
         Qc0A==
X-Gm-Message-State: AOAM532ZPhLFZmDo2/CiAhMqH4epYk5SPXkdumx83fvxu4JFV70mBApf
        AwZG5h+kHL/45pWHPqeWDQ==
X-Google-Smtp-Source: ABdhPJwOi1I6FPwfpmiu0Ei5Sk1mif5Vuxanx0y9mSs6BaIRHliKJyQLbDJzXGBOAEBHrNVOGIi3Ag==
X-Received: by 2002:aca:31c1:: with SMTP id x184mr3886578oix.8.1629231470019;
        Tue, 17 Aug 2021 13:17:50 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j6sm588904oii.36.2021.08.17.13.17.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 13:17:49 -0700 (PDT)
Received: (nullmailer pid 770116 invoked by uid 1000);
        Tue, 17 Aug 2021 20:17:48 -0000
Date:   Tue, 17 Aug 2021 15:17:48 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Tomasz Figa <tomasz.figa@gmail.com>,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2 2/8] dt-bindings: clock: samsung: add bindings for
 Exynos external clock
Message-ID: <YRwZbBEbbO/bL7gl@robh.at.kernel.org>
References: <20210810093145.26153-1-krzysztof.kozlowski@canonical.com>
 <20210810093145.26153-3-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210810093145.26153-3-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 10 Aug 2021 11:31:39 +0200, Krzysztof Kozlowski wrote:
> Document the bindings for Samsung Exynos external to SoC
> (oscclk/XXTI/XusbXTI) clock provided on boards.  The bindings are
> already implemented in most of the Exynos clock drivers and DTS files.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../clock/samsung,exynos-ext-clock.yaml       | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos-ext-clock.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
