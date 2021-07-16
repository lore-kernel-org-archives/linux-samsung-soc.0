Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A8D3C07E95
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Jul 2021 09:12:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EEEBC613E8
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 16 Jul 2021 09:12:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231312AbhGPJPO (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 16 Jul 2021 05:15:14 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:55106
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230287AbhGPJPO (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 16 Jul 2021 05:15:14 -0400
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPS id 90263408B2
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Jul 2021 09:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1626426738;
        bh=XxeFkpT94fzaqhSrGg614mOHSF8BqPdtoH/zJQ41EJ4=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=Pq76nxvIq2hFcvQY+SQJDr+Gvcv9UwOuE2M2EaqpYKZmLtgNIAJYn576PRI89JYjy
         NGt+iteD5LfyePmTfrLyW6SPPp6wA9ZcsuVbXyvgGwDLqrE3jeVmuT3r7JB+p/6MfM
         9sc71ZaUdsIFFm7/41sUbUrRtR0Vokh64BFuMHhQVBlCqKqQ0DaedbNg1Tm2vuEiQ8
         pTpALo5LpEelST3WddIOg88YWWcTDdQGidbomTzAzm9/415T002dadAXUrjC95S9g2
         le5UEOb3rrkX1Sr24FC7GCmePLdQQ7ddgbVIlIcqP+ppyXrCAKvdbD8c/XHFWmeqan
         2OAPGVO06fBXA==
Received: by mail-ej1-f72.google.com with SMTP id 16-20020a1709063010b029037417ca2d43so3353842ejz.5
        for <linux-samsung-soc@vger.kernel.org>; Fri, 16 Jul 2021 02:12:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XxeFkpT94fzaqhSrGg614mOHSF8BqPdtoH/zJQ41EJ4=;
        b=Ql23J69+Nl7OwU0spfTukFtZeFFFVXqiVRGuXjUpT55oT6UdYBD3e/f/L3qSHYRyuM
         9qgVsYjdGn39imcecFuzjdTjIHH8G10BAjSUHJkkeEzL1AZ6UKNCRaLSjngkRiArFoXC
         cpREz2X6TtYDIWYdrCNT4A6ott4a/ad8AMv8rXp6NEkgMnlbi435cVC7NzlrtKOHZ3v5
         NBdwI5tjS6T/tcFFlkm6On+JTRtKAjH3G7g1ctkFKh/strMlsExklJBdB6IpLfVrhBUJ
         CFvesqLgstLSwBDkihrrG23l7sEGekavjRKdLMlkdWZ8LsZAOso/Lhzwdw47mBuZKarY
         h+Tg==
X-Gm-Message-State: AOAM533JbKSfr/RlrftSQYBrdypH8FeFgCqI95yYJBuUncvL3zMtKPKn
        JNQgU5mFPYi8U+fJTkWukIqZ2yzcRoV9AsDHW19vSTc2mXdWzyGz4MuFk4kddk8knq/enMjx+6A
        aiU/Tgji+yaU40+HcJuvT41+4gJ6Yzuqk/vjVoRczyELg+JDC
X-Received: by 2002:a17:906:ecb3:: with SMTP id qh19mr2748283ejb.113.1626426738229;
        Fri, 16 Jul 2021 02:12:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaMvFEXXfYpTa3bZrJ+/W4FPiffv73tNzG5zxnfnhbS0r8FmEL83ODvtv5wfqMkygLzhO7Sg==
X-Received: by 2002:a17:906:ecb3:: with SMTP id qh19mr2748267ejb.113.1626426738085;
        Fri, 16 Jul 2021 02:12:18 -0700 (PDT)
Received: from [192.168.3.211] (xdsl-188-155-177-222.adslplus.ch. [188.155.177.222])
        by smtp.gmail.com with ESMTPSA id d22sm2762654ejj.47.2021.07.16.02.12.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jul 2021 02:12:17 -0700 (PDT)
Subject: Re: [PATCH] usb: dwc2: Skip clock gating on Samsung SoCs
To:     Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     Felipe Balbi <felipe.balbi@linux.intel.com>,
        Artur Petrosyan <Arthur.Petrosyan@synopsys.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
References: <CGME20210716050132eucas1p285949f9a73764b173c29ad0fa8502f23@eucas1p2.samsung.com>
 <20210716050127.4406-1-m.szyprowski@samsung.com>
 <e2fc4d3f-2f64-1d7e-5816-0275da23d6fa@canonical.com>
 <6fb5313e-b2c0-7b3e-84f7-6333216f4292@synopsys.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <bb750c51-c01a-fb95-4ad5-2fd3f1c625f9@canonical.com>
Date:   Fri, 16 Jul 2021 11:12:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <6fb5313e-b2c0-7b3e-84f7-6333216f4292@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org


On 16/07/2021 11:07, Minas Harutyunyan wrote:
> Hi Krzysztof,
> 
> On 7/16/2021 12:10 PM, Krzysztof Kozlowski wrote:
>> On 16/07/2021 07:01, Marek Szyprowski wrote:
>>> Commit 0112b7ce68ea ("usb: dwc2: Update dwc2_handle_usb_suspend_intr
>>> function.") changed the way the driver handles power down modes in a such
>>> way that it uses clock gating when no other power down mode is available.
>>>
>>> This however doesn't work well on the DWC2 implementation used on the
>>> Samsung SoCs. When a clock gating is enabled, system hangs. It looks that
>>> the proper clock gating requires some additional glue code in the shared
>>> USB2 PHY and/or Samsung glue code for the DWC2. To restore driver
>>> operation on the Samsung SoCs simply skip enabling clock gating mode
>>> until one finds what is really needed to make it working reliably.
>>>
>>> Fixes: 0112b7ce68ea ("usb: dwc2: Update dwc2_handle_usb_suspend_intr function.")
>>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>>> ---
>>>   drivers/usb/dwc2/core.h      | 4 ++++
>>>   drivers/usb/dwc2/core_intr.c | 3 ++-
>>>   drivers/usb/dwc2/hcd.c       | 6 ++++--
>>>   drivers/usb/dwc2/params.c    | 1 +
>>>   4 files changed, 11 insertions(+), 3 deletions(-)
>>>
>>
>>
>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>>
> What mean your "Acked-by" tag? Do you want to mention that this commit 
> "Tested-by" or "Reviewed-by" by you?

My "Acked-by" means exactly what Linux process defines:
https://elixir.bootlin.com/linux/latest/source/Documentation/process/submitting-patches.rst#L426

Acked-by is neither Tested-by nor Reviewed-by. For the definition
of these other tags, please also see link above.

Best regards,
Krzysztof
