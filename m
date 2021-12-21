Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C5D7C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Dec 2021 10:46:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231610AbhLUKqq (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Dec 2021 05:46:46 -0500
Received: from mailout2.w1.samsung.com ([210.118.77.12]:26687 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231523AbhLUKqp (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Dec 2021 05:46:45 -0500
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20211221104643euoutp0281badc8a9295f8c9f794716534d53f7b~Cv1kn33k20813008130euoutp02D
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Dec 2021 10:46:43 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20211221104643euoutp0281badc8a9295f8c9f794716534d53f7b~Cv1kn33k20813008130euoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1640083603;
        bh=Cos76yz0KCkPsLnbFc34Hv/DVReYF/n97bkr1vw0gKk=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=lvbHG7ridG9ArtFZJ4MCB5SUZ8BWFPjFd7JyzxlGkrIGA53+QPb3MC1mBj2GNFg9c
         DReCPKzsFU9qwNkKpQRl32Sh8ljVNCDHMgXIIqpqGeAQVVzR4X5PP4XZneoPR/IzA8
         IZuNzo7U40seYYMRC3Ant6us032jOz1+CiLaOBvc=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20211221104643eucas1p19981c346ffcd74251e285f02cc88355d~Cv1kYY8LH2701227012eucas1p1r;
        Tue, 21 Dec 2021 10:46:43 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 3F.8D.10009.390B1C16; Tue, 21
        Dec 2021 10:46:43 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20211221104643eucas1p1cccfdd1564524d6694fc7d400ff29332~Cv1jwSgZG1209012090eucas1p1m;
        Tue, 21 Dec 2021 10:46:43 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211221104643eusmtrp11ac984e195578f65f9fcc529a402b977~Cv1jvdRnq1338613386eusmtrp1U;
        Tue, 21 Dec 2021 10:46:43 +0000 (GMT)
X-AuditID: cbfec7f2-e7fff70000002719-39-61c1b09314ca
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 87.C5.09404.290B1C16; Tue, 21
        Dec 2021 10:46:42 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211221104641eusmtip2126d255c406bb549807d4c05b0532e80~Cv1iwASwF1790217902eusmtip2S;
        Tue, 21 Dec 2021 10:46:41 +0000 (GMT)
Message-ID: <fbd24aa1-4e04-feff-9125-482db22a05ef@samsung.com>
Date:   Tue, 21 Dec 2021 11:46:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH v4 7/7] ARM: implement support for vmap'ed stacks
Content-Language: en-US
To:     Krzysztof Kozlowski <krzk@kernel.org>,
        Ard Biesheuvel <ardb@kernel.org>,
        linux-arm-kernel@lists.infradead.org
Cc:     Russell King <linux@armlinux.org.uk>,
        Nicolas Pitre <nico@fluxnic.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Kees Cook <keescook@chromium.org>,
        Keith Packard <keithpac@amazon.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tony Lindgren <tony@atomide.com>,
        'Linux Samsung SOC' <linux-samsung-soc@vger.kernel.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <b484dea4-da88-3e09-64c5-e1b5bb6cd639@kernel.org>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrIKsWRmVeSWpSXmKPExsWy7djPc7qTNxxMNPj1gM/i55f3jBZ/Jx1j
        tzjTnWtxb+d9Rovz5zewW0z5s5zJYtPja6wWM87vY7I4NHUvo8WHCf+ZLOa9eMFmsf+KlwOP
        x4oLXawel69dZPb4/WsSo8e3r5NYPGY3XGTxeHainc1jwaZSj02rOtk87lzbw+axeUm9x+dN
        cgHcUVw2Kak5mWWpRfp2CVwZ97e9ZCtYK1Rx42g/awPjT74uRk4OCQETidazv1m7GLk4hARW
        MEo8XNLGAuF8YZTYc+gqG4TzmVFi7pR9jDAtR4+uh2pZzijxefE/dgjnI6PEjddL2UCqeAXs
        JPq2fGQHsVkEVCW27jjOAhEXlDg58wmYLSqQJNHa8YcJxBYWcJVovrUUbAOzgLjErSfzweIi
        AsUSHRfegi1gFnjFJPFmyX+wBJuAoUTX2y6gZRwcnEDLNjVXQfTKS2x/O4cZpF5CYDGnxNa7
        S8BqJARcJI7dsof4QFji1fEt7BC2jMTpyT0sEPXNwAA4t5YdwulhlLjcNAPqZ2uJO+d+gQ1i
        FtCUWL9LHyLsKDF/1392iPl8EjfeCkLcwCcxadt0Zogwr0RHmxBEtZrErOPr4NYevHCJeQKj
        0iykUJmF5PtZSL6ZhbB3ASPLKkbx1NLi3PTUYsO81HK94sTc4tK8dL3k/NxNjMBUd/rf8U87
        GOe++qh3iJGJg/EQowQHs5II75bZ+xOFeFMSK6tSi/Lji0pzUosPMUpzsCiJ8yZnbkgUEkhP
        LEnNTk0tSC2CyTJxcEo1MKltmfY08H228RYfi4UFq5qb1rS02mtsXxq85dpSfSvd8zXHF3gr
        zFzssiJl8/6F+75rhOyfU85Y1Bun1xZiPNu9dEJzxIMf3KcPZLV7ps48/qFaSi75oZKc7sX3
        FQXVSZKinxUSRe0W382MeirREf6DZ8c0Jg6LHMbtOW6GnM0Hjj7g3KXXWO6tk1QVzWv72Hqp
        ysG1ll/mXHDJ3nug6mq7vQdjQPLis3KWglKHEvfKLJoyITd+fW3Hyfd3mkQFSoJdnd26150J
        cVqU26Sk/mjLtstCfxS/HfPv2vvZPXrxp185WyOXbrHZdEf9u0rl5PztNqoh80T/BB1ns1b8
        cTjRQXXPXK4VL+pLs3P0lFiKMxINtZiLihMB2jWjLuQDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMIsWRmVeSWpSXmKPExsVy+t/xe7qTNhxMNNh3z9zi55f3jBZ/Jx1j
        tzjTnWtxb+d9Rovz5zewW0z5s5zJYtPja6wWM87vY7I4NHUvo8WHCf+ZLOa9eMFmsf+KlwOP
        x4oLXawel69dZPb4/WsSo8e3r5NYPGY3XGTxeHainc1jwaZSj02rOtk87lzbw+axeUm9x+dN
        cgHcUXo2RfmlJakKGfnFJbZK0YYWRnqGlhZ6RiaWeobG5rFWRqZK+nY2Kak5mWWpRfp2CXoZ
        97e9ZCtYK1Rx42g/awPjT74uRk4OCQETiaNH17N2MXJxCAksZZSY1P6KCSIhI3FyWgMrhC0s
        8edaFxtE0XtGiSWvroIleAXsJPq2fGQHsVkEVCW27jjOAhEXlDg58wmYLSqQJLF73VY2EFtY
        wFWi+dZSRhCbWUBc4taT+WDLRASKJaY0TmaDiL9hkuhY4wGxbAGTxKnHx8ASbAKGEl1vQa7g
        4OAEWrypuQqi3kyia2sX1Ex5ie1v5zBPYBSaheSMWUjWzULSMgtJywJGllWMIqmlxbnpucVG
        esWJucWleel6yfm5mxiBsb3t2M8tOxhXvvqod4iRiYPxEKMEB7OSCO+W2fsThXhTEiurUovy
        44tKc1KLDzGaAsNiIrOUaHI+MLnklcQbmhmYGpqYWRqYWpoZK4nzehZ0JAoJpCeWpGanphak
        FsH0MXFwSjUwTXr55V/T4pa4s5e9pwu93L9/17Ne1/uVwhlt9yUEnnt67f2c3rdA47XWinY9
        RpFFfA9j/th4a9/wbZj/9l3hjwU7LTWPFtbEcCZZnHkyNbF+qt3X4N3nj566vLyeSS281t5G
        0Tpx9/XXB5c+/Lsx1f7wqqfNv3b9z/Fj4ejTv2hv6Bkx7/9+xr7V3uuVjZvaooR2dUg88Pmw
        ZM5VTbY0BzFLlSfS60X2X3wW3y//8/msalk91qIyoauh8f5/dxe++LS5YO+VLT0l71Sep/gn
        6cofyNZ7FnDu0e8TPsqveuftcc9aG5R/dI3/jFOlbIedSpYv3NV9azl7UNWvIstL3UunvJR0
        5777O+f+5EVXO5RYijMSDbWYi4oTARTDi4Z2AwAA
X-CMS-MailID: 20211221104643eucas1p1cccfdd1564524d6694fc7d400ff29332
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211221103854eucas1p2592e38fcc84c1c3506fce87f1dab6739
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211221103854eucas1p2592e38fcc84c1c3506fce87f1dab6739
References: <20211122092816.2865873-1-ardb@kernel.org>
        <20211122092816.2865873-8-ardb@kernel.org>
        <CGME20211221103854eucas1p2592e38fcc84c1c3506fce87f1dab6739@eucas1p2.samsung.com>
        <0ffc858f-27e7-6789-4be1-c4c5ad61eb9d@samsung.com>
        <b484dea4-da88-3e09-64c5-e1b5bb6cd639@kernel.org>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 21.12.2021 11:42, Krzysztof Kozlowski wrote:
> On 21/12/2021 11:38, Marek Szyprowski wrote:
>> On 22.11.2021 10:28, Ard Biesheuvel wrote:
>>> Wire up the generic support for managing task stack allocations via vmalloc,
>>> and implement the entry code that detects whether we faulted because of a
>>> stack overrun (or future stack overrun caused by pushing the pt_regs array)
>>>
>>> While this adds a fair amount of tricky entry asm code, it should be
>>> noted that it only adds a TST + branch to the svc_entry path. The code
>>> implementing the non-trivial handling of the overflow stack is emitted
>>> out-of-line into the .text section.
>>>
>>> Since on ARM, we rely on do_translation_fault() to keep PMD level page
>>> table entries that cover the vmalloc region up to date, we need to
>>> ensure that we don't hit such a stale PMD entry when accessing the
>>> stack. So we do a dummy read from the new stack while still running from
>>> the old one on the context switch path, and bump the vmalloc_seq counter
>>> when PMD level entries in the vmalloc range are modified, so that the MM
>>> switch fetches the latest version of the entries.
>>>
>>> Note that we need to increase the per-mode stack by 1 word, to gain some
>>> space to stash a GPR until we know it is safe to touch the stack.
>>> However, due to the cacheline alignment of the struct, this does not
>>> actually increase the memory footprint of the struct stack array at all.
>>>
>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>>> Tested-by: Keith Packard <keithpac@amazon.com>
>>
>> This patch landed recently in linux-next 20211220 as commit a1c510d0adc6
>> ("ARM: implement support for vmap'ed stacks"). Sadly it breaks
>> suspend/resume operation on all ARM 32bit Exynos SoCs. Probably the
>> suspend/resume related code must be updated somehow (it partially works
>> on physical addresses and disabled MMU), but I didn't analyze it yet. If
>> you have any hints, let me know.
> Maybe this one would help?
> https://lore.kernel.org/lkml/20211218085843.212497-2-cuigaosheng1@huawei.com/

I forgot to mention. I've already checked it and it doesn't change/fix 
anything. It also doesn't break the old (pre-a1c510d0adc) code though.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

