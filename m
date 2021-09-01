Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB5EC432BE
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  1 Sep 2021 01:45:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B7BC560462
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  1 Sep 2021 01:45:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241672AbhIABqp (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 31 Aug 2021 21:46:45 -0400
Received: from mail-oi1-f176.google.com ([209.85.167.176]:37634 "EHLO
        mail-oi1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241525AbhIABqp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 31 Aug 2021 21:46:45 -0400
Received: by mail-oi1-f176.google.com with SMTP id y128so1794077oie.4;
        Tue, 31 Aug 2021 18:45:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WELW+t1VokhQBNo9UHiCqpi6VGFFmMKLQTAx9VOOrSY=;
        b=Q2wDYjgas2KnmPQXsxY2r3THZVXG8NVKdWF0S9ufLlG6/ffeFih4D4G+zR4JZnlyPd
         AGBLwddw4vk7uOWxIbLGu7JnAKkVvwQfBO6ku32JkjxxvldUHMOW0rVmfRHYmtSSZZvy
         S1Gb3Mcer5kezhs/HdrvWZRkkhhf1S0mf9mtaCV2jlKKJgzV//o14QJA1IIHHYKzBSOS
         0a8DN6RaeNn+XgYXoVJLabW2L1uvu4zuoZx29OwIPbjDSOrMc78rBkXfyalTDHiXE7jS
         +KSklObxl7iPTcQZguY2XX/DCYUG1pvTpk86H00pqz2xIBEldjSxa5fs8FVwvqPuvlPt
         y+fg==
X-Gm-Message-State: AOAM533MM1yCnPmOekce4ppd2jp91lozabaywJvbONfr4LiJxE2HVXE3
        tSoZrD/iwoLn75VS5QPYXA==
X-Google-Smtp-Source: ABdhPJxRMtTtU+FFCOlalA/6lm6+SPrgutd1eQP5u0+++swh3v0wAY1IUEdG5qN9vfraBUJplHWO3Q==
X-Received: by 2002:aca:c490:: with SMTP id u138mr5462429oif.150.1630460748994;
        Tue, 31 Aug 2021 18:45:48 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id d10sm4042159ooj.24.2021.08.31.18.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 18:45:48 -0700 (PDT)
Received: (nullmailer pid 1019162 invoked by uid 1000);
        Wed, 01 Sep 2021 01:45:47 -0000
Date:   Tue, 31 Aug 2021 20:45:47 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-kernel@vger.kernel.org, Tomasz Figa <tomasz.figa@gmail.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: samsung: fix header path in example
Message-ID: <YS7bS7YzI+UKHUtA@robh.at.kernel.org>
References: <20210831130643.83249-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210831130643.83249-1-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Tue, 31 Aug 2021 15:06:43 +0200, Krzysztof Kozlowski wrote:
> The proper header is exynos4.h:
> 
>     samsung,exynos4412-isp-clock.example.dts:19:18: fatal error: dt-bindings/clock/exynos4412.h: No such file or directory
> 
> Fixes: 7ac615780926 ("dt-bindings: clock: samsung: convert Exynos4 to dtschema")
> Reported-by: Stephen Boyd <sboyd@kernel.org>
> Reported-by: Rob Herring <robh+dt@kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> ---
> 
> The SHA in fixes tag is from linux-next. Might not be stable.
> ---
>  .../devicetree/bindings/clock/samsung,exynos4412-isp-clock.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
