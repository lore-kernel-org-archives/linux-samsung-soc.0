Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E58B5C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 29 Oct 2021 11:38:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C658061167
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 29 Oct 2021 11:38:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231910AbhJ2Ll1 (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 29 Oct 2021 07:41:27 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:30988 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230492AbhJ2Ll0 (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 29 Oct 2021 07:41:26 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20211029113856euoutp0182084ca66d8ddf995472c68e289819a9~yfXCGnRdJ3227032270euoutp01K
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Oct 2021 11:38:56 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20211029113856euoutp0182084ca66d8ddf995472c68e289819a9~yfXCGnRdJ3227032270euoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1635507536;
        bh=nNhnlRbnSXXDxSzuMJpGKo1v5Ye9zCNpHJdn7GO6j5U=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=pA6mSZcFbEaD+Nb5JdDbWXgokuqOn//4RDfPhhfs4Mkx1wRF/qiYfFckTBUm4qBvt
         xsvp6puUeDrVRP2I86jjh06CXrTMEuqHGf5/QsDmVrJ3Nvo+a8RK+kVqPzjwqSXsYP
         vp+F/+w7joSD/ENruXyQrYH5pTHtdIAhz+0jcTq8=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20211029113856eucas1p14fdd88099d68cbfa233a2339e7e47d97~yfXBzg8vV1259112591eucas1p1e;
        Fri, 29 Oct 2021 11:38:56 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges1new.samsung.com (EUCPMTA) with SMTP id 6B.C6.45756.05DDB716; Fri, 29
        Oct 2021 12:38:56 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20211029113855eucas1p1f31c9a05461e07adb0fa1fb4188d0987~yfXBOb-xc2615526155eucas1p1B;
        Fri, 29 Oct 2021 11:38:55 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20211029113855eusmtrp230a4145c264d9117598d0c7756d84e59~yfXBNsPCS1830518305eusmtrp2w;
        Fri, 29 Oct 2021 11:38:55 +0000 (GMT)
X-AuditID: cbfec7f2-7d5ff7000002b2bc-f9-617bdd504fdf
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 55.92.31287.F4DDB716; Fri, 29
        Oct 2021 12:38:55 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20211029113855eusmtip2ce2e2607ea3af30545610c816dd166ea~yfXAnYjeP0724707247eusmtip20;
        Fri, 29 Oct 2021 11:38:55 +0000 (GMT)
Message-ID: <d4398079-e512-e75b-92e9-51d590d8c240@samsung.com>
Date:   Fri, 29 Oct 2021 13:38:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH] arm64: Kconfig: Enable MCT timer for ARCH_EXYNOS
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sam Protsenko <semen.protsenko@linaro.org>
Cc:     linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Will Deacon <will@kernel.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <e01b0072-008a-c83d-59b2-2174860c00fd@canonical.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGKsWRmVeSWpSXmKPExsWy7djPc7oBd6sTDbbOkLZ4v6yH0eL6l+es
        Fhvf/mCy2PT4GqvF5V1z2CxmnN/HZPH3zj82i6XXLzJZPO8DclvumDpweayZt4bRY1ZDL5vH
        plWdbB53ru1h89i8pN6jb8sqRo/Pm+QC2KO4bFJSczLLUov07RK4Mmbvb2Qr2ClQ8fRhN0sD
        43beLkZODgkBE4l5t+azdjFycQgJrGCU6Pv5kRHC+cIo8fXHUmYI5zOjxIztT1hhWhaf/soO
        kVjOKPH72ikWCOcjo0TruRPMIFW8AnYSt/a1gnWwCKhKfFt8mR0iLihxcuYTFhBbVCBJouNd
        J5gtLOAqsaLrC1g9s4C4xK0n85lAbBGBTIlLd1+DLWAW+MIk8efob7AGNgFDia63XWwgNqeA
        o8Tdqb/ZIZrlJba/ncMMceoPDonf7yIgbBeJVxsus0DYwhKvjm9hh7BlJP7vBFnGBWQ3M0o8
        PLeWHcLpYZS43DSDEaLKWuLOuV9A2ziANmhKrN+lDxF2lHj97BIzSFhCgE/ixltBiBv4JCZt
        mw4V5pXoaBOCqFaTmHV8HdzagxcuMU9gVJqFFCyzkLw/C8k3sxD2LmBkWcUonlpanJueWmyY
        l1quV5yYW1yal66XnJ+7iRGYtE7/O/5pB+PcVx/1DjEycTAeYpTgYFYS4X0zpTpRiDclsbIq
        tSg/vqg0J7X4EKM0B4uSOO+q2WvihQTSE0tSs1NTC1KLYLJMHJxSDUwczzudl0bWLth5+Nt/
        7xruipM7JM8In19sULH63kTn7rMMRQFmgSbS5bYTt4elbciImx3UEL/0W2mIYdSjBYWpMzOZ
        I5xnfl7SH9PUr3Q5rCJfzaDlNdMNYZ2DoQ8bDr7U/vX/duyl+UuUlfe1tSsz+7dOaPwQy7J9
        /salm+ZUVywN1lAKdJVIKv1yi1N/2a+J9b5zDhUdcmpSevd+/kZmhVxrGdZ2D+VU9obE+yfD
        Ezsc7ugWzvzRr/rRJMxp+7OgvOMr/80JUwi+UarHMPPrI0etAmubqP9bo9/Z7OGI0Tsel7j7
        pvmrtWpHZxvMOaDwYr+U20f2RwsqtRl+3r5b86j266z731gZRVXePlBiKc5INNRiLipOBABM
        Oy2qyQMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRmVeSWpSXmKPExsVy+t/xe7r+d6sTDTbcNLJ4v6yH0eL6l+es
        Fhvf/mCy2PT4GqvF5V1z2CxmnN/HZPH3zj82i6XXLzJZPO8DclvumDpweayZt4bRY1ZDL5vH
        plWdbB53ru1h89i8pN6jb8sqRo/Pm+QC2KP0bIryS0tSFTLyi0tslaINLYz0DC0t9IxMLPUM
        jc1jrYxMlfTtbFJSczLLUov07RL0Mmbvb2Qr2ClQ8fRhN0sD43beLkZODgkBE4nFp7+ydzFy
        cQgJLGWU+NncxQSRkJE4Oa2BFcIWlvhzrYsNxBYSeM8oMeuXJYjNK2AncWtfK1gNi4CqxLfF
        l9kh4oISJ2c+YQGxRQWSJLYt+MkIYgsLuEqs6PoCVs8sIC5x68l8sF0iApkSfR/fMULEvzFJ
        HN3PC3HQCSaJAzfegyXYBAwlut5CHMEp4Chxd+pvdogGM4murV1QzfIS29/OYZ7AKDQLyR2z
        kOybhaRlFpKWBYwsqxhFUkuLc9Nziw31ihNzi0vz0vWS83M3MQJjdNuxn5t3MM579VHvECMT
        B+MhRgkOZiUR3jdTqhOFeFMSK6tSi/Lji0pzUosPMZoCA2Mis5Rocj4wSeSVxBuaGZgamphZ
        GphamhkrifNunbsmXkggPbEkNTs1tSC1CKaPiYNTqoEpbl7BzB2599/aK5509eKPi5ojf4nj
        93IpNyNpoWMNtqdYksIC9ldJdh/93p1+Wzebz+AEQ9y3PQ3lN66b8dj/nrn7/Kz6B2yTzV5K
        hSZ+Xmh9v6znoFir6EyZtb99Pt/skVXctu0Hx64FN+Rn++Us2zJPRiTyXfg6Ac7wN5Pmfnb7
        bL3BauP7xXte/w87ru24yP95w/3wp3NOGKsyF/e76n1m2yHse92VTVQp5tphNq7V9feuL4yZ
        99Zmje+bg0z1G6pPrBKbIrrgx1GLB6WvIrc1CTxQvH9AMMmSYeOxx1W3D223vOn3gqGfZ5Zh
        //bIS6JvM5dyOJdvyV95ZtlXr/kn/lzX39ArKZQn+F5yiRJLcUaioRZzUXEiAGaEy41aAwAA
X-CMS-MailID: 20211029113855eucas1p1f31c9a05461e07adb0fa1fb4188d0987
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20211028143524eucas1p16f240d8bc7e0d2c677fc54afde45957b
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20211028143524eucas1p16f240d8bc7e0d2c677fc54afde45957b
References: <20211026115916.31553-1-semen.protsenko@linaro.org>
        <8b3466f1-2b16-80ca-79c7-577860fc90aa@canonical.com>
        <CAPLW+4=YizLzdiZ1mdCGxvPCTYhNjeiomO=q=4Xk-ZxqqH++nA@mail.gmail.com>
        <CGME20211028143524eucas1p16f240d8bc7e0d2c677fc54afde45957b@eucas1p1.samsung.com>
        <e01b0072-008a-c83d-59b2-2174860c00fd@canonical.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 28.10.2021 16:35, Krzysztof Kozlowski wrote:
> On 28/10/2021 16:22, Sam Protsenko wrote:
>> On Tue, 26 Oct 2021 at 17:03, Krzysztof Kozlowski
>> <krzysztof.kozlowski@canonical.com> wrote:
>>> On 26/10/2021 13:59, Sam Protsenko wrote:
>>>> Some ARM64 Exynos SoCs have MCT timer block, e.g. Exynos850 and
>>>> Exynos5433. CLKSRC_EXYNOS_MCT option is not visible unless COMPILE_TEST
>>>> is enabled. Select CLKSRC_EXYNOS_MCT option for ARM64 ARCH_EXYNOS like
>>>> it's done in arch/arm/mach-exynos/Kconfig, to enable MCT timer support
>>>> for ARM64 Exynos SoCs.
>>>>
>>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>>>> ---
>>>>   arch/arm64/Kconfig.platforms | 1 +
>>>>   1 file changed, 1 insertion(+)
>>>>
>>> +CC Marek, Marc, Mark and Chanwoo,
>>> Looks like duplicated:
>>> https://lore.kernel.org/lkml/20181018095708.1527-7-m.szyprowski@samsung.com/
>>>
>>> The topic stalled and I think this particular patch did not make sense
>>> on its own, without rest of changes from Marek. I am not sure, though...
>>>
>> Krzysztof, Marek,
>>
>> That series looks nice, I'm quite interested in that being applied. Do
>> you think I can do something to help with that (e.g. rebasing,
>> re-sending on behalf of Marek, testing on Exynos850, etc)?
> I think there were no objections against v4 of this patchset, but
> somehow it wasn't applied.
>
> Marek,
> Does it make sense to try respinning your v4?

I think I've abandoned it, because I got a final NACK on the arch timer 
change (support for 'not-fw-configured' timers). Without that the above 
mentioned changes doesn't make much sense.

I know that the Exynos5433 firmware breaks the defined protocol, but on 
the other hand I can do nothing more than carrying internally those few 
patches out of tree to keep it fully working with 'mainline'.

I've observed the same problem with newer Exynos SoCs, but those so far 
didn't get mainline support (yet), although there have been some 
attempts from the community.

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

