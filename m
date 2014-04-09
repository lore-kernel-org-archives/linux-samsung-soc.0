From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH V3 11/17] ARM: exynos: cpuidle: Move the power sequence
 call in the cpu_pm notifier
Date: Wed, 09 Apr 2014 15:33:57 +0200
Message-ID: <53454C45.8070004@linaro.org>
References: <1396959579-18268-1-git-send-email-daniel.lezcano@linaro.org> <1396959579-18268-12-git-send-email-daniel.lezcano@linaro.org> <53453A4A.1000704@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:55911 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933287AbaDINdm (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 9 Apr 2014 09:33:42 -0400
Received: by mail-wi0-f181.google.com with SMTP id hm4so3203051wib.8
        for <linux-samsung-soc@vger.kernel.org>; Wed, 09 Apr 2014 06:33:41 -0700 (PDT)
In-Reply-To: <53453A4A.1000704@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Tomasz Figa <t.figa@samsung.com>, kgene.kim@samsung.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linaro-kernel@lists.linaro.org, b.zolnierkie@samsung.com, sachin.kamat@linaro.org, viresh.kumar@linaro.org, rjw@rjwysocki.net

On 04/09/2014 02:17 PM, Tomasz Figa wrote:
> Hi Daniel,
>
> On 08.04.2014 14:19, Daniel Lezcano wrote:
>> The code to initiate and exit the powerdown sequence is the same in
>> pm.c and
>> cpuidle.c.
>>
>> Let's split the common part in the pm.c and reuse it from the cpu_pm
>> notifier.
>>
>> That is one more step forward to make the cpuidle driver arch
>> indenpendant.
>>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
>> Reviewed-by: Viresh Kumar <viresh.kumar@linaro.org>
>> Reviewed-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
>> ---
>>   arch/arm/mach-exynos/cpuidle.c |   21 ---------------------
>>   arch/arm/mach-exynos/pm.c      |   22 ++++++++++++++++++----
>>   2 files changed, 18 insertions(+), 25 deletions(-)
>
> [snip]
>
>> -static int exynos_pm_suspend(void)
>> +static void exynos_pm_central_suspend(void)
>>   {
>>       unsigned long tmp;
>>
>>       /* Setting Central Sequence Register for power down mode */
>> -
>>       tmp =3D __raw_readl(S5P_CENTRAL_SEQ_CONFIGURATION);
>>       tmp &=3D ~S5P_CENTRAL_LOWPWR_CFG;
>>       __raw_writel(tmp, S5P_CENTRAL_SEQ_CONFIGURATION);
>> +}
>> +
>> +static int exynos_pm_suspend(void)
>> +{
>> +    unsigned long tmp;
>>
>
> Shouldn't exynos_pm_central_suspend() be called here in place of the
> code being moved to that function?

Right. Good catch !

Thanks

   -- Daniel



--=20
  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software fo=
r ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
