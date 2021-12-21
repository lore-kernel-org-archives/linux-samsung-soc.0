Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 157CDC433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Dec 2021 11:15:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236977AbhLULPL (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Dec 2021 06:15:11 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:14779 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236868AbhLULPL (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Dec 2021 06:15:11 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20211221111509euoutp0110c8875a801c432bdc3f0ddd2325aae4~CwOZSIDsK2480524805euoutp01E
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Dec 2021 11:15:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20211221111509euoutp0110c8875a801c432bdc3f0ddd2325aae4~CwOZSIDsK2480524805euoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1640085309;
        bh=+CS92uzC2SxR/olzxHlG6VLuOSbgFNu8je3sPSduk1s=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=ZnPSGEA28erILgU+tc+4CBE5gHBLdNpJjIe8q0rC1b1QXhw18soqTbRXyr0ndbJ2F
         ObrIyn2z5BykiyCSCNfSqJE38Gqv1X8talNjAQzyfyXx95Lge9fjPJ/jrVysat+nQ2
         TM9XiwNTKLv1m8RRKCoR7O433fDPp/J87t1W51Vk=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20211221111509eucas1p1e59ca8c6b66519bf1695b58006fe9423~CwOYxe0i11801718017eucas1p1d;
        Tue, 21 Dec 2021 11:15:09 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id B6.93.10260.D37B1C16; Tue, 21
        Dec 2021 11:15:09 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20211221111508eucas1p21c03036d6d53f61c44539a1b260d288d~CwOYZkR850838708387eucas1p2x;
        Tue, 21 Dec 2021 11:15:08 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211221111508eusmtrp11163b6ba1d96302c705d617bf10b5d58~CwOYYkkLo3096430964eusmtrp1j;
        Tue, 21 Dec 2021 11:15:08 +0000 (GMT)
X-AuditID: cbfec7f5-bddff70000002814-e7-61c1b73de186
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 01.2D.09522.C37B1C16; Tue, 21
        Dec 2021 11:15:08 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211221111508eusmtip29ca8da5e70d0bb8e8bdce55993d5a69d~CwOXvT31t2490724907eusmtip2L;
        Tue, 21 Dec 2021 11:15:08 +0000 (GMT)
Message-ID: <e07a229a-e565-0077-9f8a-a24ffa45f395@samsung.com>
Date:   Tue, 21 Dec 2021 12:15:09 +0100
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
In-Reply-To: <CAMj1kXG+P5AU-26t_16FL5xfQNd+ByQH_cfBLiwMSdoGPmvCuw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMKsWRmVeSWpSXmKPExsWy7djP87q22w8mGrzbzGHx88t7Rou/k46x
        W5zpzrW4t/M+o8X58xvYLab8Wc5ksenxNVaLGef3MVkcmrqX0eLDhP9MFvNevGCz2H/Fy4HH
        Y8WFLlaPy9cuMnv8/jWJ0ePb10ksHrMbLrJ4PDvRzuaxYFOpx6ZVnWwed67tYfPYvKTe4/Mm
        uQDuKC6blNSczLLUIn27BK6MM7damQv65ComPZ7N3sC4XryLkZNDQsBE4uLqDtYuRi4OIYEV
        jBL3l/9nhnC+MEq83bCfHcL5zCgxo/kjG0zL8sWNbBCJ5YwSX2Y1QFV9ZJSY8LKVHaSKV8BO
        4vn574wgNouAqsTGje2MEHFBiZMzn7CA2KICSRKtHX+YQGxhAVeJ5ltLwWqYBcQlbj2ZDxYX
        EVCR+NH0lhFkAbPATmaJcw1nwM5gEzCU6HrbBWZzCgRKtD6cAtUsL7H97RywJyQElnNKvJ88
        jR3ibheJuxf6oGxhiVfHt0DZMhKnJ/ewQDQ0M0o8PLeWHcLpYZS43DSDEaLKWuLOuV9A6ziA
        VmhKrN+lDxF2lJi/6z87SFhCgE/ixltBiCP4JCZtm84MEeaV6GgTgqhWk5h1fB3c2oMXLjFP
        YFSahRQus5D8PwvJO7MQ9i5gZFnFKJ5aWpybnlpsnJdarlecmFtcmpeul5yfu4kRmO5O/zv+
        dQfjilcf9Q4xMnEwHmKU4GBWEuHdMnt/ohBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHe5MwNiUIC
        6YklqdmpqQWpRTBZJg5OqQYmoaAcvyKvA02nWX5I3l2Rm3v83xzhOWdULbZdOmSTcshR1/cU
        27bz6hldN9U+nL19eNWPyCvC0038suPuzEls5AyY36Q18V3lr7tmhQfOTOCuuvbXb/p5i4Rm
        Jrn8SW47D0v7pu6N7VqbG+G4fU3hzmOdr5NL7BIWZPa0buWY8uhYgkxp/durz8vzb/lzO23a
        HfbM7FqmWcb9615L9Rb6ilokPO6p7RGeKRx/6UqFV/Om7H7f453Xd7Cfzqzs+l3cOleN9xXP
        t0ez/E5PmLxCV3nB95jNkybl5+bK2++dzn0u7ZWETdFVgRuvPrw59FF/z279zIdn2W251eL/
        BW6PU50ktE+vSaKqydHd/eoEJZbijERDLeai4kQAoAR+Z+YDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCIsWRmVeSWpSXmKPExsVy+t/xe7o22w8mGvw5qW3x88t7Rou/k46x
        W5zpzrW4t/M+o8X58xvYLab8Wc5ksenxNVaLGef3MVkcmrqX0eLDhP9MFvNevGCz2H/Fy4HH
        Y8WFLlaPy9cuMnv8/jWJ0ePb10ksHrMbLrJ4PDvRzuaxYFOpx6ZVnWwed67tYfPYvKTe4/Mm
        uQDuKD2bovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2M
        M7damQv65ComPZ7N3sC4XryLkZNDQsBEYvniRrYuRi4OIYGljBKrTnYzQiRkJE5Oa2CFsIUl
        /lzrgip6zyhx/8xUNpAEr4CdxPPz38EaWARUJTZubGeEiAtKnJz5hAXEFhVIkti9bitYvbCA
        q0TzraVgNcwC4hK3nsxnArFFBFQkfjS9ZQRZwCywk1ni9/bH7CAJIYHNTBLfu7NBbDYBQ4mu
        t11ggzgFAiVaH06BGmQm0bW1C8qWl9j+dg7zBEahWUjumIVk3ywkLbOQtCxgZFnFKJJaWpyb
        nltsqFecmFtcmpeul5yfu4kRGN3bjv3cvINx3quPeocYmTgYDzFKcDArifBumb0/UYg3JbGy
        KrUoP76oNCe1+BCjKTAwJjJLiSbnA9NLXkm8oZmBqaGJmaWBqaWZsZI4r2dBR6KQQHpiSWp2
        ampBahFMHxMHp1QDE/O7xjqnWJ3KvpwD0pcaXjaErO+5G5V5K0JXKPl0QOOJuMxQ3ktysxWf
        8Vb+W7ZPvG16dM9t/6buk3HHr8xse5cRdnnu1aX/Z096vFzlV8rDi4f4bv6ccrjJis//p4t4
        vJHN3XyX1w3M2lcW67obWnkn3Ta7I2NYabOB3bZy+1vVC6cFimMlD0ckZFwP9Wueq+ZR4pCg
        4WBj36JiffXyrBtCrzNusE8o2+L8/vH8jgZuQaZngrrX3PYEW21eK2y9x3om86M5DivNb97a
        I1q2NOjstpqpW4tmP111Vaz0HXv9zvV35q+48HNVm9kCjqfbF6eFRGy8+iHX3mO/3+X0iTaT
        ptoXCwdpMB66sbDynRJLcUaioRZzUXEiAHTepfF3AwAA
X-CMS-MailID: 20211221111508eucas1p21c03036d6d53f61c44539a1b260d288d
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
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Ard,

On 21.12.2021 11:44, Ard Biesheuvel wrote:
> On Tue, 21 Dec 2021 at 11:39, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
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
>> This patch landed recently in linux-next 20211220 as commit a1c510d0adc6
>> ("ARM: implement support for vmap'ed stacks"). Sadly it breaks
>> suspend/resume operation on all ARM 32bit Exynos SoCs. Probably the
>> suspend/resume related code must be updated somehow (it partially works
>> on physical addresses and disabled MMU), but I didn't analyze it yet. If
>> you have any hints, let me know.
>>
> Are there any such systems in KernelCI? We caught a suspend/resume
> related issue in development, which is why the hunk below was added.


I think that some Exynos-based Odroids (U3 and XU3) were some time ago 
available in KernelCI, but I don't know if they are still there.


> In general, any virt-to-phys translation involving and address on the
> stack will become problematic.
>
> Could you please confirm whether the issue persists with the patch
> applied but with CONFIG_VMAP_STACK turned off? Just so we know we are
> looking in the right place?


I've just checked. After disabling CONFIG_VMAP_STACK suspend/resume 
works fine both on commit a1c510d0adc6 and linux-next 20211220.


>> diff --git a/arch/arm/kernel/sleep.S b/arch/arm/kernel/sleep.S
>> index 43077e11dafd..803b51e5cba0 100644
>> --- a/arch/arm/kernel/sleep.S
>> +++ b/arch/arm/kernel/sleep.S
>> @@ -67,6 +67,14 @@ ENTRY(__cpu_suspend)
>>        ldr     r4, =cpu_suspend_size
>>    #endif
>>        mov     r5, sp                  @ current virtual SP
>> +#ifdef CONFIG_VMAP_STACK
>> +     @ Run the suspend code from the overflow stack so we don't have to rely
>> +     @ on vmalloc-to-phys conversions anywhere in the arch suspend code.
>> +     @ The original SP value captured in R5 will be restored on the way out.
>> +     mov_l   r6, overflow_stack_ptr  @ Base pointer
>> +     mrc     p15, 0, r7, c13, c0, 4  @ Get per-CPU offset
>> +     ldr     sp, [r6, r7]            @ Address of this CPU's overflow stack
>> +#endif
>>        add     r4, r4, #12             @ Space for pgd, virt sp, phys resume fn
>>        sub     sp, sp, r4              @ allocate CPU state on stack
>>        ldr     r3, =sleep_save_sp

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

