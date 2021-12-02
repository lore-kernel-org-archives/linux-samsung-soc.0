Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC764C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  2 Dec 2021 08:22:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbhLBI0M (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 2 Dec 2021 03:26:12 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:46688
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232091AbhLBI0M (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Dec 2021 03:26:12 -0500
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com [209.85.208.200])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3E5D43F1EF
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Dec 2021 08:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638433369;
        bh=/yVgv1GOFqN+8AHHqsg9jJdYjVHA4XAnE27binztNiI=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=BJiPfzlpXbRfIseygfeX/To3Nfk7McxUHtPVvnqswZZRovhFUA9nj/4UQtGHU7cp8
         rBoDfLq5SnfRJ0g6ZtbP3WCCPEG9EOVOW4beCHr1W/kF82tZHii/WLRmpZAg2erQ3X
         1AmI3f++VLJ8bfa4chAy2nwro8B0A7vw7Ti1PHvVg4qWwai2LTOwbkktaia5tSXHd9
         7iJztlZFfXHAibjT57fQiEC2ebSNaQzKrisMc1ZrO6CGR61xAox4DAoh4FSqNqGhnf
         doUcdlImq8wOcWuNXwG+ec103aMV9WS3qFjSbkwfU8PtwEUct2ez5cIqYapvnwYTtC
         tHDQ0EwaLxWgQ==
Received: by mail-lj1-f200.google.com with SMTP id b14-20020a05651c0b0e00b0021a1a39c481so9293680ljr.3
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Dec 2021 00:22:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/yVgv1GOFqN+8AHHqsg9jJdYjVHA4XAnE27binztNiI=;
        b=WVpPLOyP6qCsJABXcCo0bYaET0+nxzYhhWPyvF93rDJ0ptb5RsAO/66cGeb5SOUzYa
         iMk1EWRrk9KMfX/ungVuzyDdXoFnnIU1nvHnGje1eAMRFh8qNP0F402c/NOf3AHuLCF6
         iMPhlJGXSTRD7kNkzGZGZZfPkGbCopaDDlMKlyCKBGrVHpJmEk+ulAjEnASnBdbL7ttZ
         Sn+GzGWcUjUYxDy+kOBczx0GgcDQvOjm1AwRQK7Y/JV8PLi2uQ15F2i/1eAzVJ0NBuSm
         T3A/V55UkXCuNx77KHwQDEj/EZvCo+mh6iJaUbRtY157kJq6AVOoupS963czsTq6Ax+C
         B8Tg==
X-Gm-Message-State: AOAM533nQroIacf9hQWXTInviUVClVWwklR528890z58t0nklaK74xcm
        AGbBTMXbhSVQRsVCr+Q0Zc/mFAvuru2TBTWVTYM1GxqdcaDgX9BuZjyl9C/FWYg1qRJVvcb6d0Q
        x90NDO1WkHp0zs04ODMs3nmDCC0roig8fNQzRpOSol2BXhj2T
X-Received: by 2002:a05:6512:ad5:: with SMTP id n21mr10799108lfu.460.1638433368328;
        Thu, 02 Dec 2021 00:22:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwP3ORFJiJfE5pvx7rMdaizQ6DgKbWsDyzXXT5JfQ1TAZJykEWZ1xtOgS/qz/7LRQhqd24CfQ==
X-Received: by 2002:a05:6512:ad5:: with SMTP id n21mr10799089lfu.460.1638433367928;
        Thu, 02 Dec 2021 00:22:47 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id s4sm255390lfp.198.2021.12.02.00.22.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Dec 2021 00:22:47 -0800 (PST)
Message-ID: <95e19574-8b6b-491a-3997-e0a37748d9da@canonical.com>
Date:   Thu, 2 Dec 2021 09:22:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 1/6] dt-bindings: i2c: exynos5: Convert to dtschema
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Wolfram Sang <wsa@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20211201190455.31646-1-semen.protsenko@linaro.org>
 <20211201190455.31646-2-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211201190455.31646-2-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 01/12/2021 20:04, Sam Protsenko wrote:
> Convert Samsung Exynos High Speed I2C bindings doc to DT schema format.
> 
> Changes during bindings conversion:
> 1. Added missing required clock properties (driver fails when it's
>    unable to get the clock)
> 2. Removed properties and descriptions that can be found in
>    schemas/i2c/i2c-controller.yaml [1]
> 3. Fixed the example so it can be validated by dtschema
> 
> [1] https://github.com/robherring/dt-schema/blob/master/schemas/i2c/i2c-controller.yaml
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  .../devicetree/bindings/i2c/i2c-exynos5.txt   | 53 ------------
>  .../devicetree/bindings/i2c/i2c-exynos5.yaml  | 80 +++++++++++++++++++
>  2 files changed, 80 insertions(+), 53 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/i2c/i2c-exynos5.txt
>  create mode 100644 Documentation/devicetree/bindings/i2c/i2c-exynos5.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
