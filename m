Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEFB3C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  2 Jun 2022 09:37:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230222AbiFBJhQ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 2 Jun 2022 05:37:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232172AbiFBJhO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 2 Jun 2022 05:37:14 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D6592A3A2B
        for <linux-samsung-soc@vger.kernel.org>; Thu,  2 Jun 2022 02:37:12 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id x5so426167edi.2
        for <linux-samsung-soc@vger.kernel.org>; Thu, 02 Jun 2022 02:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=UbAi11qp5DTn/kiY7uPuGBDObYw/10Y1J5If4iuylkU=;
        b=hspK3aDSUha2ZlbLkIA4SyM1rE7MGAnEU8h5hlnsgElBeQ9W6KayPlQaKlWLwrAuA5
         Saag/wD5eOfxStucPV5KaWWW5ZQMLcshP/opeVN04jFhTn1KfPJQGtKSrs+kaSgNzAZP
         9yQo2w7phSDgvaJ+FkPrjSaIQJsWqenwWsXDoMlBoD/4j4DqUWl+Myiwbd8Lcd1yWhEo
         UwnOeIY2P+Np+bA4GrLJdX1+5o6ky/ok9dO9LfUTqjSPVY9iSNdV1JTvkiG396yi4eLD
         lPVsksCDuKkdStRSKx4qN35YmRzQdcLeB0Xc09fig9Y9r+23V6vUBu1wK3Z+loUA+c+k
         /vjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=UbAi11qp5DTn/kiY7uPuGBDObYw/10Y1J5If4iuylkU=;
        b=c6j52CNxFne5LbbH/5b8Ua5RbrY/ETdiuFl40H4t/5w205tJtaZ2vDvQUQVcv5Nkar
         0PUDOXJFQdx6yI+2mPV4vIUJARC8TBiAOYgX09HaYlMGb8vzgl58naYdjTCs6TUCFcyU
         mPxg6FKGZr4+eL/wU5gBnxXIqETNqlSDQ1XVDwRPTQo+kkjUyrTJ1qSp1SACaRx4oNom
         JhQ/dvANnGHtUIwhE44YpnsliEO65hT2BpMvBtLPji1/19w3/v6WrcMQ/zD4tQiyr5EZ
         sJL2pePvtxB+3KZbLjKw31Pb1vwZCQ0G3g31+Qw2Ir4n585+FPlW3GvDZ7yNN46nkLg3
         P6TA==
X-Gm-Message-State: AOAM532OBms2YDcH9RhbuT4ERmFKEedeC6me4MFni2tTH50VwdERT4w3
        SCzLn0f8Mf2Gu3h48Y4PvGcv3w==
X-Google-Smtp-Source: ABdhPJymJuZyD9JpI2fUlnCh+hsniUb5OSHN+1erAyXcoN5TVNkuBzXsGhuVH2mYjVFW/7lyBo6o+A==
X-Received: by 2002:a05:6402:430d:b0:42e:199a:4eb8 with SMTP id m13-20020a056402430d00b0042e199a4eb8mr1106417edc.411.1654162630874;
        Thu, 02 Jun 2022 02:37:10 -0700 (PDT)
Received: from [192.168.0.181] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id fx10-20020a170906b74a00b00708743e31b2sm1240308ejb.27.2022.06.02.02.37.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jun 2022 02:37:10 -0700 (PDT)
Message-ID: <b16915f7-a4b7-4512-77fb-b2cdd8e7cdb4@linaro.org>
Date:   Thu, 2 Jun 2022 11:37:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 1/6] dt-bindings: phy: samsung,ufs-phy: make pmu-syscon
 as phandle-array
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Chanho Park <chanho61.park@samsung.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     devicetree@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220602053250.62593-1-chanho61.park@samsung.com>
 <CGME20220602053329epcas2p4c2baca2d161814f5d51dc48722f904b1@epcas2p4.samsung.com>
 <20220602053250.62593-2-chanho61.park@samsung.com>
 <44fceb66-fd33-4b2d-fe8e-9a1a5837a51a@linaro.org>
In-Reply-To: <44fceb66-fd33-4b2d-fe8e-9a1a5837a51a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 02/06/2022 11:34, Krzysztof Kozlowski wrote:
> On 02/06/2022 07:32, Chanho Park wrote:
>> To support secondary ufs phy devices, we need to get an offset value
>> from pmu-syscon.
>>
>> Signed-off-by: Chanho Park <chanho61.park@samsung.com>
>> ---
>>  .../devicetree/bindings/phy/samsung,ufs-phy.yaml    | 13 ++++++++++---
>>  1 file changed, 10 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
>> index f6ed1a005e7a..d0ba92aa578d 100644
>> --- a/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/samsung,ufs-phy.yaml
>> @@ -40,9 +40,16 @@ properties:
>>        - const: tx0_symbol_clk
>>  
>>    samsung,pmu-syscon:
>> -    $ref: '/schemas/types.yaml#/definitions/phandle'
>> -    description: phandle for PMU system controller interface, used to
>> -                 control pmu registers bits for ufs m-phy
>> +    $ref: '/schemas/types.yaml#/definitions/phandle-array'
>> +    items:
>> +      minItems: 1
>> +      items:
>> +        - description: phandle for PMU system controller interface, used to
>> +                       control pmu registers bits for ufs m-phy
>> +        - description: offset of the pmu control register
> 
> This does not work... Please test your bindings with different cases.

Just to be clear - when I mentioned that minItems should be on second
items level, I meant it should affect the second items list, not the
first. Now you can have 1, 2 or 10 phandles.


Best regards,
Krzysztof
