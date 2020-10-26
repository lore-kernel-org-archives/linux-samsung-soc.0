Return-Path: <SRS0=YeST=EB=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD564C4363A
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 21:43:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 628E721655
	for <linux-samsung-soc@archiver.kernel.org>; Mon, 26 Oct 2020 21:43:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="aCX3Sx9c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390236AbgJZVnW (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Mon, 26 Oct 2020 17:43:22 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:50298 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390232AbgJZVnW (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 26 Oct 2020 17:43:22 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201026214310euoutp0242b37de071e21b41e2ec17160541e2cc~BqNh--8qQ1041510415euoutp02j
        for <linux-samsung-soc@vger.kernel.org>; Mon, 26 Oct 2020 21:43:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201026214310euoutp0242b37de071e21b41e2ec17160541e2cc~BqNh--8qQ1041510415euoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1603748590;
        bh=sYhJhVWWDlEPWm66uk1AXw/l+HzhGtWep/Nov/Eem9U=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=aCX3Sx9cD0IlYi2P7CP/vJ3eJrKa6nV5YVaK8VMLfDrEpRG0uvuQM8Ennntt0o3sX
         gzKELE5tbVP+0yFv+bGvamRubxdg+L5HlrXGj8pTlDXr0cLXcFuVqdOkk+tiuoodct
         5TLcd04W1WF+adJ7yK/V8pqAZxp4FMIrC/d/9Bvw=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201026214304eucas1p2b1c560093cb32ff4b20d8c4d3e259828~BqNcVULqj2743427434eucas1p2f;
        Mon, 26 Oct 2020 21:43:04 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
        eusmges3new.samsung.com (EUCPMTA) with SMTP id 46.78.06318.7E2479F5; Mon, 26
        Oct 2020 21:43:04 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
        20201026214303eucas1p2d351a2bd22c269d41cb1f3b23ad05794~BqNb1qwPx2734927349eucas1p2g;
        Mon, 26 Oct 2020 21:43:03 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
        20201026214303eusmtrp29d54146f286c2b55921ab21f9afc5ce6~BqNb1Hvd_2736327363eusmtrp2V;
        Mon, 26 Oct 2020 21:43:03 +0000 (GMT)
X-AuditID: cbfec7f5-38bff700000018ae-c1-5f9742e7fc6f
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 22.F0.06017.7E2479F5; Mon, 26
        Oct 2020 21:43:03 +0000 (GMT)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
        20201026214303eusmtip20902ea76dffe976f73ef6d84ec1f6621~BqNblJ-Xr2125721257eusmtip24;
        Mon, 26 Oct 2020 21:43:03 +0000 (GMT)
Subject: Re: [PATCH 2/3] ARM: exynos: Simplify code in Exynos3250 CPU core
 restart path
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     "linux-samsung-soc@vger.kernel.org" 
        <linux-samsung-soc@vger.kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <1c410298-f5af-7bcd-d501-397058a59b1a@samsung.com>
