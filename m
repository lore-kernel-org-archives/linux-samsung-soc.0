From: Thomas Abraham <ta.omasab@gmail.com>
Subject: Re: [PATCH v3 1/7] cpufreq: cpufreq-cpu0: allow use of optional boost
 mode frequencies
Date: Sat, 8 Feb 2014 10:49:27 +0530
Message-ID: <CAJuA9ah9xHZZknW5yfh8v8GS65TLd4uZedigEt4ATdoiy6-1Gg@mail.gmail.com>
References: <1391788548-13056-1-git-send-email-thomas.ab@samsung.com>
	<1391788548-13056-2-git-send-email-thomas.ab@samsung.com>
	<52F506EC.2070907@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-lb0-f171.google.com ([209.85.217.171]:33540 "EHLO
	mail-lb0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750717AbaBHFT3 (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sat, 8 Feb 2014 00:19:29 -0500
In-Reply-To: <52F506EC.2070907@ti.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Nishanth Menon <nm@ti.com>
Cc: "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Lukasz Majewski <l.majewski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>, Viresh Kumar <viresh.kumar@linaro.org>, Tomasz Figa <t.figa@samsung.com>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, "thomas.ab@samsung.com" <thomas.ab@samsung.com>, Shawn Guo <shawn.guo@linaro.org>

On Fri, Feb 7, 2014 at 9:46 PM, Nishanth Menon <nm@ti.com> wrote:
> On 02/07/2014 09:55 AM, Thomas Abraham wrote:
>> From: Thomas Abraham <thomas.ab@samsung.com>
>>
>> Lookup for the optional boost-frequency property in cpu0 node and if
>> available, enable support for boost mode frequencies. The frequencies
>> usable in boost mode are determined while preparing the cpufreq table
>> from the list of operating points available.
>>
>> In addition to this, enable the CPU_FREQ_BOOST_SW config option for
>> this driver by default. On platforms that do not support boost mode,
>> the boost mode frequencies will not be specified in cpu0 node and
>> hence the boost mode support will not be enabled. Since this driver
>> anyways depends on THERMAL config option, it is safe to enable
>> CPU_FREQ_BOOST_SW config option as default.
>>
>> Cc: Shawn Guo <shawn.guo@linaro.org>
>> Cc: Lukasz Majewski <l.majewski@samsung.com>
>> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
>> ---
>>  Documentation/devicetree/bindings/cpufreq/cpufreq-cpu0.txt |    2 ++
>>  drivers/cpufreq/Kconfig                                    |    1 +
>>  drivers/cpufreq/cpufreq-cpu0.c                             |    3 +++
>>  3 files changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-cpu0.txt b/Documentation/devicetree/bindings/cpufreq/cpufreq-cpu0.txt
>> index f055515..60f321a 100644
>> --- a/Documentation/devicetree/bindings/cpufreq/cpufreq-cpu0.txt
>> +++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-cpu0.txt
>> @@ -19,6 +19,8 @@ Optional properties:
>>  - cooling-min-level:
>>  - cooling-max-level:
>>       Please refer to Documentation/devicetree/bindings/thermal/thermal.txt.
>> +- boost-frequency:
>> +     Please refer to Documentation/devicetree/bindings/cpufreq/cpufreq-boost.txt
>>
>>  Examples:
>>
>> diff --git a/drivers/cpufreq/Kconfig b/drivers/cpufreq/Kconfig
>> index 4b029c0..52cc704 100644
>> --- a/drivers/cpufreq/Kconfig
>> +++ b/drivers/cpufreq/Kconfig
>> @@ -187,6 +187,7 @@ config GENERIC_CPUFREQ_CPU0
>>       tristate "Generic CPU0 cpufreq driver"
>>       depends on HAVE_CLK && REGULATOR && OF && THERMAL && CPU_THERMAL
>>       select PM_OPP
>> +     select CPU_FREQ_BOOST_SW
>>       help
>>         This adds a generic cpufreq driver for CPU0 frequency management.
>>         It supports both uniprocessor (UP) and symmetric multiprocessor (SMP)
>> diff --git a/drivers/cpufreq/cpufreq-cpu0.c b/drivers/cpufreq/cpufreq-cpu0.c
>> index 0c12ffc..06539eb 100644
>> --- a/drivers/cpufreq/cpufreq-cpu0.c
>> +++ b/drivers/cpufreq/cpufreq-cpu0.c
>> @@ -195,6 +195,9 @@ static int cpu0_cpufreq_probe(struct platform_device *pdev)
>>                       transition_latency += ret * 1000;
>>       }
>>
>> +     if (of_find_property(cpu_dev->of_node, "boost-frequency", NULL))
>> +             cpu0_cpufreq_driver.boost_supported = true;
>> +
>>       ret = cpufreq_register_driver(&cpu0_cpufreq_driver);
>>       if (ret) {
>>               pr_err("failed register driver: %d\n", ret);
>>
>
> might as well hide that under the opp api which returns a bool that
> says if boost is supported or not. that allows the parse to be
> isolated to a single location.

This is specific to the cpufreq-cpu0 driver. Other cpufreq drivers
might want to use other methods and additional constraints to
determine if boost has to be enabled.

Thanks,
Thomas.

>
> --
> Regards,
> Nishanth Menon
