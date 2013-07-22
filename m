From: Yadwinder Singh Brar <yadi.brar01@gmail.com>
Subject: Re: [PATCH] ARM: EXYNOS: Fix low level debug support
Date: Mon, 22 Jul 2013 17:27:11 +0530
Message-ID: <CAKew6eXSWbip6rzoqjWf7jMKNa3aYX4ZgYnaTB5zcfGt7dZXyQ@mail.gmail.com>
References: <1373709465-21042-1-git-send-email-yadi.brar@samsung.com>
	<CAJuYYwRij6CAfLCG-xmmoe_iDnvCsTCB_4PnEiRfD+bAiBe9VQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ie0-f171.google.com ([209.85.223.171]:55900 "EHLO
	mail-ie0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750876Ab3GVL5M (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Mon, 22 Jul 2013 07:57:12 -0400
Received: by mail-ie0-f171.google.com with SMTP id 10so68097ied.2
        for <linux-samsung-soc@vger.kernel.org>; Mon, 22 Jul 2013 04:57:11 -0700 (PDT)
In-Reply-To: <CAJuYYwRij6CAfLCG-xmmoe_iDnvCsTCB_4PnEiRfD+bAiBe9VQ@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Thomas Abraham <thomas.abraham@linaro.org>
Cc: Yadwinder Singh Brar <yadi.brar@samsung.com>, kgene@kernel.org, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, arnd@arndb.de, olof@lixom.net, Doug Anderson <dianders@chromium.org>, Tomasz Figa <t.figa@samsung.com>

Hi Thomas,

On Mon, Jul 22, 2013 at 4:53 PM, Thomas Abraham
<thomas.abraham@linaro.org> wrote:
> On 13 July 2013 04:57, Yadwinder Singh Brar <yadi.brar@samsung.com> wrote:
>> Presently, using exynos_defconfig with CONFIG_DEBUG_LL and CONFIG_EARLY_PRINTK
>> on, kernel is not booting, we are getting following:
>>
>> [    0.000000] ------------[ cut here ]------------
>> [    0.000000] kernel BUG at mm/vmalloc.c:1134!
>> [    0.000000] Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
>> [    0.000000] Modules linked in:
>> [    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 3.11.0-rc1 #633
>> [    0.000000] task: c052ec48 ti: c0524000 task.ti: c0524000
>> [    0.000000] PC is at vm_area_add_early+0x54/0x94
>> [    0.000000] LR is at add_static_vm_early+0xc/0x60
>>
>> Its because iotable_init tries to map UART again which is already mapped by
>> debug_ll_io_init() call in exynos_init_io() within same virtal address range as
>> requested later.
>
> debug_ll_io_init ioremaps debug uart address space with 4KB size
> whereas the exynos_init_io() function ioremaps a single 512KB memory
> size for all the four uart ports which envelops the mapping created by
> debug_ll_io_init. This is caught as a kernel bug.
>

Exactly !

>>
>> This issue seems to be occured after :
>> commit ee4de5d99aeac44f4507b7538b2b3faedc5205b9
>> ARM: 7781/1: mmu: Add debug_ll_io_init() mappings to early mappings
>>
>> This patch moves S3C_UART iodesc(in iodesc_list) inside CONFIG_DEBUG_LL check.
>
> Instead of moving, all the such iodesc entries for UART controller can
> be removed for all Samsung SoC's now since the Samsung uart driver
> does a ioremap during probe and any needed iomapping for earlyprintk
> is handled by debug_ll_io_init().
>

Ok, will do it.
TBH I was not sure about removing completely.
Thanks for review.

Regards,
Yadwinder

>>
>> Tested on 4412 and 5250 smdks.
>>
>> Signed-off-by: Yadwinder Singh Brar <yadi.brar@samsung.com>
>> ---
>>  arch/arm/mach-exynos/common.c |   20 ++++++++++++++------
>>  1 files changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/common.c b/arch/arm/mach-exynos/common.c
>> index 164685b..7f0591f 100644
>> --- a/arch/arm/mach-exynos/common.c
>> +++ b/arch/arm/mach-exynos/common.c
>> @@ -150,11 +150,6 @@ static struct map_desc exynos4_iodesc[] __initdata = {
>>                 .length         = SZ_64K,
>>                 .type           = MT_DEVICE,
>>         }, {
>> -               .virtual        = (unsigned long)S3C_VA_UART,
>> -               .pfn            = __phys_to_pfn(EXYNOS4_PA_UART),
>> -               .length         = SZ_512K,
>> -               .type           = MT_DEVICE,
>> -       }, {
>>                 .virtual        = (unsigned long)S5P_VA_CMU,
>>                 .pfn            = __phys_to_pfn(EXYNOS4_PA_CMU),
>>                 .length         = SZ_128K,
>> @@ -185,6 +180,14 @@ static struct map_desc exynos4_iodesc[] __initdata = {
>>                 .length         = SZ_4K,
>>                 .type           = MT_DEVICE,
>>         },
>> +#ifndef CONFIG_DEBUG_LL
>> +       {
>> +               .virtual        = (unsigned long)S3C_VA_UART,
>> +               .pfn            = __phys_to_pfn(EXYNOS4_PA_UART),
>> +               .length         = SZ_512K,
>> +               .type           = MT_DEVICE,
>> +       },
>> +#endif
>>  };
>>
>>  static struct map_desc exynos4_iodesc0[] __initdata = {
>> @@ -268,21 +271,26 @@ static struct map_desc exynos5_iodesc[] __initdata = {
>>                 .pfn            = __phys_to_pfn(EXYNOS5_PA_PMU),
>>                 .length         = SZ_64K,
>>                 .type           = MT_DEVICE,
>> -       }, {
>> +       },
>> +#ifndef CONFIG_DEBUG_LL
>> +       {
>>                 .virtual        = (unsigned long)S3C_VA_UART,
>>                 .pfn            = __phys_to_pfn(EXYNOS5_PA_UART),
>>                 .length         = SZ_512K,
>>                 .type           = MT_DEVICE,
>>         },
>> +#endif
>>  };
>>
>>  static struct map_desc exynos5440_iodesc0[] __initdata = {
>> +#ifndef CONFIG_DEBUG_LL
>>         {
>>                 .virtual        = (unsigned long)S3C_VA_UART,
>>                 .pfn            = __phys_to_pfn(EXYNOS5440_PA_UART0),
>>                 .length         = SZ_512K,
>>                 .type           = MT_DEVICE,
>>         },
>> +#endif
>>  };
>>
>>  void exynos4_restart(enum reboot_mode mode, const char *cmd)
>> --
>> 1.7.0.4
>>
