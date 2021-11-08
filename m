Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C354FC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Nov 2021 13:24:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1D6A61361
	for <linux-samsung-soc@archiver.kernel.org>; Mon,  8 Nov 2021 13:24:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239929AbhKHN1P (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 8 Nov 2021 08:27:15 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:33352
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239916AbhKHN1P (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 8 Nov 2021 08:27:15 -0500
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E9F483F1AF
        for <linux-samsung-soc@vger.kernel.org>; Mon,  8 Nov 2021 13:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1636377869;
        bh=/hm+frlIkfRbj18ggfJvfVA8HIIe4O3xDAkmIFBlwTA=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=hvj/p9QVRPgZgyraQkuJmkl3g81QfPNufnJx3+nZLSgxNCnagVrS9pk74wv9Ow7U3
         Jm/DRwLsosyUIZtTyro6Pasm6uP0FAeRe8zFOHdd1NXyk/ntJyEK9aYwxIdStd8FT1
         ZAPXZwuBJgDSBoqqdzVmUmGJbjLr9PzDy30Fl9bCgzYon8OpGoIa4JtvwpEP5mazi7
         tDaYJMKo5CNk6lQ4j0D//jrtZR+TXuinsi+Vp1SxfZuSKsXZ0FAMZt3rVCfzbX926L
         +eHhLDD4FzB+88/b9JPk0ko4HD2hCKOYUJ+m7xOI0q3XEvPEnq119P9yihpZsU4cRx
         Y9zK7hNefPhhA==
Received: by mail-lf1-f72.google.com with SMTP id d2-20020a0565123d0200b0040370d0d2fbso1677832lfv.23
        for <linux-samsung-soc@vger.kernel.org>; Mon, 08 Nov 2021 05:24:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=/hm+frlIkfRbj18ggfJvfVA8HIIe4O3xDAkmIFBlwTA=;
        b=eNMOXhGcm0F5rCAU2Zj4kxM4BvvAumox+TM+r/Y0Hhsc1Ah3Pb4oJVANu2Unr693ql
         McigpPhG4BMX11Ddx8F8QAQlhtULY8PeHo6uJX+og32G+/4j4qdRoDfr/QjWiyfFV9Mz
         XeJEURaY0lhAnEEccq0Xo/B7r+NbM4xMMpDhAauiex1XF3KuF5qAEV57wMsXf/1xDuKd
         jNnp6XbVhjLeVjE2fz8E/VechG/YFMD/JQjl7Tc8GNZ67s0729Zzkw8wKkiiVqYZan7m
         xr2kLybriebfYI78dl9o39Iz6s3xLuoky8r7mJAjhiHepqjTIbUi/MufU2wS3R9rFU+K
         05QA==
X-Gm-Message-State: AOAM531gxyBJBHV0lnHVgLmY7pthdVaRpOFHX48TfGWMD4qDHRTSOTHI
        OEfY0oElUEdeYf3f/WragvZzc5hpsZcyjsa+d+j83lPpjm/7cm2HNRIEpYdoHrrAW6Lps+Lcz4b
        N5lUVrE5EBzdfc1v6Tqx6SDjWdzpAp2GSrLDRnaD+t5vUFiYP
X-Received: by 2002:a2e:3803:: with SMTP id f3mr10888422lja.460.1636377869431;
        Mon, 08 Nov 2021 05:24:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyjqrwH68UZei4PQ8gNRPh9hkUMStu/9MMdUsMdfRFhdPTou/EX5PUQAI5rB4VsmqAfR/889Q==
X-Received: by 2002:a2e:3803:: with SMTP id f3mr10888395lja.460.1636377869193;
        Mon, 08 Nov 2021 05:24:29 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id l2sm1182683lfg.290.2021.11.08.05.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 05:24:28 -0800 (PST)
Message-ID: <f1a28b8f-c27d-19ae-a993-3fbe614d17b3@canonical.com>
Date:   Mon, 8 Nov 2021 14:24:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v3 10/12] watchdog: s3c2410: Support separate source clock
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
References: <20211107202943.8859-1-semen.protsenko@linaro.org>
 <20211107202943.8859-11-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211107202943.8859-11-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 07/11/2021 21:29, Sam Protsenko wrote:
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
> Changes in v3:
>   - Removed has_src_clk field: clk framework can handle NULL clk; added
>     s3c2410wdt_get_freq() function instead, to figure out which clock to
>     use for getting the rate
> 
> Changes in v2:
>   - Reworded commit message to be more formal
>   - Used separate "has_src_clk" trait to tell if source clock is present
>   - Renamed clock variables to match their purpose
>   - Removed caching source clock rate, obtaining it in place each time
>     instead
>   - Renamed err labels for more consistency
> 
>  drivers/watchdog/s3c2410_wdt.c | 56 +++++++++++++++++++++++++---------
>  1 file changed, 41 insertions(+), 15 deletions(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
