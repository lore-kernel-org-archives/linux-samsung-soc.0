Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20C52C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 19 Nov 2021 08:51:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0528761B43
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 19 Nov 2021 08:51:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231810AbhKSIyV (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 19 Nov 2021 03:54:21 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:38614
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231485AbhKSIyV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 19 Nov 2021 03:54:21 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1EBE63F19E
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Nov 2021 08:51:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1637311878;
        bh=ruWD3Wl39Eqs8sRNy3uOmfu7ln2HYc2tNhOSYl6noSE=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=F8ovh0HtHzX4Mgzv2FH+e/n0qiML9pcXR1kWnZckzPOeraZjDcPAjAZpFLqQtL43M
         RYOIIO7LqrzJ3PZBVLWcpnd6q6HlixAD+DDke4VRGXBv9xM6Nqu+gOAlmpySpKZ+Cg
         dl9KuhclK2tH1+Vv9gL7FJRXjOriqJA7HQ4Z5Be96rQ2+SKFFhitInsIbPn72ZzSiJ
         v6pFdPMOpk65OfaGrbcLPX+M499L2VtPRMgOXGaL+7CW3UMK+LeiBIsYbxzBTBsa7J
         +Cs2rdP5e7xI7Q3yWroEVrV+dlFvkSKSoUqp+PeLZ6vVNxjhYEqVXev/SIGHYRp7J7
         R2BLwLeFuIisQ==
Received: by mail-lf1-f69.google.com with SMTP id x7-20020a056512130700b003fd1a7424a8so6077736lfu.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Nov 2021 00:51:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=ruWD3Wl39Eqs8sRNy3uOmfu7ln2HYc2tNhOSYl6noSE=;
        b=VUE5cz+IKIyU+MsLggExtUvzKfRjeUsrTQSZJrNrkXkpZl7TlJOpSCubWQl8wTNM0X
         E6W6KchLRfqltGA4M/3/OHoS7Dc6MX50fhz+IIr1FkDEOLXIimzM5wgPVkVOcippGjbs
         rvtDuNMIJEMEaZ56lB3XGoqmYiOBMpvf1aa8POdjCGBeV4GBxj2FCXB8qo45JZJ6cP1c
         YKdMo2DIbhUe+3GyUSKgl5MO/HhLD63ABtRz2pOoUDN24uxr55YAhtKDYvsquyARHy9m
         Zbpdp9xbOxSrdL7ZJgtGKG42I7eapBW6HxGik1/cgNOnqV9DCl+icbAR9VZYbF0mxz+m
         wtsg==
X-Gm-Message-State: AOAM5313Op1e1oClryQZaUIe+yrbl5XHehDQYG9ZARegHdSEC2ARJ4tC
        y+fOklN39p0c6NPsPppZjG6OOowEBl8HD0ycbAqkwEMHgT4CJ3AAm4+DrEmNL3+n1g5ZGH1u7Be
        KX0q1wNli+SLukdA5G1UwCHhnZzA28OqOjs13p9DuNNbJiRgP
X-Received: by 2002:a05:6512:12c4:: with SMTP id p4mr30587573lfg.278.1637311875766;
        Fri, 19 Nov 2021 00:51:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw+iEh/iZtWU1gI+foH3w3Hp3x+lsgB/cHQqt6q8Cw5Axi/8v3Ctkkj7xHHxnTJ4a8Jj0tsug==
X-Received: by 2002:a05:6512:12c4:: with SMTP id p4mr30587544lfg.278.1637311875517;
        Fri, 19 Nov 2021 00:51:15 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id r3sm299007lfc.114.2021.11.19.00.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Nov 2021 00:51:14 -0800 (PST)
Message-ID: <a2854a71-6a6e-5ad6-4e4c-050c15126797@canonical.com>
Date:   Fri, 19 Nov 2021 09:51:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v3 2/2] i2c: exynos5: add support for ExynosAutov9 SoC
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Chanho Park <chanho61.park@samsung.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <CGME20211112010603epcas2p339d1a6ef3df7cdbe61c87c8afa541fd0@epcas2p3.samsung.com>
 <20211112010137.149174-1-jaewon02.kim@samsung.com>
 <20211112010137.149174-3-jaewon02.kim@samsung.com>
 <CAPLW+4==X+irRBKHiDfgJeAb0oDKkzbcWERFs7Y3=PSOg0+qAw@mail.gmail.com>
 <001401d7da86$f7ebd660$e7c38320$@samsung.com>
 <da9bd8cc-9415-6db7-024e-8d50b5f666f7@canonical.com>
 <CAPLW+4n2hZ1c9BuOo4JtKLZp48fH81xUr0GSaJoc21=ad2vv1Q@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAPLW+4n2hZ1c9BuOo4JtKLZp48fH81xUr0GSaJoc21=ad2vv1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 16/11/2021 16:31, Sam Protsenko wrote:
