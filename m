Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C82D1C46467
	for <linux-samsung-soc@archiver.kernel.org>; Sat, 26 Nov 2022 13:08:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229551AbiKZNIC (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Sat, 26 Nov 2022 08:08:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiKZNIB (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Sat, 26 Nov 2022 08:08:01 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54A071C12A
        for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Nov 2022 05:07:59 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id be13so10698852lfb.4
        for <linux-samsung-soc@vger.kernel.org>; Sat, 26 Nov 2022 05:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PumZpgWWCLIt7GuPFKuRL0B5pDS2/W2Oy2A7hBHkkG0=;
        b=ivWfLCpCTigcI4CW6DnkfkcGmtbFXQdDSOHEfEY9ANghziwgE0vyCf30XMc7LxVqlz
         DX7EI/eII8uVUIvrXN2yuGievg1KPUSHmjOGWzL2qD/IKKHGVxs8opyuPT92FbSMXwRj
         jOrAcdEvQ71f1E/32SX90VQxcW5KO0fUolyAUsdDtp2xc0DioE/T+XPjrQPi/B+TMEqm
         1O9+b09wZia+PgDBG7lcoKTbGx+kvtYFkiLf9gLRa3ene6mTjLWcTwxt5bU+3/uK6u0u
         rFnCKE0Pak7H1a1GozXdKLZ1Df2k9H+A9asulM/3Ly8+RpfbC+F3SMR99SHDP711CTPk
         QmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PumZpgWWCLIt7GuPFKuRL0B5pDS2/W2Oy2A7hBHkkG0=;
        b=1BGcVxWrUAmO45IIE8//ljevudXIdRxKq3TkAWIHwXn56t9vMvRnCGife+gatPtgm4
         aE9SG6Q4J3l0HKebsFzUOdniCx7m+OR0sakxf6neTYELt2tBfTIqRfLpWXc5nnJG0lJk
         ctXIK3EHHorFJgzAwoEND6j0OoUl0WQokyYv3hAnze4DHUMwIIfkXiHv0fPfzInLkp3l
         KcAdG3O+9J8YUlXNkUEf9SCnH1NHZpTuSYHQlC9JGB0lJemng3I3iaFLhZDiex17Zw7l
         QDMVeu6109EVY8BpgEVNIBQ0E+r5i4dxFlWO1FjX3hOaQ5ZV/eaOaeyJiHwOJEoQAaYa
         seXg==
X-Gm-Message-State: ANoB5pncnHl7padrnKLw5DhNI47f/4J4oO73iuxWqf+TsiZhDJ+eOYgP
        iZZipJZAVcf7r73GgYeYb9F9qg==
X-Google-Smtp-Source: AA0mqf4KKLZQIWEHr4q51nApvU3vh2NWWMLJctdKVErLPvKx4kWD7uVIvt/497Orjd1ZPEKrw9AjAQ==
X-Received: by 2002:a05:6512:48b:b0:4b4:9196:af54 with SMTP id v11-20020a056512048b00b004b49196af54mr8332834lfq.686.1669468076446;
        Sat, 26 Nov 2022 05:07:56 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o5-20020a198c05000000b00498fc3d4d15sm911376lfd.190.2022.11.26.05.07.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Nov 2022 05:07:55 -0800 (PST)
Message-ID: <fc6f32e1-9aa6-8106-24e4-ff020e641c48@linaro.org>
Date:   Sat, 26 Nov 2022 14:07:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/4] dt-bindings: soc: samsung: exynos-sysreg: split from
 syscon
To:     Sriranjani P <sriranjani.p@samsung.com>,
        'Lee Jones' <lee@kernel.org>,
        'Rob Herring' <robh+dt@kernel.org>,
        'Krzysztof Kozlowski' <krzysztof.kozlowski+dt@linaro.org>,
        'Alim Akhtar' <alim.akhtar@samsung.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     'Chanho Park' <chanho61.park@samsung.com>,
        'Sam Protsenko' <semen.protsenko@linaro.org>
References: <20221125112201.240178-1-krzysztof.kozlowski@linaro.org>
 <CGME20221125112238epcas5p25b27eec809d72032216f2f8c375ea45b@epcas5p2.samsung.com>
 <20221125112201.240178-2-krzysztof.kozlowski@linaro.org>
 <016d01d900da$c46a6d80$4d3f4880$@samsung.com>
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <016d01d900da$c46a6d80$4d3f4880$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 25/11/2022 15:32, Sriranjani P wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski [mailto:krzysztof.kozlowski@linaro.org]
>> Sent: 25 November 2022 16:52
>> To: Lee Jones <lee@kernel.org>; Rob Herring <robh+dt@kernel.org>;
> Krzysztof
>> Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Alim Akhtar
>> <alim.akhtar@samsung.com>; devicetree@vger.kernel.org; linux-
>> kernel@vger.kernel.org; linux-arm-kernel@lists.infradead.org;
> linux-samsung-
>> soc@vger.kernel.org
>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>; Sriranjani P
>> <sriranjani.p@samsung.com>; Chanho Park <chanho61.park@samsung.com>;
>> Sam Protsenko <semen.protsenko@linaro.org>
>> Subject: [PATCH 2/4] dt-bindings: soc: samsung: exynos-sysreg: split from
>> syscon
>>
>> Split Samsung Exynos SoC SYSREG bindings to own file to narrow the
> bindings
>> and do not allow other parts of syscon.yaml.  This allows further
> customization
>> of Samsung SoC bindings.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>
>> ---
>>
>> Cc: Sriranjani P <sriranjani.p@samsung.com>
>> Cc: Chanho Park <chanho61.park@samsung.com>
>> Cc: Sam Protsenko <semen.protsenko@linaro.org>
>> ---
> 
> We agree for add separate YAML for  Samsung Exynos and hence I think we can 
> go ahead and add  separate yaml for Tesla FSD.
> Reviewed-by: Sriranjani P <sriranjani.p@samsung.com>

Tesla FSD should go to the same file. No need for another binding for
same design...

Best regards,
Krzysztof

