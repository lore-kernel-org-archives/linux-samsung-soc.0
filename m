Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C32C1C76196
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 24 Mar 2023 11:29:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231443AbjCXL3e (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 24 Mar 2023 07:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231402AbjCXL3c (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 24 Mar 2023 07:29:32 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DFBF1ABD6
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Mar 2023 04:29:30 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id b20so6738081edd.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 24 Mar 2023 04:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679657369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UBYZAHJ4oF06kqEyxwlGgNiRWjRifAoB3O7aBMX2ZGQ=;
        b=lfpCU7UXubnZ6VCwtJq39UmJ/DpJcQAIzhTHuxxWf+LeDLHMq6sDOUOKW2kyZ2B2Qy
         QyWbPBs86cM0ZIraepVH+TRXpMh6p9DKhjM3qej/Cjoh8kaNOYC8kPdZl2NCSYyTebAV
         djGswrREiaH/F2uUbRa0T0YpeFJhVMeXij0BbQpAkHoUbzfGfXLvIi2akG9yCD3PGuaD
         NynZeaomh7rzdSsEWYqvPQ7sMwrqKW1OKsXITdOJzrF2f2cltDRWmOkwPFAluLYF2xtI
         rlnCmWqC76XzKZadNwoPOB11v1lmK9/X1N5FH9x8lkWnEgeW15EQbYyY0bcLD4sDv46a
         Oscw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679657369;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UBYZAHJ4oF06kqEyxwlGgNiRWjRifAoB3O7aBMX2ZGQ=;
        b=SA1/MXHXbE3YD7LpiiLRSmghTsTxSyNvouuM/6mIIbIo2AhPg2WpYC9c4CSFYgdLxg
         NOFkU84PcZepvf2lwXyGdZwNilWooIWaIFdyCMANIUWQlvuJf/UDZojZXF/Bm9izUq9w
         v7Krv94CLpv+u1hXJD7vbblbQ0rNvkigjCgHcxdESy58w9mY7F3M6kj7YIVXWHvAsJVe
         jt+xvpfUT3/pwxNJ8D8vK6v+kcEgjzyAEOHNUfKWS07NRKXWlVmIumjODQkyBfpRtrey
         XyDpxVlKoIQafr4G169FPuSOxhjm3nV3zhN5JPQH5SJKSaWOAiwPSa6+CdV2AkHC6BO0
         YhnA==
X-Gm-Message-State: AAQBX9f4QFaSfXLOLL+gjFDcpsxmWwkn1PCRoWyCNfpq6pbQ0N/9b7gi
        aU1cs3v4+mAF90/9OpO+lfnDRw==
X-Google-Smtp-Source: AKy350ap/qXI7A1sMp8C4oUtWf50SlQntYwZedDuCHwbGnlHGF5tBBAtbSvocbO5enonMQHKR7kEDA==
X-Received: by 2002:a17:906:40c7:b0:930:7324:2766 with SMTP id a7-20020a17090640c700b0093073242766mr2059087ejk.35.1679657369098;
        Fri, 24 Mar 2023 04:29:29 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:3027:fb0b:ae08:588? ([2a02:810d:15c0:828:3027:fb0b:ae08:588])
        by smtp.gmail.com with ESMTPSA id u7-20020a170906b10700b0092f38a6d082sm10094107ejy.209.2023.03.24.04.29.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Mar 2023 04:29:28 -0700 (PDT)
Message-ID: <4e3e6d50-c6ba-985d-82e6-df52ef17d174@linaro.org>
Date:   Fri, 24 Mar 2023 12:29:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v5 2/2] ARM: dts: exynos: add mmc aliases
To:     Henrik Grimler <henrik@grimler.se>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        alim.akhtar@samsung.com, m.szyprowski@samsung.com,
        jenneron@protonmail.com, markuss.broks@gmail.com,
        martin.juecker@gmail.com, virag.david003@gmail.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Valentine Iourine <iourine@iourine.msk.su>
References: <20230316211558.8526-1-henrik@grimler.se>
 <20230316211558.8526-3-henrik@grimler.se>
 <216262b8-fe48-6696-17a4-eaa82e776db7@linaro.org> <ZBds5NFv1Lr8k0jk@L14.lan>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <ZBds5NFv1Lr8k0jk@L14.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 19/03/2023 21:13, Henrik Grimler wrote:
>>>  
>>> +	aliases {
>>> +		mmc0 = &sdhci_0;
>>> +		mmc2 = &sdhci_2;
>>
>>
>> Why this is 2? Aliases are continues and match the board. For example
>> Universal calls this mmc1 and the next mmc2, not 3.
> 
> Not sure I follow, Universal calls sdhci_2 mmc1 in schematics? (I have tried searching for
> schematics but cannot really find anything about this board)

Yes. The alias numbers are the numbering exposed on the board. This
might or might not match original numbering. If you have a development
board with a SoM, pretty often not all interfaces, let's say UARTs, are
exposed. SoM might have 10 UARTs, but board has only 4 and numbers them
UART0-3. Aliases should be 0-3, not 0, 5, 7, 9.

> 
>> I bet it is the same on Trats and all other boards.
> 
> Sure, I can change to mmc0, mmc1 for all 4210 devices.

Yes, please.

> 
>>> +		mmc3 = &sdhci_3;
>>> +	};
>>> +
>>>  	chosen {
>>>  		bootargs = "root=/dev/mmcblk0p5 rw rootwait earlyprintk panic=5 maxcpus=1";
>>>  		stdout-path = "serial2:115200n8";
>>> diff --git a/arch/arm/boot/dts/exynos4412-itop-elite.dts b/arch/arm/boot/dts/exynos4412-itop-elite.dts
>>> index 6260da187e92..0e5419c0eaff 100644
>>> --- a/arch/arm/boot/dts/exynos4412-itop-elite.dts
>>> +++ b/arch/arm/boot/dts/exynos4412-itop-elite.dts
>>> @@ -20,6 +20,10 @@ / {
>>>  	model = "TOPEET iTop 4412 Elite board based on Exynos4412";
>>>  	compatible = "topeet,itop4412-elite", "samsung,exynos4412", "samsung,exynos4";
>>>  
>>> +	aliases {
>>> +		mmc2 = &sdhci_2;
>>
>> mmc1
> 
> Ok, will change.
> 
>>> +	};
>>> +
>>>  	chosen {
>>>  		bootargs = "root=/dev/mmcblk0p2 rw rootfstype=ext4 rootdelay=1 rootwait";
>>>  		stdout-path = "serial2:115200n8";
>>> diff --git a/arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi b/arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi
>>> index ca8d42b2ce3b..7bc6968af9c3 100644
>>> --- a/arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi
>>> +++ b/arch/arm/boot/dts/exynos4412-itop-scp-core.dtsi
>>> @@ -23,6 +23,10 @@ memory@40000000 {
>>>  		reg = <0x40000000 0x40000000>;
>>>  	};
>>>  
>>> +	aliases {
>>> +		mmc0 = &mshc_0;
>>> +	};
>>> +
>>>  	firmware@203f000 {
>>>  		compatible = "samsung,secure-firmware";
>>>  		reg = <0x0203f000 0x1000>;
>>> diff --git a/arch/arm/boot/dts/exynos4412-midas.dtsi b/arch/arm/boot/dts/exynos4412-midas.dtsi
>>> index 82aed59cba7c..e6b949c1a00f 100644
>>> --- a/arch/arm/boot/dts/exynos4412-midas.dtsi
>>> +++ b/arch/arm/boot/dts/exynos4412-midas.dtsi
>>> @@ -25,6 +25,9 @@ / {
>>>  	aliases {
>>>  		i2c11 = &i2c_max77693;
>>>  		i2c12 = &i2c_max77693_fuel;
>>> +		mmc0 = &mshc_0;
>>> +		mmc2 = &sdhci_2;
>>> +		mmc3 = &sdhci_3;
>>
>> This is actually correct.
>>
>>>  	};
>>>  
>>>  	chosen {
>>> diff --git a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>>> index 25e082fda955..45ef7b7ba7e0 100644
>>> --- a/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>>> +++ b/arch/arm/boot/dts/exynos4412-odroid-common.dtsi
>>> @@ -13,6 +13,11 @@
>>>  #include "exynos-mfc-reserved-memory.dtsi"
>>>  
>>>  / {
>>> +	aliases {
>>> +		mmc0 = &mshc_0;
>>> +		mmc2 = &sdhci_2;
>>
>> This is also correct.
>>
>>> +	};
>>
>> For all other cases, where schematics are missing, just make them linear.
> 
> Alright, will do in next version, thanks for the feedback!
> 


Best regards,
Krzysztof

