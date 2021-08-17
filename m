Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E856C4320A
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 17 Aug 2021 20:21:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0178361073
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 17 Aug 2021 20:21:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235497AbhHQUWW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 17 Aug 2021 16:22:22 -0400
Received: from mail-ot1-f41.google.com ([209.85.210.41]:37732 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235035AbhHQUWM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 17 Aug 2021 16:22:12 -0400
Received: by mail-ot1-f41.google.com with SMTP id n1-20020a9d1e810000b0290514da4485e4so23582144otn.4;
        Tue, 17 Aug 2021 13:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NzsIevEU5WeelnPBu9DnNmMmZ5sHyyheMHnAU3HVb4s=;
        b=Yz8ERtUWl54NKmaTEStPYT1ehXWRS6wmfZWZnUIQieOvYHWWA+MmaMMKLY3Ehnwr9p
         ji4V4XAqmGHg+op0Gz6yVyshhwkdJsWnmnkknqcWHYJJHBCUb4RBIF4zFr4HH2+quhx1
         IkOsYd7sowRvQWtH4kJMy+CuGWSZM8+xJASt2O1Fohytn8Aw78FdKew9AzPQv9/XD4t6
         bn1eVMx3ABcJ0bpPeJYarvazZbNcM9LDzyDje1PBY1fZXOWv5JfNgTJ02eQE91E2Zhtm
         JIqk3pTGgLEqnATe8lWSlcyoGek79uMhlcdkdN37IN3jkx/DqwSlUHYUBD6Bo9C7bduZ
         9hpQ==
X-Gm-Message-State: AOAM532TjVBrVJs27JQSuXiqP/ZZbyWxf6rSI/k3gJZCRK2IpPlM2ulH
        6rWBhelVBWnhpeqxTxaNPg==
X-Google-Smtp-Source: ABdhPJywXnfuTUNc6dev4YeJN4ME+JKYokZs+YEoP8X17i6xLxk0qGgwMM78TLfBsyn6H9cfNb34cg==
X-Received: by 2002:a05:6830:2470:: with SMTP id x48mr4104683otr.103.1629231698485;
        Tue, 17 Aug 2021 13:21:38 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u14sm606829oth.73.2021.08.17.13.21.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 13:21:38 -0700 (PDT)
Received: (nullmailer pid 775280 invoked by uid 1000);
        Tue, 17 Aug 2021 20:21:37 -0000
Date:   Tue, 17 Aug 2021 15:21:37 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Rob Herring <robh+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        Michael Turquette <mturquette@baylibre.com>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/8] dt-bindings: clock: samsung: convert Exynos3250
 to dtschema
Message-ID: <YRwaUVPHIIlxOjkx@robh.at.kernel.org>
References: <20210810093145.26153-1-krzysztof.kozlowski@canonical.com>
 <20210810093145.26153-5-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210810093145.26153-5-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 10 Aug 2021 11:31:41 +0200, Krzysztof Kozlowski wrote:
> Merge Exynos3250 clock controller bindings to existing DT schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/clock/exynos3250-clock.txt       | 57 -------------------
>  .../bindings/clock/samsung,exynos-clock.yaml  |  3 +
>  2 files changed, 3 insertions(+), 57 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/exynos3250-clock.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
