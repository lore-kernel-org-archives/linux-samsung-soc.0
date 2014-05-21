From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH] cpufreq: exynos: Fix driver compilation with ARCH_MULTIPLATFORM
Date: Wed, 21 May 2014 16:52:59 +0530
Message-ID: <CAKohpo=4nzSiqcMzgOka_jDco7FZ+3PHPa3ZWv++Pf7EAera2Q@mail.gmail.com>
References: <537C6350.2010707@gmail.com>
	<1400670752-673-1-git-send-email-t.figa@samsung.com>
	<537C8B5C.3050401@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ob0-f171.google.com ([209.85.214.171]:58904 "EHLO
	mail-ob0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752110AbaEULXA (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 21 May 2014 07:23:00 -0400
Received: by mail-ob0-f171.google.com with SMTP id wn1so1987197obc.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 May 2014 04:22:59 -0700 (PDT)
In-Reply-To: <537C8B5C.3050401@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Sachin Kamat <sachin.kamat@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, Arnd Bergmann <arnd@arndb.de>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>

On 21 May 2014 16:47, Tomasz Figa <t.figa@samsung.com> wrote:

Mostly nitpicks ..

>> diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
>>  config ARM_EXYNOS4X12_CPUFREQ
>>       bool "SAMSUNG EXYNOS4x12"
>> -     depends on (SOC_EXYNOS4212 || SOC_EXYNOS4412) && !ARCH_MULTIPLATFORM
>> +     depends on (SOC_EXYNOS4212 || SOC_EXYNOS4412)

Get rid of () as well..

>> diff --git a/drivers/cpufreq/exynos-cpufreq.h b/drivers/cpufreq/exynos-cpufreq.h
>> index a28ee9d..8dfebac 100644
>> --- a/drivers/cpufreq/exynos-cpufreq.h
>> +++ b/drivers/cpufreq/exynos-cpufreq.h
>> @@ -50,6 +50,7 @@ struct exynos_dvfs_info {
>>       struct cpufreq_frequency_table  *freq_table;
>>       void (*set_freq)(unsigned int, unsigned int);
>>       bool (*need_apll_change)(unsigned int, unsigned int);
>> +     void __iomem    *cmu_regs;

s/tab/space ? before *cmu_regs ..

>> diff --git a/drivers/cpufreq/exynos4210-cpufreq.c b/drivers/cpufreq/exynos4210-cpufreq.c
>> @@ -143,6 +160,8 @@ int exynos4210_cpufreq_init(struct exynos_dvfs_info *info)
>>       info->freq_table = exynos4210_freq_table;
>>       info->set_freq = exynos4210_set_frequency;
>>
>> +     cpufreq = info;

I couldn't find this variable .. i.e. 'cpufreq'

>> +
>>       return 0;
>>
>>  err_mout_apll:
>> diff --git a/drivers/cpufreq/exynos4x12-cpufreq.c b/drivers/cpufreq/exynos4x12-cpufreq.c

>>  int exynos4x12_cpufreq_init(struct exynos_dvfs_info *info)
>>  {
>> +     struct device_node *np;
>>       unsigned long rate;
>>
>> +     np = of_find_compatible_node(NULL, NULL, "samsung,exynos4412-clock");
>> +     if (!np) {
>> +             pr_err("%s: failed to find clock controller DT node\n",
>> +                     __func__);
>> +             return -ENODEV;
>> +     }
>> +
>> +     info->cmu_regs = of_iomap(np, 0);
>> +     if (!info->cmu_regs) {
>> +             pr_err("%s: failed to map CMU registers\n", __func__);
>> +             return -EFAULT;
>> +     }
>> +

Don't replicate. Create a routine for all this..
