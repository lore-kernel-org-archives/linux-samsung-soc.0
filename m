Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28424C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  7 Jan 2022 07:47:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236024AbiAGHrg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 7 Jan 2022 02:47:36 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:44684
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234484AbiAGHrg (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 7 Jan 2022 02:47:36 -0500
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 53D9F4001B
        for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Jan 2022 07:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641541655;
        bh=PdugAwOKj5OweNcK0/97VfSiKgWNV0xCmwKuJGhwWoE=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=uEBUumSQwUxDSX+8q4UuuyyDBmXgq/LhLCAnGxShgh7U/w3R+ccT2HASdO2Eu1+FK
         egKmBVbaY8z8XwyaTkCSIkG0RTlNZXoLM8ggrzI7pdxy7dgX/L6XmOI3xmssuNFJKU
         QUKAkN+jBHVX2OP1Bl7jNk6FhCJoKKRvB5Ltvdu11Nm0GfhHrtv29ceKc19m98t25t
         omwSrWlA9xL13qzZLaibbimIYj3UO19rlvyNIBo3NrZ8jzXmXPChJTcU5eaUjxZUDs
         Lbf249DI/LSXnj5Gi161tUBPKc8v5LQu11Ti6OyYMrN8EBdDHYF8nxxCcPXf24SV2M
         5K0RsrbrM6J0g==
Received: by mail-wm1-f70.google.com with SMTP id m19-20020a05600c3b1300b00346af84fd7dso654527wms.7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Jan 2022 23:47:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PdugAwOKj5OweNcK0/97VfSiKgWNV0xCmwKuJGhwWoE=;
        b=rT6z3Rlw3J44NQHCM3/wbng+qPHLaeD+PTROWQKIBe0X/U+mhS/hd4VDBU28Yg8B0e
         4ndeI8b/64oGjxxPDBYPg/nhlTBoFUjMAT9/73a9Jh+99b6kka91/8uAtQMSaYcvYRz6
         3jbLsmTE+ioPw+mXcsLfgW3pZfo8F88YChl8JGpL48xHaekxd4ftWnmgyMJewkHiWgiZ
         izDCR2ppl1lp+P3BTf8W8+tHTbKg0ERaZw+10bjJ3ZklDh8ExltejNikZoTAMFk724PX
         /BIY4qKqMagkNHqQgDHMdp1t6q7vU7ThGwCb/w2anDIorlTjirbZ5USxw+Xh7kCsjvbI
         4SGg==
X-Gm-Message-State: AOAM530f7Q1jyb1NBDkt52z1gogDWhRXb8GPBEYsns1uUKw/CpuYmfSJ
        bl2ptixz4HpS8Kkv740/RFnE5tQ5iHq1ij+45JFyPQZqOgRDB+OTenyssGJs5neS34ATXD8GkSi
        v4bLQuViq88Q6lHpnxHwnYlQBOy8DKYzxEw/5Xa1gerq2IfW1
X-Received: by 2002:a05:600c:34c8:: with SMTP id d8mr10369570wmq.94.1641541655028;
        Thu, 06 Jan 2022 23:47:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBTfZa15VkS7xNqxo/0lg4qbFu1EvIdIy6O7U40/j2g0LzvxAKZFECt3AXaHWvqWXpOlO3KA==
X-Received: by 2002:a05:600c:34c8:: with SMTP id d8mr10369553wmq.94.1641541654841;
        Thu, 06 Jan 2022 23:47:34 -0800 (PST)
Received: from [192.168.1.126] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id w8sm1271049wrs.41.2022.01.06.23.47.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jan 2022 23:47:34 -0800 (PST)
Message-ID: <66754058-187e-ffd5-71ba-4720101f5d98@canonical.com>
Date:   Fri, 7 Jan 2022 08:47:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [RFT][PATCH 3/3] arm64: dts: exynos: drop incorrectly placed
 wakeup interrupts in Exynos850
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Jaehoon Chung <jh80.chung@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>
References: <20211230195325.328220-1-krzysztof.kozlowski@canonical.com>
 <20211230195325.328220-3-krzysztof.kozlowski@canonical.com>
 <CAPLW+4mDWg1xAGEALNVN1vs8jb3rzH2VqEBfacTkM_gNxeuhRg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAPLW+4mDWg1xAGEALNVN1vs8jb3rzH2VqEBfacTkM_gNxeuhRg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 03/01/2022 22:09, Sam Protsenko wrote:
> On Thu, 30 Dec 2021 at 21:53, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> The pin controller device node is expected to have one (optional)
>> interrupt.  Its pin banks capable of external interrupts, should define
>> interrupts for each pin, unless a muxed interrupt is used.
>>
>> Exynos850 defined the second part - interrupt for each pin in wake-up
>> pin controller - but also added these interrupts in main device node,
>> which is not correct.
>>
>> Fixes: e3493220fd3e ("arm64: dts: exynos: Add initial Exynos850 SoC support")
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
> 
> Tested-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> 
> Despite some errors brought by this change:
> 
>     samsung-pinctrl 11850000.pinctrl: irq number not available
>     samsung-pinctrl 11c30000.pinctrl: irq number not available
> 
> the interrupts seem to be functional still. Tested on E850-96 board,
> by pressing buttons connected to gpa0..gpa1, and checking
> /proc/interrupts info. I guess it's ok to merge this one as is, and
> then work further to fix the driver (or dts?) accordingly.
> 
> Also, I submitted related patch ("arm64: dts: exynos: Add missing gpm6
> and gpm7 nodes to Exynos850"), please take a look.
> 

Several Exynos850 pinctrl banks use exynos_eint_gpio_init, so they need
the interrupt property (for external interrupts). Otherwise external
GPIO interrupts won't work. The ones you checked, could be the external
wakeup interrupts which are not affected here.

This change seems wrong. Instead one interrupt should be left. However I
don't know which - should be described in reference manual in interrupt
sources.


Best regards,
Krzysztof
