From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH 05/17] ARM: exynos: cpuidle: Move some code inside the
 idle_finisher
Date: Fri, 04 Apr 2014 11:02:20 +0200
Message-ID: <533E751C.3000202@linaro.org>
References: <1396597683-6969-1-git-send-email-daniel.lezcano@linaro.org>	<1396597683-6969-6-git-send-email-daniel.lezcano@linaro.org> <CAKohponNuanWf2jbD+P0v=05O4CmJV2wBV9wDbLK5GJBCoNGTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f52.google.com ([74.125.82.52]:48472 "EHLO
	mail-wg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751799AbaDDJCG (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 4 Apr 2014 05:02:06 -0400
Received: by mail-wg0-f52.google.com with SMTP id k14so3066477wgh.11
        for <linux-samsung-soc@vger.kernel.org>; Fri, 04 Apr 2014 02:02:04 -0700 (PDT)
In-Reply-To: <CAKohponNuanWf2jbD+P0v=05O4CmJV2wBV9wDbLK5GJBCoNGTA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, Tomasz Figa <t.figa@samsung.com>, linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Lists linaro-kernel <linaro-kernel@lists.linaro.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 04/04/2014 10:50 AM, Viresh Kumar wrote:
> On 4 April 2014 13:17, Daniel Lezcano <daniel.lezcano@linaro.org> wro=
te:
>> Move the code around to differentiate different section of code and =
prepare it
>> to be factored out in the next patches.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>> ---
>>   arch/arm/mach-exynos/cpuidle.c |   17 +++++++++--------
>>   1 file changed, 9 insertions(+), 8 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-exynos/c=
puidle.c
>> index 18f6aba..9cd1ed9 100644
>> --- a/arch/arm/mach-exynos/cpuidle.c
>> +++ b/arch/arm/mach-exynos/cpuidle.c
>> @@ -88,7 +88,16 @@ static void restore_cpu_arch_register(void)
>>
>>   static int idle_finisher(unsigned long flags)
>>   {
>> +       exynos_set_wakeupmask();
>> +
>> +       __raw_writel(virt_to_phys(s3c_cpu_resume), REG_DIRECTGO_ADDR=
);
>> +       __raw_writel(S5P_CHECK_AFTR, REG_DIRECTGO_FLAG);
>> +
>> +       /* Set value of power down register for aftr mode */
>> +       exynos_sys_powerdown_conf(SYS_AFTR);
>
> Just to highlight this, you have changed the order in which these
> things were done earlier.. In case that have any side effects.

Yes, that's correct. I changed the order. That doesn't have a side=20
effect because the calls are independent. The important call is=20
cpu_do_idle() which must be done the last.

>>          cpu_do_idle();
>> +
>>          return 1;
>>   }
>>
>> @@ -98,14 +107,6 @@ static int exynos_enter_core0_aftr(struct cpuidl=
e_device *dev,
>>   {
>>          unsigned long tmp;
>>
>> -       exynos_set_wakeupmask();
>> -
>> -       /* Set value of power down register for aftr mode */
>> -       exynos_sys_powerdown_conf(SYS_AFTR);
>> -
>> -       __raw_writel(virt_to_phys(s3c_cpu_resume), REG_DIRECTGO_ADDR=
);
>> -       __raw_writel(S5P_CHECK_AFTR, REG_DIRECTGO_FLAG);
>> -
>>          save_cpu_arch_register();
>>
>>          /* Setting Central Sequence Register for power down mode */
>
> Here as well, we do all above (-) things after this sequence now:
>
> save_cpu_arch_register();
>
> /* Setting Central Sequence Register for power down mode */
> tmp =3D __raw_readl(S5P_CENTRAL_SEQ_CONFIGURATION);
> tmp &=3D ~S5P_CENTRAL_LOWPWR_CFG;
> __raw_writel(tmp, S5P_CENTRAL_SEQ_CONFIGURATION);
>
> cpu_pm_enter();
>
> Probably mention that in log too, that it doesn't have any side effec=
ts?
>
> Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
>


--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
