Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6FC8C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Tue, 21 Dec 2021 21:56:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237288AbhLUV40 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Tue, 21 Dec 2021 16:56:26 -0500
Received: from mailout1.w1.samsung.com ([210.118.77.11]:24657 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230251AbhLUV4Z (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Tue, 21 Dec 2021 16:56:25 -0500
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20211221215623euoutp0133a6481e3f4289bbd7477c98cdb0df6e~C4_RCDqb71121811218euoutp01L
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Dec 2021 21:56:23 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20211221215623euoutp0133a6481e3f4289bbd7477c98cdb0df6e~C4_RCDqb71121811218euoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1640123783;
        bh=huX9b+7G4/K70l+LLSXFJOlZYWkrLj5aHhpqQl0C3Bc=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=syW3uruPUoBfN2AQi6zO6m/FCB4u/6lK8UH02dWP3Jsm+n12adYD0hVtHNk0E/dWq
         OUhB85H+UJTy9/IMf9uoci20yNeXSRGsFT/E4IX3RFI3JGrShYarALBd5kCeBuGR5m
         qEF+5bpeKvuW40stiNoPC5RpLd0RLxpOhbUVTSO4=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20211221215623eucas1p2e4d56fba761e0f04d37c3a6db829ad4f~C4_Qke1Ca0958609586eucas1p2D;
        Tue, 21 Dec 2021 21:56:23 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id 42.4C.09887.68D42C16; Tue, 21
        Dec 2021 21:56:22 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20211221215621eucas1p1236374f7a3b76a27197d6c8191e1bf56~C4_PJlTMn0855308553eucas1p1V;
        Tue, 21 Dec 2021 21:56:21 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211221215621eusmtrp146ca74760344d0de01ff61a45bc86658~C4_PIzizW1040610406eusmtrp1Y;
        Tue, 21 Dec 2021 21:56:21 +0000 (GMT)
X-AuditID: cbfec7f4-471ff7000000269f-7d-61c24d862a70
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 95.25.09404.58D42C16; Tue, 21
        Dec 2021 21:56:21 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20211221215621eusmtip19b5d2efcb2f4cfdccebfab9a8b028059~C4_OetX8D2230522305eusmtip1F;
        Tue, 21 Dec 2021 21:56:21 +0000 (GMT)
Message-ID: <f469726d-86fb-cf54-2775-d4658d2f3a5d@samsung.com>
Date:   Tue, 21 Dec 2021 22:56:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.4.0
Subject: Re: [PATCH v4 7/7] ARM: implement support for vmap'ed stacks
Content-Language: en-US
To:     Ard Biesheuvel <ardb@kernel.org>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
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
In-Reply-To: <CAMj1kXHQrqZSE1kHaQyQyK6R58EV3cUyvJFmM1JYifaMemyUhQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrMKsWRmVeSWpSXmKPExsWy7djPc7ptvocSDc69UrT4+eU9o8XfScfY
        Lc5051rc23mf0eL8+Q3sFlP+LGey2PT4GqvFjPP7mCwOTd3LaPFhwn8mi3kvXrBZ7L/i5cDj
        seJCF6vH5WsXmT1+/5rE6PHt6yQWj9kNF1k8np1oZ/NYsKnUY9OqTjaPO9f2sHlsXlLv8XmT
        XAB3FJdNSmpOZllqkb5dAlfGiVULWQv2ylZc/9nH3MA4S6KLkZNDQsBEYt3k5yxdjFwcQgIr
        GCV6u6awQzhfGCUO77/NBOF8ZpT4veIdM0zL1u+PoFqWM0p0XNjHCOF8ZJTYu20lG0gVr4Cd
        xK6upawgNouAqsSP6W+h4oISJ2c+YQGxRQWSJFo7/jCB2MICrhLNt5YygtjMAuISt57MB4uL
        CKhI/Gh6C7aAWeAos8TqqRfBBrEJGEp0ve0CszkFAiX2b7wG1Swvsf3tHGaQBgmB5ZwSd59+
        Y4S420Xi1MYGqB+EJV4d38IOYctInJ7cwwLR0Mwo8fDcWnYIp4dR4nLTDKhua4k7534BreMA
        WqEpsX6XPkTYUWL+rv/sIGEJAT6JG28FIY7gk5i0bTozRJhXoqNNCKJaTWLW8XVwaw9euMQ8
        gVFpFlK4zELy/ywk78xC2LuAkWUVo3hqaXFuemqxUV5quV5xYm5xaV66XnJ+7iZGYLo7/e/4
        lx2My1991DvEyMTBeIhRgoNZSYR3y+z9iUK8KYmVValF+fFFpTmpxYcYpTlYlMR5kzM3JAoJ
        pCeWpGanphakFsFkmTg4pRqYjBftv9b73n+9b6xAl8ekS3+uxs3TmtxlsT1i0gyhP+ZZq9r3
        1l587t3jdW3Dr103133lcnpsUXFkLUPbApuTztwvpeYJX2P/X3s9T/3TQrf1njvO/z8dNcH/
        h2xW4V3r+B3fX6zplG8KWn6Hy5bNcOtH5vSls1VM+ZdapM2p9Nc5dIPh0NPyf6UPJ7k0HPOp
        ziz3kC8RWBf8bF+MgSF7SGhr/ivf2idMf5+eWsN6ZynvI9+nr8JXlsw+dmjVa8t3Kx3cl828
        3PDsKNfriHvhGasebIg5GPZAcW03u/ZszxVn+NYVW2mUlnyf5/ph6UtJnuUpdabnWVhMrYp7
        5lwJeRTxztblZV7WjwtqewNNc5VYijMSDbWYi4oTASzpSjPmAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsVy+t/xu7qtvocSDd72iFr8/PKe0eLvpGPs
        Fme6cy3u7bzPaHH+/AZ2iyl/ljNZbHp8jdVixvl9TBaHpu5ltPgw4T+TxbwXL9gs9l/xcuDx
        WHGhi9Xj8rWLzB6/f01i9Pj2dRKLx+yGiywez060s3ks2FTqsWlVJ5vHnWt72Dw2L6n3+LxJ
        LoA7Ss+mKL+0JFUhI7+4xFYp2tDCSM/Q0kLPyMRSz9DYPNbKyFRJ384mJTUnsyy1SN8uQS/j
        xKqFrAV7ZSuu/+xjbmCcJdHFyMkhIWAisfX7I5YuRi4OIYGljBL7N61lgkjISJyc1sAKYQtL
        /LnWxQZR9J5R4tn2NYwgCV4BO4ldXUvBilgEVCV+TH/LBhEXlDg58wkLiC0qkCSxe91WsLiw
        gKtE862lYL3MAuISt57MB1smIqAi8aPpLSPIAmaBo8wSZ5fMZoXYtppF4u+Oi2Ab2AQMJbre
        doFN4hQIlNi/8RrUJDOJrq1dULa8xPa3c5gnMArNQnLILCQLZyFpmYWkZQEjyypGkdTS4tz0
        3GIjveLE3OLSvHS95PzcTYzA+N527OeWHYwrX33UO8TIxMF4iFGCg1lJhHfL7P2JQrwpiZVV
        qUX58UWlOanFhxhNgaExkVlKNDkfmGDySuINzQxMDU3MLA1MLc2MlcR5PQs6EoUE0hNLUrNT
        UwtSi2D6mDg4pRqYlng3u6VHT71e91Tb5shElbkslhpbrY2ELN7buqYr1Tw/OGvZ08SELQFP
        q7k4mtgifBnOHvw/6/9sV41nkyz8GBbmizNWTtp3Q39ubQn/772l28+GLyp/XrlEzf7mL8vl
        H1Ys6bl8p1mj5M8xHvsLZ5Rb/kpYCzMdFDtqft9m9ZW8+83i3Km1P1J4jWa1dj8VNWF/MI9j
        7oSW973vHuQtTzxYcXJSg6N0uwpfkN3Gaftb1r0vaLr1VCZszcrTf498+vuwZvpiw/5Zz6aq
        X68QfKi2rXNuafCWJc4T1hTaveCd2niv2k6Z8UvMlI0RnG/zCx88jQ27Fy+a2K8SxrXtuW98
        iV/57Krgz24dlbtalFiKMxINtZiLihMBbbjBeHgDAAA=
X-CMS-MailID: 20211221215621eucas1p1236374f7a3b76a27197d6c8191e1bf56
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
        <b22077f6-0925-ee00-41ea-3e52241926e2@samsung.com>
        <CAMj1kXHQrqZSE1kHaQyQyK6R58EV3cUyvJFmM1JYifaMemyUhQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi,

On 21.12.2021 17:20, Ard Biesheuvel wrote:
> On Tue, 21 Dec 2021 at 14:51, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> On 21.12.2021 14:34, Ard Biesheuvel wrote:
>>> On Tue, 21 Dec 2021 at 12:15, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>>>> On 21.12.2021 11:44, Ard Biesheuvel wrote:
>>>>> On Tue, 21 Dec 2021 at 11:39, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>>>>>> On 22.11.2021 10:28, Ard Biesheuvel wrote:
>>>>>>> Wire up the generic support for managing task stack allocations via vmalloc,
>>>>>>> and implement the entry code that detects whether we faulted because of a
>>>>>>> stack overrun (or future stack overrun caused by pushing the pt_regs array)
>>>>>>>
>>>>>>> While this adds a fair amount of tricky entry asm code, it should be
>>>>>>> noted that it only adds a TST + branch to the svc_entry path. The code
>>>>>>> implementing the non-trivial handling of the overflow stack is emitted
>>>>>>> out-of-line into the .text section.
>>>>>>>
>>>>>>> Since on ARM, we rely on do_translation_fault() to keep PMD level page
>>>>>>> table entries that cover the vmalloc region up to date, we need to
>>>>>>> ensure that we don't hit such a stale PMD entry when accessing the
>>>>>>> stack. So we do a dummy read from the new stack while still running from
>>>>>>> the old one on the context switch path, and bump the vmalloc_seq counter
>>>>>>> when PMD level entries in the vmalloc range are modified, so that the MM
>>>>>>> switch fetches the latest version of the entries.
>>>>>>>
>>>>>>> Note that we need to increase the per-mode stack by 1 word, to gain some
>>>>>>> space to stash a GPR until we know it is safe to touch the stack.
>>>>>>> However, due to the cacheline alignment of the struct, this does not
>>>>>>> actually increase the memory footprint of the struct stack array at all.
>>>>>>>
>>>>>>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>>>>>>> Tested-by: Keith Packard <keithpac@amazon.com>
>>>>>> This patch landed recently in linux-next 20211220 as commit a1c510d0adc6
>>>>>> ("ARM: implement support for vmap'ed stacks"). Sadly it breaks
>>>>>> suspend/resume operation on all ARM 32bit Exynos SoCs. Probably the
>>>>>> suspend/resume related code must be updated somehow (it partially works
>>>>>> on physical addresses and disabled MMU), but I didn't analyze it yet. If
>>>>>> you have any hints, let me know.
>>>>>>
>>>>> Are there any such systems in KernelCI? We caught a suspend/resume
>>>>> related issue in development, which is why the hunk below was added.
>>>> I think that some Exynos-based Odroids (U3 and XU3) were some time ago
>>>> available in KernelCI, but I don't know if they are still there.
>>>>
>>>>
>>>>> In general, any virt-to-phys translation involving and address on the
>>>>> stack will become problematic.
>>>>>
>>>>> Could you please confirm whether the issue persists with the patch
>>>>> applied but with CONFIG_VMAP_STACK turned off? Just so we know we are
>>>>> looking in the right place?
>>>> I've just checked. After disabling CONFIG_VMAP_STACK suspend/resume
>>>> works fine both on commit a1c510d0adc6 and linux-next 20211220.
>>>>
>>> Thanks. Any other context you can provide beyond 'does not work' ?
>> Well, the board properly suspends, but it doesn't wake then (tested
>> remotely with rtcwake command). So far I cannot provide anything more.
>>
> Thanks. Does the below help? Or otherwise, could you try doubling the
> size of the overflow stack at arch/arm/include/asm/thread_info.h:34?

I've tried both (but not at the same time) on the current linux-next and 
none helped. This must be something else... :/


Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

