Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A12C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  4 Oct 2021 14:32:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E7636108E
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  4 Oct 2021 14:32:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234349AbhJDOdx (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 4 Oct 2021 10:33:53 -0400
Received: from mail-oi1-f182.google.com ([209.85.167.182]:33363 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234201AbhJDOdw (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 4 Oct 2021 10:33:52 -0400
Received: by mail-oi1-f182.google.com with SMTP id 24so21802302oix.0;
        Mon, 04 Oct 2021 07:32:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=q9RpayVmV6dz7BE0rFofENAU5jVyhNoIcnSv0poP0Ow=;
        b=FlI7ix+7PfH3/yRxG538x+KNUagB1ygk6uIQEYeHtiM+Kk53gzPho3WWN+kLip+H3y
         Uwg6a535mWkNjz2T7OswhJ8xXGXi4wDZeDzV1bm3uB37G+W06vmFyAPdrjmYxtd20yjz
         tJ4kVTTrNObFv5h7w1PNegtGXI3Bg7J3qmoCYLykRpX5CERVwXC+z9TnEfD/53z8k7AI
         2jssnGlpgqTPu/fKnYsRSM5ILfMke5xISjBHYgnhwYqKuRUjeXJQ7Xp0Whc+tLqxrUDv
         9PahcXY01DX7FVnJLwOJG2wJ9sqvH0lmr0DzMhZCzbs1NNUetEL8F0+VWoHhet9m4M/S
         QxBg==
X-Gm-Message-State: AOAM5304uDl8gRHs66Wv2xirVLT4XPLjeHR38ix4fcxzPM6KNJ6zDVwD
        lBW2RF+AgarKsgqwwJXiKA==
X-Google-Smtp-Source: ABdhPJz8ctFv6k91eGqdhbNzgQH2rc5RqKI1GU8kBpw45f0kwDChGQUvPqHMsyVjdYn03lAKyAuJ2Q==
X-Received: by 2002:aca:aa12:: with SMTP id t18mr13675233oie.25.1633357922564;
        Mon, 04 Oct 2021 07:32:02 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id d7sm2907554otl.19.2021.10.04.07.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 07:32:02 -0700 (PDT)
Received: (nullmailer pid 1247990 invoked by uid 1000);
        Mon, 04 Oct 2021 14:32:01 -0000
Date:   Mon, 4 Oct 2021 09:32:01 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Lee Jones <lee.jones@linaro.org>,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v2 03/10] dt-bindings: clock: samsung,s2mps11: convert to
 dtschema
Message-ID: <YVsQYV1sA7m8l5LN@robh.at.kernel.org>
References: <20211001094106.52412-1-krzysztof.kozlowski@canonical.com>
 <20211001094106.52412-4-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001094106.52412-4-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 01 Oct 2021 11:40:59 +0200, Krzysztof Kozlowski wrote:
> Convert the clock provider of Samsung S2MPS11 family of PMICs to DT
> schema format.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/clock/samsung,s2mps11.txt        | 49 -------------------
>  .../bindings/clock/samsung,s2mps11.yaml       | 45 +++++++++++++++++
>  MAINTAINERS                                   |  2 +-
>  3 files changed, 46 insertions(+), 50 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/samsung,s2mps11.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
