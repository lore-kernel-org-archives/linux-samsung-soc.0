From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 2/3] ARM: S5PV210: Add supplies for CIF camera on GONI board
Date: Fri, 28 Jan 2011 19:53:28 +0900
Message-ID: <AANLkTi=HqesRD_fEW12QY8kVKC7RFoTQNLs=7RUTAmfN@mail.gmail.com>
References: <1294419468-13700-1-git-send-email-s.nawrocki@samsung.com>
	<1294419468-13700-3-git-send-email-s.nawrocki@samsung.com>
	<02e101cbbece$55a77790$00f666b0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:62104 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753881Ab1A1Kx3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 28 Jan 2011 05:53:29 -0500
Received: by wwa36 with SMTP id 36so3207735wwa.1
        for <linux-samsung-soc@vger.kernel.org>; Fri, 28 Jan 2011 02:53:28 -0800 (PST)
In-Reply-To: <02e101cbbece$55a77790$00f666b0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, m.szyprowski@samsung.com, Mark Brown <broonie@opensource.wolfsonmicro.com>

On Fri, Jan 28, 2011 at 6:32 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> Sylwester Nawrocki wrote:
>>
>> Add regulator supplies required for NOON010PC30 CIF sensor.
>>
>> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
>> Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
>> ---
>> =A0arch/arm/mach-s5pv210/mach-goni.c | =A0 24 +++++++++++++++++++++-=
--
>> =A01 files changed, 21 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/arm/mach-s5pv210/mach-goni.c
> b/arch/arm/mach-s5pv210/mach-
>> goni.c
>> index fc34575..2051cee 100644
>> --- a/arch/arm/mach-s5pv210/mach-goni.c
>> +++ b/arch/arm/mach-s5pv210/mach-goni.c
>> @@ -273,6 +273,18 @@ static struct regulator_consumer_supply
>> goni_ldo5_consumers[] =3D {
>> =A0 =A0 =A0 REGULATOR_SUPPLY("vmmc", "s3c-sdhci.0"),
>> =A0};
>>
>> +static struct regulator_consumer_supply goni_ldo11_consumers[] =3D =
{
>> + =A0 =A0 REGULATOR_SUPPLY("vddio", "0-0030"), /* "CAM_IO_2.8V" */
>> +};
>
> Need array in goni_ldo11_consumers?

Yes, it's required for consistency and most consumers use this style.

Look smdk board file
http://git.kernel.org/?p=3Dlinux/kernel/git/kgene/linux-samsung.git;a=3D=
blob;f=3Darch/arm/mach-s3c64xx/mach-smdk6410.c;h=3De85192a86fbe1a9f51bb=
9da15f20899bf0b4ab3e;hb=3Drefs/heads/for-next

 303 #ifdef CONFIG_REGULATOR
 304 /* ARM core */
 305 static struct regulator_consumer_supply smdk6410_vddarm_consumers[=
] =3D {
 306         {
 307                 .supply =3D "vddarm",
 308         }
 309 };
 310
 311 /* VDDARM, BUCK1 on J5 */
 312 static struct regulator_init_data smdk6410_vddarm =3D {
 313         .constraints =3D {
 314                 .name =3D "PVDD_ARM",
 315                 .min_uV =3D 1000000,
 316                 .max_uV =3D 1300000,
 317                 .always_on =3D 1,
 318                 .valid_ops_mask =3D REGULATOR_CHANGE_VOLTAGE,
 319         },
 320         .num_consumer_supplies =3D ARRAY_SIZE(smdk6410_vddarm_cons=
umers),
 321         .consumer_supplies =3D smdk6410_vddarm_consumers,
 322 };

