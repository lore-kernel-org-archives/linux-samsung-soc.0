Return-Path: <linux-samsung-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B743C64EC4
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  3 Mar 2023 10:38:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230411AbjCCKiK (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 3 Mar 2023 05:38:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230196AbjCCKiH (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 3 Mar 2023 05:38:07 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9460FD50E
        for <linux-samsung-soc@vger.kernel.org>; Fri,  3 Mar 2023 02:38:00 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id o12so8355757edb.9
        for <linux-samsung-soc@vger.kernel.org>; Fri, 03 Mar 2023 02:38:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1677839879;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ByV1DpFwrDiWSATjB7kIBSOH1G5jP8pmmsblB73XYQw=;
        b=yO882W4jvt6lpOQgMbjly2L3Do9JixBBZ2HzF9iBoDsg4UAdou724TCOshXb2XnWi5
         vexGjvGFUTBW+XFVRiI/NPeUbbSFyvFB5VpZAhivGzZP3iqtV9uHJ5ciaxD3sUuesDGE
         hEEwtxbrZyfoU2ryn1GMlPITZOAhXPIzDmdqZjzvC4qDmYbjbBydSsyJ6f8Q23MwkoYM
         nmr76wlLX2n0MF656IAeVf6qJUqAVIT+9/1QDVoDH34nli9eV74NtR+hjINkKat/kPhB
         yIS/7K/mSH8Gg1Z7EJrXpPC3zsuy+GZQ8iMP2TsB/Q2zphUjfpRsq4phL1eF1EeOacc1
         vlDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677839879;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ByV1DpFwrDiWSATjB7kIBSOH1G5jP8pmmsblB73XYQw=;
        b=gaUXDyjWRqcn1RhJ0Vxr4PM5CO1IGHn70gHG1osX6beRJFM7OMsfS2/JM4mCWXWRmw
         afMobkzIiQFFBco4BFKpAf3sDc2//lfGvY+kHFg9YWFhbuwxzsjJ/PkGnAAEyrzbokfX
         XRY/Qh10wMboQM7zLgA8LlBhZmvRMLN86rYl4CqHLwRhmUgf8jqJjiD2QIegdcENdYlm
         lA1N/Oap6y2qu1/rt5PB4gjTacDcWLHJaMVK4T7AKvT/FP04AxBjqqcNYUictBEkNMR1
         FkieVUvGvwHEyPZmWuaIgMsWy47RVxFFkHMIfQVn9aRGxS6eHdstbXuYdeGqMCfsyuRd
         I/KA==
X-Gm-Message-State: AO0yUKUmJg+10gLqZQ/hqpDZaC244a13Z5L9ZtiYJBA3nFr5E8qa2JxR
        rY8ENsXv+Xd29DGTM8aldvWgyw==
X-Google-Smtp-Source: AK7set8XdyIl0PIsmIXF7DLaUSseLygG5dm9ED972P5q3w+BqiGXDJcX4QQ7oRxM+yI+7X1QwGHlDg==
X-Received: by 2002:a17:906:fe44:b0:88f:8a5:b4cd with SMTP id wz4-20020a170906fe4400b0088f08a5b4cdmr1604008ejb.1.1677839878805;
        Fri, 03 Mar 2023 02:37:58 -0800 (PST)
Received: from [192.168.1.20] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id k21-20020a05640212d500b004aee4e2a56esm1003739edx.0.2023.03.03.02.37.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 02:37:58 -0800 (PST)
Message-ID: <28914007-ee30-636b-eaf4-2180110f589e@linaro.org>
Date:   Fri, 3 Mar 2023 11:37:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 06/16] arm64: dts: exynos: Rename the term elbi to appl
Content-Language: en-US
To:     Shradha Todi <shradha.t@samsung.com>, lpieralisi@kernel.org,
        kw@linux.com, robh@kernel.org, bhelgaas@google.com,
        krzysztof.kozlowski+dt@linaro.org, alim.akhtar@samsung.com,
        jingoohan1@gmail.com, Sergey.Semin@baikalelectronics.ru,
        lukas.bulwahn@gmail.com, hongxing.zhu@nxp.com, tglx@linutronix.de,
        m.szyprowski@samsung.com, jh80.chung@samsung.co,
        pankaj.dubey@samsung.com
Cc:     linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230214121333.1837-1-shradha.t@samsung.com>
 <CGME20230214121428epcas5p3d91e877e62a78008d2b0d6066efea059@epcas5p3.samsung.com>
 <20230214121333.1837-7-shradha.t@samsung.com>
 <31e377b7-88bf-8737-0397-44ecca8cff54@linaro.org>
 <139801d94d07$fc0b9e70$f422db50$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <139801d94d07$fc0b9e70$f422db50$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 02/03/2023 14:07, Shradha Todi wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski [mailto:krzysztof.kozlowski@linaro.org]
>> Sent: 16 February 2023 16:34
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
>> Subject: Re: [PATCH 06/16] arm64: dts: exynos: Rename the term elbi to appl
>>
>> On 14/02/2023 13:13, Shradha Todi wrote:
>>> DT uses the name elbi in reg-names for application logic registers
>>> which is a wrong nomenclature. This patch fixes the same.
>>>
>>> This commit shouldn't be applied without changes
>>> "dt-bindings: PCI: Rename the term elbi to appl" and
>>> "PCI: samsung: Rename the term elbi to appl"
>>
>> Dependencies and patch ordering goes after '---', because there is no point
>> to store it in git history.
>>
> 
> Understood will take care in next set of patches.
> 
>> Anyway, that's an ABI break and Exynos5433 is quite stable, so without clear
>> indication of fixed bug, we should not do this.
>>
> 
> We have strong technical reason to do so.
> 
> As per DWC PCIe UM, ELBI delivers an inbound register RD/WR received by the controller to external application registers when the controller
> is expected to generate the PCIe completion of this register RD/WR.
> In this driver register space which is currently marked as ELBI, is not used for this purpose (Not sure why original author has named this set of registers as ELBI)
> So to keep this technically correct, it should be marked as application specific wrapper register space.
> We used name as "appl" taking reference from intel-gw-pcie.yaml's similar register space named as "app", whereas in nvidia,tegra194-pcie.yaml it's named "appl". 
> 
> So our argument is if a future Samsung manufactured SoC having DWC PCIe controller comes with support of real ELBI interface, we need to use the name elbi.
> We know such SoC exists but they are not yet upstreamed.
> 
> Ready to adopt the best possible suggested method to make this happen but I really think the name ELBI is misleading.

All this is rather reason for a future case. What is the problem
experienced now?

Best regards,
Krzysztof

