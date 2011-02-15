From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 0/11] ARM: EXYNOS4: Change ARCH name, ARCH_EXYNOS4 from ARCH_S5PV310
Date: Tue, 15 Feb 2011 09:18:22 +0900
Message-ID: <AANLkTimOqg4XGMv+Gsarpa9U56MB3hxewhZxznHpx4-u@mail.gmail.com>
References: <1297671787-10571-1-git-send-email-kgene.kim@samsung.com>
	<AANLkTim49dpC_r4BcK7tqo9wmu8W=qMDZE5szDUja6Wo@mail.gmail.com>
	<002d01cbcca2$5900e430$0b02ac90$@com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:47568 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751082Ab1BOASY convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 14 Feb 2011 19:18:24 -0500
Received: by wwa36 with SMTP id 36so5531114wwa.1
        for <linux-samsung-soc@vger.kernel.org>; Mon, 14 Feb 2011 16:18:22 -0800 (PST)
In-Reply-To: <002d01cbcca2$5900e430$0b02ac90$@com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sangbeom Kim <sbkim73@samsung.com>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Marek Szyprowski <m.szyprowski@samsung.com>

On Tue, Feb 15, 2011 at 8:53 AM, Sangbeom Kim <sbkim73@samsung.com> wro=
te:
> Hi,
> I answer your questions in detail.
>
>> On Monday, February 14, 2011 8:16 PM, Kyungmin Park wrote:
>>
>> Hi,
>>
>> Wow, fast move, but need to more explanation.
>> what's the exact meaning of exynos4210?
>> Exynos4 is prefix and remaining are variants?
>
> Exynos4210 means below.
>
> 1st digit means ARM core version. In this case, 4 means Cortex A9.
> (If we release cortex A15, it will be Exynos5xxx)
> 2nd digit means number of core. =A02 mean dual core.
> 3rd digit means application category(LSI internal category).
> 4th digit means design rule (generation or shrink version)

Nice, I want these rules.
>
>> Now you changed all s5pv310 to exynos4. if new exynos4xxx chip are
>> comes then how to handle this one?
>> e.g., exynos4220 or later.
>> it's also conflict with mach-exynos4. do you handle all exynos4 seri=
es
>> at this mach directory?
>> historically there's no rules of the base RAM address at least samsu=
ng
>> chips.
>
> Yes, we will handle all exynos4 series at mach-exynos4 directory.
> In the past, there is no rule.
> But now, we are making consistent rules with AP design team.
> So, new version of exynos4 series will have same base RAM address.

Okay, no problem with base ram address,

Another one is how do you handle the GPIOs?
Now it's also changed as EXYNOS4_GPXX, I think it's difficult to use
the same banks as exynos4210 has if new chips are introduced.
maybe IRQ also has similar issue.

Now these patches assumes all exynos4 has same gpios, irqs and so on.

How do you think about it?

Thank you,
Kyungmin Park
>
> Thanks and regards,
> Sangbeom Kim
>
>>
>> Thank you,
>> Kyungmin Park
>>
>> On Mon, Feb 14, 2011 at 5:22 PM, Kukjin Kim <kgene.kim@samsung.com> =
wrote:
>> > This patch set changes to ARCH_EXYNOS4 from ARCH_S5PV310 for suppo=
rting
>> Samsung's
>> > new brand name EXYNOS. Samsung officially announced about the bran=
d name
>> of EXYNOS
>> > at MWC 2011 and The EXYNOS4 integrates a ARM Cortex A9 microporces=
sor
>> with several
>> > other peripherals to support features such as multimedai, storage,
>> graphics and gaming.
>> > Especially, the EXYNOS4210 CPU which is one of EXYNOS4 SoC series =
can be
>> used in
>> > products such as Mobile devices.
>> >
>> > This patch set consists of the following patches.
>> >
>> > [PATCH 01/11] ARM: EXYNOS4: Add EXYNOS4 CPU initialization support
>> > [PATCH 02/11] ARM: EXYNOS4: Update Clock part
>> > [PATCH 03/11] ARM: EXYNOS4: Update IRQ part
>> > [PATCH 04/11] ARM: EXYNOS4: Update Timer part
>> > [PATCH 05/11] ARM: EXYNOS4: Update device support
>> > [PATCH 06/11] ARM: EXYNOS4: Moved board support files
>> > [PATCH 07/11] ARM: EXYNOS4: Update Kconfig and Makefile for the ne=
w
>> ARCH_EXYNOS4
>> > [PATCH 08/11] ARM: exynos4_defconfig: Add defconfig for EXYNOS4
>> > [PATCH 09/11] mtd: OneNAND: Change dependency of ARCH_EXYNOS4
>> > [PATCH 10/11] ASoC: Change dependency of ARCH_EXYNOS4
>> > [PATCH 11/11] tty: Change dependency of ARCH_EXYNOS4
>> >
>> > _______________________________________________
>> > linux-arm-kernel mailing list
>> > linux-arm-kernel@lists.infradead.org
>> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>> >
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-sams=
ung-
>> soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
