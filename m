Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1187C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 30 Sep 2022 07:08:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230488AbiI3HIE (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 30 Sep 2022 03:08:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbiI3HIC (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 30 Sep 2022 03:08:02 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF0F11D9816
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Sep 2022 00:08:01 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id a8so5475337lff.13
        for <linux-samsung-soc@vger.kernel.org>; Fri, 30 Sep 2022 00:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=nLJnMnuF27KpA54oCyazXvMEh65rDHKWB2qGdOWup6o=;
        b=dfmkwZ8TCwiafjYtCW45hVGIkW2t/An31iW6b/oglbbyqZvQMwrwR/8bPQlpeym3Bv
         91HDEHYPHjHUIosK8WztZ2XhFuf0uqhiZnh0ESybq3ZvoVtB+E7TuZU9wfLz9QlUWjTy
         GxpPMJQLbt7UmB+hmcobwJa/b1eXEwK3PniXzWw11LZJr889iYz+AS7j1LMQew2d1FPr
         s7C7yP/6FLG1jw24IATvrNEJQfXwZJvzOl02lqa/MGnMLbs1zsgAjI4iVqQJhiAezQ/+
         K1mbgyQKEfLcVwXVqX1b3jLHTOTe1BVn0orLFv6SpLhJbR19ahWo4IM+tH9YU1qLSGcT
         Q5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=nLJnMnuF27KpA54oCyazXvMEh65rDHKWB2qGdOWup6o=;
        b=4eV3yzDHRA1fH9JNsUnaNXby1Z+jqlH7WDcmPGJ+u2+vymFUZ9YFWvPS1qfk15goX9
         LC/3pzOA2mZTV1ufn9BEGCWqHqodehobswzH12fgIiNo7mgdl7+p+mduCqSZttqt5oQ+
         I1ExG2AQYYUUnWS/xHQfiAPTZ3buu9ECFuR2B7DiTSsVJQNOitgA9Pqs8wiT6P2d0gh0
         PyEdJCs1lmH4lglfrokj1jylDmNaMyfIXORjbqIETO6c2da4wtKql9SmW3Ot2vZ7cQQc
         nuSJ3gETOUKmKvXhiwmETX0+1agvJ4PLJ5vkKQXrzqFk9OAcO8RTqqNDvJOYtr3MXv7m
         Qyuw==
X-Gm-Message-State: ACrzQf3GX2h/r6RT4Ez6lXvshOyFZ8tLbMrCV0g/KhdEWIflUzsNfp3g
        brmzYm0gPYGeg9K1Oe7Hqm9DUg==
X-Google-Smtp-Source: AMsMyM6TmE2GOXzon3ucipybgwTivKMpek15bxf0HQkuASIYDcfMTXgavt/SZx50tvXv0SOklI0UPA==
X-Received: by 2002:a05:6512:3e4:b0:497:a649:6627 with SMTP id n4-20020a05651203e400b00497a6496627mr3116789lfq.326.1664521679980;
        Fri, 30 Sep 2022 00:07:59 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id k15-20020a05651239cf00b00499b19f23e8sm195644lfu.279.2022.09.30.00.07.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Sep 2022 00:07:59 -0700 (PDT)
Message-ID: <9d65aa4f-3db9-c7e1-f41c-41db8877372e@linaro.org>
Date:   Fri, 30 Sep 2022 09:07:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] dt-bindings: samsung: soc: match preferred naming in
 entire compatible
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220926124757.475471-1-krzysztof.kozlowski@linaro.org>
 <20220929212845.GA2725627-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220929212845.GA2725627-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 29/09/2022 23:28, Rob Herring wrote:
> On Mon, Sep 26, 2022 at 02:47:57PM +0200, Krzysztof Kozlowski wrote:
>> Compatible is a string-array, therefore the "select" should look for
>> anything containing Samsung SoC part.  This allows to validate cases
>> like:
>>  - "samsung,exynos5250-gsc", "samsung,exynos5-gsc"
>>  - "samsung,exynos5250-pmu", "syscon"
>>  - "tesla,fsd-mct", "samsung,exynos4210-mct"
>>
>> Since Tesla FSD builts on top of Exynos blocks, add an adidtional
>> pattern for it.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> ---
>>  .../bindings/arm/samsung/samsung-soc.yaml     | 26 +++++++++++++++----
>>  1 file changed, 21 insertions(+), 5 deletions(-)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/samsung/samsung-soc.yaml b/Documentation/devicetree/bindings/arm/samsung/samsung-soc.yaml
>> index 653f85997643..bb1fdc205b44 100644
>> --- a/Documentation/devicetree/bindings/arm/samsung/samsung-soc.yaml
>> +++ b/Documentation/devicetree/bindings/arm/samsung/samsung-soc.yaml
>> @@ -18,17 +18,33 @@ description: |
>>      samsung,exynos5433-cmu-isp
>>  
>>  select:
>> -  properties:
>> -    compatible:
>> -      pattern: "^samsung,.*(s3c|s5pv|exynos)[0-9a-z]+.*$"
>> +  allOf:
>> +    - properties:
>> +        $nodename:
>> +          pattern: '^[a-z]'
> 
> Why do you need this?

Because otherwise I am matching top-level board compatible, which
obviously do not fall into my patterns.

> 
>> +    - properties:
>> +        compatible:
>> +          contains:
>> +            pattern: "^samsung,.*(s3c|s5pv|exynos)[0-9a-z]+.*$"
>>    required:
>>      - compatible
>>  
>>  properties:
>>    compatible:
>>      oneOf:
>> -      - description: Preferred naming style for compatibles of SoC components
>> -        pattern: "^samsung,(s3c|s5pv|exynos|exynosautov)[0-9]+-.*$"
>> +      - description: Preferred naming style for compatibles of S3C/S5P/Exynos SoC components
>> +        minItems: 1
>> +        items:
>> +          - pattern: "^samsung,(s3c|s5pv|exynos|exynosautov)[0-9]+-.*$"
>> +          - {}
>> +          - {}
> 
> Wouldn't just contains be fine here too:
> 
> contains:
>   pattern: "^samsung,(s3c|s5pv|exynos|exynosautov)[0-9]+-.*$"

Somehow it does not work like it should - nodes with wrong compatibles
pass. I tested with fake compatibles like:
samsung,cmu-exynos5433-cmu-top
samsung,exynos54xx-cmu-cpif

Best regards,
Krzysztof

