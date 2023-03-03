Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AD84C7EE2F
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Mar 2023 10:06:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229766AbjCCKGW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 3 Mar 2023 05:06:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229816AbjCCKGV (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Mar 2023 05:06:21 -0500
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 485E3E053
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Mar 2023 02:06:19 -0800 (PST)
Received: by mail-ed1-x52c.google.com with SMTP id x3so7998567edb.10
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Mar 2023 02:06:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677837978;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A52iRvnx5c7MGijeXJmmv5mrghysldEPBrnjdkAkJZ4=;
        b=yr1lGj5AdVK9kPgEvrtJdc3zZz5bDs0BSUoUjg+sHzLPIMJTsPXA3OQ9nUqXxlNLZ+
         ZmLGPmzovNOCnWNSKxurap8WIvGeWrYRu80UjGAyRj8vm7cBTLTgMBajvllO4gZItrnQ
         XPfoX8g7C0Hp0ZZQ1dJQUG0uZXCHumzAVxP+yqxR5oWNsrDatY0vYddtrdgUSGV9PdMm
         4EGZnFcJJ7WNoEGWhA5TE2hgwKollJcggbKcpjnWUHpOs1Mcjtz/9AvkcIE0byxowqAo
         0LgC7WvNUc9Omqt0Nk9AZ7VOjPQlO2n555IuBNXFRTIvxJ/Z+q6BvNFEojv5DTF9Tz/1
         P8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677837978;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A52iRvnx5c7MGijeXJmmv5mrghysldEPBrnjdkAkJZ4=;
        b=3YwUr4N75xSWwIp28TsSbf9aSSKSl9+vzCvcNlPdaXmIpKNOnCQuz0ufS/7tkjbxBn
         2Kh0CfP7opfDdTYG7vjDPr5ANdr69yWWXumMhZitvrl0NAM8tjWwGlq2hITh4W/NT0oe
         dw846KfmJXEiAdH8IQSPWgYsf4ZZNGFvmYMYuqGZvv+Z61Y8XUJoNQG0PmoQkrA49HXM
         TagfsUWjrwC2jIkmATFz/JVGOjjfeu2HRv8ZrQputU+8i5FSntIpMQiFd5bQ6p6ASm2G
         R9zeHrT6Z7kE/hJ9zUUh6YCiHVv63zh9PkuRADY66Iuz3nUa+7ch7DPM1/JrQ6quRv6i
         dTkw==
X-Gm-Message-State: AO0yUKXawJiOZRBAMaKt7Q+/vbzF5rtc7TjWSLugzlUCHgs1reb7bPIc
        zxDmxS1Q5cIMQJLUEwCHGnXCBw==
X-Google-Smtp-Source: AK7set+ehJpZq1NePXVYHcpcgCL/tQBG+1grBrCeNQPJL4QzQpW6BkSTT9hiFKaiWt2LgNJT6dtWTA==
X-Received: by 2002:aa7:c392:0:b0:4ac:d2b4:5e37 with SMTP id k18-20020aa7c392000000b004acd2b45e37mr1173029edq.39.1677837977750;
        Fri, 03 Mar 2023 02:06:17 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v5-20020a50d085000000b004af5968cb3bsm969650edd.17.2023.03.03.02.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 02:06:17 -0800 (PST)
Message-ID: <f175dcae-2729-2bac-d2e8-088537354160@linaro.org>
Date:   Fri, 3 Mar 2023 11:06:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 08/16] PCI: samsung: Rename exynos_pcie to samsung_pcie
Content-Language: en-US
To:     Pankaj Dubey <pankaj.dubey@samsung.com>,
        'Shradha Todi' <shradha.t@samsung.com>, lpieralisi@kernel.org,
        kw@linux.com, robh@kernel.org, bhelgaas@google.com,
        krzysztof.kozlowski+dt@linaro.org, alim.akhtar@samsung.com,
        jingoohan1@gmail.com, Sergey.Semin@baikalelectronics.ru,
        lukas.bulwahn@gmail.com, hongxing.zhu@nxp.com, tglx@linutronix.de,
        m.szyprowski@samsung.com, jh80.chung@samsung.co
