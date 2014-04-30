From: Pankaj Dubey <pankaj.dubey@samsung.com>
Subject: Re: [PATCH v3 01/12] ARM: EXYNOS: Make exynos machine_ops as static
Date: Wed, 30 Apr 2014 16:35:36 +0900
Message-ID: <5360A7C8.1080407@samsung.com>
References: <1398835057-3860-1-git-send-email-pankaj.dubey@samsung.com>
 <1398835057-3860-2-git-send-email-pankaj.dubey@samsung.com>
 <CAK9yfHxfkegFzzJCz4nAkxrHT6FGT0OQ-5RkCdTA3ruo2kU8CA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:41602 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751426AbaD3HRe convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 30 Apr 2014 03:17:34 -0400
In-reply-to: <CAK9yfHxfkegFzzJCz4nAkxrHT6FGT0OQ-5RkCdTA3ruo2kU8CA@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sachin Kamat <sachin.kamat@linaro.org>
Cc: linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kukjin Kim <kgene.kim@samsung.com>, Russell King <linux@arm.linux.org.uk>, Tomasz Figa <t.figa@samsung.com>, chow.kim@samsung.com, Young-Gun Jang <yg1004.jang@samsung.com>, VIKAS SAJJANC <vikas.sajjan@samsung.com>

Hi Sachin,

On 04/30/2014 03:00 PM, Sachin Kamat wrote:
> Hi Pankaj,
>
> On 30 April 2014 10:47, Pankaj Dubey <pankaj.dubey@samsung.com> wrote=
:
>> As machine function ops are used only in this file let's make
>> them static.
>>
>> Signed-off-by: Pankaj Dubey <pankaj.dubey@samsung.com>
>> ---
>>   arch/arm/mach-exynos/exynos.c |    6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/exynos.c b/arch/arm/mach-exynos/ex=
ynos.c
>> index 3d69e8d..06dcce5 100644
>> --- a/arch/arm/mach-exynos/exynos.c
>> +++ b/arch/arm/mach-exynos/exynos.c
>> @@ -198,7 +198,7 @@ static struct map_desc exynos5_iodesc[] __initda=
ta =3D {
>>          },
>>   };
>>
>> -void exynos_restart(enum reboot_mode mode, const char *cmd)
>> +static void exynos_restart(enum reboot_mode mode, const char *cmd)
>>   {
>>          struct device_node *np;
>>          u32 val =3D 0x1;
>> @@ -239,7 +239,7 @@ void __init exynos_cpufreq_init(void)
>>          platform_device_register_simple("exynos-cpufreq", -1, NULL,=
 0);
>>   }
>>
>> -void __init exynos_init_late(void)
>> +static void __init exynos_init_late(void)
>>   {
>>          if (of_machine_is_compatible("samsung,exynos5440"))
>>                  /* to be supported later */
>> @@ -300,7 +300,7 @@ static void __init exynos_map_io(void)
>>                  iotable_init(exynos5250_iodesc, ARRAY_SIZE(exynos52=
50_iodesc));
>>   }
>>
>> -void __init exynos_init_io(void)
>> +static void __init exynos_init_io(void)
>>   {
>>          debug_ll_io_init();
>
> The declarations from common.h should also be removed in this patch t=
o
> avoid the below
> build errors:

Thanks. I will merge changes in common.h in this patch itself.

>
> arch/arm/mach-exynos/exynos.c:198:13: error: static declaration of
> =E2=80=98exynos_restart=E2=80=99 follows non-static declaration
>   static void exynos_restart(enum reboot_mode mode, const char *cmd)
>               ^
> In file included from arch/arm/mach-exynos/exynos.c:31:0:
> arch/arm/mach-exynos/common.h:22:6: note: previous declaration of
> =E2=80=98exynos_restart=E2=80=99 was here
>   void exynos_restart(enum reboot_mode mode, const char *cmd);
>        ^
> arch/arm/mach-exynos/exynos.c:235:20: error: static declaration of
> =E2=80=98exynos_init_late=E2=80=99 follows non-static declaration
>   static void __init exynos_init_late(void)
>                      ^
> In file included from arch/arm/mach-exynos/exynos.c:31:0:
> arch/arm/mach-exynos/common.h:25:6: note: previous declaration of
> =E2=80=98exynos_init_late=E2=80=99 was here
>   void exynos_init_late(void);
>        ^
> arch/arm/mach-exynos/exynos.c:296:20: error: static declaration of
> =E2=80=98exynos_init_io=E2=80=99 follows non-static declaration
>   static void __init exynos_init_io(void)
>                      ^
> In file included from arch/arm/mach-exynos/exynos.c:31:0:
> arch/arm/mach-exynos/common.h:21:6: note: previous declaration of
> =E2=80=98exynos_init_io=E2=80=99 was here
>   void exynos_init_io(void);
>
>


--=20
Best Regards,
Pankaj Dubey
