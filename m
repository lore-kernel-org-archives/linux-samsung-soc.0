Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23F31C6379F
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  9 Feb 2023 15:18:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbjBIPSl (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 9 Feb 2023 10:18:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbjBIPSj (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 9 Feb 2023 10:18:39 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B78B7282
        for <linux-samsung-soc@vger.kernel.org>; Thu,  9 Feb 2023 07:18:37 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id j25so2121975wrc.4
        for <linux-samsung-soc@vger.kernel.org>; Thu, 09 Feb 2023 07:18:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JNOf909AvFsCos0KOHU0CqEFVPl0S7cNeZpHg6SpFa0=;
        b=pjqlIqDSQePrY760fDl8+fY6VkAh/Kq+tp6hFAqiBPhwVAbCRrF49Guw023kpTjOAe
         6CRXK54vOlupgJlbu0uDEje5lPrtJd4Atc9NwgXoEb/pCGZP7csRc5i2pBPTXmbHVbhp
         szmJxWrzcaghABxWwX/XaT+sNbSNrS/OKyxs9isyPZ/GTPX/mXq7+Ns/xdZCh1DTl6PV
         CFhUrW5ebhRuPGVdjZgsi4N9bG5dPpugv7Y0hucKrPmp/7PAfHjOujbXpk9XtmJuXzIw
         KsP9nfx0Q6fDXCuWnjtMsRkiY1JVFsSuPYtBm68tsLW4dXNoEblJ09iflPjTa2PtWqF1
         x8SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JNOf909AvFsCos0KOHU0CqEFVPl0S7cNeZpHg6SpFa0=;
        b=CSgpkbJnvV9fjDZgPZG/09Ems4HN2Ei89qLFqVlfLWkBShCZ+2EqfACcZScp6UWjfl
         6uacaTtbhwYSLqXniWba/v9tBAZ/YLy2WcCo2JKhALOsqISnmO7KvWBl33hyZyp2O4pw
         nFskjvWaHtJe8dcvu7ThsXGV7s5cs8zXgKQWQOj9CbSYmo3dVP8JjFBKSZxFeP71Nzp2
         6OM+tTYUa9ZUJ3m5YjFksD6Xy2qrlcJj6dov2QzN6H9+ke8Wa5DyTwV7KZfrrl5weFb6
         A7IIbtfAS9ysQaSBnJMNq8GftQCbykCzuk5zI12BxpxVLBaouxzIfpaVM5VGacELhfeD
         3I7g==
X-Gm-Message-State: AO0yUKVNSdAXewEM+w9mgn0Fleodia76n/HFosL7cFrbSTClRiLvkhXI
        +OUVhVHFon7obYjuycxM1F+1wg==
X-Google-Smtp-Source: AK7set/3tLjOIxPDg321gFY9Y0M3vTclrDzKX6dqJWCNW/5MlJj09onuafxH210uOAQcaY1JeETxWA==
X-Received: by 2002:adf:dd43:0:b0:2c5:4480:b590 with SMTP id u3-20020adfdd43000000b002c54480b590mr433763wrm.54.1675955915390;
        Thu, 09 Feb 2023 07:18:35 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id m6-20020adffe46000000b002c3ed120cf8sm1473580wrs.61.2023.02.09.07.18.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 07:18:35 -0800 (PST)
Message-ID: <e6c8ba8a-7d53-6931-a2e8-bcf4ecfbcd81@linaro.org>
Date:   Thu, 9 Feb 2023 16:18:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 2/2] ARM: dts: exynos: add mmc aliases
Content-Language: en-US
To:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Henrik Grimler <henrik@grimler.se>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, alim.akhtar@samsung.com,
        jenneron@protonmail.com, markuss.broks@gmail.com,
        martin.juecker@gmail.com, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Cc:     Valentine Iourine <iourine@iourine.msk.su>
References: <20230128133151.29471-1-henrik@grimler.se>
 <20230128133151.29471-3-henrik@grimler.se>
 <CGME20230209142330eucas1p2d7ba56b6496bb90ed6af2054fe929c9d@eucas1p2.samsung.com>
 <99a17d21-2cf9-a573-29cb-827568c9709b@linaro.org>
 <8fd04935-0553-e04b-7d8c-470573816e6f@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8fd04935-0553-e04b-7d8c-470573816e6f@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 09/02/2023 15:50, Marek Szyprowski wrote:
> On 09.02.2023 15:23, Krzysztof Kozlowski wrote:
>> On 28/01/2023 14:31, Henrik Grimler wrote:
>>> Add aliases for eMMC, SD card and WiFi where applicable, so that
>>> assigned mmcblk numbers are always the same.
>>>
>>> Co-developed-by: Anton Bambura <jenneron@protonmail.com>
>>> Signed-off-by: Anton Bambura <jenneron@protonmail.com>
>>> [ Tested on exynos5800-peach-pi ]
>>> Tested-by: Valentine Iourine <iourine@iourine.msk.su>
>>> Signed-off-by: Henrik Grimler <henrik@grimler.se>
>>> ---
>>>   arch/arm/boot/dts/exynos3250-artik5-eval.dts        | 5 +++++
>>>   arch/arm/boot/dts/exynos3250-artik5.dtsi            | 5 +++++
>>>   arch/arm/boot/dts/exynos3250-monk.dts               | 1 +
>>>   arch/arm/boot/dts/exynos3250-rinato.dts             | 2 ++
>>>   arch/arm/boot/dts/exynos4210-i9100.dts              | 6 ++++++
>>>   arch/arm/boot/dts/exynos4210-origen.dts             | 5 +++++
>>>   arch/arm/boot/dts/exynos4210-smdkv310.dts           | 4 ++++
>>>   arch/arm/boot/dts/exynos4210-trats.dts              | 6 ++++++
>>>   arch/arm/boot/dts/exynos4210-universal_c210.dts     | 6 ++++++
>>>   arch/arm/boot/dts/exynos4412-itop-elite.dts         | 5 +++++
>>>   arch/arm/boot/dts/exynos4412-midas.dtsi             | 3 +++
>>>   arch/arm/boot/dts/exynos4412-odroid-common.dtsi     | 5 +++++
>>>   arch/arm/boot/dts/exynos4412-origen.dts             | 5 +++++
>>>   arch/arm/boot/dts/exynos4412-p4note.dtsi            | 6 ++++++
>>>   arch/arm/boot/dts/exynos4412-smdk4412.dts           | 4 ++++
>>>   arch/arm/boot/dts/exynos4412-tiny4412.dts           | 4 ++++
>>>   arch/arm/boot/dts/exynos5250-arndale.dts            | 5 +++++
>>>   arch/arm/boot/dts/exynos5250-smdk5250.dts           | 2 ++
>>>   arch/arm/boot/dts/exynos5250-snow-common.dtsi       | 3 +++
>>>   arch/arm/boot/dts/exynos5250-spring.dts             | 5 +++++
>>>   arch/arm/boot/dts/exynos5260-xyref5260.dts          | 5 +++++
>>>   arch/arm/boot/dts/exynos5410-odroidxu.dts           | 2 ++
>>>   arch/arm/boot/dts/exynos5410-smdk5410.dts           | 5 +++++
>>>   arch/arm/boot/dts/exynos5420-arndale-octa.dts       | 5 +++++
>>>   arch/arm/boot/dts/exynos5420-galaxy-tab-common.dtsi | 5 +++++
>>>   arch/arm/boot/dts/exynos5420-peach-pit.dts          | 3 +++
>>>   arch/arm/boot/dts/exynos5420-smdk5420.dts           | 5 +++++
>>>   arch/arm/boot/dts/exynos5422-odroid-core.dtsi       | 5 +++++
>>>   arch/arm/boot/dts/exynos5422-odroidxu3-common.dtsi  | 4 ++++
>>>   arch/arm/boot/dts/exynos5422-samsung-k3g.dts        | 4 ++++
>>>   arch/arm/boot/dts/exynos5800-peach-pi.dts           | 3 +++
>>>   31 files changed, 133 insertions(+)
>>>
>>> diff --git a/arch/arm/boot/dts/exynos3250-artik5-eval.dts b/arch/arm/boot/dts/exynos3250-artik5-eval.dts
>>> index a1e22f630638..83266a66124b 100644
>>> --- a/arch/arm/boot/dts/exynos3250-artik5-eval.dts
>>> +++ b/arch/arm/boot/dts/exynos3250-artik5-eval.dts
>>> @@ -16,6 +16,11 @@ / {
>>>   	model = "Samsung ARTIK5 evaluation board";
>>>   	compatible = "samsung,artik5-eval", "samsung,artik5",
>>>   			"samsung,exynos3250", "samsung,exynos3";
>>> +
>>> +	aliases {
>>> +		mmc2 = &mshc_2;
>>> +	};
>>> +
>>>   };
>>>   
>>>   &mshc_2 {
>>> diff --git a/arch/arm/boot/dts/exynos3250-artik5.dtsi b/arch/arm/boot/dts/exynos3250-artik5.dtsi
>>> index 0ac3f284fbb8..a6e2f46917a8 100644
>>> --- a/arch/arm/boot/dts/exynos3250-artik5.dtsi
>>> +++ b/arch/arm/boot/dts/exynos3250-artik5.dtsi
>>> @@ -17,6 +17,11 @@
>>>   / {
>>>   	compatible = "samsung,artik5", "samsung,exynos3250", "samsung,exynos3";
>>>   
>>> +	aliases {
>>> +		mmc0 = &mshc_0;
>>> +		mmc1 = &mshc_1;
>>> +	};
>>> +
>>>   	chosen {
>>>   		stdout-path = &serial_2;
>>>   	};
>>> diff --git a/arch/arm/boot/dts/exynos3250-monk.dts b/arch/arm/boot/dts/exynos3250-monk.dts
>>> index 80d90fe7fad1..a68e5f81404c 100644
>>> --- a/arch/arm/boot/dts/exynos3250-monk.dts
>>> +++ b/arch/arm/boot/dts/exynos3250-monk.dts
>>> @@ -22,6 +22,7 @@ / {
>>>   
>>>   	aliases {
>>>   		i2c7 = &i2c_max77836;
>>> +		mmc0 = &mshc_0;
>>>   	};
>>>   
>>>   	memory@40000000 {
>>> diff --git a/arch/arm/boot/dts/exynos3250-rinato.dts b/arch/arm/boot/dts/exynos3250-rinato.dts
>>> index 1f9cba0607e1..f0fb6890e4a8 100644
>>> --- a/arch/arm/boot/dts/exynos3250-rinato.dts
>>> +++ b/arch/arm/boot/dts/exynos3250-rinato.dts
>>> @@ -23,6 +23,8 @@ / {
>>>   
>>>   	aliases {
>>>   		i2c7 = &i2c_max77836;
>>> +		mmc0 = &mshc_0;
>>> +		mmc1 = &mshc_1;
>>>   	};
>>>   
>>>   	chosen {
>>> diff --git a/arch/arm/boot/dts/exynos4210-i9100.dts b/arch/arm/boot/dts/exynos4210-i9100.dts
>>> index bba85011ecc9..7051e2c4b391 100644
>>> --- a/arch/arm/boot/dts/exynos4210-i9100.dts
>>> +++ b/arch/arm/boot/dts/exynos4210-i9100.dts
>>> @@ -25,6 +25,12 @@ memory@40000000 {
>>>   		reg = <0x40000000 0x40000000>;
>>>   	};
>>>   
>>> +	aliases {
>>> +		mmc0 = &sdhci_0;
>>> +		mmc2 = &sdhci_2;
>>> +		mmc3 = &sdhci_3;
>> 1. Is this actually correct? Since mmc1 was disabled, sdhci_2 had mmc1
>> index but now will have mmc2.
>>
>> 2. I tested Odroid U3 and the ID changed. emmc went from 1 to 0. Any
>> idea why? Both patches should be transparent.
> 
> Nope, eMMC and SD order changed a few times in the past and now they get 
> indices based on the probe time, so any order is possible depending on 
> the presence of the sd card / eMMC module.
> 
>> 3. Patchset does not look bisectable, so both patches should be squashed.
> 
> Why? First patch removes obsolete mshc aliases, which don't determine 
> the logical MMC device number in the system. The second one adds fixed 
> indices to the local MMC devices created by the respective MMC host 
> controllers.

Ah, I see now, so mshc only determined the caps. That makes sense and
answers my two questions.

But my question (1) a bit remains - these numbers of aliases should
reflect what is wired on the board, so:
A. before indices were mmc0, mmc1, mmc2 (and sdhcio_1 disabled). Now
indices will be mmc0, mmc2 and mmc3, right?

B. How the interface is called on the board? For some boards we actually
can check with schematics.

Best regards,
Krzysztof

