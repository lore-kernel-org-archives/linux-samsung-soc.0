Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0DEDC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 10:05:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B1C766120F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 21 Oct 2021 10:05:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231599AbhJUKHq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 21 Oct 2021 06:07:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231334AbhJUKHp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 21 Oct 2021 06:07:45 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAAF1C06161C
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 03:05:28 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id g39so84038wmp.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 21 Oct 2021 03:05:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=oIH6k1XfPCF96hkeJmQ/V6bxdGFbUJnWDssZcAqRTzY=;
        b=i9elGL2KOdJr21TYKpPwPqF2Ed6pVqMrhbLgYEm/YzWdXjz5ej2k+8RA/HeWs3y1UM
         m+1kqifhiAezk8d37neSSwx0E5GeLB013riEmWc4GNV4YZLtwcEQxOMkO0R7A64Jymhd
         r2mGiVIH51zNWkWZEno8sqZGxzTD6yW2ReQbS1StzmpGRZfTAzk7rRh8WyL2xPQUKB3R
         iTO9eikiHEE+Aaaiofend/6KEVan5Y7PfSDxzguPIGVlSbyVlQpI3iiMB5UN0gkMRot1
         rOja8Ar2V1Cdm5KyEIJEXdkyXCOUxwN/hV9/duisLbaSafOCsNH2VfIPzNhZ7fBLH7rB
         WlPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=oIH6k1XfPCF96hkeJmQ/V6bxdGFbUJnWDssZcAqRTzY=;
        b=bZK3jprmWx+jd4omMkGAtlz7R3Ucd0pl4BB59QEnWi3aVpx942DHdHFvOczzGsjSTL
         MLjSY7XBr2XDfnBKvnb6PZsuKTgdmQYlJ22G32+6zu/+vvQD9bjrhCq/1qCkL7K3qzK1
         I4+jW6fVfyjFR0q78ad9UFmVPuFIWWihVuS72FVJjev+oALeSLVe0sl7CaKgG8vy5php
         +WKsktaH5Sj8zwG/vMwEQTaYCLG0rEa765xfxIc46oY1kAeNxKm14aPnVcy6VQsZWbOy
         StXmAE8ifTB5umCrvmg9uCuPiOm2CWwDF0ATvRP86uV0FdXozyc4zMx9ZG/ON0dGODmB
         BAHA==
X-Gm-Message-State: AOAM531txtEUVNygJMsm2cEYwm7h4Mbz+3xpkvzgp1d4kZf+beMiJ3c0
        2Dv1JJF4cH5RYrVeOWIWaY5B9A==
X-Google-Smtp-Source: ABdhPJxUffGbnUtoh7hvbaVzELl4gWQ9sa8upJ2oBins4SrKokc63t6y32KmJLQ1KVlIKM58P1Vszg==
X-Received: by 2002:a05:600c:ac1:: with SMTP id c1mr5385767wmr.99.1634810727463;
        Thu, 21 Oct 2021 03:05:27 -0700 (PDT)
Received: from google.com ([95.148.6.207])
        by smtp.gmail.com with ESMTPSA id 36sm4226905wrc.92.2021.10.21.03.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Oct 2021 03:05:27 -0700 (PDT)
Date:   Thu, 21 Oct 2021 11:05:25 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Chanho Park <chanho61.park@samsung.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: mfd: add samsung,exynosautov9-sysreg
 compatible
Message-ID: <YXE7ZVjHBKlaynWa@google.com>
References: <20211010032246.146939-1-chanho61.park@samsung.com>
 <CGME20211010032456epcas2p2b56e49dcc5973224b26725cb8b7589b3@epcas2p2.samsung.com>
 <20211010032246.146939-2-chanho61.park@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211010032246.146939-2-chanho61.park@samsung.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On Sun, 10 Oct 2021, Chanho Park wrote:

> Add document Samsung's Exynos Auto v9 compatible for system registers.
> 
> Cc: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
> index abe3fd817e0b..75dcbb741010 100644
> --- a/Documentation/devicetree/bindings/mfd/syscon.yaml
> +++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
> @@ -55,6 +55,7 @@ properties:
>                - samsung,exynos4-sysreg
>                - samsung,exynos5-sysreg
>                - samsung,exynos5433-sysreg
> +              - samsung,exynosautov9-sysreg
>  
>            - const: syscon

Amended the subject line and applied, thanks.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
