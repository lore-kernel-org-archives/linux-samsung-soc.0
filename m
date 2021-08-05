Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B901C4338F
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Aug 2021 09:43:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 19F7861078
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Aug 2021 09:43:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239571AbhHEJn5 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Aug 2021 05:43:57 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:60080
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234746AbhHEJn4 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Aug 2021 05:43:56 -0400
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id A07FA3F10B
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Aug 2021 09:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628156621;
        bh=PlH+VlKUMlcX80piFT0gda5UUaZVZ2zU1R5Uqd41yvE=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=LmZehnVippZhk2SPYUljupAbaYK/eUjcu+Mkriyce/ICUlSqsZdgUv6Z+azPiQFeM
         z9Z/EtUQeAyDG/HnXiupfETEIBCpcwGNgYtoroHQbXmsqIitN4YfMSdoq+fStS4FEJ
         npbNUYPhT3vshj5D0b4WqG83wnkTKh/nG5NKtu1eGD3cHcdB6CvwoQH8cqlrytpQkv
         ZmxIFEnBAVe9fYlu0ID23oXU1Qbi90nQRHA76F0pLxwt5G2dsZGG7m42tFg4Tm3smj
         JhheomOdkogmMU/Tx8d9a7owPE1rKx+IUgOnC68wIESEcfL6ZlxGj7x8mgdSQN7GmT
         CtBCS0xOsPFXg==
Received: by mail-ed1-f69.google.com with SMTP id a23-20020a50ff170000b02903b85a16b672so2897460edu.1
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Aug 2021 02:43:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PlH+VlKUMlcX80piFT0gda5UUaZVZ2zU1R5Uqd41yvE=;
        b=JCyUU3/pAMODE20dRSaXI3a6Tvx7HfAi0DehNP0KlgEjmF0OXCaq11NlZBbPEQqG7s
         0R+HRDDBXhHRPPXjLED12q3TsvicrsjVYDKaLjtwijg9JZMB5l28g2kcTeB8A5KwWMa1
         CqlElZy9wG/sflQzq03RobaxXYi3MqprT3E8TEjpS+DHwOkhiSGyTGEH5pg7cJFGGlrk
         lDVsru1sDvVZEMn5vFHFj8u5r67SfahkYKo5cIJ3DtyIetqnkjslV4gfb6EeWPuDXXMV
         F2RpIL+Q5zDcA3ay1IyWK7BUXIf1cpMSzrvk3N4ieTmI1qgLdlR0J+FdMCojcSJ0sMfa
         7kIw==
X-Gm-Message-State: AOAM5337DNJTd0YY5fFvR4pGO6h54vNY7W6093vk/bL0a9Er1VZUdvse
        rUlpAoQt+pOe9OFOjm95yQK1n+Kg1VF5ySRIYh4CbJbjdEJyb4gRHwqHFF+u6McghZ8YA/eVz7g
        BcvDR9QAx1eK4+AR5QBswFODfT1dbdqEm4bWf0kMVef2k5ULQ
X-Received: by 2002:a17:906:c7c2:: with SMTP id dc2mr3972979ejb.472.1628156621383;
        Thu, 05 Aug 2021 02:43:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGoPDPK+MWVCmOjwAsROGmWLcIrk5p+yD4K34PJk7bXHMYE41l71FAk8Cu0oD/JmROctGTdA==
X-Received: by 2002:a17:906:c7c2:: with SMTP id dc2mr3972967ejb.472.1628156621254;
        Thu, 05 Aug 2021 02:43:41 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id o5sm1998626edc.16.2021.08.05.02.43.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Aug 2021 02:43:40 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: exynos: correct GIC CPU interfaces address
 range on Exynos7
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        'Rob Herring' <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     'Chanwoo Choi' <cw00.choi@samsung.com>,
        'Pankaj Dubey' <pankaj.dubey@samsung.com>,
        'Sam Protsenko' <semen.protsenko@linaro.org>,
        'Marc Zyngier' <maz@kernel.org>
References: <20210805072110.4730-1-krzysztof.kozlowski@canonical.com>
 <CGME20210805073653epcas5p21b4c2358b7de2b3c21dbc357af957137@epcas5p2.samsung.com>
 <b0d6ff2a-24af-96c1-62a1-8b920c63e05a@canonical.com>
 <03d701d789db$f275d290$d76177b0$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <7c019443-6153-f059-418b-3b268750f7a8@canonical.com>
Date:   Thu, 5 Aug 2021 11:43:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <03d701d789db$f275d290$d76177b0$@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 05/08/2021 11:26, Alim Akhtar wrote:
> Hi Krzysztof,
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> Sent: 05 August 2021 13:07
>> To: Rob Herring <robh+dt@kernel.org>; devicetree@vger.kernel.org; linux-
>> arm-kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linux-
>> kernel@vger.kernel.org
>> Cc: Alim Akhtar <alim.akhtar@samsung.com>; Chanwoo Choi
>> <cw00.choi@samsung.com>; Pankaj Dubey <pankaj.dubey@samsung.com>;
>> Sam Protsenko <semen.protsenko@linaro.org>; Marc Zyngier
>> <maz@kernel.org>
>> Subject: Re: [PATCH] arm64: dts: exynos: correct GIC CPU interfaces address
>> range on Exynos7
>>
>> On 05/08/2021 09:21, Krzysztof Kozlowski wrote:
>>> The GIC-400 CPU interfaces address range is defined as 0x2000-0x3FFF
>>> (by ARM).
>>>
>>
> Looking at DDI0471B_gic400_r0p1_trm.pdf, CPU interface range is 0x0000 ~ 0x10000
> 
>> I underestimated the issue - this is actually bug as there is a GICC_DIR
>> register at offset 0x1000. Therefore:
>>
> Looking at the exynos7 and exynos5433 UMs looks like GICC_DIR is at offset 0x2100 (from 0x1100_0000 GIC base)
> It is possible for you to cross check once?
> 

That's a mistake in Exynos manual. GICC_DIR is at 0x1000:
https://developer.arm.com/documentation/ddi0471/b/programmers-model/cpu-interface-register-summary

We have discussion here:
https://lore.kernel.org/linux-samsung-soc/0277c701-cc25-cdc5-d3b9-cf2cc2ba4de5@canonical.com/T/#m1ced9a28bed27f5cf74e281fb68efe1b57d5609e

Range of 0x10000 is definitely wrong as it overlaps with two other
ranges.


Best regards,
Krzysztof
