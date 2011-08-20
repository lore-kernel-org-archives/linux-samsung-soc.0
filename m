From: MyungJoo Ham <myungjoo.ham@gmail.com>
Subject: Re: [PATCH] ARM: EXYNOS4: Remove useless codes on NURI board
Date: Sat, 20 Aug 2011 11:27:08 +0900
Message-ID: <CAJ0PZbTHOKazY=x17nbPGg1djyw=1DRL7n5qrtHMiUqC+PcKUg@mail.gmail.com>
References: <1313758894-31814-1-git-send-email-kgene.kim@samsung.com>
	<CAH9JG2Ufwg7+6rAsf4v_RJ-fccp=5-8ziNFZEDX5ToUP5MpJ4A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-bw0-f46.google.com ([209.85.214.46]:37194 "EHLO
	mail-bw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753787Ab1HTC1J convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 19 Aug 2011 22:27:09 -0400
Received: by bke11 with SMTP id 11so2599876bke.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 19 Aug 2011 19:27:08 -0700 (PDT)
In-Reply-To: <CAH9JG2Ufwg7+6rAsf4v_RJ-fccp=5-8ziNFZEDX5ToUP5MpJ4A@mail.gmail.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kyungmin Park <kmpark@infradead.org>
Cc: Kukjin Kim <kgene.kim@samsung.com>, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org

2011/8/19 Kyungmin Park <kmpark@infradead.org>:
> Maybe charger manager codes are not merged. it's used for charger man=
agers.
>
> To Mr. Ham,
> which patches are missing?
>
> Thank you,
> Kyungmin Park

The patch to register Charger-Manager in Nuri is missing in the file.
In order to apply that, we will need to modify NTC driver (either
update hwmon framework or seperate NTC driver into two parts
(platorm-device + hwmon-device) first so that in-kernel modules can
read values from NTC.

>
> On Fri, Aug 19, 2011 at 10:01 PM, Kukjin Kim <kgene.kim@samsung.com> =
wrote:
>> The 'nuri_cm_devices' is defined but not used.
>>
>> Cc: Kyungmin Park <kyungmin.park@samsung.com>
>> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>> ---
>> =A0arch/arm/mach-exynos4/mach-nuri.c | =A0 =A07 -------
>> =A01 files changed, 0 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/arm/mach-exynos4/mach-nuri.c b/arch/arm/mach-exyno=
s4/mach-nuri.c
>> index 43be71b..65df994 100644
>> --- a/arch/arm/mach-exynos4/mach-nuri.c
>> +++ b/arch/arm/mach-exynos4/mach-nuri.c
>> @@ -1037,13 +1037,6 @@ static struct platform_device nuri_max8903_de=
vice =3D {
>> =A0 =A0 =A0 =A0},
>> =A0};
>>
>> -static struct device *nuri_cm_devices[] =3D {
>> - =A0 =A0 =A0 &s3c_device_i2c5.dev,
>> - =A0 =A0 =A0 &s3c_device_adc.dev,
>> - =A0 =A0 =A0 NULL, /* Reserved for UART */
>> - =A0 =A0 =A0 NULL,
>> -};
>> -
>> =A0static void __init nuri_power_init(void)
>> =A0{
>> =A0 =A0 =A0 =A0int gpio;
>> --
>> 1.7.1
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-sams=
ung-soc" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>>
>



--=20
MyungJoo Ham, Ph.D.
Mobile Software Platform Lab,
Digital Media and Communications (DMC) Business
Samsung Electronics
cell: 82-10-6714-2858
