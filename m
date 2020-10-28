Return-Path: <SRS0=5Pkx=ED=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE079C56202
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 28 Oct 2020 22:40:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 585322076B
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 28 Oct 2020 22:40:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="itqqTQ6m"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389049AbgJ1Wke (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:40:34 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:39127 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389042AbgJ1Wkd (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Oct 2020 18:40:33 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20201028094400euoutp01b4529596b601cea3552ce2e704259de5~CHsMOKk351003110031euoutp01u
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Oct 2020 09:44:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20201028094400euoutp01b4529596b601cea3552ce2e704259de5~CHsMOKk351003110031euoutp01u
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1603878240;
        bh=OeUXq/HWrD297QZ6nBPiLM+CaY/t56PSFxZTcF03lwQ=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=itqqTQ6mO3jLQ1Gbkt0B3cb1RDE8s/N/IR1mg0ofpBecbrF1If2bQOBeZUM/RVx9c
         vNty1VYIgW/+q7gp/f7mDkzTcSOZtKnC0AxQUlCQYOEI6inZtzGnUHJ6f9cIedcKV8
         hJHToKxJlCal4sTgGKGJlODMjS6Ml4K+Bekbn1+I=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20201028094355eucas1p1460c91c39ecd5a97e86e08133d017f77~CHsHSLwIn2469024690eucas1p11;
        Wed, 28 Oct 2020 09:43:55 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id A0.A9.05997.A5D399F5; Wed, 28
        Oct 2020 09:43:55 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201028094354eucas1p276bc31d7b0caa105886af742b7100d4e~CHsGzOtbm0990309903eucas1p2d;
        Wed, 28 Oct 2020 09:43:54 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201028094354eusmtrp12056676e50bd6ad2491a64f355ea1215~CHsGyfwnR2907529075eusmtrp1R;
        Wed, 28 Oct 2020 09:43:54 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-c0-5f993d5a650d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id BE.45.06314.A5D399F5; Wed, 28
        Oct 2020 09:43:54 +0000 (GMT)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201028094354eusmtip1e12d7dfb7f3ac3ec9973fd8462b6b05f~CHsGTQkHx2487424874eusmtip1f;
        Wed, 28 Oct 2020 09:43:54 +0000 (GMT)
Subject: Re: [PATCH v2 2/2] ARM: move device tree mapping out of linear
 region
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Nicolas Pitre <nico@fluxnic.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        Rob Herring <robh+dt@kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <c740495b-2dc1-3e19-27f1-153114f5f96d@samsung.com>
Date:   Wed, 28 Oct 2020 10:43:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAMj1kXGXcNydxXjNnbKcy3qSETuMbqWSwRrTLqZ7-p99P4c2Mg@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrNKsWRmVeSWpSXmKPExsWy7djPc7rRtjPjDeZuYrL4+eU9o8Wvd0fY
        Lc6f38BuMeXPciaLTY+vsVrMOL+PyeLQ1L2MFvNevGCzaN17hN2B0+PytYvMHs9OtLN57Jx1
        l91j06pONo871/aweWxeUu/xeZNcAHsUl01Kak5mWWqRvl0CV8b/h7dYCv4KV9xZmdHAOFWg
        i5GDQ0LAROLz1uQuRi4OIYEVjBL7HneyQzhfGCU27WgHcjiBnM+MElM2aME07OqLhKhZzijx
        or0VquE9o8SupdtYQRqEBQIk3r+YwAJiiwioSPxoessIYjMLXGeS6N8pCWKzCRhKdL3tYgOx
        eQXsJOZ82gZWzyKgKvFp+mOwelGBJIm/n/8wQ9QISpyc+QSshlMgUOLYgR1MEDPlJba/ncMM
        YYtL3HoynwnkIAmBc+wSUz6cBFsgIeAiMeHmLUYIW1ji1fEt7BC2jMTpyT0sEA3NjBIPz61l
        h3B6GCUuN82A6rCWuHPuFxvI/8wCmhLrd+lDhB0ljjTcZIYEC5/EjbeCEEfwSUzaNh0qzCvR
        0SYEUa0mMev4Ori1By9cYp7AqDQLyWuzkLwzC8k7sxD2LmBkWcUonlpanJueWmyUl1quV5yY
        W1yal66XnJ+7iRGYpE7/O/5lB+OuP0mHGAU4GJV4eG8ozIgXYk0sK67MPcQowcGsJMLrdPZ0
        nBBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFe40UvY4UE0hNLUrNTUwtSi2CyTBycUg2MoUctO5/k
        susemzBtm9z24ytCFDR0ta51LZzDeOxw4JywuA3sLD4rzENymdcdP3DsoO06exc1RWsPW/Gw
        +qkM96dn89nIp1S+maj053Fs5qoZd64t3My+uXV5g6jKvyzZP8UJijvXZeR7pa1YtaBlKpNv
        5K7PRocf/E4wLzDjnXpgvqtK/r4SJZbijERDLeai4kQAv4rT6U4DAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAIsWRmVeSWpSXmKPExsVy+t/xu7pRtjPjDbruK1j8/PKe0eLXuyPs
        FufPb2C3mPJnOZPFpsfXWC1mnN/HZHFo6l5Gi3kvXrBZtO49wu7A6XH52kVmj2cn2tk8ds66
        y+6xaVUnm8eda3vYPDYvqff4vEkugD1Kz6Yov7QkVSEjv7jEVina0MJIz9DSQs/IxFLP0Ng8
        1srIVEnfziYlNSezLLVI3y5BL+P/w1ssBX+FK+6szGhgnCrQxcjBISFgIrGrL7KLkYtDSGAp
        o0TrtvOsXYycQHEZiZPTGqBsYYk/17rYIIreMkrsWXuSESQhLOAnsXrvT7AiEQEViR9NbxlB
        ipgFbjJJbJjWxw7R8Y1JoqltHVgHm4ChRNdbkFGcHLwCdhJzPm1jAbFZBFQlPk1/DFYjKpAk
        8fLCVCaIGkGJkzOfgNVwCgRKHDuwAyzOLGAmMW/zQ2YIW15i+9s5ULa4xK0n85kmMArNQtI+
        C0nLLCQts5C0LGBkWcUoklpanJueW2yoV5yYW1yal66XnJ+7iREYm9uO/dy8g/HSxuBDjAIc
        jEo8vDcUZsQLsSaWFVfmHmKU4GBWEuF1Ons6Tog3JbGyKrUoP76oNCe1+BCjKdBzE5mlRJPz
        gWkjryTe0NTQ3MLS0NzY3NjMQkmct0PgYIyQQHpiSWp2ampBahFMHxMHp1QD45T8EylaO5iZ
        1vN8b5DZferw+d+r9k3Kqfhpmn/d49aR732TXBmLXW2z1L29tfPnH58RZvJ75hveYy/5DpUd
        aVY5Mu9iblvnP+6vPMl7ukLK697yWt2cH/J2TpummFFW/oz/7btmVrF+e6yi6CI7Zb46++e7
        7i6znpl1pmyRW3vl2aVz+8I0ZZRYijMSDbWYi4oTAYUz6srjAgAA
X-CMS-MailID: 20201028094354eucas1p276bc31d7b0caa105886af742b7100d4e
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20201028091912eucas1p13fb9cd947faa6bfd79199ea79648b6af
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201028091912eucas1p13fb9cd947faa6bfd79199ea79648b6af
References: <20201007083944.27910-1-ardb@kernel.org>
        <CGME20201028091912eucas1p13fb9cd947faa6bfd79199ea79648b6af@eucas1p1.samsung.com>
        <20201007083944.27910-3-ardb@kernel.org>
        <920965b8-6f87-3f82-9fce-d3051fc543ca@samsung.com>
        <CAMj1kXG-HcwhX9UJz3L-RYeBYcBZWJAt_arD_i4iMNvFcogXSw@mail.gmail.com>
        <CAMj1kXGXcNydxXjNnbKcy3qSETuMbqWSwRrTLqZ7-p99P4c2Mg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Ard,

On 28.10.2020 10:24, Ard Biesheuvel wrote:
> On Wed, 28 Oct 2020 at 10:22, Ard Biesheuvel <ardb@kernel.org> wrote:
>> On Wed, 28 Oct 2020 at 10:19, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>>> On 07.10.2020 10:39, Ard Biesheuvel wrote:
>>>> On ARM, setting up the linear region is tricky, given the constraints
>>>> around placement and alignment of the memblocks, and how the kernel
>>>> itself as well as the DT are placed in physical memory.
>>>>
>>>> Let's simplify matters a bit, by moving the device tree mapping to the
>>>> top of the address space, right between the end of the vmalloc region
>>>> and the start of the the fixmap region, and create a read-only mapping
>>>> for it that is independent of the size of the linear region, and how it
>>>> is organized.
>>>>
>>>> Since this region was formerly used as a guard region, which will now be
>>>> populated fully on LPAE builds by this read-only mapping (which will
>>>> still be able to function as a guard region for stray writes), bump the
>>>> start of the [underutilized] fixmap region by 512 KB as well, to ensure
>>>> that there is always a proper guard region here. Doing so still leaves
>>>> ample room for the fixmap space, even with NR_CPUS set to its maximum
>>>> value of 32.
>>>>
>>>> Tested-by: Linus Walleij <linus.walleij@linaro.org>
>>>> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
>>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>>> This patch landed in linux-next 20201028 as commit 7a1be318f579 ("ARM:
>>> 9012/1: move device tree mapping out of linear region"). Sadly it broke
>>> booting  almost all Samsung Exynos-based boards. The only one which
>>> booted, used an appended device tree. I can provide more information if
>>> needed, just let me know what to check. "Starting kernel ..." is the
>>> last message I see here. No output from earlycon.
>>>
>> Thanks for the report. I will have a look later today.
>>
>> Do these platforms happen to have any static device mappings that may
>> collide with this mapping of the FDT? Also, could this be related to
>> device drivers making changes in memory to the FDT image? Because the
>> permanent mapping of the FDT is read-only now.
>>
> IOW, does using MT_MEMORY_RW instead of MT_ROM for the mapping make a
> difference?

Nope, chaning it to MT_MEMORY_RW doesn't fix anything.

The only static mapping I'm aware is S5P_VA_CHIPID at 0xF6000000 + 
0x02000000.

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

