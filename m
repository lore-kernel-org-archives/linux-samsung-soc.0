Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6210C432BE
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Aug 2021 12:32:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB1AB61163
	for <linux-samsung-soc@archiver.kernel.org>; Fri,  6 Aug 2021 12:32:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243835AbhHFMcg (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 6 Aug 2021 08:32:36 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:50238
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1343700AbhHFMca (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 6 Aug 2021 08:32:30 -0400
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 6705F40642
        for <linux-samsung-soc@vger.kernel.org>; Fri,  6 Aug 2021 12:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628253134;
        bh=YQe/91rqxclnbWHtwO35T2bNBoJfLztQell5eud2D5g=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=tk29V8Bu+mN22wT5koB0MhhraYtDWCz/Ye1Mt/rNO5QxxKIIAaO9CccUZaQ6Pc0Hj
         xepHrbBlDBcMWibAWr1Oqir5NOM/j+lTtyCMGTpuW3KxtkrGuQxIRxFfO8a2MoyfPr
         8G7aAQ/1tJkbA1Rpir3aZ4uZiYT98H6ZQsVaqPqS+IF2++vxBjF8uwiLnEsgSNPb2H
         06qrE1g5WVFNpb/59V/hY6TbKDHCm9UiD4BwtFFmW5snZBnQ3wuLty22g+fiC8Q7xO
         XYEx1pBR8UwfSAcSxQ13fwK1pS19Xkmd6NsfWh2cnpVt3ZlUy5/eYPNEGsZ5Qz4d6P
         5205yLLhamByw==
Received: by mail-lf1-f72.google.com with SMTP id s1-20020a0565122141b02903bf02f21443so2937038lfr.17
        for <linux-samsung-soc@vger.kernel.org>; Fri, 06 Aug 2021 05:32:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YQe/91rqxclnbWHtwO35T2bNBoJfLztQell5eud2D5g=;
        b=S9JMbUjysbNtGdoDmwR4v5Y7sX2U9KGjhdufwJActLYxbFoUj8Rp7R34IPTfqj3Rq0
         X73lG6uSF7Tu7jZwDi+ae/nCsNNTLpRXf2JTCYGf1WdogGiF1ZtfVEzDvk6SDrTyNW+y
         IgXJrQhK9Je/nFqnhKMRM5ApekikkKFdon+DO9nEhOgRPVH0OXa99PZQT3V9bTAg0DKR
         XbT2Ne8KnKe55pllPQ4/O/EUm/MDFk1Ut/V89EeV+4fqKzTIRXyrWSAHp5CVucdwnHca
         4PeN1/jtx7lMs3fymuNkGL7ho8D2Itxf1/kiZZlwbIU23wHDYk0XktvitEKR1aGMlq2X
         h+pQ==
X-Gm-Message-State: AOAM533/tartvLXBmR283mMH3CfKwYIO29NQtZkoprVHj5sqtTvc1JHo
        Tq07auZyRuTG/MY1MHS+9P7dh1BV8h+/enWPADmBInnoP0zMW+HZNoVAUTjPEwvehJhinouLsGG
        wfDvwrIqAkL/OzYG2y1Oe8KEFc6+mpc2nnBpwcGuVN8BtixpB
X-Received: by 2002:a05:6402:4245:: with SMTP id g5mr1726654edb.222.1628253123596;
        Fri, 06 Aug 2021 05:32:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPTsSpDhFkB5QZHp+lNdByTmL0W66nvl/IYvdDKIE3av+cgSJZOTy0u6WCyCiMVy5KpW0G1A==
X-Received: by 2002:a05:6402:4245:: with SMTP id g5mr1726635edb.222.1628253123479;
        Fri, 06 Aug 2021 05:32:03 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id h19sm3870934edt.87.2021.08.06.05.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Aug 2021 05:32:03 -0700 (PDT)
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
 <20210730144922.29111-13-semen.protsenko@linaro.org>
 <455cfb5e-dff7-a5c0-3875-49abe3e900f3@canonical.com>
 <CAPLW+4nDS0atrbUFagDA0W_Ky5MvOiY+N+NQoQ+me4pndp_iWg@mail.gmail.com>
 <68734f6c-fc76-595c-8d34-8924dbbbb845@canonical.com>
 <CAPLW+4n_JKj5xeBHXONcv__vyAFvx3fhXoxJa17NTHK1RSJFJw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 12/12] arm64: dts: exynos: Add Exynos850 SoC support
Message-ID: <b753796c-2ce6-4166-7c20-289e950237ad@canonical.com>
Date:   Fri, 6 Aug 2021 14:32:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4n_JKj5xeBHXONcv__vyAFvx3fhXoxJa17NTHK1RSJFJw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 06/08/2021 14:07, Sam Protsenko wrote:
> On Fri, 6 Aug 2021 at 10:49, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> On 06/08/2021 01:06, Sam Protsenko wrote:
>>> On Sat, 31 Jul 2021 at 12:03, Krzysztof Kozlowski
>>> <krzysztof.kozlowski@canonical.com> wrote:
>>>
>>>>>
>>>>> This patch adds minimal SoC support. Particular board device tree files
>>>>> can include exynos850.dtsi file to get SoC related nodes, and then
>>>>> reference those nodes further as needed.
>>>>>
>>>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>>>>> ---
>>>>>  .../boot/dts/exynos/exynos850-pinctrl.dtsi    | 782 ++++++++++++++++++
>>>>>  arch/arm64/boot/dts/exynos/exynos850-usi.dtsi |  30 +
>>>>>  arch/arm64/boot/dts/exynos/exynos850.dtsi     | 245 ++++++
>>>>
>>>> Not buildable. Missing Makefile, missing DTS. Please submit with initial
>>>> DTS, otherwise no one is able to verify it even compiles.
>>>>
>>>
>>> This device is not available for purchase yet. I'll send the patch for
>>> board dts once it's announced. I can do all the testing for now, if
>>> you have any specific requests. Would it be possible for us to review
>>> and apply only SoC support for now? Will send v2 soon...
>>
>> What you propose is equal to adding a driver (C source code) without
>> ability to compile it. What's the point of having it in the kernel? It's
>> unverifiable, unbuildable and unusable.
>>
> 
> Yes, I understand. That's adding code with no users, and it's not a
> good practice.
> 
>> We can review the DTSI however merging has to be with a DTS. Usually the
>> SoC vendor adds first an evalkit (e.g. SMDK board). Maybe you have one
>> for Exynos850? Otherwise if you cannot disclose the actual board, the
>> DTSI will have to wait. You can submit drivers, though.
>>
> 
> Sure, let's go this way. I'll send v2 soon. Improving patches and
> having Reviewed-by tag for those would good enough for me at this
> point. I'll continue to prepare another Exynos850 related patches
> until the actual board is announced, like proper clock driver, reset,
> MMC, etc. Is it ok if I send those for a review too (so I can fix all
> issues ahead)?

Sure, prepare all necessary drivers earlier. I suspect clocks will be a
real pain because of significant changes modeled in vendor kernel. I
remember Paweł Chmiel (+Cc) was doing something for these:
https://github.com/PabloPL/linux/tree/exynos7420

I mentioned before - you should also modify the chipid driver. Check
also other drivers in drivers/soc/samsung, although some are needed only
for suspend&resume.

BTW, Paweł,
How is your Exynos7420 progress? :)

> And should I maybe add RFC tag for those?

No need. Drivers can be merged before DTS users.

Best regards,
Krzysztof
