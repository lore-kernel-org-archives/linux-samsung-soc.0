Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 900E6C4320E
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Aug 2021 17:59:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7A0E06113A
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 25 Aug 2021 17:59:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241389AbhHYSAg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 25 Aug 2021 14:00:36 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:40593 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230112AbhHYSAg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 25 Aug 2021 14:00:36 -0400
Received: by mail-oi1-f171.google.com with SMTP id h133so513771oib.7;
        Wed, 25 Aug 2021 10:59:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TX3UIEco/WcX1QTQiBsHb+XZL4fHTE0jssR9S6SDXjs=;
        b=jvLwNZWer8boQhIg8ALFTzRexQ7q/JA9M/WkPrS5p1P7WlDb4Ia+z6YSeA0RRiCf/F
         pxsuyCNn1boGR3xq9MiJjsuKTj7B+AFOkCl2IG9BaJ/vP6USyQ1v/4KXOAUIKqrU+DiP
         ZrV4pgKQbHKZTqxXugHf0AaS3W84sIQzqNCb42XP/w0gDmiS0Vn9cK4n42D7PfDk9vgU
         u2bYOG6NeGHBu0Ge/doKUH3NMxGkqPMe7a+Fz2gdY8OBnxGfSsbuz93O+qXu7Cgu5n1J
         a/ITyF/u9B8FmZq/vJruSRZTa8FWLuL9FkqYlav1vUqX3RvrMV/gOgrDQdA8CFG6wzQP
         t8nA==
X-Gm-Message-State: AOAM532hIrSedDm2qLh1Rs6zltttVEVj8Dy+SLezPOmi0Q+5SHnqJTNH
        lhIHnNLdvS+AF0OMkwEMHg==
X-Google-Smtp-Source: ABdhPJyLDhhTET9Bbo0fEZleYpXDXbcIqjtWa6nz/KlEkU6AP5qCCfDx7ZbfW1wfA/FwWV61WUPyYw==
X-Received: by 2002:a54:4008:: with SMTP id x8mr7712361oie.113.1629914389688;
        Wed, 25 Aug 2021 10:59:49 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id r25sm122276oic.13.2021.08.25.10.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 10:59:49 -0700 (PDT)
Received: (nullmailer pid 3021634 invoked by uid 1000);
        Wed, 25 Aug 2021 17:59:48 -0000
Date:   Wed, 25 Aug 2021 12:59:48 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        devicetree@vger.kernel.org,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-samsung-soc@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 3/8] dt-bindings: clock: samsung: convert Exynos542x
 to dtschema
Message-ID: <YSaFFEU2/7jTK1VQ@robh.at.kernel.org>
References: <20210825134056.219884-1-krzysztof.kozlowski@canonical.com>
 <20210825134056.219884-4-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210825134056.219884-4-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Wed, 25 Aug 2021 15:40:51 +0200, Krzysztof Kozlowski wrote:
> Merge Exynos542x clock controller bindings to existing DT schema.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  .../bindings/clock/exynos5420-clock.txt       | 42 -------------------
>  .../bindings/clock/samsung,exynos-clock.yaml  |  9 +++-
>  2 files changed, 8 insertions(+), 43 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/exynos5420-clock.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
