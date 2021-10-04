Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7423FC43217
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  4 Oct 2021 14:34:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5A12561360
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  4 Oct 2021 14:34:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234567AbhJDOgM (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 4 Oct 2021 10:36:12 -0400
Received: from mail-ot1-f51.google.com ([209.85.210.51]:34474 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234538AbhJDOgM (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 4 Oct 2021 10:36:12 -0400
Received: by mail-ot1-f51.google.com with SMTP id g62-20020a9d2dc4000000b0054752cfbc59so21772822otb.1;
        Mon, 04 Oct 2021 07:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=b7SYhJy+mmipGKEWts89mwAvqFvwTQpZ6vU+YVwAT8o=;
        b=hEfPUw8gg/leMRQFlCol/1FSZwDYvupQHUGrIjti+C7+ANb59H5RuCu3KfPtEqYo5J
         /ivxfciLxgKp+xMxWFNFHLtRNlllKAq3j/iROVVvf0yJsdB0xIS+FvhOQGF0VAOBWMXP
         hmh+3VRCfbl2pR6kQMBNtAEOvgFZpa2aup1xKUoQTy9GNdUrjWBJiMpzkeRDvqWukJqh
         38pVHutjSqq3oW/b9rbCArh6dYpcGxE2BuCvP8fMB9z8XbRFKl6T7xDKAHGRFjeVYAtA
         WEQkitMOosXRkkZHhSBYDSHd75g9FukjIL5Mb+CbyL3MRvA8mo6pylmFQMqMtrS8zcG6
         ycZA==
X-Gm-Message-State: AOAM533f8SZTNtUSsBHvZzxRZjKoh9THt16B+Lj/7TMenWSeVFSvJOH7
        v8HmkZknlmfmaerHGas4rw==
X-Google-Smtp-Source: ABdhPJwe6rrb5Yj0sByabApe27Tf5QsGwm+3X2f6wO7rmX1hV++kaHkDeQNAQZwkdTxdaXrp5UzySA==
X-Received: by 2002:a05:6830:2806:: with SMTP id w6mr9992892otu.238.1633358062874;
        Mon, 04 Oct 2021 07:34:22 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id x8sm2441884otg.31.2021.10.04.07.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 07:34:22 -0700 (PDT)
Received: (nullmailer pid 1251656 invoked by uid 1000);
        Mon, 04 Oct 2021 14:34:21 -0000
Date:   Mon, 4 Oct 2021 09:34:21 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-kernel@vger.kernel.org, Lee Jones <lee.jones@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2 04/10] regulator: dt-bindings: samsung,s2m: convert to
 dtschema
Message-ID: <YVsQ7YRDzYgtfGJ7@robh.at.kernel.org>
References: <20211001094106.52412-1-krzysztof.kozlowski@canonical.com>
 <20211001094106.52412-5-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211001094106.52412-5-krzysztof.kozlowski@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Fri, 01 Oct 2021 11:41:00 +0200, Krzysztof Kozlowski wrote:
> Convert the regulators of Samsung
> S2MPS11/S2MPS13/S2MPS14/S2MPS15/S2MPU02 family of PMICs to DT schema
> format.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> ---
>  .../bindings/regulator/samsung,s2mps11.txt    | 102 ------------------
>  .../bindings/regulator/samsung,s2mps11.yaml   |  52 +++++++++
>  .../bindings/regulator/samsung,s2mps13.yaml   |  52 +++++++++
>  .../bindings/regulator/samsung,s2mps14.yaml   |  52 +++++++++
>  .../bindings/regulator/samsung,s2mps15.yaml   |  52 +++++++++
>  .../bindings/regulator/samsung,s2mpu02.yaml   |  52 +++++++++
>  MAINTAINERS                                   |   2 +-
>  7 files changed, 261 insertions(+), 103 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps11.txt
>  create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps11.yaml
>  create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps13.yaml
>  create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps14.yaml
>  create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps15.yaml
>  create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mpu02.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
