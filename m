Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA76C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 13 Jan 2022 13:32:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235150AbiAMNcR (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 13 Jan 2022 08:32:17 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:56374
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232034AbiAMNcQ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 13 Jan 2022 08:32:16 -0500
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 87316402A5
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jan 2022 13:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642080735;
        bh=t1fGsqpmZOTRML60TK0WG2DkdgMd68nNzRyjYpnjGrc=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=jYsOTEgE3KfenEN846ufUBSnZscWv6h6ToOyACG77/eCrIvIYHxKiibwzUx+KNzWf
         6oW+RVXUTnA95igJtm/KeuwSGMxCGkZufyX/7DCEdncZ+UTt/dKYazp6BmEN4ixj4v
         WD3RkFmrxJoHsaHKBg2A6embbrEp34Sxbn1OxRM/lrxku+lGGrEcXuRedLm4n8ugrP
         lP9Wgu1On4pA0qiEMRQnLH2+iidLP94WYRLHuGSXrf6YEIOi1vGXrwCvUP1RM2GgI2
         TosSz2bfKHKNxxa13/w0XCTB8/+00ybc2QS8VzOW90U1k+Brj+A8Tcr4STfzKxlnlb
         8vI5PO8Go/q9Q==
Received: by mail-wm1-f72.google.com with SMTP id 14-20020a05600c024e00b0034a83f7391aso2312785wmj.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 13 Jan 2022 05:32:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=t1fGsqpmZOTRML60TK0WG2DkdgMd68nNzRyjYpnjGrc=;
        b=bLXtW7OhkTV+gtgaAv2oqfSmyW1WoVfDAhYX10W6ZPvkt2NZXghlTZHNFU9U0p8Ezx
         h6tAVhyURnaZfuO7VDAu3rWVfX22r444kdLOWjHD5YKq8DNSdeoqXBeTywoh9cp5HF0j
         eWCc4+rnLXPAlb0DD8IINjZtZmaXeMRDYoI96SEUKB0fPpuDdLgTeyXy3g4jh8AXiJUN
         UW9qMHpJE00516Wudsscf5NA/Pd/sDtu2rOXOAbNwAYWvIj1UgVlu3qEegMJE92i55Yo
         4xEeVteajtOn8JY+kvbbnT/OhracbmUdS2bFz9kvUFOEeFSUBqRsDbEKPrAISQyHTi8F
         DRUw==
X-Gm-Message-State: AOAM532/pbAJNM0mJVrGD4zT2/6L1bm6263NRBpFi5r+GtUxDv0a/WzI
        X2NHbFFbtEqQL7fhKGN4PckvB+x15ti5jgZx3rfq91cEs3JbfTMlRHpCf3/zBaaX5atkWKN3EO6
        gspxRR1Kkr3v5QDE4cm9Dpcw/Zjc+37A8vO01r08087GelNrV
X-Received: by 2002:a05:6000:18af:: with SMTP id b15mr4109163wri.616.1642080733701;
        Thu, 13 Jan 2022 05:32:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwGbdSMulTQPsY60UuoLAuZAuY6P+aX+jB+ZR3YiMMLRRXKaWDybBcgGidUepwKg+fmquMeJg==
X-Received: by 2002:a05:6000:18af:: with SMTP id b15mr4109138wri.616.1642080733499;
        Thu, 13 Jan 2022 05:32:13 -0800 (PST)
Received: from [192.168.0.30] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id h10sm3615799wmh.0.2022.01.13.05.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 05:32:13 -0800 (PST)
Message-ID: <75ae8b8c-e416-5007-b995-f1317ef207d4@canonical.com>
Date:   Thu, 13 Jan 2022 14:32:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 20/23] dt-bindings: iio: adc: exynos-adc: Add ADC-V3
 variant
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com, Tamseel Shams <m.shams@samsung.com>
References: <20220113121143.22280-1-alim.akhtar@samsung.com>
 <CGME20220113122447epcas5p266d44c8df143229d22dfa700c285a786@epcas5p2.samsung.com>
 <20220113121143.22280-21-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220113121143.22280-21-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 13/01/2022 13:11, Alim Akhtar wrote:
> This patch adds a new compatible string for exynos's ADC-V3 variant.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Tamseel Shams <m.shams@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  .../devicetree/bindings/iio/adc/samsung,exynos-adc.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> index 81c87295912c..9303053759ca 100644
> --- a/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/samsung,exynos-adc.yaml
> @@ -14,6 +14,7 @@ properties:
>      enum:
>        - samsung,exynos-adc-v1                 # Exynos5250
>        - samsung,exynos-adc-v2
> +      - samsung,exynos-adc-v3

Please use SoC-specific compatible. IP block versions are tricky because:
1. Documentation/datasheet mentioning which SoC has which block version
are not public.
2. Neither are public the datasheets for ADC blocks.
3. The versioning of IP blocks can be inaccurate.


Best regards,
Krzysztof
