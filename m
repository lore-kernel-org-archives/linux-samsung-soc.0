From: Javier Martinez Canillas <javier.martinez-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>
Subject: Re: [PATCH v6 22/23] rtc: Add driver for Maxim 77802 PMIC Real-Time-Clock
Date: Fri, 04 Jul 2014 15:23:48 +0200
Message-ID: <53B6AAE4.4020700@collabora.co.uk>
References: <1404467722-26687-1-git-send-email-javier.martinez@collabora.co.uk> <1404467722-26687-23-git-send-email-javier.martinez@collabora.co.uk> <1404474972.14069.20.camel@AMDC1943> <53B6A3A3.9090300@collabora.co.uk> <1404479478.2653.5.camel@AMDC1943>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1404479478.2653.5.camel@AMDC1943>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Krzysztof Kozlowski <k.kozlowski-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alessandro Zummo <a.zummo-BfzFCNDTiLLj+vYz1yj4TQ@public.gmane.org>, Kukjin Kim <kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Tomeu Vizoso <tomeu.vizoso-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, Yadwinder Singh Brar <yadi.brar01-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Tushar Behera <trblinux-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andreas Farber <afaerber-l3A5Bk7waGM@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-samsung-soc@vger.kernel.org

Hello Krzysztof,

On 07/04/2014 03:11 PM, Krzysztof Kozlowski wrote:
> On pi=C4=85, 2014-07-04 at 14:52 +0200, Javier Martinez Canillas wrot=
e:
>> Hello Krzysztof,
>>=20
>> Thanks a lot for your feedback.
>>=20
>> On 07/04/2014 01:56 PM, Krzysztof Kozlowski wrote:
>> > On pi=C4=85, 2014-07-04 at 11:55 +0200, Javier Martinez Canillas w=
rote:
>> >> The MAX7802 PMIC has a Real-Time-Clock (RTC) with two alarms.
>> >> This patch adds support for the RTC and is based on a driver
>> >> added by Simon Glass to the Chrome OS kernel 3.8 tree.
>> >>=20
>> >> Signed-off-by: Javier Martinez Canillas <javier.martinez@collabor=
a.co.uk>
>> >> ---
>> >>=20
>> >> Changes since v5: None
>> >>=20
>> >> Changes since v4: None
>> >>=20
>> >> Changes since v3: None
>> >> ---
>> >>  drivers/rtc/Kconfig        |  10 +
>> >>  drivers/rtc/Makefile       |   1 +
>> >>  drivers/rtc/rtc-max77802.c | 637 +++++++++++++++++++++++++++++++=
++++++++++++++
>> >>  3 files changed, 648 insertions(+)
>> >>  create mode 100644 drivers/rtc/rtc-max77802.c
>> >>=20
>> >> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
>> >> index a672dd1..243ac72 100644
>> >> --- a/drivers/rtc/Kconfig
>> >> +++ b/drivers/rtc/Kconfig
>> >> @@ -288,6 +288,16 @@ config RTC_DRV_MAX77686
>> >>  	  This driver can also be built as a module. If so, the module
>> >>  	  will be called rtc-max77686.
>> >> =20
>> >> +config RTC_DRV_MAX77802
>> >> +	tristate "Maxim 77802 RTC"
>> >> +	depends on MFD_MAX77686
>> >> +	help
>> >> +	  If you say yes here you will get support for the
>> >> +	  RTC of Maxim MAX77802 PMIC.
>> >> +
>> >> +	  This driver can also be built as a module. If so, the module
>> >> +	  will be called rtc-max77802.
>> >> +
>> >>  config RTC_DRV_RS5C372
>> >>  	tristate "Ricoh R2025S/D, RS5C372A/B, RV5C386, RV5C387A"
>> >>  	help
>> >> diff --git a/drivers/rtc/Makefile b/drivers/rtc/Makefile
>> >> index 70347d0..247de78 100644
>> >> --- a/drivers/rtc/Makefile
>> >> +++ b/drivers/rtc/Makefile
>> >> @@ -81,6 +81,7 @@ obj-$(CONFIG_RTC_DRV_MAX8998)	+=3D rtc-max8998.=
o
>> >>  obj-$(CONFIG_RTC_DRV_MAX8997)	+=3D rtc-max8997.o
>> >>  obj-$(CONFIG_RTC_DRV_MAX6902)	+=3D rtc-max6902.o
>> >>  obj-$(CONFIG_RTC_DRV_MAX77686)	+=3D rtc-max77686.o
>> >> +obj-$(CONFIG_RTC_DRV_MAX77802)  +=3D rtc-max77802.o
>> >>  obj-$(CONFIG_RTC_DRV_MC13XXX)	+=3D rtc-mc13xxx.o
>> >>  obj-$(CONFIG_RTC_DRV_MCP795)	+=3D rtc-mcp795.o
>> >>  obj-$(CONFIG_RTC_DRV_MSM6242)	+=3D rtc-msm6242.o
>> >> diff --git a/drivers/rtc/rtc-max77802.c b/drivers/rtc/rtc-max7780=
2.c
>> >> new file mode 100644
>> >> index 0000000..2f4fc2e
>> >> --- /dev/null
>> >> +++ b/drivers/rtc/rtc-max77802.c
>> >> @@ -0,0 +1,637 @@
>> >> +/*
>> >> + * RTC driver for Maxim MAX77802
>> >> + *
>> >> + * Copyright (C) 2013 Google, Inc
>> >> + *
>> >> + * Copyright (C) 2012 Samsung Electronics Co.Ltd
>> >> + *
>> >> + *  based on rtc-max8997.c
>> >> + *
>> >> + *  This program is free software; you can redistribute  it and/=
or modify it
>> >> + *  under  the terms of  the GNU General  Public License as publ=
ished by the
>> >> + *  Free Software Foundation;  either version 2 of the  License,=
 or (at your
>> >> + *  option) any later version.
>> >> + *
>> >> + */
>> >> +
>> >> +#include <linux/slab.h>
>> >> +#include <linux/rtc.h>
>> >> +#include <linux/delay.h>
>> >> +#include <linux/mutex.h>
>> >> +#include <linux/module.h>
>> >> +#include <linux/platform_device.h>
>> >> +#include <linux/mfd/max77686-private.h>
>> >> +#include <linux/irqdomain.h>
>> >> +#include <linux/regmap.h>
>> >> +
>> >> +/* RTC Control Register */
>> >> +#define BCD_EN_SHIFT			0
>> >> +#define BCD_EN_MASK			(1 << BCD_EN_SHIFT)
>> >> +#define MODEL24_SHIFT			1
>> >> +#define MODEL24_MASK			(1 << MODEL24_SHIFT)
>> >> +/* RTC Update Register1 */
>> >> +#define RTC_UDR_SHIFT			0
>> >> +#define RTC_UDR_MASK			(1 << RTC_UDR_SHIFT)
>> >> +#define RTC_RBUDR_SHIFT			4
>> >> +#define RTC_RBUDR_MASK			(1 << RTC_RBUDR_SHIFT)
>> >> +/* WTSR and SMPL Register */
>> >> +#define WTSRT_SHIFT			0
>> >> +#define SMPLT_SHIFT			2
>> >> +#define WTSR_EN_SHIFT			6
>> >> +#define SMPL_EN_SHIFT			7
>> >> +#define WTSRT_MASK			(3 << WTSRT_SHIFT)
>> >> +#define SMPLT_MASK			(3 << SMPLT_SHIFT)
>> >> +#define WTSR_EN_MASK			(1 << WTSR_EN_SHIFT)
>> >> +#define SMPL_EN_MASK			(1 << SMPL_EN_SHIFT)
>> >> +/* RTC Hour register */
>> >> +#define HOUR_PM_SHIFT			6
>> >> +#define HOUR_PM_MASK			(1 << HOUR_PM_SHIFT)
>> >> +/* RTC Alarm Enable */
>> >> +#define ALARM_ENABLE_SHIFT		7
>> >> +#define ALARM_ENABLE_MASK		(1 << ALARM_ENABLE_SHIFT)
>> >> +
>> >> +/* For the RTCAE1 register, we write this value to enable the al=
arm */
>> >> +#define ALARM_ENABLE_VALUE		0x77
>> >> +
>> >> +#define MAX77802_RTC_UPDATE_DELAY_US	200
>> >> +#undef MAX77802_RTC_WTSR_SMPL
>> >=20
>> > Hmmm... I am not sure what is the purpose of this undef. It disabl=
es
>> > some functions below. I saw same code in 77686 RTC driver but this=
 does
