Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79A5AC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 21 Jan 2022 18:33:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351193AbiAUSd0 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 21 Jan 2022 13:33:26 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:56632
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1346191AbiAUSdZ (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 21 Jan 2022 13:33:25 -0500
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id F378B3F4B6
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Jan 2022 18:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642789998;
        bh=mXZlfPhqAVSv8NPi2Pl5gmTb003b75PhYIJqXglSUqA=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=ScuZp+mU2eQzCYxHGTbCUXx7f5+4brJfbIrULXfQn6Mk11IT6Fm6vIB1kc2pmCHCb
         2+SDmdw6ozBrYVVdgG7KkY0ctNYlM0/0Wg7XFWjE5rsM1db83ffEkV2BU+sbSqJGkH
         QT64XNHOqXXdUW/vZplcAAqd8hvXyNRQHysG6TPEXm/z1F+HtPfZlH4da0IiBP6s/O
         G3pYka3XCDOUhbyqAh5QdIsIJXVAN0wGcYx+lFyWLUIJQfQkEzfnE3bHmZI9CVDnIX
         K8Q/jIYYsoArOSp/PEnbiE2JjIAKLY2Ei6O9Y1VCE/R5jKIRqM3OzlWWGyDVNEbzUe
         Sa6jcpBew5Ozw==
Received: by mail-ej1-f72.google.com with SMTP id q3-20020a17090676c300b006a9453c33b0so407877ejn.13
        for <linux-samsung-soc@vger.kernel.org>; Fri, 21 Jan 2022 10:33:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mXZlfPhqAVSv8NPi2Pl5gmTb003b75PhYIJqXglSUqA=;
        b=iIalCEAh2piE0uoO8l7Jd7iduWDZqmj9H84bqsTIBph7x4YCP5QscMF+/Jbflc0wjB
         7QtMr/o2P/NFOyW7vPyr0XKB0lSt7a6DlmBsZEox3rMv2t4WL9xs//vK6Dpu3YZ5TP0Y
         6DPPFoZd1H+ItnRBvWMugCMOcWI+Bp7VzNS3TvUQehgxzwuVZrjZs7IeiueDk93m1C7H
         ImDAnwTsy4EoCdvhEJupPkC+AY/vc9HI4FHXluAkdGxe1ZiUQIhA9UFwC/Xc6NvV597N
         /IJQsYT+jzHjaunyT3KvJeEcCwBpWL+96+pPBCGmJ3eU8Vl32HzeFeGN0V+x0q1dXetF
         Wy6g==
X-Gm-Message-State: AOAM533XtI7RDGkR+kqujwIT+hoy9UasitjHrF4+idfz/PCLEF98GWRA
        5G00ow8EcS+m1iS0JLDZdbKjzWBD5iOQWU/L3NaYUC1BqPez6KlTezR4mktoWe3jNWdE8Brj6WZ
        vQ7eHx9iJtVueFjwJ1PEjpvAN4RFdUPjZ1lyqkP8Fwznxam7M
X-Received: by 2002:a17:907:7858:: with SMTP id lb24mr4306543ejc.629.1642789997390;
        Fri, 21 Jan 2022 10:33:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzOKjPuqYPtjHGgNKA+6097tyEbgBqQY22vvlACKfaO33upCODhf6sV7Otiz0IHhhh/a2hzSQ==
X-Received: by 2002:a17:907:7858:: with SMTP id lb24mr4306522ejc.629.1642789997159;
        Fri, 21 Jan 2022 10:33:17 -0800 (PST)
Received: from [192.168.0.51] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id e11sm2268231ejd.188.2022.01.21.10.33.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Jan 2022 10:33:16 -0800 (PST)
Message-ID: <aa172f14-2328-fc7c-0063-5c0033970d1d@canonical.com>
Date:   Fri, 21 Jan 2022 19:33:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 1/3] spi: dt-bindings: samsung: Add fsd spi compatible
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linus.walleij@linaro.org,
        robh+dt@kernel.org, linux-samsung-soc@vger.kernel.org,
        pankaj.dubey@samsung.com, broonie@kernel.org, andi@etezian.org,
        linux-spi@vger.kernel.org, linux-fsd@tesla.com,
        Adithya K V <adithya.kv@samsung.com>
References: <20220120192438.25555-1-alim.akhtar@samsung.com>
 <CGME20220120193613epcas5p238851849d212e01d7d830d78ca7d6379@epcas5p2.samsung.com>
 <20220120192438.25555-2-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220120192438.25555-2-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 20/01/2022 20:24, Alim Akhtar wrote:
> Adds spi controller dt-binding compatible information for
> Tesla Full Self-Driving (FSD) SoC.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Adithya K V <adithya.kv@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  Documentation/devicetree/bindings/spi/samsung,spi.yaml | 1 +
>  1 file changed, 1 insertion(+)

I think you forgot to mention - in cover letter - that this depends on
my Samsung SPI bindings conversion to dtschema.

I'll be sending v6 of it after merge window, with minor changes.

> 
> diff --git a/Documentation/devicetree/bindings/spi/samsung,spi.yaml b/Documentation/devicetree/bindings/spi/samsung,spi.yaml
> index 61c77088e8ee..bf9a76d931d2 100644
> --- a/Documentation/devicetree/bindings/spi/samsung,spi.yaml
> +++ b/Documentation/devicetree/bindings/spi/samsung,spi.yaml
> @@ -21,6 +21,7 @@ properties:
>            - samsung,s3c6410-spi
>            - samsung,s5pv210-spi # for S5PV210 and S5PC110
>            - samsung,exynos5433-spi
> +          - tesla,fsd-spi
>        - const: samsung,exynos7-spi
>          deprecated: true
>  
> 


Best regards,
Krzysztof
