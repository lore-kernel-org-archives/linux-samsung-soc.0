Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1237EC43217
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 26 Nov 2022 13:08:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbiKZNIt (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 26 Nov 2022 08:08:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229446AbiKZNIs (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 26 Nov 2022 08:08:48 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65D1B1C10E
        for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Nov 2022 05:08:47 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id z4so8020491ljq.6
        for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Nov 2022 05:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kBp9JJJ8y9iJjxZRAAxiuLXJ4T2FaosTbSPRiHvomTk=;
        b=bST3FkgoBljZ5d3OnIxGZe694KSTcTtbU7/LamQOhEBhuRF5W2cZybdVk7PBbPhf/z
         V/WUfp695FFhu2WImtkfdYtIcPHpVs0TJM44SSFvtsfclcHIJ9E5VUsuUbnK2ofTsSVE
         O/qvyOru7KZQo3SFpW8EZllT9HfPeKdDLQlfnl7gSrsoHbfw3mXlfTWnURQ/vMW3ddi5
         PHqvUweV7ZEzGe1kW8DddH1qITGrPRp0/dGOsF6Z6pU8e+NGS1FCuNvohtVxjJbALS2r
         HHxc9Gm/fs6bcUEvWWfAr2elbZNzYuNsa39Ul8RdXsiY3/ES91l/Hp4SjnJGWLDAqgUz
         rHJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kBp9JJJ8y9iJjxZRAAxiuLXJ4T2FaosTbSPRiHvomTk=;
        b=bFTR1xlOX0g/Xwo6QbVjWkLLJ3Qi2/kRMTyBvdEt+phfpv8GaO4HR5qhzVF+bOTJ3T
         D/aRTH/MPpYoIcPSRqHjbAz+8GAdzTfdjFGebxgy3fu3+yIuNZJzbkoGZ8Ru8eOshTXp
         Ai3EzpqBPt1M/1Ifkbiu1Tj5kbVds1ng4di41+tETVrMIArTuVvoMopdNBgq21f1PKPv
         JrzsPR6yHRKziYOXTqzA1ZZDJWg2Z72WHeGLbE3cUAfnhgYYwoyGGujVbpRxat0eW06f
         WET+HU9NOQyb8ihJVC0co8eREVPnT1dDuYmc2OO5v55qN4BxNRTOtDPZHGfLgzRMQ6Qf
         hMrA==
X-Gm-Message-State: ANoB5pkibsfSoWm2kKes3S2CAS/wYlzp6K4/A8TKtAXMpnqaSll5tlPY
        EqrAwanySfizoqHh94/EgnDdGw==
X-Google-Smtp-Source: AA0mqf7wRdpO5GEpd9igTtQ2FsMD4Iu4RPsZKe+3QvKfPtldGePuaubW6od0RFNNbWpvHhgAS/id+Q==
X-Received: by 2002:a2e:6a17:0:b0:277:fae:902e with SMTP id f23-20020a2e6a17000000b002770fae902emr9927508ljc.267.1669468125710;
        Sat, 26 Nov 2022 05:08:45 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id b11-20020ac2410b000000b004b40c2fccfdsm933446lfi.59.2022.11.26.05.08.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Nov 2022 05:08:45 -0800 (PST)
Message-ID: <8cc27053-0635-b34f-cef8-8ac307060f1d@linaro.org>
Date:   Sat, 26 Nov 2022 14:08:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 3/4] dt-bindings: soc: samsung: exynos-sysreg: add
 dedicated SYSREG compatibles to Exynos5433
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        'Lee Jones' <lee@kernel.org>,
        'Rob Herring' <robh+dt@kernel.org>,
        'Krzysztof Kozlowski' <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     'Sriranjani P' <sriranjani.p@samsung.com>,
        'Chanho Park' <chanho61.park@samsung.com>,
        'Sam Protsenko' <semen.protsenko@linaro.org>
References: <20221125112201.240178-1-krzysztof.kozlowski@linaro.org>
 <CGME20221125112241epcas5p1d9558a8de5bfa807ed6dc5c55635c900@epcas5p1.samsung.com>
 <20221125112201.240178-3-krzysztof.kozlowski@linaro.org>
 <01a901d900f0$3b025560$b1070020$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <01a901d900f0$3b025560$b1070020$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 25/11/2022 18:06, Alim Akhtar wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski [mailto:krzysztof.kozlowski@linaro.org]
>> Sent: Friday, November 25, 2022 4:52 PM
>> To: Lee Jones <lee@kernel.org>; Rob Herring <robh+dt@kernel.org>;
>> Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Alim Akhtar
>> <alim.akhtar@samsung.com>; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
>> samsung-soc@vger.kernel.org
>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>; Sriranjani P
>> <sriranjani.p@samsung.com>; Chanho Park <chanho61.park@samsung.com>;
>> Sam Protsenko <semen.protsenko@linaro.org>
>> Subject: [PATCH 3/4] dt-bindings: soc: samsung: exynos-sysreg: add
> dedicated
>> SYSREG compatibles to Exynos5433
>>
>> Exynos5433 has several different SYSREGs, so use dedicated compatibles for
>> them.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Cc: Sriranjani P <sriranjani.p@samsung.com>
>> Cc: Chanho Park <chanho61.park@samsung.com>
>> Cc: Sam Protsenko <semen.protsenko@linaro.org>
>> ---
>> .../bindings/soc/samsung/samsung,exynos-sysreg.yaml | 13 ++++++++++++-
>> 1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git
>> a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-
>> sysreg.yaml
>> b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-
>> sysreg.yaml
>> index 68064a5e339c..42357466005e 100644
>> --- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-
>> sysreg.yaml
>> +++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-
>> sysre
>> +++ g.yaml
>> @@ -17,10 +17,21 @@ properties:
>>               - samsung,exynos3-sysreg
>>               - samsung,exynos4-sysreg
>>               - samsung,exynos5-sysreg
>> -              - samsung,exynos5433-sysreg
>>               - samsung,exynos850-sysreg
>>               - samsung,exynosautov9-sysreg
>>           - const: syscon
>> +      - items:
>> +          - enum:
>> +              - samsung,exynos5433-cam0-sysreg
>> +              - samsung,exynos5433-cam1-sysreg
>> +              - samsung,exynos5433-disp-sysreg
>> +              - samsung,exynos5433-fsys-sysreg
>> +          - const: samsung,exynos5433-sysreg
>> +          - const: syscon
>> +      - items:
>> +          - const: samsung,exynos5433-sysreg
>> +          - const: syscon
>> +        deprecated: true
> Any reason to add "deprecated: true" here for above compatible?

Because it should be used alone as unspecific.

Best regards,
Krzysztof