>> > not help me :).
>> >=20
>> > If this is on purpose can you add a comment explaining the
>> > purpose/cause?
>> >=20
>>=20
>> This is a left over from when a combined 77686/802 driver was attemp=
ted since as
>> you said the 77686 RTC driver does the same.
>>=20
>> I just checked MAX77802 data sheet and the MAX77802_RTC_WTSR_SMPL re=
gister is to
>> control the SMPL (Sudden Momentary Power Loss) and WTSR (Watchdog Ti=
meout and
>> Software Resets) features.
>>=20
>> Now, I wanted to figure out why the 77686 driver unset that register=
 and have
>> those conditionals but git blame shows me that this was already in t=
he original
>> commit that added the driver: fca1dd03 ("rtc: max77686: add Maxim 77=
686 driver").
>>=20
>> Also, I see that the MAX8997 driver (drivers/rtc/rtc-max8997.c) also=
 has a
>> similar register but actually uses it and doesn't have the condition=
als if is
>> disabled. But this driver has two module parameters to control if th=
ese features
>> are enabled or not (wtsr_en and smpl_en).
>>=20
>> If these two features have been disabled since the max77686 driver w=
as merged
>> then I guess that the dead code should be removed from that driver a=
s well? Or
>> do you have more hints about why it has been disabled?
>=20
> If the max77802 driver in current form works fine for your setup then=
 I
> think these functions can be removed completely. It should not harm
> since this is dead code anyway and it will simplify the driver.
>=20

Agreed, I'll just remove it.

> I think the same applies to max77686 (especially that as you said - t=
his
> is dead since beginning). Just remove it in separate patch.
>=20

Ok, I'll add that as a separate cleanup patch in the next version of th=
e series
as well.

> Best regards,
> Krzysztof
>=20
>=20

Best regards,
Javier

--
To unsubscribe from this list: send the line "unsubscribe devicetree" i=
n
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
