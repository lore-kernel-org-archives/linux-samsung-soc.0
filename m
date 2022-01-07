Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E35ADC433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  7 Jan 2022 07:34:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344335AbiAGHey (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 7 Jan 2022 02:34:54 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:44454
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344646AbiAGHex (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 7 Jan 2022 02:34:53 -0500
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C0A693FFD2
        for <linux-samsung-soc@vger.kernel.org>; Fri,  7 Jan 2022 07:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1641540892;
        bh=29xTho4bxkKXwnEyHI5IJ+c7kcKHDeYilSRX91ahp4E=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=bW+artJFJ5o70f5Ia+U+8fiDbIR8KIXHMizviSAL1dtoaAOkUE9UGk7wlv6DT8gMv
         FoYefYDk/GhnJ22oRAcr8EotZWOkt/i7wS32rmu4YOjHlPDB/ZqbKiVCshcZHOQ5YW
         EiRGCF16MSqzQ/GQx6Gs/YYSoUX6zB2W9G3EZDHM1Uwr85BI112JzP6PP55T6g6je2
         LjlyN94pte6IXbWpr7QXymeKzRVCX0pQhrSdvlU69JiD2AepMNU564eV6cYmHtmqE5
         3r7/8Yn9PxqH8xCCAnvyJYF1p88leak0RFt9U5ZOC3k42L0uuXTc4T+pDSwp7qa6zC
         eSSs0l+5I0P7w==
Received: by mail-wm1-f70.google.com with SMTP id az9-20020a05600c600900b0034692565ca8so3226252wmb.9
        for <linux-samsung-soc@vger.kernel.org>; Thu, 06 Jan 2022 23:34:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=29xTho4bxkKXwnEyHI5IJ+c7kcKHDeYilSRX91ahp4E=;
        b=GCZ2uN95jICEZkd1t9WQMgMzEaRF2Ad0dYdt7a3ueKvNJReDBYR16zg0wovptsUuh4
         xhlLDg1/b7OgLLhTTchmJYL5AhFu5TWBivEqLkjw1FDFJDD2lA1/bHmyYw9HGi0SeDQp
         sxkX3pTUa5y+T9o32k3eLRjs1jNLvqcg3t+DHSSh4CZpQRl3W+vMceP55+4R+3Fr9C8h
         sbyZUcD7TR5PUXp9eRkncSZ4c9hgz8HNr4ANBkl/D0frs6FfT2/u8MJ96DQfPp5afas+
         poDv2ljg151/xOSWoGiWj5v1iyx+Qn8Nk1xNo+nhVLU203VdBKMWBRVatIhrCheK26MG
         byDw==
X-Gm-Message-State: AOAM531N5htJqkRjLUUXeb9rr55DS0prdig3CKua/Eowe71iIFaT/e/z
        9aGgKZVeQydAqRVC85EBeGYeaS6ZkQL1NPMI/E3Gvh582RofChFIfIf38bo54KEL9yhJFjVigEj
        CeqEOfqbBh6GUyp5x0C1JLzntVU7QJTjfIFvolDhdz6xRXYLf
X-Received: by 2002:a5d:614e:: with SMTP id y14mr971914wrt.612.1641540892387;
        Thu, 06 Jan 2022 23:34:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzal1pG8kk1sn8VyXOvRs9p4HnfBX9rkUhBpqROcFubzAGcRyXhVKsHCKyDwlklTWzbHmAmtQ==
X-Received: by 2002:a5d:614e:: with SMTP id y14mr971894wrt.612.1641540892246;
        Thu, 06 Jan 2022 23:34:52 -0800 (PST)
Received: from [192.168.1.126] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id d17sm1525914wmq.42.2022.01.06.23.34.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jan 2022 23:34:51 -0800 (PST)
Message-ID: <e13e70ff-1416-e0b8-93ae-991cf58a5f1d@canonical.com>
Date:   Fri, 7 Jan 2022 08:34:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 08/24] ARM: dts: exynos: simplify PMIC DVS pin
 configuration in Peach Pi
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@gmail.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Sam Protsenko <semen.protsenko@linaro.org>,
        Chanho Park <chanho61.park@samsung.com>
References: <20211231161930.256733-1-krzysztof.kozlowski@canonical.com>
 <20211231162207.257478-2-krzysztof.kozlowski@canonical.com>
 <CAGOxZ52PjcMD0hFQa95NHO2M5Z+Gpx4HNO14+KCsYnCffLc3JQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAGOxZ52PjcMD0hFQa95NHO2M5Z+Gpx4HNO14+KCsYnCffLc3JQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 06/01/2022 19:47, Alim Akhtar wrote:
> Hi Krzysztof,
> 
> On Sat, Jan 1, 2022 at 1:15 PM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> The pin configuration for PMIC DVS (pmic-dvs-2 and pmic-dvs-3) are
>> exactly the same, so merge them.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  arch/arm/boot/dts/exynos5800-peach-pi.dts | 20 +++++++-------------
>>  1 file changed, 7 insertions(+), 13 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/exynos5800-peach-pi.dts b/arch/arm/boot/dts/exynos5800-peach-pi.dts
>> index 6bf3fd37fb2b..eca805b83816 100644
>> --- a/arch/arm/boot/dts/exynos5800-peach-pi.dts
>> +++ b/arch/arm/boot/dts/exynos5800-peach-pi.dts
>> @@ -221,7 +221,7 @@ max77802: pmic@9 {
>>                 interrupts = <1 IRQ_TYPE_NONE>;
>>                 pinctrl-names = "default";
>>                 pinctrl-0 = <&max77802_irq>, <&pmic_selb>,
>> -                           <&pmic_dvs_1>, <&pmic_dvs_2>, <&pmic_dvs_3>;
>> +                           <&pmic_dvs_1>, <&pmic_dvs_2>;
>>                 wakeup-source;
>>                 reg = <0x9>;
>>                 #clock-cells = <1>;
>> @@ -874,26 +874,20 @@ &sd1_cmd {
>>
>>  &pinctrl_2 {
>>         pmic_dvs_2: pmic-dvs-2 {
>> -               samsung,pins = "gpj4-2";
>> +               samsung,pins = "gpj4-2", "gpj4-3";
>>                 samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
>>                 samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
>>                 samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
>>         };
>> +};
>>
>> -       pmic_dvs_3: pmic-dvs-3 {
>> -               samsung,pins = "gpj4-3";
>> -               samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
>> -               samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
>> -               samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV1>;
>> -       };
>> +/* pinctrl_3*/
>> +/* Drive SPI lines at x2 for better integrity */
>> +&spi2_bus {
>> +       samsung,pin-drv = <EXYNOS5420_PIN_DRV_LV3>;
>>  };
>>
> Maybe move this spi2_bus part to patch #07 as the commit does not
> mention this change.
> 

Right, it should be part of #7.


Best regards,
Krzysztof