>
> +static struct regulator_consumer_supply goni_ldo11_consumers =3D
> + =A0 =A0 =A0 REGULATOR_SUPPLY("vddio", "0-0030"); /* "CAM_IO_2.8V" *=
/
>
>> +
>> +static struct regulator_consumer_supply goni_ldo13_consumers[] =3D =
{
>> + =A0 =A0 REGULATOR_SUPPLY("vdda", "0-0030"), /* "CAM_A_2.8V" */
>> +};
>
> Same above.
>
>> +
>> +static struct regulator_consumer_supply goni_ldo14_consumers[] =3D =
{
>> + =A0 =A0 REGULATOR_SUPPLY("vdd_core", "0-0030"), /* "CAM_CIF_1.8V" =
*/
>> +};
>
> Same above.
>
>> +
>> =A0static struct regulator_init_data goni_ldo2_data =3D {
>> =A0 =A0 =A0 .constraints =A0 =A0=3D {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "VALIVE_1.=
1V",
>> @@ -371,8 +383,10 @@ static struct regulator_init_data goni_ldo11_da=
ta =3D {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .min_uV =A0 =A0 =A0 =A0 =3D 2800000,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .max_uV =A0 =A0 =A0 =A0 =3D 2800000,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .apply_uV =A0 =A0 =A0 =3D 1,
>> - =A0 =A0 =A0 =A0 =A0 =A0 .always_on =A0 =A0 =A0=3D 1,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .valid_ops_mask =3D REGULATOR_CHANGE_STATU=
S,
>> =A0 =A0 =A0 },
>> + =A0 =A0 .num_consumer_supplies =A0=3D ARRAY_SIZE(goni_ldo11_consum=
ers),
>> + =A0 =A0 .consumer_supplies =A0 =A0 =A0=3D goni_ldo11_consumers,
>
> If you modify as per my suggestion, then need to change this like fol=
lowing.

Same, I want to use the same style even though it has one consumer.
and If it has one consumer, ARRAY_SIZE(some_consumers) has 1 at
compile time.

>
> + =A0 =A0 =A0 .num_consumer_supplies =A0=3D 1,
> + =A0 =A0 =A0 .consumer_supplies =A0 =A0 =A0=3D &goni_ldo11_consumers=
,
>
>> =A0};
>>
>> =A0static struct regulator_init_data goni_ldo12_data =3D {
>> @@ -391,8 +405,10 @@ static struct regulator_init_data goni_ldo13_da=
ta =3D {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .min_uV =A0 =A0 =A0 =A0 =3D 2800000,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .max_uV =A0 =A0 =A0 =A0 =3D 2800000,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .apply_uV =A0 =A0 =A0 =3D 1,
>> - =A0 =A0 =A0 =A0 =A0 =A0 .always_on =A0 =A0 =A0=3D 1,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .valid_ops_mask =3D REGULATOR_CHANGE_STATU=
S,
>> =A0 =A0 =A0 },
>> + =A0 =A0 .num_consumer_supplies =A0=3D ARRAY_SIZE(goni_ldo13_consum=
ers),
>> + =A0 =A0 .consumer_supplies =A0 =A0 =A0=3D goni_ldo13_consumers,
>
> Same above.
>
>> =A0};
>>
>> =A0static struct regulator_init_data goni_ldo14_data =3D {
>> @@ -401,8 +417,10 @@ static struct regulator_init_data goni_ldo14_da=
ta =3D {
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .min_uV =A0 =A0 =A0 =A0 =3D 1800000,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .max_uV =A0 =A0 =A0 =A0 =3D 1800000,
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 .apply_uV =A0 =A0 =A0 =3D 1,
>> - =A0 =A0 =A0 =A0 =A0 =A0 .always_on =A0 =A0 =A0=3D 1,
>> + =A0 =A0 =A0 =A0 =A0 =A0 .valid_ops_mask =3D REGULATOR_CHANGE_STATU=
S,
>> =A0 =A0 =A0 },
>> + =A0 =A0 .num_consumer_supplies =A0=3D ARRAY_SIZE(goni_ldo14_consum=
ers),
>> + =A0 =A0 .consumer_supplies =A0 =A0 =A0=3D goni_ldo14_consumers,
>
> Same above.
>
>> =A0};
>>
>> =A0static struct regulator_init_data goni_ldo15_data =3D {
>> --
>> 1.7.3.5
>
> If required array in there, please let me know.
>
> Thanks.
>
> Best regards,
> Kgene.
> --
> Kukjin Kim <kgene.kim@samsung.com>, Senior Engineer,
> SW Solution Development Team, Samsung Electronics Co., Ltd.
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
