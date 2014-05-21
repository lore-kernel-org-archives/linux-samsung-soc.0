From: Tomasz Figa <t.figa@samsung.com>
Subject: Re: [PATCH] cpufreq: exynos: Fix driver compilation with
 ARCH_MULTIPLATFORM
Date: Wed, 21 May 2014 14:11:48 +0200
Message-ID: <537C9804.8030508@samsung.com>
References: <537C6350.2010707@gmail.com>
 <1400670752-673-1-git-send-email-t.figa@samsung.com>
 <537C8B5C.3050401@samsung.com>
 <CAKohpo=4nzSiqcMzgOka_jDco7FZ+3PHPa3ZWv++Pf7EAera2Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout3.w1.samsung.com ([210.118.77.13]:15003 "EHLO
	mailout3.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751561AbaEUMLz (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 08:11:55 -0400
Received: from eucpsbgm1.samsung.com (unknown [203.254.199.244])
 by mailout3.w1.samsung.com
 (Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit (built Nov
 17 2011)) with ESMTP id <0N5X00275B7QMB90@mailout3.w1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Wed, 21 May 2014 13:11:50 +0100 (BST)
In-reply-to: <CAKohpo=4nzSiqcMzgOka_jDco7FZ+3PHPa3ZWv++Pf7EAera2Q@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sachin Kamat <sachin.kamat@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

Hi Viresh,

Thanks for the review.

On 21.05.2014 13:22, Viresh Kumar wrote:
> On 21 May 2014 16:47, Tomasz Figa <t.figa@samsung.com> wrote:
> 
> Mostly nitpicks ..
> 
>>> diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
>>>  config ARM_EXYNOS4X12_CPUFREQ
>>>       bool "SAMSUNG EXYNOS4x12"
>>> -     depends on (SOC_EXYNOS4212 || SOC_EXYNOS4412) && !ARCH_MULTIPLATFORM
>>> +     depends on (SOC_EXYNOS4212 || SOC_EXYNOS4412)
> 
> Get rid of () as well..

Right.

> 
>>> diff --git a/drivers/cpufreq/exynos-cpufreq.h b/drivers/cpufreq/exynos-cpufreq.h
>>> index a28ee9d..8dfebac 100644
>>> --- a/drivers/cpufreq/exynos-cpufreq.h
>>> +++ b/drivers/cpufreq/exynos-cpufreq.h
>>> @@ -50,6 +50,7 @@ struct exynos_dvfs_info {
>>>       struct cpufreq_frequency_table  *freq_table;
>>>       void (*set_freq)(unsigned int, unsigned int);
>>>       bool (*need_apll_change)(unsigned int, unsigned int);
>>> +     void __iomem    *cmu_regs;
> 
> s/tab/space ? before *cmu_regs ..

Other fields in this struct have their names aligned with a tab as well.

> 
>>> diff --git a/drivers/cpufreq/exynos4210-cpufreq.c b/drivers/cpufreq/exynos4210-cpufreq.c
>>> @@ -143,6 +160,8 @@ int exynos4210_cpufreq_init(struct exynos_dvfs_info *info)
>>>       info->freq_table = exynos4210_freq_table;
>>>       info->set_freq = exynos4210_set_frequency;
>>>
>>> +     cpufreq = info;
> 
> I couldn't find this variable .. i.e. 'cpufreq'

It is a static global variable that is being added at the top of the file.

> 
>>> +
>>>       return 0;
>>>
>>>  err_mout_apll:
>>> diff --git a/drivers/cpufreq/exynos4x12-cpufreq.c b/drivers/cpufreq/exynos4x12-cpufreq.c
> 
>>>  int exynos4x12_cpufreq_init(struct exynos_dvfs_info *info)
>>>  {
>>> +     struct device_node *np;
>>>       unsigned long rate;
>>>
>>> +     np = of_find_compatible_node(NULL, NULL, "samsung,exynos4412-clock");
>>> +     if (!np) {
>>> +             pr_err("%s: failed to find clock controller DT node\n",
>>> +                     __func__);
>>> +             return -ENODEV;
>>> +     }
>>> +
>>> +     info->cmu_regs = of_iomap(np, 0);
>>> +     if (!info->cmu_regs) {
>>> +             pr_err("%s: failed to map CMU registers\n", __func__);
>>> +             return -EFAULT;
>>> +     }
>>> +
> 
> Don't replicate. Create a routine for all this..
> 

While I agree that all three drivers basically use the same look-up and
mapping code replicated, this patch is a temporary hack, until all those
three drivers are completely removed, most likely in 3.17, so I would
prefer doing this in the most ugly way, so that people don't follow this.

Still, I think a comment added before of_find_compatible_node() in each
driver saying that this is a hack and why it is there would be nice, though.

Best regards,
Tomasz
