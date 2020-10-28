Return-Path: <SRS0=5Pkx=ED=vger.kernel.org=linux-samsung-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DDE1C56202
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 28 Oct 2020 21:33:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF4DC2485A
	for <linux-samsung-soc@archiver.kernel.org>; Wed, 28 Oct 2020 21:33:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="o0nzjMRV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725914AbgJ1VdJ (ORCPT
        <rfc822;linux-samsung-soc@archiver.kernel.org>);
        Wed, 28 Oct 2020 17:33:09 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:59308 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725834AbgJ1VdF (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Wed, 28 Oct 2020 17:33:05 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20201028131625euoutp021862d3d77e23c9dea75682a0300ec6bd~CKlqWnw0z1318913189euoutp02B
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Oct 2020 13:16:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20201028131625euoutp021862d3d77e23c9dea75682a0300ec6bd~CKlqWnw0z1318913189euoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
        s=mail20170921; t=1603890985;
        bh=T3F4AY65DSJjamdrLefuzjoAzNMZ7acTt4ESXOxGnpE=;
        h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
        b=o0nzjMRV+7YOvK+On7WTV1/rkgDEBTIT9pcSu4wMMvv/4gP8fMx62RNhf+xjvEUsH
         eD4PfIOvqH7UumoiSlTkUcwNJFyNJWgxMVy3RbEmbWVdBGOMJ2jsUOkDsXim1RaYxj
         xqYMfN0TwM19UWYToGU6NbqdO6ysgfYZxrhQGzzc=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
        eucas1p2.samsung.com (KnoxPortal) with ESMTP id
        20201028131620eucas1p2e0b4ab74a255fef067dec571d3b73c42~CKllfMIwK0071000710eucas1p2s;
        Wed, 28 Oct 2020 13:16:20 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
        eusmges2new.samsung.com (EUCPMTA) with SMTP id DA.D2.05997.42F699F5; Wed, 28
        Oct 2020 13:16:20 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
        eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
        20201028131620eucas1p1b371154d7b93fa035fab0d4a1f36f826~CKllB-Wlr1230912309eucas1p14;
        Wed, 28 Oct 2020 13:16:20 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
        eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
        20201028131620eusmtrp1b21ca6e70f23e07a11fd31078c38074e~CKllBSdcV0446304463eusmtrp1c;
        Wed, 28 Oct 2020 13:16:20 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-00-5f996f240e1f
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
        eusmgms2.samsung.com (EUCPMTA) with SMTP id 31.10.06017.32F699F5; Wed, 28
        Oct 2020 13:16:20 +0000 (GMT)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
        eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
        20201028131619eusmtip15b4e777747f086dbe9dbeb62af99ff19~CKlkY5rDd2603726037eusmtip1I;
        Wed, 28 Oct 2020 13:16:19 +0000 (GMT)
Subject: Re: [PATCH v2 2/2] ARM: move device tree mapping out of linear
 region
To:     Ard Biesheuvel <ardb@kernel.org>, Joel Stanley <joel@jms.id.au>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Rob Herring <robh+dt@kernel.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
From:   Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <301c4dee-f6bf-e707-8ef3-85947f1642bb@samsung.com>
Date:   Wed, 28 Oct 2020 14:16:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
        Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAMj1kXH90MzCUJ_DHZ_2=JcWBX=Qf1PT-A9PX9EeBTVx22EkaQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01SazBUYRjuc86ePdThsyveIcp2m5rKrR9nVLroxxk/TP42Ey1OKJbZg2LM
        2JikraSLsN1MGtuY0KipGLrsGNKymxgT1TRiajXDCpNhUc6eLv497/s+7/s8zzcfTSgsMl86
        RZPJazXqVBXlRj5pn7Vu35BeGRdcZAlkZ6ftiNWdf06xc+NtctZhXSBYq/WhnL02b3RhG4f7
        ZWyF9bkLayprRextm41iz7S2yfet5Hr7ewju6+uzFNdk+CTnen60E1zrGz+usfYcxX3sb6G4
        R/fyuanGgEOuh912J/KpKdm8NijiqFtyeZtnRnfAqa7eVkKHZkCPaBrwTvhlp/TIlVbg+wjO
        1cfrkdsSnkYwd/oBKRVTCGoXBgiRJS502LoJaWBEYCssRVJhR9A1MYxElhIfArutlBSxF46E
        AkeTc4PA5wkon6yQiQMKh4B+TE+JPhgcAb16P7FN4o1wabzSeWc1joeFqXmnMoM9obNyxHnT
        FcdAt0Pn5BB4LTwdu0lI2AcGR+64iFqAx+QwMKkjpZwHoXrmTwIlfO94LJfwGjBfvUBK/EIE
        Q5Y6uVRcQNBbUIEk1i74aJlzGiXwFmhoDpLa+6FNJz6LeN8d3o95Sh7c4cqT8j9tBoqLFBJ7
        Exg66v/Jvnr7jihFKsOyZIZlaQzL0hj+61Yhshb58FlCWhIvhGr4kzsEdZqQpUnakZCe1oiW
        fpl5sWP6GWqejzchTCPVKub9uoo4hUydLeSkmRDQhMqLOdBtjlUwieqcXF6bHqfNSuUFE/Kj
        SZUPE3Z39IgCJ6kz+RM8n8Fr/05daFdfHbpld084VpXrHW0c9P32sCTKFtnJBe4tDlX6RH3I
        iNmTONTy8vi2prq+8HUH8haLPV4JDdGXd/Gfc6sumsOUjhcNMjMyXi/R2JjqL30TNwqGqZ+5
        g3lNNd41wRaBqV+M6PRQe4XzsbOjgbYVhH/9+oP2QeUs9tJd3+yv1ZTN5atIIVkdspXQCurf
        mSY8S2EDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEIsWRmVeSWpSXmKPExsVy+t/xu7oq+TPjDVbdZrb4+eU9o0VD9z42
        i1/vjrBb/D7/l9ni/PkN7BZT/ixnstj0+BqrxYzz+5gsDk3dy2gx78ULNovWvUfYHbg9Ll+7
        yOzx7EQ7m8fOWXfZPS5+PMbssfeUtMemVZ1sHneu7WHz2Lyk3uPzJrkAzig9m6L80pJUhYz8
        4hJbpWhDCyM9Q0sLPSMTSz1DY/NYKyNTJX07m5TUnMyy1CJ9uwS9jOlHBAvOylWcubyXuYHx
        u0QXIyeHhICJxPEXZ5m7GLk4hASWMko0PJ3PCpGQkTg5rQHKFpb4c62LDcQWEnjLKHF3tS+I
        LSzgJ7F670+wGhEBZ4mm3zvBBjEL9DNLLFyzjwli6jcmiYuzm8C62QQMJbregkzi4OAVsJO4
        3CUNEmYRUJXofzeTEcQWFUiSeHlhKhOIzSsgKHFy5hMWEJtTIFDi7O8GsBpmATOJeZsfMkPY
        8hLb386BssUlbj2ZzzSBUWgWkvZZSFpmIWmZhaRlASPLKkaR1NLi3PTcYiO94sTc4tK8dL3k
        /NxNjMD43Xbs55YdjF3vgg8xCnAwKvHw3lCYES/EmlhWXJl7iFGCg1lJhNfp7Ok4Id6UxMqq
        1KL8+KLSnNTiQ4ymQM9NZJYSTc4Hppa8knhDU0NzC0tDc2NzYzMLJXHeDoGDMUIC6Yklqdmp
        qQWpRTB9TBycUg2MbT6S89Wfyv90ZVl4LOWQ4c6IsIk2R+Y8Vvu7TObem0hul6wJM7gjLbXY
        /YqXJE64/OF+TAOv/MW10yQernv6/2LKc4annGXzL9eJTVhTWRg6p7FokwuDdGq83CxZvx+T
        de/93VsmxNnQrHV4WerVlJNrtSN2Tq2LbK03WPBiwronHSvjp+1fpMRSnJFoqMVcVJwIAE/B
        ZJr1AgAA
X-CMS-MailID: 20201028131620eucas1p1b371154d7b93fa035fab0d4a1f36f826
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
        <CACPK8XfNfqToFBe0GPFTGrnPhNTYhSDiEagpB7ayBSW1DC-THA@mail.gmail.com>
        <CAMj1kXH90MzCUJ_DHZ_2=JcWBX=Qf1PT-A9PX9EeBTVx22EkaQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-samsung-soc.vger.kernel.org>
X-Mailing-List: linux-samsung-soc@vger.kernel.org

Hi Ard,

On 28.10.2020 13:52, Ard Biesheuvel wrote:
> On Wed, 28 Oct 2020 at 13:05, Joel Stanley <joel@jms.id.au> wrote:
>> On Wed, 28 Oct 2020 at 09:19, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
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
>> A bisection lead me to this patch after the next-20201028 failed to
>> boot on the aspeed systems in testing (aspeed_g5_defconfig).
>>
>> You can reproduce this with today's next and qemu 5.1:
>>
>> qemu-system-arm -M romulus-bmc -nographic \
>>   -kernel arch/arm/boot/zImage \
>>   -dtb arch/arm/boot/dts/aspeed-bmc-opp-romulus.dtb \
>>   -initrd any-old-file
>>
>> It requires the initrd option to reproduce, but the initrd doesn't
>> need to be valid as we don't make it that far.
>>
>> There is no output but attaching gdb shows the kernel is stuck in
>> setup_machine_tags. (If we enable CONFIG_ATAGS it is instead stuck in
>> calibrate_delay).
>>
>> (gdb) bt
>> #0  setup_machine_tags (machine_nr=<optimized out>,
>> __atags_vaddr=<optimized out>) at ../arch/arm/kernel/atags.h:12
>> #1  setup_arch (cmdline_p=0x80c01fc4) at ../arch/arm/kernel/setup.c:1100
>> #2  0x80b00d2c in start_kernel () at ../init/main.c:862
>> #3  0x00000000 in ?? ()
>>
>> Reverting 7a1be318f579 on top of next allowed the system to boot again.
>>
> Does this help?
>
> diff --git a/arch/arm/include/asm/memory.h b/arch/arm/include/asm/memory.h
> index bb79e52aeb90..4f355bda872a 100644
> --- a/arch/arm/include/asm/memory.h
> +++ b/arch/arm/include/asm/memory.h
> @@ -68,8 +68,8 @@
>   #define XIP_VIRT_ADDR(physaddr)  (MODULES_VADDR + ((physaddr) & 0x000fffff))
>
>   #define FDT_FIXED_BASE         UL(0xff800000)
> -#define FDT_FIXED_SIZE         (2 * PMD_SIZE)
> -#define FDT_VIRT_ADDR(physaddr)        ((void *)(FDT_FIXED_BASE |
> (physaddr) % PMD_SIZE))
> +#define FDT_FIXED_SIZE         (2 * SECTION_SIZE)
> +#define FDT_VIRT_ADDR(physaddr)        ((void *)(FDT_FIXED_BASE |
> (physaddr) % SECTION_SIZE))
>
>   #if !defined(CONFIG_SMP) && !defined(CONFIG_ARM_LPAE)
>   /*

Yes, this fixes booting of my Samsung Exynos-based test boards :)

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Best regards

-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