Date:   Mon, 26 Oct 2020 22:43:03 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAJKOXPeO7uS0mLejYo-oBEpMvBd0338LDogRk=hnU61rdUXCQw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmleLIzCtJLcpLzFFi42LZduznOd0XTtPjDQ4oW2ycsZ7V4vz5DewW
        M87vY3Jg9ti0qpPNo2/LKkaPz5vkApijuGxSUnMyy1KL9O0SuDKW9sUW3JWp+PPwI1sD436J
        LkZODgkBE4lZ/VdZuhi5OIQEVjBKvHi3nhXC+cIocaChixnC+cwo0X14GRtMy6dFe5kgEssZ
        JaYdeArlvGeUWPf7E3sXIweHsECkxKQT0SANIgKaEtf/fgcbyyzQzCjx79UfdpAEm4ChRNfb
        LrCpvAJ2Ese6NzOD2CwCqhIfPk9iAbFFBZIk/n7+wwxRIyhxcuYTFpD5nAKBEo+awcLMAvIS
        29/OgbLFJW49mQ92j4RAO7vEn32vWSCudpFYdfYZO4QtLPHq+BYoW0bi/06YBqDjHp5byw7h
        9DBKXG6awQhRZS1x59wvNpDNzEDvrN+lDxF2lHj8bQFYWEKAT+LGW0GII/gkJm2bzgwR5pXo
        aBOCqFaTmHV8HdzagxcuMU9gVJqF5LNZSN6ZheSdWQh7FzCyrGIUTy0tzk1PLTbOSy3XK07M
        LS7NS9dLzs/dxAhMIqf/Hf+6g3Hfn6RDjAIcjEo8vBfeTosXYk0sK67MPcQowcGsJMLrdPZ0
        nBBvSmJlVWpRfnxRaU5q8SFGaQ4WJXFe40UvY4UE0hNLUrNTUwtSi2CyTBycUg2ManUTZhlt
        EtJJc1iQWc8msvXfQakNB8LXH96vvHRhwseVXb9Fty3gOGr0aDFX8nIx/9ygo64mzRcfd0Ws
        y27Z3SFwfs1Dfru729rm78m6FF11Ze0Ts5ZWx0/FzglrWk33hU0tq7H9993WrfXqzM2nmQ8+
        jN0bfMv2vKXfgck+ga+cOpW/OR5gVGIpzkg01GIuKk4EAJSy5NgeAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprLIsWRmVeSWpSXmKPExsVy+t/xe7rPnabHG+xvkbHYOGM9q8X58xvY
        LWac38fkwOyxaVUnm0ffllWMHp83yQUwR+nZFOWXlqQqZOQXl9gqRRtaGOkZWlroGZlY6hka
        m8daGZkq6dvZpKTmZJalFunbJehlLO2LLbgrU/Hn4Ue2Bsb9El2MnBwSAiYSnxbtZepi5OIQ
        EljKKHHxxiwmiISMxMlpDawQtrDEn2tdbCC2kMBbRonbv0O7GDk4hAUiJSadiAYJiwhoSlz/
        +50VZA6zQDOjxNJ3cxkhhvYwSezrms4IUsUmYCjR9RZiEK+AncSx7s3MIDaLgKrEh8+TWEBs
        UYEkiZcXpjJB1AhKnJz5hAVkGadAoMSjZrByZgEziXmbH0LZ8hLb386BssUlbj2ZzzSBUWgW
        ku5ZSFpmIWmZhaRlASPLKkaR1NLi3PTcYiO94sTc4tK8dL3k/NxNjMCo2Xbs55YdjF3vgg8x
        CnAwKvHwXng7LV6INbGsuDL3EKMEB7OSCK/T2dNxQrwpiZVVqUX58UWlOanFhxhNgX6byCwl
        mpwPjOi8knhDU0NzC0tDc2NzYzMLJXHeDoGDMUIC6YklqdmpqQWpRTB9TBycUg2M3IXm6y5X
        Cl5RvNknELHHMFFtle/EbXa3HxbbqSmHnmY34Np7TebJ+5LsOZuP1LB1M+rNV9vf+ix3a8bu
        K+oLc90PflviHHJh/nuvb20XxOe/mprLK2nBuMrIq+ji70Xx0i7xipYHusq4BX6a/OWJe6zg
        78chHdV8NXLT6nevztgftZr4KDtdiaU4I9FQi7moOBEADpvYNrACAAA=
X-CMS-MailID: 20201026214303eucas1p2d351a2bd22c269d41cb1f3b23ad05794
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20190322114844eucas1p16095d6c26d9b6ef23c1168ce70194255
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20190322114844eucas1p16095d6c26d9b6ef23c1168ce70194255
References: <CGME20190322114844eucas1p16095d6c26d9b6ef23c1168ce70194255@eucas1p1.samsung.com>
        <20190322114833.12686-1-m.szyprowski@samsung.com>
        <20190322114833.12686-3-m.szyprowski@samsung.com>
        <CAJKOXPeO7uS0mLejYo-oBEpMvBd0338LDogRk=hnU61rdUXCQw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Krzysztof,

