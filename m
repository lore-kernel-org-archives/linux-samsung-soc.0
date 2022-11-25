Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B28B2C43219
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 25 Nov 2022 15:01:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbiKYPBg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 25 Nov 2022 10:01:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbiKYPBb (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 25 Nov 2022 10:01:31 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 460B432060
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Nov 2022 07:01:30 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id t10so5496798ljj.0
        for <linux-samsung-soc@vger.kernel.org>; Fri, 25 Nov 2022 07:01:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=94PbW/ltOKOm/qJBLJVRn1IDNTKIsX6g0SVX2b46Dbk=;
        b=qq6Hx88tkfo7+D1qphcXIKQi6NGKUNKUlyVhxeckYhjG19NgOYegoyzQHAX1t/16Xn
         odjqfnFXNiFAoOJ/yr9uWiYnsUOW/QHtIseSSgCZd5S4nKI74bwnidIaUspAmcwQCGiW
         wzD4U7rVQFe2A7ULy073mjTZvk8vBicCulhBsMWn+2k6aUrQirSqWtxkxMaFUOyUE3iL
         KgQe1FH1wAnSUDazZkqc7T5ODIJVyHexjGAg26hctQM5PS3V4u9rF6PLB8ntX86PI6VA
         MqUteFpo5cuSwpc9XlgAwW7MJc0uGiRg56reQElNeaCmNzckPcLLAyflk5MPiLvwPKWT
         jNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=94PbW/ltOKOm/qJBLJVRn1IDNTKIsX6g0SVX2b46Dbk=;
        b=7PZBbXRkOYT700w6I0EbPc8ftHOqFPcIGoCckgr6vJu5q2w9Fg4w0HxcAdF5QmDJQ6
         c9RZOvCM1KhfzF0K9xdYOzxhHUruFWeZYjs5RBNWGhlXY3X/A9PdEc9tspFxJe4pi3qI
         HfoVfOZFKm7f9a0SufnR8HxhG1Ab8le6Y2H62xub7L7TMAjIBSXG7YAIcOEeirb9VSzo
         u8MvSl4LLekQf9YX5Y04LMYzHwpy5I5zQT16OxVrsGZCm3v7VwyxLxLLP6TLEdp74gDI
         q8o1uMladmL1+gWShhRBFgFRlCqBhels1kZRCdaY9HNjuP7m+kSRDOes6k6fbsZZ5qNa
         L8+w==
X-Gm-Message-State: ANoB5plzOomqSmHJB14+tIHiO2i8OTQn634xYKLGrqclR4clVhUjhXD9
        PcQm4GWRwazLYpVR8hiALLhVwg==
X-Google-Smtp-Source: AA0mqf6N/acKSsSzIeuCEG7rXhNpwGx/2OgTNX8bK8JIQT+L8rh+ICXSSLrw1JdPH6Z3K+/GqZMBWw==
X-Received: by 2002:a05:651c:10af:b0:277:3046:3d1c with SMTP id k15-20020a05651c10af00b0027730463d1cmr11681896ljn.422.1669388488347;
        Fri, 25 Nov 2022 07:01:28 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id u27-20020ac258db000000b0049adf925d00sm555433lfo.1.2022.11.25.07.01.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Nov 2022 07:01:27 -0800 (PST)
Message-ID: <016293da-92b1-16e9-9a8d-ecab34c2f0c6@linaro.org>
Date:   Fri, 25 Nov 2022 16:01:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 3/4] dt-bindings: soc: samsung: exynos-sysreg: add
 dedicated SYSREG compatibles to Exynos5433
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        Sriranjani P <sriranjani.p@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>
References: <20221125112201.240178-1-krzysztof.kozlowski@linaro.org>
 <20221125112201.240178-3-krzysztof.kozlowski@linaro.org>
 <CAPLW+4kwFCLaiowajdCnA09eT4emOB-3d-6cbA=ZYyRLwYuCxw@mail.gmail.com>
 <dfd956d5-d62d-52ac-c485-afc71c441df5@linaro.org>
 <CAPLW+4mWq5Q4Ht1Upx2Xw3fMfNvvSK6fEPbLFru1NLpKHLbKOg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAPLW+4mWq5Q4Ht1Upx2Xw3fMfNvvSK6fEPbLFru1NLpKHLbKOg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 25/11/2022 15:57, Sam Protsenko wrote:
> On Fri, 25 Nov 2022 at 08:47, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 25/11/2022 15:22, Sam Protsenko wrote:
>>> On Fri, 25 Nov 2022 at 05:22, Krzysztof Kozlowski
>>> <krzysztof.kozlowski@linaro.org> wrote:
>>>>
>>>> Exynos5433 has several different SYSREGs, so use dedicated compatibles
>>>> for them.
>>>>
>>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>
>>>> ---
>>>>
>>>> Cc: Sriranjani P <sriranjani.p@samsung.com>
>>>> Cc: Chanho Park <chanho61.park@samsung.com>
>>>> Cc: Sam Protsenko <semen.protsenko@linaro.org>
>>>> ---
>>>
>>> Hi Krzysztof,
>>>
>>> Just curious: what is the rationale for adding those more specific
>>> sysregs? AFAIR, e.g. in Exynos850, different SysReg instances have
>>> pretty much the same register layout.
>>>
>>
>> On Exynos5433 all these blocks have different registers. Are you saying
>> that Exynos850 has four (or more) sysregs which are exactly the same?
>> Same registers? Why would they duplicate it?
>>
> 
> Ah, no, you are right. Just checked it, they are different. Just first
> couple of registers are similar between blocks, that's why I memorized
> it wrong.
> 
> So as I understand, adding those new compatibles follows "describe HW,
> not a driver" rule? Because AFAIU, right now it'll fallback to
> "syscon" compatible anyway.

Yes, they describe hardware. Of course all of these sysregs are similar
as they are just bunch of SFR/MMIO-region, but they have different
roles/features. For example some other devices (users) of syscon/sysreg
should reference specific device, not any sysreg.

On several other architectures we use specific compatibles, so I think
for Samsung we should do the same.

Different case was for Exynos 3/4/5 where there was only one SYSREG.

Best regards,
Krzysztof

