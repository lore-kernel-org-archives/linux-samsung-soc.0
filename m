From: Sangwook Lee <sangwook.lee@linaro.org>
Subject: Re: [PATCH] ARM: EXYNOS: Add WLAN init on ORIGEN
Date: Tue, 21 Feb 2012 11:25:19 +0000
Message-ID: <CADPsn1Yt18GGTd0woHa9RLaYMEDwWiD2UpPfhDOkYzw2bT7hFg@mail.gmail.com>
References: <1329404118-19198-1-git-send-email-sangwook.lee@linaro.org>
	<4F3D6363.9010703@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-pz0-f46.google.com ([209.85.210.46]:52366 "EHLO
	mail-pz0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751567Ab2BULZU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 21 Feb 2012 06:25:20 -0500
Received: by daed14 with SMTP id d14so6790170dae.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 21 Feb 2012 03:25:19 -0800 (PST)
In-Reply-To: <4F3D6363.9010703@gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Sylwester Nawrocki <snjw23@gmail.com>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, patches@linaro.org

On 16 February 2012 20:13, Sylwester Nawrocki <snjw23@gmail.com> wrote:
> Hi Sangwook,
>
>
> On 02/16/2012 03:55 PM, Sangwook Lee wrote:
>>
>> Add WLAN init code on Origen for both hw2.1.1 and hw2.0 in AR6003
>>
>> Signed-off-by: Sangwook Lee<sangwook.lee@linaro.org>
>> ---
>> =A0arch/arm/mach-exynos/mach-origen.c | =A0 21 +++++++++++++++++++++
>> =A01 files changed, 21 insertions(+), 0 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/mach-origen.c
>> b/arch/arm/mach-exynos/mach-origen.c
>> index e1d87b9..d570667 100644
>> --- a/arch/arm/mach-exynos/mach-origen.c
>> +++ b/arch/arm/mach-exynos/mach-origen.c
>> @@ -21,6 +21,7 @@
>> =A0#include<linux/mfd/max8997.h>
>> =A0#include<linux/lcd.h>
>> =A0#include<linux/rfkill-gpio.h>
>> +#include<linux/delay.h>
>>
>> =A0#include<asm/mach/arch.h>
>> =A0#include<asm/hardware/gic.h>
>> @@ -676,6 +677,25 @@ static void __init origen_bt_setup(void)
>> =A0 =A0 =A0 =A0s3c_gpio_setpull(EXYNOS4_GPX2(2), S3C_GPIO_PULL_NONE)=
;
>> =A0}
>>
>> +static void __init origen_wlan_setup(void)
>> +{
>> + =A0 =A0 =A0 int err;
>> +
>> + =A0 =A0 =A0 err =3D gpio_request_one(EXYNOS4_GPX2(4),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 GPIOF_OUT_INIT_LOW, "G=
PX2_4");
>> + =A0 =A0 =A0 if (err) {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pr_warning("ORIGEN: Failed to obtain W=
IFI GPIOs\n");
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
>> + =A0 =A0 =A0 }
>> + =A0 =A0 =A0 s3c_gpio_cfgpin(EXYNOS4_GPX2(4), S3C_GPIO_OUTPUT);
>
>
> The pin is already configured as output in gpio_request_one(), doesn'=
t
> it work without this line ?
>
>> + =A0 =A0 =A0 s3c_gpio_setpull(EXYNOS4_GPX2(4),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S3C_GPIO_PULL_NONE);
>
>
> No need to break the line.
>
>
>> + =A0 =A0 =A0 /* VDD33,I/O Supply must be done */
>
>
> Is it to reset the module by cycling its power supply ?
>
>> + =A0 =A0 =A0 gpio_set_value(EXYNOS4_GPX2(4), 0);
>
>
> Isn't EXYNOS4_GPX2(4) set to low state (0) already at this point,
> since you used GPIOF_OUT_INIT_LOW flags ?
>
>
>> + =A0 =A0 =A0 udelay(30); =A0 =A0 /*AR6003 speicic value Tb */
>
>
> s/speicic/specific ?
>

Thanks, good point!


>> + =A0 =A0 =A0 gpio_direction_output(EXYNOS4_GPX2(4), 1);
>
>
> Isn't gpio_set_value() enough here ?
>
>> +}
>
>
> I couldn't identify EXYNOS4_GPX2(4) GPIO on the board's schematics
> (I didn't try too hard though), AFAIU it controls a voltage regulator=
=2E

It is not the voltage regulator but reset pin to the external chip

> I guess, it doesn't make sense to define a fixed voltage regulator
> for "VDD3,I/O" supply, since it is not controlled from anywhere else
> than the board code ?
>
> --
> Regards,
> Sylwester