Cc:     linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230214121333.1837-1-shradha.t@samsung.com>
 <CGME20230214121436epcas5p1641de02220bea5edb23bc875b6311270@epcas5p1.samsung.com>
 <20230214121333.1837-9-shradha.t@samsung.com>
 <a4bfad9d-b9df-28a5-6bee-5cbbca4dd23f@linaro.org>
 <146301d94d03$002ba040$0082e0c0$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <146301d94d03$002ba040$0082e0c0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 02/03/2023 13:32, Pankaj Dubey wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: Thursday, February 16, 2023 4:37 PM
>> To: Shradha Todi <shradha.t@samsung.com>; lpieralisi@kernel.org;
>> kw@linux.com; robh@kernel.org; bhelgaas@google.com;
>> krzysztof.kozlowski+dt@linaro.org; alim.akhtar@samsung.com;
>> jingoohan1@gmail.com; Sergey.Semin@baikalelectronics.ru;
>> lukas.bulwahn@gmail.com; hongxing.zhu@nxp.com; tglx@linutronix.de;
>> m.szyprowski@samsung.com; jh80.chung@samsung.co;
>> pankaj.dubey@samsung.com
>> Cc: linux-pci@vger.kernel.org; devicetree@vger.kernel.org; linux-arm-
>> kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linux-
>> kernel@vger.kernel.org
>> Subject: Re: [PATCH 08/16] PCI: samsung: Rename exynos_pcie to
>> samsung_pcie
>>
>> On 14/02/2023 13:13, Shradha Todi wrote:
>>> The platform specific structure being used is named exynos_pcie.
>>> Changing it to samsung_pcie for making it generic.
>>>
>>> Suggested-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>>> Signed-off-by: Shradha Todi <shradha.t@samsung.com>
>>> ---
>>>  drivers/pci/controller/dwc/pci-samsung.c | 190
>>> +++++++++++------------
>>>  1 file changed, 95 insertions(+), 95 deletions(-)
>>>
>>> diff --git a/drivers/pci/controller/dwc/pci-samsung.c
>>> b/drivers/pci/controller/dwc/pci-samsung.c
>>> index d5adf1017a05..be0177fcd763 100644
>>> --- a/drivers/pci/controller/dwc/pci-samsung.c
>>> +++ b/drivers/pci/controller/dwc/pci-samsung.c
>>> @@ -23,7 +23,7 @@
>>>
>>>  #include "pcie-designware.h"
>>>
>>> -#define to_exynos_pcie(x)	dev_get_drvdata((x)->dev)
>>> +#define to_samsung_pcie(x)	dev_get_drvdata((x)->dev)
>>>
>>>  /* PCIe APPL registers */
>>>  #define EXYNOS_PCIE_IRQ_PULSE			0x000
>>> @@ -51,7 +51,7 @@
>>>  #define EXYNOS_PCIE_APPL_SLV_ARMISC		0x120
>>>  #define EXYNOS_PCIE_APPL_SLV_DBI_ENABLE	BIT(21)
>>>
>>> -struct exynos_pcie {
>>> +struct samsung_pcie {
>>
>> No, I don't see benefit of this at all. How we call stuff inside driver is not related
>> whether this is for Tesla or Exynos. We could even call it "pony". :) Thus
>> renamings just to support new variant of Samsung device is not a good reason.
>>
> Whole intention of this whole series was to make exynos-pcie driver to support for all Samsung manufactured SoCs be it Exynos series or custom ASIC such as fsd, artpect-v8. 

But the patches does not do it, at least mostly. It only renames which
does not bring any support... what's more, such renames without actual
context - support for the new devices - is a bit pointless.

> 
> While doing so, we feel for better readability and conveying better names for files, structs, internal APIs will help developers for understanding and reusing it. For example we know that clock initialization will remain common (thanks for bulk_clk_xxx APIs) so we kept APIs for handling clocks starting with samsung_clk_xxxx, but if we have to implement two variant of APIs, or struct targeting different platforms it would be good if they have platform specific prefixes. This will help in grep or future code maintenance.

Without context it's impossible to judge whether this makes any sense.

Best regards,
Krzysztof

