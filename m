From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 1/2] ARM: exynos: delete redundant HAVE_SCHED_CLOCK option
 in Kconfig
Date: Fri, 31 Aug 2012 19:58:18 +0900
Message-ID: <CAH9JG2W3KL=K7MHDsF4_NScjY01X56JLc=nBy+wvh3EFQefQmw@mail.gmail.com>
References: <1346406296-16223-1-git-send-email-Barry.Song@csr.com>
	<CAH9JG2W8xZrkmGkVw_JDY3qSsqHnaTi8-BNoW99V3FUyvWBXng@mail.gmail.com>
	<CAGsJ_4xUBDGn1hDdWvUX68MfC98936v-_vLfPrisLNL7RY6nEw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-qa0-f53.google.com ([209.85.216.53]:57190 "EHLO
	mail-qa0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752026Ab2HaK6T (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 31 Aug 2012 06:58:19 -0400
Received: by qaas11 with SMTP id s11so822804qaa.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Aug 2012 03:58:18 -0700 (PDT)
In-Reply-To: <CAGsJ_4xUBDGn1hDdWvUX68MfC98936v-_vLfPrisLNL7RY6nEw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Barry Song <21cnbao@gmail.com>
Cc: Barry Song <Barry.Song@csr.com>, olof@lixom.net, arnd@arndb.de, kgene.kim@samsung.com, rob.herring@calxeda.com, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, workgroup.linux@csr.com, Barry Song <Baohua.Song@csr.com>

Acked-by: Kyungmin Park <kyungmin.park@samsung.com>

# git grep HAVE_SCHED_CLOCK arch/arm/
arch/arm/Kconfig:       select HAVE_SCHED_CLOCK
arch/arm/mach-exynos/Kconfig:   select HAVE_SCHED_CLOCK

On 8/31/12, Barry Song <21cnbao@gmail.com> wrote:
> 2012/8/31 Kyungmin Park <kmpark@infradead.org>:
>> Hi,
>>
>> then where select it HAVE_SCHED_CLOCK? apart from other exynos board,
>> universal have to use another clock.
>
> The old arch/arm/kernel/Makefile:
> obj-$(CONFIG_HAVE_SCHED_CLOCK)  += sched_clock.o
> has become:
> obj-y += sched_clock.o
>
>>
>> Thank you,
>> Kyungmin Park
>>
>> On 8/31/12, Barry Song <Barry.Song@csr.com> wrote:
>>> From: Barry Song <Baohua.Song@csr.com>
>>>
>>> Signed-off-by: Barry Song <Baohua.Song@csr.com>
>>> ---
>>>  arch/arm/mach-exynos/Kconfig |    1 -
>>>  1 files changed, 0 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
>>> index b5b4c8c..3fd4ab3 100644
>>> --- a/arch/arm/mach-exynos/Kconfig
>>> +++ b/arch/arm/mach-exynos/Kconfig
>>> @@ -243,7 +243,6 @@ config MACH_UNIVERSAL_C210
>>>       select CPU_EXYNOS4210
>>>       select S5P_HRT
>>>       select CLKSRC_MMIO
>>> -     select HAVE_SCHED_CLOCK
>>>       select S5P_GPIO_INT
>>>       select S5P_DEV_FIMC0
>>>       select S5P_DEV_FIMC1
>>> --
>>> 1.7.0.4
>>>
> -barry
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsung-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
