Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72E7DC433FE
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 16 Nov 2021 09:32:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 50AC161B62
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 16 Nov 2021 09:32:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233202AbhKPJfA (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 16 Nov 2021 04:35:00 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:54210
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233126AbhKPJe6 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 16 Nov 2021 04:34:58 -0500
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 654643F1FC
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Nov 2021 09:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637055120;
        bh=ehnfGawteeyhlUwbu9+j2LLxbkkJ0pH25hQdNnnLslo=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=NkF+4eN3useUEmAi9ecSikJGhKCsE0fGJEdo2mq2EoZml1cr48d/afa1K5saYBtij
         ugaIRKmlPS5Qw5XQHBXquHXoGfRlOzEjB8X66IHJNPpmvw5PoEkNvL+wVB234xaDMR
         9VG8MoGZAKuFvYx1ii5kP14LVKEiduJZViEjWM/IbZdW2wiSo0sX8oe2VTKuL9WUru
         tC3X0P/WWLcO9KAmDxXYnatV3wd1eRe0Ec2fEaDAlKsEXawGE49dUXA1/VgWIY1Z8p
         esuCFW5DZiE7/4x17/bZecbOXF68klj72OmXaMpzoLuza0iDNyPSyVyenXTwrlBsJ5
         iifHBr025pdcA==
Received: by mail-lj1-f197.google.com with SMTP id q13-20020a2e750d000000b00218c953d0b8so6025472ljc.21
        for <linux-samsung-soc@vger.kernel.org>; Tue, 16 Nov 2021 01:32:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ehnfGawteeyhlUwbu9+j2LLxbkkJ0pH25hQdNnnLslo=;
        b=D2/21hLpONeIyPPR3g71ddJAk34Thtm+humvLNtw45Re+MlQjL8aDVCfU4MxY2V7OX
         9F15ED5HhTQ9jr5pD5bl3x0M37riJ7KWYD9CUJaHyE+wRTuZcATpmq2oAoRoo/f62lFm
         3p5fM65nW0EQBN43IKY1MZYEFC49JcJQB0agC2YWulqMcgfT7ojtttFzfPsmwKWYb1yE
         UqGpyQ7Qe+Jrq6kxgnlB2M+y3UblyTbXJY+lVPxTDvDu65L0AkodKisx3ExrMkHEqfrY
         ARmjBRihUsxRXzznLe/esrOh6LDJBEp5phh4iS2pYm37FZ4W/6+jFHE+QQh4RC7EVJtC
         zUcQ==
X-Gm-Message-State: AOAM532be2gVQWIDB7KPoK8mrF0LTppvAYIuyICY/wtc0kSf21uGGkCW
        /3wL5cmmz6QARCva5AVx5FBVbm3zvkRVCoFaHtkY5epvm5mhRD9eS406DhOd/EwpwUoyOzonaws
        H4u7PqowaTyGZpyIulJVe0U6VY0wLKAgWHBITJIpFZs2UCtZd
X-Received: by 2002:ac2:442c:: with SMTP id w12mr5361242lfl.554.1637055119888;
        Tue, 16 Nov 2021 01:31:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoIFJgoO9BfuRzytBejWadPiMEkn9NfvQz8Vj7Ew//pbJ/BmzZR3GbXzbPFtW40CFEKz2ing==
X-Received: by 2002:ac2:442c:: with SMTP id w12mr5361225lfl.554.1637055119702;
        Tue, 16 Nov 2021 01:31:59 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id a7sm1702229lfi.149.2021.11.16.01.31.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Nov 2021 01:31:59 -0800 (PST)
Message-ID: <da9bd8cc-9415-6db7-024e-8d50b5f666f7@canonical.com>
Date:   Tue, 16 Nov 2021 10:31:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v3 2/2] i2c: exynos5: add support for ExynosAutov9 SoC
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        'Sam Protsenko' <semen.protsenko@linaro.org>,
        'Jaewon Kim' <jaewon02.kim@samsung.com>
Cc:     'Wolfram Sang' <wsa@kernel.org>,
        'Rob Herring' <robh+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <CGME20211112010603epcas2p339d1a6ef3df7cdbe61c87c8afa541fd0@epcas2p3.samsung.com>
 <20211112010137.149174-1-jaewon02.kim@samsung.com>
 <20211112010137.149174-3-jaewon02.kim@samsung.com>
 <CAPLW+4==X+irRBKHiDfgJeAb0oDKkzbcWERFs7Y3=PSOg0+qAw@mail.gmail.com>
 <001401d7da86$f7ebd660$e7c38320$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <001401d7da86$f7ebd660$e7c38320$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 16/11/2021 02:12, Chanho Park wrote:
>> With this patch the Exynos850 HSI2C becomes functional. The only nit-pick
>> from my side (just a food for thought): do we want to configure USI
>> related config inside of particular drivers (SPI, I2C, UART)? Or it would
>> be better design to implement some platform driver for that, so we can
>> choose USI configuration (SPI/I2C/UART) in device tree? I think this
>> series is good to be merged as is, but we should probably consider all
>> upsides and downsides of each option, for the future work.
> 
> I'm also considering how to support this USI configuration gracefully.
> Current version of USI is v2 which means there is a v1 version as well. It might be a non-upstream SoC so we don't need to consider it so far.
> But, there is a possibility that the USI hw version can be bumped for future SoCs.
> 
> As you probably know, earlier version of the product kernel has a USI SoC driver[1] and it was designed to be configured the USI settings by device tree.
> 
> Option1) Make a USI driver under soc/samsung/ like [1].
> Option2) Use more generic driver such as "reset driver"? This might be required to extend the reset core driver.
> Option3) Each USI driver(uart/i2c/spi) has its own USI configurations respectively and expose some configurations which can be variable as device tree.
> 
> [1]: https://github.com/ianmacd/d2s/blob/master/drivers/soc/samsung/usi_v2.c

I don't have user manuals, so all my knowledge here is based on
Exynos9825 vendor source code, therefore it is quite limited. In
devicetree the USI devices have their own nodes - but does it mean it's
separate SFR range dedicated to USI? Looks like that, especially that
address space is just for one register (4 bytes).

In such case having separate dedicated driver makes sense and you would
only have to care about driver ordering (e.g. via device links or phandles).

Option 2 looks interesting - reusing reset framework to set proper USI
mode, however this looks more like a hack. As you said Chanho, if there
is a USI version 3, this reset framework might not be sufficient.

In option 3 each driver (UART/I2C/SPI) would need to receive second IO
range and toggle some registers, which could be done via shared
function. If USI v3 is coming, all such drivers could get more complicated.

I think option 1 is the cleanest and extendable in future. It's easy to
add usi-v3 or whatever without modifying the UART/I2C/SPI drivers. It
also nicely encapsulates USI-related stuff in separate driver. Probe
ordering should not be a problem now.

But as I said, I don't have even the big picture here, so I rely on your
opinions more.

Best regards,
Krzysztof
