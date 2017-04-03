From: "pankaj.dubey" <pankaj.dubey@samsung.com>
Subject: Re: [PATCH v9 12/12] ARM: EXYNOS: refactor of mach-exynos to use
 chipid information
Date: Mon, 3 Apr 2017 14:55:43 +0530
Message-ID: <485f9aaa-3c32-5996-e7f0-9fa1a589e39b@samsung.com>
References: <CGME20170330131444epcas5p45051cf7e6ec7a993c2c9f84254b89a19@epcas5p4.samsung.com>
        <1490879826-16754-1-git-send-email-pankaj.dubey@samsung.com>
        <1490879826-16754-13-git-send-email-pankaj.dubey@samsung.com>
        <CAK8P3a2oK1MvWe4B-4r2Rt7Q87juNJd3MsetN8-OeDYhBmKyUg@mail.gmail.com>
        <69ac19c2-76de-d614-492b-ccdc83d01d81@samsung.com>
        <CAK8P3a1GobLFjVXySXHGYBXscMaTcL8nzv183Reho87+U3Z5cA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:62076 "EHLO
        epoutp01.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751920AbdDCJWa (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Mon, 3 Apr 2017 05:22:30 -0400
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
        by epoutp01.samsung.com (KnoxPortal) with ESMTP id 20170403092228epoutp018cbf0aa4676710b297fc65b3e944df00~x2NIgePwE3151231512epoutp01g
        for <linux-samsung-soc@vger.kernel.org>; Mon,  3 Apr 2017 09:22:28 +0000 (GMT)
In-Reply-To: <CAK8P3a1GobLFjVXySXHGYBXscMaTcL8nzv183Reho87+U3Z5cA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-samsung-soc@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, m.reichl@fivetechno.de, a.hajda@samsung.com, cwchoi00@gmail.com, Javier Martinez Canillas <javier@osg.samsung.com>



On Friday 31 March 2017 01:52 PM, Arnd Bergmann wrote:
> On Fri, Mar 31, 2017 at 8:01 AM, pankaj.dubey <pankaj.dubey@samsung.com> wrote:
>> On Thursday 30 March 2017 07:31 PM, Arnd Bergmann wrote:
>>> On Thu, Mar 30, 2017 at 3:17 PM, Pankaj Dubey <pankaj.dubey@samsung.com> wrote:
>>>
>>> This seems really overcomplicated. From what I can tell, this is only needed
>>> to find the SCU address, but there are better ways to do that, either by
>>> looking up the SCU in the DT at the time you actually need it,
>>> or by calling scu_a9_get_base().
>>
>> Indeed it's complicated and ugly, for the same reason I attempted to
>> clean-up this part for Exynos SoC in patch series [1], which was
>> accepted by Samsung maintainer Krzysztof and later during pull request
>> rejected by ARM maintainers [2]
>>
>> [1]: https://www.spinics.net/lists/arm-kernel/msg540498.html
>> [2]: http://lkml.iu.edu/hypermail/linux/kernel/1612.0/01508.html
>>
>> Given the argument we can't adopt getting base address of SCU completely
>> via DT without breaking OLD dtbs at some point, difficult to simplify
>> these stuffs.
>>
>> Please guide which is the best way to handle such stuffs.
>>
>> In fact I made another attempt [3] to cleanup this SCU related stuffs
>> for other ARM based platforms, but we could not arrive on some consensus
>> at that time. I will try to attempt it again soon.
>>
>> [3]: http://www.spinics.net/lists/arm-kernel/msg542351.html
> 
> I very much appreciate your attempts, this is very helpful. I'm sorry
> for making it so hard for you. I had remembered your previous series,
> but did not realize that you were the author of both this patch and
> the SCU cleanup.
> 
> Let me try to understand the entire problem space better. These
> are my assumptions based on what  you write:
> 
> - A clean solution would be to map the SCU based on the DT as
>   you implemented in the earlier patch series, but that breaks
>   running new kernels with old DTBs, which we don't want.
> 
> - Another clean solution would be to map the SCU based on
>   scu_a9_get_base(), but that doesn't work on all variants of
>   exynos4, because there is at least one (which?) that has incorrect
>   data in the register

Sorry, I am also not aware which variant does not support this.
Currently for none of exynos4 we are using scu_a9_get_base(), and due to
unavailability of all exynos4 based board with me, I can't test it.

> 
> - The approach in this patch works, but is really ugly as it
>   requires parsing the fdt.
> 
> Assuming that we don't want any of the approaches above,
> here are some other ideas that might be a little better:
> 
> - Map the SCU later, just before we first need for calling
>   scu_enable(): exynos_smp_prepare_cpus(),
>   exynos_enter_aftr() or exynos_pm_resume(). All three
>   are late enough that we can simply call ioremap()
>   on the known physical address for the first caller,
>   and they are all guarded by a
>   ARM_CPU_PART_CORTEX_A9 check that should
>   be equivalent to the EXYNOS4 check you have.
> 

OK, let me try this, I think I can shift it at a little later point of boot.

> - Split the exynos4 machine descriptor from the one
>   for exynos5, and exynos3, the call the iotable_init
>   unconditionally for exynos4. The same method would
>   also let us get rid of some of the other
>   of_machine_is_compatible() checks.
> 

Once we move SCU mapping to later point of time, iotable_init can be
dropped. Currently only for SCU mapping it is getting called. So this
part will become more clean.


Thanks for suggestion. I will work on it and submit next version.

Pankaj Dubey

>        Arnd
> 
> 
> 
