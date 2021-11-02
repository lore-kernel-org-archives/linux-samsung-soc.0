Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39628C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 10:15:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19FD060F4B
	for <linux-samsung-soc@archiver.kernel.org>; Tue,  2 Nov 2021 10:15:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbhKBKST (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 2 Nov 2021 06:18:19 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:33524
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229783AbhKBKSR (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 2 Nov 2021 06:18:17 -0400
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A619A3F1B3
        for <linux-samsung-soc@vger.kernel.org>; Tue,  2 Nov 2021 10:15:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635848142;
        bh=DQUpFUGZ13OCH5xFHghe2q73BFVerQ09LvF/JJEZVyI=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=Xp/QWP2bnD1hWBlIlP3z2V4+ZFMjIsH98Ps6eWDUWTSTUegLlEiEDe+ywZQ5Rt/J9
         229QWYG5e0+bXFdN3m+6s+OmISfWxI8fXYieETJFD8ZrhyDF+X0Gaxvpwa7HeQyEyD
         R1Y3pyBgeiI74wYumIG3HFL0ZVdSG9c34mYlcuz2qV1DZtTmeFWKKtQqwx8g6VERoG
         pJZ1iki0GhqlxuJPvL2DsN235HpOy32hU6qZB82i7FqYLa5P7lyuPl/m4PAXI821jx
         bOB9wGj2ppf34UuxefCTjfSTKJpzdg3wSWttM+bCHxqMJMaSKqcn7/CovvkVn1uXxA
         Ju3/gIFVhbB5w==
Received: by mail-lj1-f199.google.com with SMTP id j1-20020a2eb701000000b00212ac0666acso7159426ljo.18
        for <linux-samsung-soc@vger.kernel.org>; Tue, 02 Nov 2021 03:15:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=DQUpFUGZ13OCH5xFHghe2q73BFVerQ09LvF/JJEZVyI=;
        b=WjYfzlDXyTis4OSgt7lvRtnfQ88+n4wy3qo9mVfAjYN5fiWRsUKs64F0rZ3I6FB5MB
         2VtpfuV6xi5w95W9hHDCF2ImqOOMRXvESB1DKIU6L7jG1xN185LEjSInqR0iKXhbpJs7
         22ViCD80w1vNxF3/3knU3l2Wn9Hzud8W/gHXDOkVPeF7KMtgKQrt4MJoXeBKDY26W9lU
         pE2PQy6bnOUcqoReP5nXrlqdPjj+iFFwZxqWmUEqxFpT5oxVOPoC7j0voDDy+twyrHRS
         YaKgkUizrx/meDajnEa0ZyBzGpLgJqOBkRSl+V4Alv6IsgKmAz5uiMD//G1IVm5H3Ypo
         WpAA==
X-Gm-Message-State: AOAM530j6+N2TjT8vzPQ0qgQR8IwIGqrM1DyNAjK5hbjJLN9/XM0JMtR
        xIkcQ4v3l0ewLeWwxl9kgAtVmynA7M8V0l0hNmwP/f1OW33aRhVAr8vPa4gRwe+ko+APdLiOTVF
        /War20A9stZO7DYBQqH82oiupeVYI+X6qFond3Dc3/idQP9KP
X-Received: by 2002:a2e:bd88:: with SMTP id o8mr27745388ljq.197.1635848142109;
        Tue, 02 Nov 2021 03:15:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw19yBZU62Ix4yX551lPGweiYYrsBhZngk9OZDYsebEsKVhmI7gih9ogLJHPeQH/3HIlK/ycQ==
X-Received: by 2002:a2e:bd88:: with SMTP id o8mr27745341ljq.197.1635848141759;
        Tue, 02 Nov 2021 03:15:41 -0700 (PDT)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id y7sm709265ljy.88.2021.11.02.03.15.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Nov 2021 03:15:41 -0700 (PDT)
Message-ID: <a63f37a9-ea04-2606-e4f5-1170c4e59db2@canonical.com>
Date:   Tue, 2 Nov 2021 11:15:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH v2 10/12] watchdog: s3c2410: Support separate source clock
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211031122216.30212-1-semen.protsenko@linaro.org>
 <20211031122216.30212-11-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211031122216.30212-11-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 31/10/2021 13:22, Sam Protsenko wrote:
> Right now all devices supported in the driver have the single clock: it
> acts simultaneously as a bus clock (providing register interface
> clocking) and source clock (driving watchdog counter). Some newer Exynos
> chips, like Exynos850, have two separate clocks for that. In that case
> two clocks will be passed to the driver from the resource provider, e.g.
> Device Tree. Provide necessary infrastructure to support that case:
>   - use source clock's rate for all timer related calculations
>   - use bus clock to gate/ungate the register interface
> 
> All devices that use the single clock are kept intact: if only one clock
> is passed from Device Tree, it will be used for both purposes as before.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v2:
>   - Reworded commit message to be more formal
>   - Used separate "has_src_clk" trait to tell if source clock is present
>   - Renamed clock variables to match their purpose
>   - Removed caching source clock rate, obtaining it in place each time instead
>   - Renamed err labels for more consistency
> 
>  drivers/watchdog/s3c2410_wdt.c | 52 +++++++++++++++++++++++++---------
>  1 file changed, 39 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index fdb1a1e9bd04..c733917c5470 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -118,7 +118,9 @@ struct s3c2410_wdt_variant {
>  
>  struct s3c2410_wdt {
>  	struct device		*dev;
> -	struct clk		*clock;
> +	struct clk		*bus_clk; /* for register interface (PCLK) */
> +	struct clk		*src_clk; /* for WDT counter */
> +	bool			has_src_clk;

Why do you need the has_src_clk value? If clk_get() fails, just store
there NULL and clk API will handle it.

Best regards,
Krzysztof
