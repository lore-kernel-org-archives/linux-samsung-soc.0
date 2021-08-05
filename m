Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7312FC4338F
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Aug 2021 09:45:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4CD3560F25
	for <linux-samsung-soc@archiver.kernel.org>; Thu,  5 Aug 2021 09:45:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239045AbhHEJpn (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Thu, 5 Aug 2021 05:45:43 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:60212
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239159AbhHEJpm (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Thu, 5 Aug 2021 05:45:42 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id E9DCD3F109
        for <linux-samsung-soc@vger.kernel.org>; Thu,  5 Aug 2021 09:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628156698;
        bh=eq4sHLyLRo38xlokxNFSRX3L+vSvOngMzJAr9ypms3s=;
        h=Subject:From:To:Cc:References:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=UB7DyAAp87dLJSrhSrxvV1IOcspBHPeVPuI2hPq2Bbzi1W3SOtYfvd4PqAAMTCSYl
         hGaieSzBPiOoBr93x2fJuiLZ4L3zCPOjpYHxo4HTN9fuHVKHGxtDdqk9jzAoc0C9pO
         vHEVgyYBBNaXm2MVZq0NfhFSOTdHNWyDxT1eb1tuyJHiSUu/SQzwER5wILTCmi5E0t
         3S26r125c3ecZEmX3Q/eQzNBhDOrcJ2JZv5pymxgLtQBXwiFQZQOxYYtWwdzXCdvQl
         JKmQYF/UkTYih/7jr3Oda3ApqHW81PkbyCcaVJdVsKo4ykC0DyNyXBAQYybt7MhAvi
         8xu/UjGBngksg==
Received: by mail-ed1-f72.google.com with SMTP id p2-20020a50c9420000b02903a12bbba1ebso2870993edh.6
        for <linux-samsung-soc@vger.kernel.org>; Thu, 05 Aug 2021 02:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eq4sHLyLRo38xlokxNFSRX3L+vSvOngMzJAr9ypms3s=;
        b=eYv8AnSQq/pG2ZevpqKmYDeoDfCIDVmg8ecXkGp+7l1m6rXxcbvW8c75WpcyqatrWl
         AyZU8KTSGLDZ3LKC/+lHOuYk5tXSOqJTXl7uDK0ZBJ+mpiMCRR+TV9BCKWIBmEsFF18W
         q10UXyOOQrRfUAXxH7tQ3rmqMEbsj070bQmS1Nw35ysgCKl7o/Gpv7oQdGNn1ds1RemD
         Xjgau0/+LoXtj4fgk8J483YiVnLuL4WqaLpA7fUNo84WEeETmHwB0A4pUPWt62DYZbI7
         TUdIfqx8JdPq3cVa2HHb0CDDOLDYJzNuQFdC8MNPKkevul78t2QZvzktNgF4gNj60f6I
         YDyw==
X-Gm-Message-State: AOAM531hSwZquk1WAbEn5e9D7NM2kemTYSCmZYrdDpk4lKnpxrwzurSP
        myBfT/Mmj4hIo0MlUHrHFNrPtAVo4zIvB6MgeKss3+NZQhLx88+Af5GiMB6G23RqyySb9Y7zArT
        b4Xh/QR/CB3cLoHIXnaRiuftUvem2PGWV/D8iBu+n64ZYPvDw
X-Received: by 2002:a17:906:70a:: with SMTP id y10mr3852262ejb.381.1628156698745;
        Thu, 05 Aug 2021 02:44:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEo7uFha2cwn65X0bkEZr/Cg0CxuSlgPy6k3dOYxyK2z2ZGphK8vaAGNcJrVjcpVnwxnmwtA==
X-Received: by 2002:a17:906:70a:: with SMTP id y10mr3852248ejb.381.1628156698548;
        Thu, 05 Aug 2021 02:44:58 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id h15sm1506392ejg.31.2021.08.05.02.44.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Aug 2021 02:44:57 -0700 (PDT)
Subject: Re: [PATCH] arm64: dts: exynos: correct GIC CPU interfaces address
 range on Exynos7
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
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
 <7c019443-6153-f059-418b-3b268750f7a8@canonical.com>
Message-ID: <4fc60199-44cd-41ea-9178-92b131d21b73@canonical.com>
Date:   Thu, 5 Aug 2021 11:44:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <7c019443-6153-f059-418b-3b268750f7a8@canonical.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 05/08/2021 11:43, Krzysztof Kozlowski wrote:
> On 05/08/2021 11:26, Alim Akhtar wrote:
>> Hi Krzysztof,
>>
>>> -----Original Message-----
>>> From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>> Sent: 05 August 2021 13:07
>>> To: Rob Herring <robh+dt@kernel.org>; devicetree@vger.kernel.org; linux-
>>> arm-kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org; linux-
>>> kernel@vger.kernel.org
>>> Cc: Alim Akhtar <alim.akhtar@samsung.com>; Chanwoo Choi
>>> <cw00.choi@samsung.com>; Pankaj Dubey <pankaj.dubey@samsung.com>;
>>> Sam Protsenko <semen.protsenko@linaro.org>; Marc Zyngier
>>> <maz@kernel.org>
>>> Subject: Re: [PATCH] arm64: dts: exynos: correct GIC CPU interfaces address
>>> range on Exynos7
>>>
>>> On 05/08/2021 09:21, Krzysztof Kozlowski wrote:
>>>> The GIC-400 CPU interfaces address range is defined as 0x2000-0x3FFF
>>>> (by ARM).
>>>>
>>>
>> Looking at DDI0471B_gic400_r0p1_trm.pdf, CPU interface range is 0x0000 ~ 0x10000
>>
>>> I underestimated the issue - this is actually bug as there is a GICC_DIR
>>> register at offset 0x1000. Therefore:
>>>
>> Looking at the exynos7 and exynos5433 UMs looks like GICC_DIR is at offset 0x2100 (from 0x1100_0000 GIC base)
>> It is possible for you to cross check once?
>>
> 
> That's a mistake in Exynos manual. GICC_DIR is at 0x1000:

0x1000 from CPU base offset, so 0x3000 from GIC base.

> https://developer.arm.com/documentation/ddi0471/b/programmers-model/cpu-interface-register-summary
> 
> We have discussion here:
> https://lore.kernel.org/linux-samsung-soc/0277c701-cc25-cdc5-d3b9-cf2cc2ba4de5@canonical.com/T/#m1ced9a28bed27f5cf74e281fb68efe1b57d5609e
> 
> Range of 0x10000 is definitely wrong as it overlaps with two other
> ranges.


Best regards,
Krzysztof
