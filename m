From: Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH] ARM: EXYNOS: cpuidle: Skip C1 cpuidle state for exynos5440
Date: Sun, 28 Jul 2013 09:10:09 +0200
Message-ID: <51F4C3D1.2060901@linaro.org>
References: <0e7d01ce8840$82f79070$88e6b150$@org> <1374659615-29447-1-git-send-email-amit.daniel@samsung.com> <0eaf01ce8863$89d3c4e0$9d7b4ea0$@org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wg0-f51.google.com ([74.125.82.51]:50338 "EHLO
	mail-wg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753210Ab3G1HKK (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 28 Jul 2013 03:10:10 -0400
Received: by mail-wg0-f51.google.com with SMTP id a12so214399wgh.30
        for <linux-samsung-soc@vger.kernel.org>; Sun, 28 Jul 2013 00:10:09 -0700 (PDT)
In-Reply-To: <0eaf01ce8863$89d3c4e0$9d7b4ea0$@org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene@kernel.org>
Cc: 'Amit Daniel Kachhap' <amit.daniel@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 'Thomas Abraham' <thomas.abraham@linaro.org>

On 07/24/2013 01:47 PM, Kukjin Kim wrote:
> Amit Daniel Kachhap wrote:
>>
>> This patch skips the deep C1(AFTR -Arm off top running) state for
>> exynos5440
>> soc as this soc does not support this state. All the cpu's only allo=
ws the
>> basic
>> C0 state.
>>
>> Signed-off-by: Amit Daniel Kachhap <amit.daniel@samsung.com>
>> ---
>>  arch/arm/mach-exynos/cpuidle.c |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/cpuidle.c b/arch/arm/mach-
>> exynos/cpuidle.c
>> index 17a18ff..9a776a1 100644
>> --- a/arch/arm/mach-exynos/cpuidle.c
>> +++ b/arch/arm/mach-exynos/cpuidle.c
>> @@ -210,7 +210,7 @@ static int __init exynos4_init_cpuidle(void)
>>  		device->cpu =3D cpu_id;
>>
>>  		/* Support IDLE only */
>> -		if (cpu_id !=3D 0)
>> +		if (soc_is_exynos5440() || cpu_id !=3D 0)
>>  			device->state_count =3D 1;
>>
>>  		ret =3D cpuidle_register_device(device);
>> --
>> 1.7.1
>=20
> Applied, thanks.

You shouldn't have. This patch means exynos5540 has no cpuidle driver a=
t
all. It should be fixed in the Kconfig to unselect CONFIG_CPU_IDLE for
an exynos5540.


--=20
 <http://www.linaro.org/> Linaro.org =E2=94=82 Open source software for=
 ARM SoCs

=46ollow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
