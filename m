Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1359AC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 28 Apr 2022 10:45:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232140AbiD1Ksh (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 28 Apr 2022 06:48:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230122AbiD1Ksf (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 28 Apr 2022 06:48:35 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AB9F890BD
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Apr 2022 03:45:21 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id l18so8702567ejc.7
        for <linux-samsung-soc@vger.kernel.org>; Thu, 28 Apr 2022 03:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=cYKCRoREjH87n5LGj1ImFAnKPWrOHAXKmxpNcNNNnIw=;
        b=l17YCFMxKiwjEr5HZ0HPvJ9Lp/No3mKPtEwmSTNmRmgT2RGTJcYSTwyW3ZAGFxNhhG
         hemeitu4DciYBdWDTVfpRkaS4x14zdyI4L6NtXH1TBAWKHDN9AyxE/u3/GlKo2LuRr8S
         R5kWe+WsFQl6l1GEXZamWspcggud4YW1AHazmNflTGkpcSZN2UwIGJ457pndK0rlZbk5
         bDtLeUKFu+7YurGBdZ2t+SrjRzkoneO4541QY4RHWSC+7E2Bm+EVDy+YyF8Y40k0FiJZ
         UT+6IDNuGkq8AQRkGQh4GZGA6YYifsOo8ZX1qcpZWS09L30vH/rRXx09o4OVFllVV0xL
         t3GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=cYKCRoREjH87n5LGj1ImFAnKPWrOHAXKmxpNcNNNnIw=;
        b=xaWuWORQDA1SXJ8hxGpo8ErBR5yV6d0XsW1hBu01ivD6TRCOJfDN0827fuANOcUU4H
         5fDkUIHKAg4aPVYBgzsrvoTOemHJJi4mwT8nfl+nhtQhYybhqt9jteUrJb6dt4cbqr49
         HzvfTEsiSVO8aqCvoXI8NsvtIeZzaz1ZjzAFyLkR7D2LmLei5xQonRp6dYjGRvkeLAHI
         kj6EARBncTC0TLnlI8NPO+ifDY8URUG+HjqN1lFAH/QBMm1dpceQxzCChO653oYCENVG
         taq3xBxB0tBcXEdINEsEtrUVOcjS5vRlHoOaXzyeN4brzQhpv9MnXRUKWVS0FmdxvEFA
         s8hg==
X-Gm-Message-State: AOAM530fK6dYU9nSpkMLwdDyW9MOBl+AcpCvMUg0CYJ66mdCumwyFaMa
        jRlEk+97RmLhFwYY8hPCzOPJPA==
X-Google-Smtp-Source: ABdhPJyp6f5iGveZCxbZ+tLf8F4Iv7cCwecumgh+r4Mv003t4J9QnoHQJbOmBYZwweCyrVxme8/N/g==
X-Received: by 2002:a17:907:7ba3:b0:6ef:f9ca:f2da with SMTP id ne35-20020a1709077ba300b006eff9caf2damr20181561ejc.634.1651142719668;
        Thu, 28 Apr 2022 03:45:19 -0700 (PDT)
Received: from [192.168.0.161] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id h7-20020a1709060f4700b006e8d0746969sm8053221ejj.222.2022.04.28.03.45.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Apr 2022 03:45:19 -0700 (PDT)
Message-ID: <d8448fa4-3cec-db1c-c132-d875cab61572@linaro.org>
Date:   Thu, 28 Apr 2022 12:45:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 04/10] arm64: dts: juno: use proper
 'dma-channels/requests' properties
Content-Language: en-US
To:     Robin Murphy <robin.murphy@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Broadcom Kernel Team <bcm-kernel-feedback-list@broadcom.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>
References: <20220427155840.596535-1-krzysztof.kozlowski@linaro.org>
 <20220427155840.596535-5-krzysztof.kozlowski@linaro.org>
 <1d1aae6e-50db-d6db-9727-62f9c2d1ca6b@arm.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1d1aae6e-50db-d6db-9727-62f9c2d1ca6b@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 28/04/2022 12:43, Robin Murphy wrote:
> On 2022-04-27 16:58, Krzysztof Kozlowski wrote:
>> pl330 DMA controller bindings documented 'dma-channels' and
>> 'dma-requests' properties (without leading hash sign), so fix the DTS to
>> match the bindings.
>>
>> Reported-by: Rob Herring <robh@kernel.org>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>   arch/arm64/boot/dts/arm/juno-base.dtsi | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/arm/juno-base.dtsi b/arch/arm64/boot/dts/arm/juno-base.dtsi
>> index 4f40a5c8f565..96ef0ddc0b2d 100644
>> --- a/arch/arm64/boot/dts/arm/juno-base.dtsi
>> +++ b/arch/arm64/boot/dts/arm/juno-base.dtsi
>> @@ -829,8 +829,8 @@ dma-controller@7ff00000 {
>>   		compatible = "arm,pl330", "arm,primecell";
>>   		reg = <0x0 0x7ff00000 0 0x1000>;
>>   		#dma-cells = <1>;
>> -		#dma-channels = <8>;
>> -		#dma-requests = <32>;
>> +		dma-channels = <8>;
>> +		dma-requests = <32>;
> 
> BTW, this has always been wrong - Juno is configured with only 8 request 
> interfaces. But then it's moot anyway since PL330 has an ID register for 
> this stuff[1], so the DT properties aren't used by Linux, and shouldn't 
> be needed in general.

Marek also raised the point [1] that these properties are useless for
PL330 because the actual data is read from the device registers.

I understand you are also supporting the idea of removing them from
pl330 device nodes?

[1]
https://lore.kernel.org/linux-devicetree/20220427155840.596535-1-krzysztof.kozlowski@linaro.org/T/#mf108b8c9f0d513ebc6e381775e3c6887b5c2fe31

Best regards,
Krzysztof
