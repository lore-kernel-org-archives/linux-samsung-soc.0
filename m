Return-Path: <linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B33C433EF
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 29 Oct 2021 13:36:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF705611C0
	for <linux-samsung-soc@archiver.kernel.org>; Fri, 29 Oct 2021 13:36:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231537AbhJ2NjZ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Fri, 29 Oct 2021 09:39:25 -0400
Received: from mailout1.w1.samsung.com ([210.118.77.11]:12996 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231481AbhJ2NjY (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 29 Oct 2021 09:39:24 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20211029133655euoutp01ae36899ae4deffc77c32ac803539736a~yg_CPnDx40463504635euoutp01K
        for <linux-samsung-soc@vger.kernel.org>; Fri, 29 Oct 2021 13:36:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20211029133655euoutp01ae36899ae4deffc77c32ac803539736a~yg_CPnDx40463504635euoutp01K
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1635514615;
        bh=rvusb1ciiVPIPGs1yAbONR4bYOc2fenxpYe9tSfOLJA=;
        h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
        b=fdwk444PkZRycBsluyMcxONc/A2pJAk79c5wursSQik9MmRnHVDdczKLViQ+WBwYJ
         m/0njTEjvE4ujMLX6ZU+Yt4za23WaYeP8mt8BkUfgSxGzxn6bxMqgskC3fPMYeZP18
         tfHE81Jvj6ge2/etHQbsFWHpHyEVpucodIpMmsoY=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTP id
        20211029133654eucas1p1102cc0e1a592d0277bbdac401739349d~yg_B6nUbK0985309853eucas1p1A;
        Fri, 29 Oct 2021 13:36:54 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id A4.A8.56448.6F8FB716; Fri, 29
        Oct 2021 14:36:54 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20211029133654eucas1p2b089257876d8a0fe48f20bf94024ec8a~yg_BaFt2m0277202772eucas1p2z;
        Fri, 29 Oct 2021 13:36:54 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20211029133654eusmtrp1b783ca73441d4bbe75950ad86185f25f~yg_BZHQAW2496724967eusmtrp1I;
        Fri, 29 Oct 2021 13:36:54 +0000 (GMT)
X-AuditID: cbfec7f5-d3bff7000002dc80-7d-617bf8f6f75d
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms1.samsung.com (EUCPMTA) with SMTP id 56.D3.31287.6F8FB716; Fri, 29
        Oct 2021 14:36:54 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20211029133653eusmtip1e0418ed7828ea7bd9c663c05bda57839~yg_A0gb871222612226eusmtip1f;
        Fri, 29 Oct 2021 13:36:53 +0000 (GMT)
Message-ID: <c888fc5e-4698-333f-6922-8b53f3efbe36@samsung.com>
Date:   Fri, 29 Oct 2021 15:36:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
        Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [PATCH] arm64: Kconfig: Enable MCT timer for ARCH_EXYNOS
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Will Deacon <will@kernel.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <CAPLW+4kKBXiwQF4qPTA04WCDb3PY365OORV4brtFxmQbSBxL8A@mail.gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf0yMcRze99733nt753i7oo/83I2IxEnba3HYNJdhYja/OXpVU2l3EmJu
        yk2vNHNa1ymJi+uWmlziJNwihpKsYmd+rqYcVy6uQ3T3+tF/z+d5Ps+e5/Pdl8Qk1cJgMjFl
        N6tKUSZJCQq/eq+/ccZXd4Zylscdxny+kIOYNlenkLnscAuYqnetQqbFWkgw+qY6AfPTPkAw
        pW3NAqYzd3DMskcupBTlZ8qRwqA5TiiqzNmEwt5aSyiuGA8pci1mpPhSNX6laD01L45NStzD
        qmbKt1IJJQOQ+ix47/Pay0iD7CM55EcCPQeKuC6CQxQpoU0ITNUegVeQ0C4EXN8wXviCQFPZ
        JvrraH+Zj3jhIoLTTrOQH3oQnL1bRHi3xLQc6kucmBfj9GTQdh/Bed4fHhS89+GR9DY4+inb
        hwPoaDBxLqEXY3QQvHhf7KsRSIdDRUGXyBuA0ZUYeHLzfQEELQPOwfmwHx0LvT89GG+eADWO
        QsxrAPoXCce+cTjfezHUWzRCHgdAV4Plzz1j4aEuB+cNmQjeNF4S8UMOgpbDesRvRYG90TMY
        Rw5GhEKldSZPL4LujqeYlwZ6OLQ7/PkSw+Hk1fw/tBiOaiX8dggYGir+xd558hQ7gaSGIe9i
        GHK/Ycg5hv+5ZxFuRkFsmjo5nlVHpLDp4WplsjotJT58+67kKjT4sx4ONPRdQ6aunnAbEpDI
        hoDEpIHij6cylBJxnHLffla1a4sqLYlV29AYEpcGia3V5VskdLxyN7uTZVNZ1V9VQPoFawRB
        8lkG9/FVFzxaa14ZrDVaMo1Zq2dPXBY9j9pw4G5vgNBkid+o63C1zF3x4UNzzrkViVRM8YOl
        7WkHprUdqhtly377JEl3Wx9dHPE6MiJ9XGrnvWtR/uwp2yTtr/zChvELbqicrbG3uRnpLpn5
        5vXHm7r9SqiYsOiCuiJZZtxU/Xm588qrPhD192fFWGtGVcjckZaQ0FpJ7sH6Uny0pbPjU7fQ
        LM+QbP+8ehMnnfhVhPJWGfXG72Fzl7xc93GybvnrlbGaWzttvaE7kt+e6F8albl5X+B9x4im
        JjJEwDmnz+fWJTxer59SHKytoRY363pCogLGvXnkKqN+iMvW7NGUSnF1glI2DVOplb8B9NRF
        zsgDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrOIsWRmVeSWpSXmKPExsVy+t/xu7rfflQnGvy+xGnxflkPo8X1L89Z
        LTa+/cFksenxNVaLy7vmsFnMOL+PyeLvnX9sFkuvX2SyeN4H5LbcMXXg8lgzbw2jx6yGXjaP
        Tas62TzuXNvD5rF5Sb1H35ZVjB6fN8kFsEfp2RTll5akKmTkF5fYKkUbWhjpGVpa6BmZWOoZ
        GpvHWhmZKunb2aSk5mSWpRbp2yXoZSz8J1FwRari5p6NjA2Md0S7GDk5JARMJG7cnc4IYgsJ
        LGWUOPE/CCIuI3FyWgMrhC0s8edaF1sXIxdQzXtGiaUzXrGDJHgF7CSOLPzADGKzCKhKtL1u
        ZYGIC0qcnPkEzBYVSJLYtuAn2AJhAVeJFV1fwIYyC4hL3HoynwnEFhHQk1g3E2QmF1B8I7PE
        nWVvoLYdYZZ41bwbbBubgKFE11uQMzg5OAUCJT79/cUMMclMomtrFyOELS+x/e0c5gmMQrOQ
        HDILycJZSFpmIWlZwMiyilEktbQ4Nz232FCvODG3uDQvXS85P3cTIzBGtx37uXkH47xXH/UO
        MTJxMB5ilOBgVhLhfTOlOlGINyWxsiq1KD++qDQntfgQoykwNCYyS4km5wOTRF5JvKGZgamh
        iZmlgamlmbGSOO/WuWvihQTSE0tSs1NTC1KLYPqYODilGphE/Upev7oziTnrQtiegJ9/1j+d
        /O782TmF95SFq27urIs9uTVBrND3006D8wz3Dl+Tv7nkzW9N8+Ckqe6R78tVb69idHI581r6
        dKyZ/kkBnkmOmTJrlpp8eSwkEx2v8vingKiKccoq1y3H6lrfn5ZgfuUvtGb1WmUz2ei1TmE6
        LbOn/JHL1/RtCl5VsflN8YHD0z/bivb0STRU+p437Z26TDTOZVV5zpNHTz4v26A5hWO2w50b
        ahz1qozzbUTC103dFeYRf7KvjPHGU03fTkY204faE2vTJEwDZpp33uF2W2wVpvNh+16HlhOF
        F7Z2X+R+ZTvv49JTZj4lNtd2xH78cNh9P0fGLEHBXgZ+S0clluKMREMt5qLiRAAdZ/ZzWgMA
        AA==
X-CMS-MailID: 20211029133654eucas1p2b089257876d8a0fe48f20bf94024ec8a
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
        <d4398079-e512-e75b-92e9-51d590d8c240@samsung.com>
        <CAPLW+4kKBXiwQF4qPTA04WCDb3PY365OORV4brtFxmQbSBxL8A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

On 29.10.2021 15:15, Sam Protsenko wrote:
> On Fri, 29 Oct 2021 at 14:38, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> On 28.10.2021 16:35, Krzysztof Kozlowski wrote:
>>> On 28/10/2021 16:22, Sam Protsenko wrote:
>>>> On Tue, 26 Oct 2021 at 17:03, Krzysztof Kozlowski
>>>> <krzysztof.kozlowski@canonical.com> wrote:
>>>>> On 26/10/2021 13:59, Sam Protsenko wrote:
>>>>>> Some ARM64 Exynos SoCs have MCT timer block, e.g. Exynos850 and
>>>>>> Exynos5433. CLKSRC_EXYNOS_MCT option is not visible unless COMPILE_TEST
>>>>>> is enabled. Select CLKSRC_EXYNOS_MCT option for ARM64 ARCH_EXYNOS like
>>>>>> it's done in arch/arm/mach-exynos/Kconfig, to enable MCT timer support
>>>>>> for ARM64 Exynos SoCs.
>>>>>>
>>>>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>>>>>> ---
>>>>>>    arch/arm64/Kconfig.platforms | 1 +
>>>>>>    1 file changed, 1 insertion(+)
>>>>>>
>>>>> +CC Marek, Marc, Mark and Chanwoo,
>>>>> Looks like duplicated:
>>>>> https://lore.kernel.org/lkml/20181018095708.1527-7-m.szyprowski@samsung.com/
>>>>>
>>>>> The topic stalled and I think this particular patch did not make sense
>>>>> on its own, without rest of changes from Marek. I am not sure, though...
>>>>>
>>>> Krzysztof, Marek,
>>>>
>>>> That series looks nice, I'm quite interested in that being applied. Do
>>>> you think I can do something to help with that (e.g. rebasing,
>>>> re-sending on behalf of Marek, testing on Exynos850, etc)?
>>> I think there were no objections against v4 of this patchset, but
>>> somehow it wasn't applied.
>>>
>>> Marek,
>>> Does it make sense to try respinning your v4?
>> I think I've abandoned it, because I got a final NACK on the arch timer
>> change (support for 'not-fw-configured' timers). Without that the above
>> mentioned changes doesn't make much sense.
>>
>> I know that the Exynos5433 firmware breaks the defined protocol, but on
>> the other hand I can do nothing more than carrying internally those few
>> patches out of tree to keep it fully working with 'mainline'.
>>
>> I've observed the same problem with newer Exynos SoCs, but those so far
>> didn't get mainline support (yet), although there have been some
>> attempts from the community.
>>
> There is no such problem on Exynos850 SoC (which I'm trying to
> upstream right now), the architectured timer seems to be working fine
> there, as is. Or maybe everything is configured properly in
> bootloader, not sure. Also I managed to use MCT as a primary
> clocksource (for sched_clock, etc) by disabling arch timer in
> arch/arm64/kernel/time.c (just for the sake of test), and it works
> fine.  So I still would like to have MCT enabled in kernel: this way
> we can at least test the driver, as the clocksource can be changed to
> MCT via sysfs (or by disabling arch timer in time.c). And for that we
> need to at least enable CLKSRC_EXYNOS_MCT in ARCH_EXYNOS.
MCT can be also set as default by changing its rating, like it is done 
under #ifdef CONFIG_ARM.
> I guess all your patches (except one you mentioned) from that series
> should be fine to apply. Do you mind if I re-send your patch series
> (minus one patch) on your behalf? That would spare you some boring
> work, and at least minimize your local delta you're carrying.

Feel free to resend it.

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

