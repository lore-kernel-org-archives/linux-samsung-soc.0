Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 511A8C433F5
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Dec 2021 13:51:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231382AbhLUNvr (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Dec 2021 08:51:47 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:27123 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237602AbhLUNvr (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Dec 2021 08:51:47 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20211221135145euoutp01897f3210c0c813f2822acf2377132124~CyXILVz1K3164131641euoutp01E
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Dec 2021 13:51:45 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20211221135145euoutp01897f3210c0c813f2822acf2377132124~CyXILVz1K3164131641euoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1640094706;
        bh=ZBr6S8+OUMZh67Ez6rSHyO8gUn3IiJOslQ2F0PaoIRU=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=qREJHEez0fgM8qonoE6pWCh/KcAFssNsXaUzqhB3vufRmhiNzNKOiQlkA0mx9vzWI
         Fgm+3m4RljZkxO4DKXDmvARJiGdkH2zQRtGJuZzrAMUqJeSw5F8Ri4s1fSLOTDz2gD
         T4qPFkAUBJp1bh7kYRcQPmxyNaGvoZ4IFHNuYMIU=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20211221135145eucas1p1ebaf2a9a33667db0f3c5760323bedb58~CyXHnIfJt0991209912eucas1p1F;
        Tue, 21 Dec 2021 13:51:45 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 5E.DD.10260.1FBD1C16; Tue, 21
        Dec 2021 13:51:45 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20211221135144eucas1p14705e44a61887521566115d19de4e1bf~CyXHE6NGH0991209912eucas1p1C;
        Tue, 21 Dec 2021 13:51:44 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211221135144eusmtrp293c8aa9d3af85bbf7da4a5c91ea2bb58~CyXHED3_E0561505615eusmtrp2g;
        Tue, 21 Dec 2021 13:51:44 +0000 (GMT)
X-AuditID: cbfec7f5-bddff70000002814-de-61c1dbf10340
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 04.34.09522.0FBD1C16; Tue, 21
        Dec 2021 13:51:44 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211221135143eusmtip24b69e9073c5eccecc4cd98a9b0dd4d73~CyXGGDKWC0267002670eusmtip2H;
        Tue, 21 Dec 2021 13:51:43 +0000 (GMT)
Message-ID: <b22077f6-0925-ee00-41ea-3e52241926e2@samsung.com>
Date:   Tue, 21 Dec 2021 14:51:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH v4 7/7] ARM: implement support for vmap'ed stacks
Content-Language: en-US
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Kees Cook <keescook@chromium.org>,
        Keith Packard <keithpac@amazon.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tony Lindgren <tony@atomide.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAMj1kXG3neg0riLAaU32KLvB2PLBNzwqgO0F21nbK1ivS=FwMg@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrAKsWRmVeSWpSXmKPExsWy7djPc7ofbx9MNLiwldvi55f3jBZ/Jx1j
        tzjTnWtxb+d9Rovz5zewW0z5s5zJYtPja6wWM87vY7I4NHUvo8WHCf+ZLOa9eMFmsf+KlwOP
        x4oLXawel69dZPb4/WsSo8e3r5NYPGY3XGTxeHainc1jwaZSj02rOtk87lzbw+axeUm9x+dN
        cgHcUVw2Kak5mWWpRfp2CVwZvw9+Yi64KllxetcU9gbGTyJdjJwcEgImEo8fb2PuYuTiEBJY
        wShxt2cNC4TzhVGidWcfE0iVkMBnRokDCyVgOvbva2CCKFrOKPF6WztU+0cg5+xXVpAqXgE7
        ia3fnjJ2MXJwsAioSly7zwsRFpQ4OfMJC4gtKpAk0drxB2yBsICrRPOtpYwgNrOAuMStJ/PB
        4iICKhI/mt4ygsxnFtjJLHGu4QwbSIJNwFCi620XmM0pECgx/+MdFohmeYntb+cwQ1y6mlNi
        5RQxCNtFYm3LTzYIW1ji1fEt7BC2jMT/nfPBvpEQaGaUeHhuLTuE08MocblpBiNElbXEnXO/
        2EC+YRbQlFi/Sx8i7Cgxf9d/dpCwhACfxI23ghA38ElM2jadGSLMK9HRJgRRrSYx6/g6uLUH
        L1xinsCoNAspWGYheX8Wkm9mIexdwMiyilE8tbQ4Nz212DgvtVyvODG3uDQvXS85P3cTIzDR
        nf53/OsOxhWvPuodYmTiYDzEKMHBrCTCu2X2/kQh3pTEyqrUovz4otKc1OJDjNIcLErivMmZ
        GxKFBNITS1KzU1MLUotgskwcnFINTA0mc2+ofGtOvXo1lOOk2cx/h1V2zslpzF9xKfqP3v7m
        nKP7VyfGyDbPOritTOT34dWeavMWs/jW5b20WPRd6AUDk1To76gXUy7ft9zLrWjUcO3jUt1u
        LwdjBt09OhVN/j3Ppm91PdbUVDhNZq2f0ySHY6YMG50M9/JYWa1bu1Tm2HHz5PxufXkbxlXL
        f4aml/gxcjmt27TT8Zz95J+nFjPk/FZu2P7y1VqJlWdESj/uq+l9M/X06s87sri+/OaJYa1T
        uDf3auS7qaz7Wb4c7eA7NmnW6c4Xi2wT/tnembkguqsjQGhHEUP85azjwTPD9Da0XllyOVqj
        2ZT/2t2WNxlf48X+XhWy4VJ7E22/tUKJpTgj0VCLuag4EQAmR4Hu4wMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRmVeSWpSXmKPExsVy+t/xe7ofbh9MNDh2QdXi55f3jBZ/Jx1j
        tzjTnWtxb+d9Rovz5zewW0z5s5zJYtPja6wWM87vY7I4NHUvo8WHCf+ZLOa9eMFmsf+KlwOP
        x4oLXawel69dZPb4/WsSo8e3r5NYPGY3XGTxeHainc1jwaZSj02rOtk87lzbw+axeUm9x+dN
        cgHcUXo2RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZ
        vw9+Yi64KllxetcU9gbGTyJdjJwcEgImEvv3NTB1MXJxCAksZZRofveNCSIhI3FyWgMrhC0s
        8edaFxtE0XtGieXvHoMleAXsJLZ+e8rYxcjBwSKgKnHtPi9EWFDi5MwnLCC2qECSxO51W9lA
        bGEBV4nmW0sZQWxmAXGJW0/mg+0SEVCR+NH0lhFkPrPATmaJ39sfs0MsW88s8WDRTbBlbAKG
        El1vu8AmcQoESsz/eIcFYpKZRNfWLqip8hLb385hnsAoNAvJIbOQLJyFpGUWkpYFjCyrGEVS
        S4tz03OLDfWKE3OLS/PS9ZLzczcxAqN727Gfm3cwznv1Ue8QIxMH4yFGCQ5mJRHeLbP3Jwrx
        piRWVqUW5ccXleakFh9iNAUGxkRmKdHkfGB6ySuJNzQzMDU0MbM0MLU0M1YS5/Us6EgUEkhP
        LEnNTk0tSC2C6WPi4JRqYArRa+Zbftn07FXZ58Eci491Tjle9rQtahfnvVPrKm5tZdB6clT8
        XPjE1sgUOYUlE4z35SVX/QwunHAyfIOv0+nw481Ce9RO9we8l+e0en21xpL5TuWB1CPONQ4a
        ffMN9jtbpq+fKLzp1KLH8vr9ke+8Uo1rMg6vPXl9Znx1bXxUR6dpgNq6t1Uh1h2bRNmebOx9
        VK/uvCMlK1vzbOi/teI/N15STBMKzDe1Xqj27sz+tCYdPabj9WYl948t2cNjLmFUuPECx+bb
        OmsW5IfyFs4JO7loVyxPQrlk18EWpZqNWjJnfsoyS6yaaMavNsFEZu5dk8+zipNcbs74sTJ0
        S8t+sdwPn9ec27DJQL5/oRJLcUaioRZzUXEiAGrNyHN3AwAA
X-CMS-MailID: 20211221135144eucas1p14705e44a61887521566115d19de4e1bf
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211221103854eucas1p2592e38fcc84c1c3506fce87f1dab6739
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211221103854eucas1p2592e38fcc84c1c3506fce87f1dab6739
References: <20211122092816.2865873-1-ardb@kernel.org>
        <CGME20211221103854eucas1p2592e38fcc84c1c3506fce87f1dab6739@eucas1p2.samsung.com>
        <20211122092816.2865873-8-ardb@kernel.org>
        <0ffc858f-27e7-6789-4be1-c4c5ad61eb9d@samsung.com>
        <CAMj1kXG+P5AU-26t_16FL5xfQNd+ByQH_cfBLiwMSdoGPmvCuw@mail.gmail.com>
        <e07a229a-e565-0077-9f8a-a24ffa45f395@samsung.com>
        <CAMj1kXG3neg0riLAaU32KLvB2PLBNzwqgO0F21nbK1ivS=FwMg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On 21.12.2021 14:34, Ard Biesheuvel wrote:
> On Tue, 21 Dec 2021 at 12:15, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> Hi Ard,
>>
>> On 21.12.2021 11:44, Ard Biesheuvel wrote:
>>> On Tue, 21 Dec 2021 at 11:39, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>>>> On 22.11.2021 10:28, Ard Biesheuvel wrote:
>>>>> Wire up the generic support for managing task stack allocations via vmalloc,
>>>>> and implement the entry code that detects whether we faulted because of a
>>>>> stack overrun (or future stack overrun caused by pushing the pt_regs array)
>>>>>
>>>>> While this adds a fair amount of tricky entry asm code, it should be
>>>>> noted that it only adds a TST + branch to the svc_entry path. The code
>>>>> implementing the non-trivial handling of the overflow stack is emitted
>>>>> out-of-line into the .text section.
>>>>>
>>>>> Since on ARM, we rely on do_translation_fault() to keep PMD level page
>>>>> table entries that cover the vmalloc region up to date, we need to
>>>>> ensure that we don't hit such a stale PMD entry when accessing the
>>>>> stack. So we do a dummy read from the new stack while still running from
>>>>> the old one on the context switch path, and bump the vmalloc_seq counter
>>>>> when PMD level entries in the vmalloc range are modified, so that the MM
>>>>> switch fetches the latest version of the entries.
>>>>>
>>>>> Note that we need to increase the per-mode stack by 1 word, to gain some
>>>>> space to stash a GPR until we know it is safe to touch the stack.
>>>>> However, due to the cacheline alignment of the struct, this does not
>>>>> actually increase the memory footprint of the struct stack array at all.
>>>>>
>>>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>>>>> Tested-by: Keith Packard <keithpac@amazon.com>
>>>> This patch landed recently in linux-next 20211220 as commit a1c510d0adc6
>>>> ("ARM: implement support for vmap'ed stacks"). Sadly it breaks
>>>> suspend/resume operation on all ARM 32bit Exynos SoCs. Probably the
>>>> suspend/resume related code must be updated somehow (it partially works
>>>> on physical addresses and disabled MMU), but I didn't analyze it yet. If
>>>> you have any hints, let me know.
>>>>
>>> Are there any such systems in KernelCI? We caught a suspend/resume
>>> related issue in development, which is why the hunk below was added.
>>
>> I think that some Exynos-based Odroids (U3 and XU3) were some time ago
>> available in KernelCI, but I don't know if they are still there.
>>
>>
>>> In general, any virt-to-phys translation involving and address on the
>>> stack will become problematic.
>>>
>>> Could you please confirm whether the issue persists with the patch
>>> applied but with CONFIG_VMAP_STACK turned off? Just so we know we are
>>> looking in the right place?
>>
>> I've just checked. After disabling CONFIG_VMAP_STACK suspend/resume
>> works fine both on commit a1c510d0adc6 and linux-next 20211220.
>>
> Thanks. Any other context you can provide beyond 'does not work' ?

Well, the board properly suspends, but it doesn't wake then (tested 
remotely with rtcwake command). So far I cannot provide anything more.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

