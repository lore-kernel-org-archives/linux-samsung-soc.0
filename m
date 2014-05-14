From: Thomas Abraham <ta.omasab@gmail.com>
Subject: Re: [PATCH v4 7/8] ARM: Exynos: switch to using generic cpufreq-cpu0 driver
Date: Wed, 14 May 2014 19:39:58 +0530
Message-ID: <CAJuA9aiHrM2VD-NzedowyFj0+dC8m_7QU+YgjmAe3yy-mjODRA@mail.gmail.com>
References: <1400029876-5830-1-git-send-email-thomas.ab@samsung.com>
	<1400029876-5830-8-git-send-email-thomas.ab@samsung.com>
	<6835645.2kTGeWTa9p@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <cpufreq-owner@vger.kernel.org>
In-Reply-To: <6835645.2kTGeWTa9p@wuerfel>
Sender: cpufreq-owner@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "cpufreq@vger.kernel.org" <cpufreq@vger.kernel.org>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Lukasz Majewski <l.majewski@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Mike Turquette <mturquette@linaro.org>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Viresh Kumar <viresh.kumar@linaro.org>, Tomasz Figa <t.figa@samsung.com>, "rjw@rjwysocki.net" <rjw@rjwysocki.net>, "linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, Shawn Guo <shawn.guo@linaro.org>
List-Id: linux-samsung-soc@vger.kernel.org

On Wed, May 14, 2014 at 6:20 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Wednesday 14 May 2014 06:41:15 Thomas Abraham wrote:
>> From: Thomas Abraham <thomas.ab@samsung.com>
>>
>> Remove the platform device instantiation for Exynos specific cpufreq
>> driver and add the platform device for cpufreq-cpu0 driver.
>>
>> Signed-off-by: Thomas Abraham <thomas.ab@samsung.com>
>> ---
>>  arch/arm/mach-exynos/exynos.c |    4 +++-
>>  1 files changed, 3 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/exynos.c
>> index b32a907..489a495 100644
>> --- a/arch/arm/mach-exynos/exynos.c
>> +++ b/arch/arm/mach-exynos/exynos.c
>> @@ -232,7 +232,9 @@ void __init exynos_cpuidle_init(void)
>>
>>  void __init exynos_cpufreq_init(void)
>>  {
>> -       platform_device_register_simple("exynos-cpufreq", -1, NULL, 0);
>> +       if (!(of_machine_is_compatible("samsung,exynos5420")) &&
>> +               !(of_machine_is_compatible("samsung,exynos5440")))
>> +               platform_device_register_simple("cpufreq-cpu0", -1, NULL, 0);
>>  }
>>
>
> Could we please come up with a way to probe this from DT in the cpufreq-cpu0
> driver itself, so we don't have to add a device in every platform using it?

Okay, I don't have a solution for this as of now. Would this be
considered as a blocker for this series? I hope we could just live
with this for now.

Thanks,
Thomas.

>
> I realize you copied it from the other platforms using this driver, but
> it still seems really wrong.
>
>         Arnd
