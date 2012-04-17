From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 08/12] gpio/samsung: add GPC4 bank instance
Date: Tue, 17 Apr 2012 13:54:04 +0530
Message-ID: <CAJuYYwQb2Ahzc-HX2qDFa6NoSmhp2C1KTtN7OQfMVc=zcUbn-A@mail.gmail.com>
References: <1334641595-25301-1-git-send-email-thomas.abraham@linaro.org>
	<1334641595-25301-9-git-send-email-thomas.abraham@linaro.org>
	<CAH9JG2VorCARJie+nrxh13-p0zTkboiRjkyMFpw8Eczb-9V-Bw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:45852 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755422Ab2DQIYF convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 17 Apr 2012 04:24:05 -0400
Received: by vcqp1 with SMTP id p1so3898211vcq.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 17 Apr 2012 01:24:05 -0700 (PDT)
In-Reply-To: <CAH9JG2VorCARJie+nrxh13-p0zTkboiRjkyMFpw8Eczb-9V-Bw@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, linux-arm-kernel@lists.infradead.org, Sangsu Park <sangsu4u.park@samsung.com>, Grant Likely <grant.likely@secretlab.ca>

On 17 April 2012 12:03, Kyungmin Park <kmpark@infradead.org> wrote:
> On 4/17/12, Thomas Abraham <thomas.abraham@linaro.org> wrote:
>> From: Sangsu Park <sangsu4u.park@samsung.com>
>>
>> Add GPC4 bank instance which is included in rev1 of Exynos5.
>>
>> Cc: Grant Likely <grant.likely@secretlab.ca>
>> Signed-off-by: Sangsu Park <sangsu4u.park@samsung.com>
>> ---
>> =A0arch/arm/mach-exynos/include/mach/gpio.h | =A0 =A09 ++++++---
>> =A0drivers/gpio/gpio-samsung.c =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A08=
 ++++++++
