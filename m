From: amit daniel kachhap <amit.daniel@samsung.com>
Subject: Re: [PATCH v2] clocksource: exynos-mct: Register the timer for stable udelay
Date: Thu, 19 Jun 2014 15:51:58 +0530
Message-ID: <CADGdYn6YObHdRq6A9-L7qbD+EYiPrwhrKkLwyA5Z=0tDoWUzvA@mail.gmail.com>
References: <1403167145-5267-1-git-send-email-amit.daniel@samsung.com>
	<53A2A936.3070109@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-yk0-f172.google.com ([209.85.160.172]:53750 "EHLO
	mail-yk0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752125AbaFSKV7 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 19 Jun 2014 06:21:59 -0400
In-Reply-To: <53A2A936.3070109@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Kukjin Kim <kgene.kim@samsung.com>, Thomas Gleixner <tglx@linutronix.de>, LAK <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, David Riley <davidriley@chromium.org>, Doug Anderson <dianders@chromium.org>, Tomasz Figa <tomasz.figa@gmail.com>

On Thu, Jun 19, 2014 at 2:41 PM, Daniel Lezcano
<daniel.lezcano@linaro.org> wrote:
> On 06/19/2014 10:39 AM, Amit Daniel Kachhap wrote:
>>
>> This patch register the exynos mct clocksource as the current timer
>> as it has constant clock rate. This will generate correct udelay for=
 the
>> exynos platform and avoid using unnecessary calibrated jiffies. This
>> change
>> has been tested on exynos5420 based board and udelay is very close t=
o
>> expected.
>>
>> Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
>> ---
>> Changes in V2:
>> * Added #defines for ARM and ARM64 as pointed by Doug Anderson.
>>
>> Patches from David Riley confirmed that udelay is broken in exynos54=
20.
>> Link to those patches are,
>> 1) https://patchwork.kernel.org/patch/4344911/
>> 2) https://patchwork.kernel.org/patch/4344881/
>>
>>   drivers/clocksource/exynos_mct.c | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> diff --git a/drivers/clocksource/exynos_mct.c
>> b/drivers/clocksource/exynos_mct.c
>> index f71d55f..02927e2 100644
>> --- a/drivers/clocksource/exynos_mct.c
>> +++ b/drivers/clocksource/exynos_mct.c
>> @@ -195,10 +195,25 @@ static u64 notrace exynos4_read_sched_clock(vo=
id)
>>         return exynos4_frc_read(&mct_frc);
>>   }
>>
>> +static struct delay_timer exynos4_delay_timer;
>> +
>> +static unsigned long exynos4_read_current_timer(void)
>> +{
>> +#ifdef ARM
>> +       return __raw_readl(reg_base + EXYNOS4_MCT_G_CNT_L);
>> +#else /* ARM64, etc */
>> +       return exynos4_frc_read(&mct_frc);
>> +#endif
>> +}
>> +
>
>
> There isn't another solution than that ? macros definitions in C file=
 are
> avoided as much as possible.
I also didn't want to use macros but used as a last option. you want
me to put more comments here?
Or something like below is also possible for checking the size of
(unsigned long) in runtime.

unsigned long x;
unsigned int size =3D (char *)(&x + 1) - (char *)(&x);
if (size =3D=3D 4)
           return __raw_readl(reg_base + EXYNOS4_MCT_G_CNT_L);
else
           return exynos4_frc_read(&mct_frc);

But this involves extra computation which should not be used for time
critical functions.
Any suggestion?

>
>
>>   static void __init exynos4_clocksource_init(void)
>>   {
>>         exynos4_mct_frc_start();
>>
>> +       exynos4_delay_timer.read_current_timer =3D
>> &exynos4_read_current_timer;
>
>
> &exynos4_read_current_timer ?
Any issue in the naming?
>
>
>> +       exynos4_delay_timer.freq =3D clk_rate;
>> +       register_current_timer_delay(&exynos4_delay_timer);
>> +
>>         if (clocksource_register_hz(&mct_frc, clk_rate))
>>                 panic("%s: can't register clocksource\n", mct_frc.na=
me);
>>
>>
>
>
> --
>  <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software f=
or ARM SoCs
>
> Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
> <http://twitter.com/#!/linaroorg> Twitter |
> <http://www.linaro.org/linaro-blog/> Blog
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