> On Tue, 16 Nov 2021 at 11:32, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> On 16/11/2021 02:12, Chanho Park wrote:
>>>> With this patch the Exynos850 HSI2C becomes functional. The only nit-pick
>>>> from my side (just a food for thought): do we want to configure USI
>>>> related config inside of particular drivers (SPI, I2C, UART)? Or it would
>>>> be better design to implement some platform driver for that, so we can
>>>> choose USI configuration (SPI/I2C/UART) in device tree? I think this
>>>> series is good to be merged as is, but we should probably consider all
>>>> upsides and downsides of each option, for the future work.
>>>
>>> I'm also considering how to support this USI configuration gracefully.
>>> Current version of USI is v2 which means there is a v1 version as well. It might be a non-upstream SoC so we don't need to consider it so far.
>>> But, there is a possibility that the USI hw version can be bumped for future SoCs.
>>>
>>> As you probably know, earlier version of the product kernel has a USI SoC driver[1] and it was designed to be configured the USI settings by device tree.
>>>
>>> Option1) Make a USI driver under soc/samsung/ like [1].
>>> Option2) Use more generic driver such as "reset driver"? This might be required to extend the reset core driver.
>>> Option3) Each USI driver(uart/i2c/spi) has its own USI configurations respectively and expose some configurations which can be variable as device tree.
>>>
>>> [1]: https://github.com/ianmacd/d2s/blob/master/drivers/soc/samsung/usi_v2.c
>>
>> I don't have user manuals, so all my knowledge here is based on
>> Exynos9825 vendor source code, therefore it is quite limited. In
>> devicetree the USI devices have their own nodes - but does it mean it's
>> separate SFR range dedicated to USI? Looks like that, especially that
>> address space is just for one register (4 bytes).
>>
>> In such case having separate dedicated driver makes sense and you would
>> only have to care about driver ordering (e.g. via device links or phandles).
>>
>> Option 2 looks interesting - reusing reset framework to set proper USI
>> mode, however this looks more like a hack. As you said Chanho, if there
>> is a USI version 3, this reset framework might not be sufficient.
>>
>> In option 3 each driver (UART/I2C/SPI) would need to receive second IO
>> range and toggle some registers, which could be done via shared
>> function. If USI v3 is coming, all such drivers could get more complicated.
>>
>> I think option 1 is the cleanest and extendable in future. It's easy to
>> add usi-v3 or whatever without modifying the UART/I2C/SPI drivers. It
>> also nicely encapsulates USI-related stuff in separate driver. Probe
>> ordering should not be a problem now.
>>
>> But as I said, I don't have even the big picture here, so I rely on your
>> opinions more.
>>
> 
> To provide more context, USI registers are split across two different
> register maps:
> 
>     - USI protocol configuration (where we choose which protocol to
> use: HSI2C, SPI or UART) is done via *_SW_CONF registers, from System
> Register SFR range. To access those SW_CONF registers we need to
> either:
>         (Option 3) pass System Register registers to corresponding
> driver (HSI2C/SPI/UART) via syscon
>         (Option 1) or implement separate USI driver, so we can choose
> desired protocol in device tree; in that case I guess System Register
> registers should be passed via syscon to USI driver
>     - USI registers (like USI_CON register, which contains USI_RESET
> bit) are contained in the same SFR range as corresponding
> HSI2C/SPI/UART IP-core. Or rather HSI2C/SPI/UART IP-cores are
> encapsulated within USI block(s). So to access registers like USI_CON
> we only need to use memory already passed to corresponding
> HSI2C/SPI/UART driver via "reg" property.
> 
> So I'd say ideally we should do next:
>   - modify USI registers (like USI_CON) in corresponding
> HSI2C/SPI/UART drivers; but because all HSI2C/SPI/UART drivers share
> the same USI registers, we might want to pull USI register offsets and
> bits to some common header file, for example (to not duplicate that
> code in drivers)
>   - implement separate USI driver to control SW_CONF registers from
> System Register module (Option 1), so we can choose desired protocol
> in device tree (in some USI node, not in HSI2C node)
>   - also, it probably makes sense to group all USI related nodes in
> some separate *-usi.dtsi file; that would reduce confusion, given that
> we have even more encapsulation in Exynos850 thanks to CMGP (Common
> GPIO) block
> 
> My suggestion is to take this patch as is, and then we can work on USI
> driver implementation/upstreaming. 

No, you cannot later rework it. It becomes a binding which you need to
support.

> Right now we don't have much of
> device tree files that use USI HSI2C driver, so it'll be fairly easy
> to fix those dts's once we implemented USI driver. 

Once sysreg solution is accepted, it's removal would be ABI break.
Please do not rush with incomplete solutions.

> That will also
> unblock me with submitting dev board support (dts files) I'm working
> on right now. Krzysztof, please let me know if I'm wrong and if we
> shouldn't change dts API too much, so it's mandatory to implement USI
> driver before accepting this patch.

David's point of USIv1 points me to the separate driver solution.


Best regards,
Krzysztof