>> =A02 files changed, 14 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos/include/mach/gpio.h
>> b/arch/arm/mach-exynos/include/mach/gpio.h
>> index d7498af..df5612b 100644
>> --- a/arch/arm/mach-exynos/include/mach/gpio.h
>> +++ b/arch/arm/mach-exynos/include/mach/gpio.h
>> @@ -153,10 +153,11 @@ enum exynos4_gpio_number {
>> =A0#define EXYNOS5_GPIO_B2_NR =A0 (4)
>> =A0#define EXYNOS5_GPIO_B3_NR =A0 (4)
>> =A0#define EXYNOS5_GPIO_C0_NR =A0 (7)
>> -#define EXYNOS5_GPIO_C1_NR =A0 (7)
>> +#define EXYNOS5_GPIO_C1_NR =A0 (4)
>> =A0#define EXYNOS5_GPIO_C2_NR =A0 (7)
>> =A0#define EXYNOS5_GPIO_C3_NR =A0 (7)
>> -#define EXYNOS5_GPIO_D0_NR =A0 (8)
>> +#define EXYNOS5_GPIO_C4_NR =A0 (8)
>> +#define EXYNOS5_GPIO_D0_NR =A0 (4)
>> =A0#define EXYNOS5_GPIO_D1_NR =A0 (8)
>> =A0#define EXYNOS5_GPIO_Y0_NR =A0 (6)
>> =A0#define EXYNOS5_GPIO_Y1_NR =A0 (4)
>> @@ -199,7 +200,8 @@ enum exynos5_gpio_number {
>> =A0 =A0 =A0 EXYNOS5_GPIO_C1_START =A0 =A0 =A0 =A0 =A0 =3D EXYNOS_GPI=
O_NEXT(EXYNOS5_GPIO_C0),
>> =A0 =A0 =A0 EXYNOS5_GPIO_C2_START =A0 =A0 =A0 =A0 =A0 =3D EXYNOS_GPI=
O_NEXT(EXYNOS5_GPIO_C1),
>> =A0 =A0 =A0 EXYNOS5_GPIO_C3_START =A0 =A0 =A0 =A0 =A0 =3D EXYNOS_GPI=
O_NEXT(EXYNOS5_GPIO_C2),
>> - =A0 =A0 EXYNOS5_GPIO_D0_START =A0 =A0 =A0 =A0 =A0 =3D EXYNOS_GPIO_=
NEXT(EXYNOS5_GPIO_C3),
>> + =A0 =A0 EXYNOS5_GPIO_C4_START =A0 =A0 =A0 =A0 =A0 =3D EXYNOS_GPIO_=
NEXT(EXYNOS5_GPIO_C3),
>> + =A0 =A0 EXYNOS5_GPIO_D0_START =A0 =A0 =A0 =A0 =A0 =3D EXYNOS_GPIO_=
NEXT(EXYNOS5_GPIO_C4),
>> =A0 =A0 =A0 EXYNOS5_GPIO_D1_START =A0 =A0 =A0 =A0 =A0 =3D EXYNOS_GPI=
O_NEXT(EXYNOS5_GPIO_D0),
>> =A0 =A0 =A0 EXYNOS5_GPIO_Y0_START =A0 =A0 =A0 =A0 =A0 =3D EXYNOS_GPI=
O_NEXT(EXYNOS5_GPIO_D1),
>> =A0 =A0 =A0 EXYNOS5_GPIO_Y1_START =A0 =A0 =A0 =A0 =A0 =3D EXYNOS_GPI=
O_NEXT(EXYNOS5_GPIO_Y0),
>> @@ -242,6 +244,7 @@ enum exynos5_gpio_number {
>> =A0#define EXYNOS5_GPC1(_nr) =A0 =A0(EXYNOS5_GPIO_C1_START + (_nr))
>> =A0#define EXYNOS5_GPC2(_nr) =A0 =A0(EXYNOS5_GPIO_C2_START + (_nr))
>> =A0#define EXYNOS5_GPC3(_nr) =A0 =A0(EXYNOS5_GPIO_C3_START + (_nr))
>> +#define EXYNOS5_GPC4(_nr) =A0 =A0(EXYNOS5_GPIO_C4_START + (_nr))
>> =A0#define EXYNOS5_GPD0(_nr) =A0 =A0(EXYNOS5_GPIO_D0_START + (_nr))
>> =A0#define EXYNOS5_GPD1(_nr) =A0 =A0(EXYNOS5_GPIO_D1_START + (_nr))
>> =A0#define EXYNOS5_GPY0(_nr) =A0 =A0(EXYNOS5_GPIO_Y0_START + (_nr))
>> diff --git a/drivers/gpio/gpio-samsung.c b/drivers/gpio/gpio-samsung=
=2Ec
>> index 4627787..0153bb9 100644
>> --- a/drivers/gpio/gpio-samsung.c
>> +++ b/drivers/gpio/gpio-samsung.c
>> @@ -2452,6 +2452,12 @@ static struct samsung_gpio_chip exynos5_gpios=
_1[] =3D {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
>> =A0 =A0 =A0 }, {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D EXYNOS5_GPC4=
(0),
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D EXYNOS5_GPIO=
_C4_NR,
>> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPC4",
>> + =A0 =A0 =A0 =A0 =A0 =A0 },
>> + =A0 =A0 }, {
>> + =A0 =A0 =A0 =A0 =A0 =A0 .chip =A0 =3D {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .base =A0 =3D EXYNOS5_GP=
D0(0),
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ngpio =A0=3D EXYNOS5_GP=
IO_D0_NR,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 .label =A0=3D "GPD0",
>> @@ -2880,6 +2886,8 @@ static __init int samsung_gpiolib_init(void)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (i =3D 0; i < 4; i++, chip++, gpx_ba=
se +=3D 0x20)
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip->base =3D gpx_base;
>>
>> + =A0 =A0 =A0 =A0 =A0 =A0 exynos5_gpios_1[11].base =3D gpio_base1 + =
0x2E0;
> '11' seems dangerous. I think you add comments here and above to know
> '11' meaning.

Yes, true. But these will go away when the Samsung pinctrl driver will
be merged. For now, I will put a comment to explain the meaning of 11.

Thanks for reviewing the patches.

Thanks,
Thomas.

>> +
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 chip =3D exynos5_gpios_1;
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 nr_chips =3D ARRAY_SIZE(exynos5_gpios_1)=
;
>>
>> --
>> 1.6.6.rc2
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-sams=
ung-soc"
>> in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
