Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF3FC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu, 24 Mar 2022 11:49:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349861AbiCXLvU (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 24 Mar 2022 07:51:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349846AbiCXLvT (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 24 Mar 2022 07:51:19 -0400
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B41FA9026B;
        Thu, 24 Mar 2022 04:49:47 -0700 (PDT)
Received: by mail-ed1-f53.google.com with SMTP id b24so5288237edu.10;
        Thu, 24 Mar 2022 04:49:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nhtDJxx+rYit+5kY/+8k4LZTDafDnBdntGoPASkMFmE=;
        b=UIsVUQiPPIFp3Lb3DFH3S+t2LmDEDdtWT+ph8OpPNYD1z5lZSpWaweBT+SHPXy4T+M
         qyRbRLDaWWhqXZ3GxzLrdCW5qbCt7i1rkIqmLDpVbK3zCoi6g/kCRThpUwp8WodLFQ0n
         lzBgE1XF3K+vNejtdtKPvvMC9Lj6vaFBd2Jdhz3lUtmI9wreSQG0XYp1b6flMiat5Zgm
         aioCBLl886gwY7BEWTSsaQVU6TTmxtTityAk93YLEsPjwWiJ5hEJusOvdVZj6xDwfUAh
         74IPeMXazPIRNe/XKcIXF2agnrcsX1jGACbhgkkHz1IDgsNHtOS/OBM3T5nlWQZwjNN7
         Lczw==
X-Gm-Message-State: AOAM533mEKua0VbgZ/6y8vo78VvKVECXaqvcQvM1OTJJEcCRZTwFUcZw
        r5k1rdEDFey83/DpRgiS/lgb5Pz6E8JNQg==
X-Google-Smtp-Source: ABdhPJzdEYTxDqX15SKQ9PEXbajaY2optQk5N/wMsVOMxwQLd2TzNpQ+j8Q59Vhl9DfQ7Z/NyKS8Kg==
X-Received: by 2002:aa7:de96:0:b0:418:f9ca:67f6 with SMTP id j22-20020aa7de96000000b00418f9ca67f6mr6300917edv.25.1648122586128;
        Thu, 24 Mar 2022 04:49:46 -0700 (PDT)
Received: from [192.168.0.156] (xdsl-188-155-201-27.adslplus.ch. [188.155.201.27])
        by smtp.googlemail.com with ESMTPSA id v1-20020a1709064e8100b006e07d033572sm622970eju.33.2022.03.24.04.49.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Mar 2022 04:49:45 -0700 (PDT)
Message-ID: <414f1ad8-8ee1-9913-c0e8-b4f66f3e7180@kernel.org>
Date:   Thu, 24 Mar 2022 12:49:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/7] ARM: dts: s5pv210: Adjust I2S entries to match spec
Content-Language: en-US
To:     Jonathan Bakker <xc-racer2@live.ca>, alim.akhtar@samsung.com
Cc:     robh+dt@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CY4PR04MB0567E33A07D8761C2D485327CB179@CY4PR04MB0567.namprd04.prod.outlook.com>
 <CY4PR04MB056784D54ADDBB4F57F82D4ACB189@CY4PR04MB0567.namprd04.prod.outlook.com>
 <4ebe2bb9-4f92-2dff-6737-d057e5950b24@kernel.org>
 <f44c9881-6f7b-f4f5-8225-e0c74c83fab1@kernel.org>
 <CY4PR04MB05677B21384FCE2013EB1B94CB189@CY4PR04MB0567.namprd04.prod.outlook.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <CY4PR04MB05677B21384FCE2013EB1B94CB189@CY4PR04MB0567.namprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 23/03/2022 18:24, Jonathan Bakker wrote:
> Hi Krzysztof,
> 
> On 2022-03-23 8:15 a.m., Krzysztof Kozlowski wrote:
>> On 23/03/2022 16:14, Krzysztof Kozlowski wrote:
>>> On 23/03/2022 16:03, Jonathan Bakker wrote:
>>>> Based on the device tree spec, clocks should be ordered tx/rx.
>>>> Re-order from rx/tx to avoid warnings when running make dtbs_check
>>>>
>>>> Additionally, the number of #sound-dai-cells should be 1, not 0
>>>>
>>>> Signed-off-by: Jonathan Bakker <xc-racer2@live.ca>
>>>> ---
>>>>  arch/arm/boot/dts/s5pv210-aries.dtsi |  2 +-
>>>>  arch/arm/boot/dts/s5pv210.dtsi       | 18 +++++++++---------
>>>>  2 files changed, 10 insertions(+), 10 deletions(-)
>>>>
>>>> diff --git a/arch/arm/boot/dts/s5pv210-aries.dtsi b/arch/arm/boot/dts/s5pv210-aries.dtsi
>>>> index 70ff56daf4cb..503b5a50ef1a 100644
>>>> --- a/arch/arm/boot/dts/s5pv210-aries.dtsi
>>>> +++ b/arch/arm/boot/dts/s5pv210-aries.dtsi
>>>> @@ -644,7 +644,7 @@
>>>>  };
>>>>  
>>>>  &i2s0 {
>>>> -	dmas = <&pdma0 9>, <&pdma0 10>, <&pdma0 11>;
>>>> +	dmas = <&pdma0 10>, <&pdma0 9>, <&pdma0 11>;
>>>>  	status = "okay";
>>>
>>> Except that fix that's the same commit as here:
>>> https://lore.kernel.org/all/20200907161141.31034-26-krzk@kernel.org/
>>> so just extend it.
>>>
>>> sound-dai-cells should go to a separate commit. But are you sure they
>>> are correct? The Fascinate 4G seems to be using them as cells=0.
>>
>> See my previous patch and discussion:
>> https://lore.kernel.org/all/20200907161141.31034-10-krzk@kernel.org/
>>
> 
> Thanks, I'd totally forgotten about this series from the past.  I'll re-test
> those commits and submit your copies of them in v2 if that's OK with you and
> that they're confirmed functional?

My dma fixes change lacked this aries fix. The sound-dai-cells needed
more rethinking.


Best regards,
Krzysztof
