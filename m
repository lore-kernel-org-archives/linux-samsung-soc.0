Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB299C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  2 Jun 2022 09:35:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233165AbiFBJfR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 2 Jun 2022 05:35:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233075AbiFBJe7 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Jun 2022 05:34:59 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00B0F2AA9AF
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Jun 2022 02:34:56 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id fd25so5509193edb.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Jun 2022 02:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=wyoF638EbARH0sNnissy0uoI8l86SU1ciSSOUZ5ajbc=;
        b=vC/lPXYlQKQCRWvnO+dwsPxV0IBdwfu+FGat/4eaqwyjYZlkNA8Q7kWCy35O3jRLSY
         vgVJRmLYxSJ/UsAxDFfKqxzROuhrA08m5zRLq7GgVthpVELzdfsLrZUGqR5uEFCzl57E
         hOuI2APRMWnU4TUOz/GbnCBSHDgDfamULrI+DqrsTItaRiutFEYLuDb5qSQwABVrWcYU
         UcOwm/MHtug7bxMemRNw3PWMnHAf5bv/e2TXGX3kJCU5L/g2ydH3tGXzaAXfpj/jdZHM
         1xmY1VDu2La1avwgq527Cxr20pKT4AquHUfpakqV7a3CFpd66NYwHNhtOGeyMhM3FFuD
         w03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wyoF638EbARH0sNnissy0uoI8l86SU1ciSSOUZ5ajbc=;
        b=a4oAVhUCziKpXGIWoLEsQ6W3q2Idlmww+t7OyO2w5wC2qc0eRmd74e3exrxEnj3xwJ
         mCFIQ587MI5gkrMGdy4ZvwDDweliLOJGWKNZ0zTkpeCUCjymmzxGohcDBMFf9pyi2Od0
         +E9UhPDiOYtvwLhyzgsf92ARfEJt4HFwheOCwnv9Gk8gUD3j4rI5p3HNaMAbbkpTzxbR
         ipaHxFGCBZ8Awajs/VmTSfA1Ejt0zsEFy8lNKPfuNvrgjxvogdfM5TtSnm/M2/l3GmRm
         0a9K/hee5iXvlkCwxukeWfxElY3nToVo1G8wB+L+ZiRNi4lE+ZVpM90Mj3zEf++NZiJS
         Kkgg==
X-Gm-Message-State: AOAM530YZ/i9E192U6q2gB0YeMwJm+ZGInLfVw0i4w/kcp7kNrZkxXga
        TMCxIXvbpVL9PeOpuqcakqA1/A==
X-Google-Smtp-Source: ABdhPJzjN7cmR9MX0Q1VRsFNcfISVEPshK1uHFtZjtnqfk81TisLcbq3RvXrPTHivGPhu/w9r5XYmQ==
X-Received: by 2002:a05:6402:1857:b0:42d:bcd6:3a88 with SMTP id v23-20020a056402185700b0042dbcd63a88mr4399524edy.6.1654162495560;
        Thu, 02 Jun 2022 02:34:55 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id h10-20020aa7de0a000000b0042dd1584e74sm2157302edv.90.2022.06.02.02.34.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 02:34:55 -0700 (PDT)
Message-ID: <44fceb66-fd33-4b2d-fe8e-9a1a5837a51a@linaro.org>
Date:   Thu, 2 Jun 2022 11:34:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 1/6] dt-bindings: phy: samsung,ufs-phy: make pmu-syscon
 as phandle-array
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220602053250.62593-1-chanho61.park@samsung.com>
 <CGME20220602053329epcas2p4c2baca2d161814f5d51dc48722f904b1@epcas2p4.samsung.com>
 <20220602053250.62593-2-chanho61.park@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220602053250.62593-2-chanho61.park@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 02/06/2022 07:32, Chanho Park wrote:
> To support secondary ufs phy devices, we need to get an offset value
> from pmu-syscon.
> 
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  .../devicetree/bindings/phy/samsung,ufs-phy.yaml    | 13 ++++++++++---
>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
> index f6ed1a005e7a..d0ba92aa578d 100644
> --- a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
> @@ -40,9 +40,16 @@ properties:
>        - const: tx0_symbol_clk
>  
>    samsung,pmu-syscon:
> -    $ref: '/schemas/types.yaml#/definitions/phandle'
> -    description: phandle for PMU system controller interface, used to
> -                 control pmu registers bits for ufs m-phy
> +    $ref: '/schemas/types.yaml#/definitions/phandle-array'
> +    items:
> +      minItems: 1
> +      items:
> +        - description: phandle for PMU system controller interface, used to
> +                       control pmu registers bits for ufs m-phy
> +        - description: offset of the pmu control register

This does not work... Please test your bindings with different cases.

Best regards,
Krzysztof
