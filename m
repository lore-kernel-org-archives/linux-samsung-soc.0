Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 814CAEDE98F
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 14 Sep 2023 08:03:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235969AbjINIDm (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 14 Sep 2023 04:03:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236065AbjINIDl (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 14 Sep 2023 04:03:41 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 862ADA1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Sep 2023 01:03:37 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-99c1c66876aso85401966b.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 14 Sep 2023 01:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694678616; x=1695283416; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4NRB4alMY1NVgea7TozYUMItQUlkCZKiIlDqxQtzmM8=;
        b=Unc+nWjND6ZGB0WKXskuSUQ75iChOQoisCFygUyR2s+F6ZZY68pYqatSeI8VFq5D2W
         QTIGbmPmOCmZHvDVqWv0ihyefbz0GAbt6WglYpw2Vgolc6xgcP4rB63s363/kmnhMBmy
         xk+hbatpweg5XLXvzT+zg4xFPSzVYo/GxgPbS8/A5pJMIl8MpGyhM9e1TAnT9P6Q2Nuq
         6vYYZe28cp3MfzWRdPuwDW7RwLeStQP7M8oyzTSPTZrsqzYvcW6/r9xQD8wSuy4xVmgr
         HPn5+HjgCW4JVAELnPQddT1FR4hhtiNK5LOx7CdDgbwSlurAVoCxLB/nLS2uOkSgFmqM
         L4Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694678616; x=1695283416;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4NRB4alMY1NVgea7TozYUMItQUlkCZKiIlDqxQtzmM8=;
        b=ZULOdcrzRNz/XJWGqxbvf5pzPQPOn8y8gtjjpU58EJCI31xN7vnt2pvmIolINkc8yr
         2BMzaJAXL9orA0lwJgDTsgpkNu20y4xUmd2cgdYunO4MIqo64PFMD01iF3evCLus8/r/
         +V4mA4/8/+m3AsbTERBWAGKPajt0BDO6jV9wENEBqN6m2yAhxm3pWdn5gra2wuRij/Wq
         AF4NHhSP9uXwekUIzBjh4UbcXtBrhcATs9woJznztivnADtA0VF5zbsoneTOkAfQtc/E
         ICTPV3cvMHfJ1p3UniCOTZIvHnVVjPrIG9zzA0mYZABHpZI1t+rl5+mghXOQ+NfxA/ig
         b1AQ==
X-Gm-Message-State: AOJu0YzR6my3reJ5n1QsnOGllZeH7jwR1jFY2dBI6vU3uHUkCLRN3BlA
        uHOLFB6vk99jgZExfQAJKDUH9Q==
X-Google-Smtp-Source: AGHT+IFV4DfNqYLwUOKA3yGGXOAhUvrZ0uU0sDJrGix/jT6KMxNQwV//CEpyKC2hA+lZLd08e7+uJA==
X-Received: by 2002:a17:906:5a5f:b0:9aa:20b2:35e7 with SMTP id my31-20020a1709065a5f00b009aa20b235e7mr3762342ejc.9.1694678615900;
        Thu, 14 Sep 2023 01:03:35 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id v4-20020a17090690c400b00992b1c93279sm619880ejw.110.2023.09.14.01.03.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Sep 2023 01:03:34 -0700 (PDT)
Message-ID: <f69b4727-679f-7874-2d0e-137d17e5841f@linaro.org>
Date:   Thu, 14 Sep 2023 10:03:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2] ARM: dts: exynos: enable polling in Exynos 4210
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Mateusz Majewski <m.majewski2@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
References: <CGME20230911133431eucas1p2631e7060cecb0914933ed45b837cf8eb@eucas1p2.samsung.com>
 <20230911133417.14042-1-m.majewski2@samsung.com>
 <e30a38fd-ea70-d5de-795f-9c8ea3177ac4@linaro.org>
In-Reply-To: <e30a38fd-ea70-d5de-795f-9c8ea3177ac4@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 14/09/2023 10:01, Krzysztof Kozlowski wrote:
> On 11/09/2023 15:34, Mateusz Majewski wrote:
>> It seems that thermal in Exynos 4210 is broken without this, as it will
>> never decrease cooling after increasing it.
>>
>> Signed-off-by: Mateusz Majewski <m.majewski2@samsung.com>
>> ---
>> v1 -> v2: Just uploaded separately from all the thermal: exynos:
>>   patches with a shorter recipient list, no change otherwise.
>>
>>  arch/arm/boot/dts/samsung/exynos4210.dtsi | 10 ++++++++--
>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm/boot/dts/samsung/exynos4210.dtsi b/arch/arm/boot/dts/samsung/exynos4210.dtsi
>> index 0e27c3375e2e..aae185b7f91c 100644
>> --- a/arch/arm/boot/dts/samsung/exynos4210.dtsi
>> +++ b/arch/arm/boot/dts/samsung/exynos4210.dtsi
>> @@ -391,8 +391,14 @@ &cpu_alert2 {
>>  };
>>  
>>  &cpu_thermal {
>> -	polling-delay-passive = <0>;
>> -	polling-delay = <0>;
>> +	/* Exynos 4210 supports thermal interrupts, but only for the rising threshold.
> 
> This is a friendly reminder during the review process.
> 
> It seems my previous comments were not fully addressed. Maybe my
> feedback got lost between the quotes, maybe you just forgot to apply it.
> Please go back to the previous discussion and either implement all
> requested changes or keep discussing them.
> 
> I fixed it up and applied.
> 

BTW, line wrapping was also not correct :/ Please follow coding style -
it is still 80, unless exception makes things readable. There is no need
for exception here.

Best regards,
Krzysztof

