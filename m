Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71374C4338F
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Aug 2021 18:36:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5026860560
	for <linux-samsung-soc@archiver.kernel.org>; Wed,  4 Aug 2021 18:36:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240328AbhHDShJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 4 Aug 2021 14:37:09 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:44396
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240325AbhHDShI (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 4 Aug 2021 14:37:08 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id EBC3B3F338
        for <linux-samsung-soc@vger.kernel.org>; Wed,  4 Aug 2021 18:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628102214;
        bh=kLWUtHA3a5xY5N4esWD+HgIy7cu1PUh6hkksxjyOzDA=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=W9vUuNUfvP8aErA13DmZIdef0nBu73Qx4ZEb21KgWKv4B9qPz3VPaR3Z/SEIj2R7s
         +L1S6rToxFq67ZkFrbOeTYKvnMlQNBZ+nqQ6tRsa/98eO1enf7FA+MV0y7VcmMEqry
         RAqxnYM7DhoEWLA8KN/NsEWU83I7pGFzH4aeVy/xj8XsTg6ePdtBIj34D2zBIzJOi4
         HJijgn9h6cjiywWiM01um9LRRxaY/FPjQ/uT0hyz8p/bYBRHvywbYTJBJFMWDBtvSN
         3SzFgne2MrD+US05abnVoDL9GvB5sLhby02OCLabeE3rq4fAX0hM/g3sMQ0l1wvOEZ
         WOffPzA7SBiNA==
Received: by mail-ed1-f72.google.com with SMTP id cm18-20020a0564020c92b02903bc7f21d540so1890041edb.13
        for <linux-samsung-soc@vger.kernel.org>; Wed, 04 Aug 2021 11:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kLWUtHA3a5xY5N4esWD+HgIy7cu1PUh6hkksxjyOzDA=;
        b=TXs3hCGN4d8gsiJ3DyzI/1W/K0/nn4PbrEhhMIsJmnM5WlZ/lI8IdzNG4H9wEru0Y3
         tiOqGx0QEaziNLc1tJixIQKh/h4GqSbgBQ5oikwnlC47Dh7bUQhcKRzBFQTkS1tmGMcB
         XOKgVu63ZI1KnSqZJFL6x82m78l4bvf6oIIzHiFAGmIO9WsbGlODJmIuHQWQ9my4ugqS
         AhKigKbujiKegWMpgA+flz6hV2BFn6iranMGSY0AUSswt/B72H1fUcMMxGSDSbBLJXh8
         gm36iJknvouea/nzinRrPthq0jiJVdCeoLUIAFFXEN+ZnL8kIJtcm0+fLpGaDXDeHAx7
         LzSg==
X-Gm-Message-State: AOAM533sWQUrwExCgpAfhCQCmfCzzZiEYZxRuQhs+wT1VfKeUPUz1S6j
        iQopoUn1nYVVWgZx2IBXqy2qMvqtF5BqcPs9uqzFqd5sfUYeXDDM6+VTj2s7sVvleVhOm+wiR/x
        hWOYu//g7Q3F7c0Ha0mtJ9cIGgmMwq6y8cIhvkhT6LntHodEP
X-Received: by 2002:a17:906:9c84:: with SMTP id fj4mr572931ejc.356.1628102203665;
        Wed, 04 Aug 2021 11:36:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9TZSrCE1ZT+ckWS9kno03EUR0eItVE1fmPjRT2brkptWJ/N8BEt1UTXE4ubRLwSxkR5ISYw==
X-Received: by 2002:a17:906:9c84:: with SMTP id fj4mr572916ejc.356.1628102203469;
        Wed, 04 Aug 2021 11:36:43 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.43.172])
        by smtp.gmail.com with ESMTPSA id cm1sm1248761edb.68.2021.08.04.11.36.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Aug 2021 11:36:42 -0700 (PDT)
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Marc Zyngier <maz@kernel.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
 <20210730144922.29111-13-semen.protsenko@linaro.org>
 <15871f8ced3c757fad1ab3b6e62c4e64@misterjones.org>
 <CAPLW+4=v4bDcuxGVqs06mobGj34At4cD+vg48b4dPujarS07Tg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 12/12] arm64: dts: exynos: Add Exynos850 SoC support