On 22.03.2019 14:10, Krzysztof Kozlowski wrote:
> On Fri, 22 Mar 2019 at 12:48, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> exynos_core_restart() is called by secondary CPU boot procedure, used by
>> CPU hotplug. Replace of_machine_is_compatible() call with a simple SoC
>> revision check.
>>
>> of_machine_is_compatible() function performs a dozen of string comparisons
>> during the full device tree walk, while soc_is_exynos3250() is a simple
>> integer check on SoC revision variable.
> Yes but it is against the effort of getting rid of all soc_is_() (see
> https://patchwork.kernel.org/project/linux-samsung-soc/list/?series=43565&state=*
> ). It also makes this code sticky to mach - we cannot move it to
> drivers. See also Arnd's opinion:
> https://marc.info/?l=devicetree&m=139291569126848&w=2
>
> Did you measure the practical performance impact of this change?

No, I didn't measure the performance, but recently I noticed the 
following warning:

=============================
WARNING: suspicious RCU usage
5.10.0-rc1-00001-g6f65599d1f4f-dirty #1800 Not tainted
-----------------------------
./include/trace/events/lock.h:37 suspicious rcu_dereference_check() usage!

other info that might help us debug this:


rcu_scheduler_active = 2, debug_locks = 1
RCU used illegally from extended quiescent state!
no locks held by swapper/0/0.

stack backtrace:
CPU: 0 PID: 0 Comm: swapper/0 Not tainted 
5.10.0-rc1-00001-g6f65599d1f4f-dirty #1800
Hardware name: Samsung Exynos (Flattened Device Tree)
[<c0111514>] (unwind_backtrace) from [<c010ceb8>] (show_stack+0x10/0x14)
[<c010ceb8>] (show_stack) from [<c0b1d8dc>] (dump_stack+0xb4/0xd4)
[<c0b1d8dc>] (dump_stack) from [<c0194acc>] (lock_acquire+0x418/0x584)
[<c0194acc>] (lock_acquire) from [<c0b29e58>] 
(_raw_spin_lock_irqsave+0x4c/0x60)
[<c0b29e58>] (_raw_spin_lock_irqsave) from [<c0897af4>] 
(of_device_is_compatible+0x1c/0x4c)
[<c0897af4>] (of_device_is_compatible) from [<c01216d8>] 
(exynos_core_restart+0x14/0xb0)
[<c01216d8>] (exynos_core_restart) from [<c0120a78>] 
(exynos_cpu0_enter_aftr+0x1d0/0x1dc)
[<c0120a78>] (exynos_cpu0_enter_aftr) from [<c08575b0>] 
(exynos_enter_coupled_lowpower+0x44/0x74)
[<c08575b0>] (exynos_enter_coupled_lowpower) from [<c085477c>] 
(cpuidle_enter_state+0x178/0x660)
[<c085477c>] (cpuidle_enter_state) from [<c08572dc>] 
(cpuidle_enter_state_coupled+0x35c/0x378)
[<c08572dc>] (cpuidle_enter_state_coupled) from [<c0854cc8>] 
(cpuidle_enter+0x50/0x54)
[<c0854cc8>] (cpuidle_enter) from [<c0164854>] (do_idle+0x224/0x2a4)
[<c0164854>] (do_idle) from [<c0164c88>] (cpu_startup_entry+0x18/0x1c)
[<c0164c88>] (cpu_startup_entry) from [<c1100fa0>] 
(start_kernel+0x640/0x67c)
[<c1100fa0>] (start_kernel) from [<00000000>] (0x0)

I will add this to the commit message and resend. This looks like a good 
reason for this change.

>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   arch/arm/mach-exynos/platsmp.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm/mach-exynos/platsmp.c b/arch/arm/mach-exynos/platsmp.c
>> index 65da13923b8f..d5d48fbdab17 100644
>> --- a/arch/arm/mach-exynos/platsmp.c
>> +++ b/arch/arm/mach-exynos/platsmp.c
>> @@ -216,7 +216,7 @@ void exynos_core_restart(u32 core_id)
>>   {
>>          u32 val;
>>
>> -       if (!of_machine_is_compatible("samsung,exynos3250"))
>> +       if (!soc_is_exynos3250())
>>                  return;
>>
>>          while (!pmu_raw_readl(S5P_PMU_SPARE2))
>> --
>> 2.17.1
>>
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

