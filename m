From: "pankaj.dubey" <pankaj.dubey@samsung.com>
Subject: Re: [PATCH v9 12/12] ARM: EXYNOS: refactor of mach-exynos to use
 chipid information
Date: Fri, 31 Mar 2017 11:31:54 +0530
Message-ID: <69ac19c2-76de-d614-492b-ccdc83d01d81@samsung.com>
References: <CGME20170330131444epcas5p45051cf7e6ec7a993c2c9f84254b89a19@epcas5p4.samsung.com>
        <1490879826-16754-1-git-send-email-pankaj.dubey@samsung.com>
        <1490879826-16754-13-git-send-email-pankaj.dubey@samsung.com>
        <CAK8P3a2oK1MvWe4B-4r2Rt7Q87juNJd3MsetN8-OeDYhBmKyUg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:27641 "EHLO
        epoutp02.samsung.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S932299AbdCaF6y (ORCPT
        <rfc822;linux-samsung-soc@vger.kernel.org>);
        Fri, 31 Mar 2017 01:58:54 -0400
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
        by epoutp02.samsung.com (KnoxPortal) with ESMTP id 20170331055851epoutp025e606b57dbca8bd748710d4abe896f1a~w4fgAVYup2344623446epoutp02m
        for <linux-samsung-soc@vger.kernel.org>; Fri, 31 Mar 2017 05:58:51 +0000 (GMT)
In-Reply-To: <CAK8P3a2oK1MvWe4B-4r2Rt7Q87juNJd3MsetN8-OeDYhBmKyUg@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-samsung-soc@vger.kernel.org, Linux ARM <linux-arm-kernel@lists.infradead.org>, Krzysztof Kozlowski <krzk@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, Kukjin Kim <kgene@kernel.org>, m.reichl@fivetechno.de, a.hajda@samsung.com, cwchoi00@gmail.com, Javier Martinez Canillas <javier@osg.samsung.com>



On Thursday 30 March 2017 07:31 PM, Arnd Bergmann wrote:
> On Thu, Mar 30, 2017 at 3:17 PM, Pankaj Dubey <pankaj.dubey@samsung.com> wrote:
> 
>>   * register the standard cpu IO areas
>>   */
>> -static void __init exynos_map_io(void)
>> +static int __init exynos_fdt_map_scu(unsigned long node, const char *uname,
>> +               int depth, void *data)
>>  {
>> -       if (soc_is_exynos4())
>> -               iotable_init(exynos4_iodesc, ARRAY_SIZE(exynos4_iodesc));
>> +       if (!of_flat_dt_is_compatible(node, "samsung,exynos4210") &&
>> +                       !of_flat_dt_is_compatible(node, "samsung,exynos4212") &&
>> +                       !of_flat_dt_is_compatible(node, "samsung,exynos4412"))
>> +               return 0;
>> +
>> +       iotable_init(exynos4_iodesc, ARRAY_SIZE(exynos4_iodesc));
>> +       return 1;
>>  }
> 
> This seems really overcomplicated. From what I can tell, this is only needed
> to find the SCU address, but there are better ways to do that, either by
> looking up the SCU in the DT at the time you actually need it,
> or by calling scu_a9_get_base().

Indeed it's complicated and ugly, for the same reason I attempted to
clean-up this part for Exynos SoC in patch series [1], which was
accepted by Samsung maintainer Krzysztof and later during pull request
rejected by ARM maintainers [2]

[1]: https://www.spinics.net/lists/arm-kernel/msg540498.html
[2]: http://lkml.iu.edu/hypermail/linux/kernel/1612.0/01508.html

Given the argument we can't adopt getting base address of SCU completely
via DT without breaking OLD dtbs at some point, difficult to simplify
these stuffs.

Please guide which is the best way to handle such stuffs.

In fact I made another attempt [3] to cleanup this SCU related stuffs
for other ARM based platforms, but we could not arrive on some consensus
at that time. I will try to attempt it again soon.

[3]: http://www.spinics.net/lists/arm-kernel/msg542351.html

Thanks,
Pankaj Dubey

> 
>       Arnd
> 
> 
> 