Message-ID: <bf21badb-804f-45f0-c02b-80ff57ab9931@canonical.com>
Date:   Wed, 4 Aug 2021 20:36:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4=v4bDcuxGVqs06mobGj34At4cD+vg48b4dPujarS07Tg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 04/08/2021 16:39, Sam Protsenko wrote:
> Hi Marc,
> 
> On Fri, 30 Jul 2021 at 19:50, Marc Zyngier <maz@kernel.org> wrote:
>>
>> On 2021-07-30 15:49, Sam Protsenko wrote:
>>> Samsung Exynos850 is ARMv8-based mobile-oriented SoC.
>>>
>>> Features:
>>>  * CPU: Cortex-A55 Octa (8 cores), up to 2 GHz
>>>  * Memory interface: LPDDR4/4x 2 channels (12.8 GB/s)
>>>  * SD/MMC: SD 3.0, eMMC5.1 DDR 8-bit
>>>  * Modem: 4G LTE, 3G, GSM/GPRS/EDGE
>>>  * RF: Quad GNSS, WiFi 5 (802.11ac), Bluetooth 5.0
>>>  * GPU: Mali-G52 MP1
>>>  * Codec: 1080p 60fps H64, HEVC, JPEG HW Codec
>>>  * Display: Full HD+ (2520x1080)@60fps LCD
>>>  * Camera: 16+5MP/13+8MP ISP, MIPI CSI 4/4/2, FD, DRC
>>>  * Connectivity: USB 2.0 DRD, USI (SPI/UART/I2C), HSI2C, I3C, ADC,
>>> Audio
>>>
>>> This patch adds minimal SoC support. Particular board device tree files
>>> can include exynos850.dtsi file to get SoC related nodes, and then
>>> reference those nodes further as needed.
>>>
>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>>> ---
>>>  .../boot/dts/exynos/exynos850-pinctrl.dtsi    | 782 ++++++++++++++++++
>>>  arch/arm64/boot/dts/exynos/exynos850-usi.dtsi |  30 +
>>>  arch/arm64/boot/dts/exynos/exynos850.dtsi     | 245 ++++++
>>>  3 files changed, 1057 insertions(+)
>>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
>>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos850-usi.dtsi
>>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos850.dtsi
>>>
>>> diff --git a/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
>>> b/arch/arm64/boot/dts/exynos/exynos850-pinctrl.dtsi
>>> new file mode 100644
>>> index 000000000000..4cf0a22cc6db
>>
>> [...]
>>
>>> +     gic: interrupt-controller@12a00000 {
>>> +             compatible = "arm,cortex-a15-gic", "arm,cortex-a9-gic";
>>
>> One thing for sure, it cannot be both. And given that it is
>> an A55-based SoC, it isn't either. It is more likely a GIC400.
>>
> 
> Yes, it's GIC-400, thanks for pointing that out. Will fix that in v2.
> 
>>> +             #interrupt-cells = <3>;
>>> +             #address-cells = <0>;
>>> +             interrupt-controller;
>>> +             reg = <0x0 0x12a01000 0x1000>,
>>> +                   <0x0 0x12a02000 0x1000>,
>>
>> This is wrong. It is architecturally set to 8kB.
>>
> 
> Nice catch! Actually there is an error (typo?) in SoC's TRM, saying
> that Virtual Interface Control Register starts at 0x3000 offset (from
> 0x12a00000), where it obviously should be 0x4000, that's probably
> where this dts error originates from. Btw, I'm also seeing the same
> error in exynos7.dtsi.

What's the error exactly? The "Virtual interface control register"
offset (3rd region) is set properly to 0x4000 on Exynos7. Also one for
the Exynos5433 looks correct.

> Though I don't have a TRM for Exynos7 SoCs, so
> not sure if I should go ahead and fix that too. Anyway, for Exynos850,
> I'll fix that in v2 series.


However while we are at addresses - why are you using address-cells 2?
It adds everywhere additional 0x0 before actual address.


Best regards,
Krzysztof
