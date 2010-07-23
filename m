From: Wan ZongShun <mcuos.com@gmail.com>
Subject: Re: [rtc-linux] [PATCH 3/3] rtc: rtc-s3c: Add BCD register
	initialization codes
Date: Fri, 23 Jul 2010 17:28:07 +0800
Message-ID: <AANLkTimMaNp4JN+f-A=NpuchSfDaTnKBcCeBdjkR8rm1@mail.gmail.com>
References: <1279702666-13021-1-git-send-email-kgene.kim@samsung.com>
	<1279702666-13021-4-git-send-email-kgene.kim@samsung.com>
	<AANLkTinHlD1fC_Es6P7mcX4-_STNoYxV4wmsKe6KAw_N@mail.gmail.com>
	<006501cb2a39$8b06eb20$a114c160$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:48804 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753552Ab0GWJ2I convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 23 Jul 2010 05:28:08 -0400
Received: by vws3 with SMTP id 3so1348036vws.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 23 Jul 2010 02:28:08 -0700 (PDT)
In-Reply-To: <006501cb2a39$8b06eb20$a114c160$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: rtc-linux@googlegroups.com
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, p_gortmaker@yahoo.com, a.zummo@towertech.it, Taekgyun Ko <taeggyun.ko@samsung.com>

2010/7/23 Kukjin Kim <kgene.kim@samsung.com>:
> Wan ZongShun wrote:
>>
>> 2010/7/21 Kukjin Kim <kgene.kim@samsung.com>:
>> > From: Taekgyun Ko <taeggyun.ko@samsung.com>
>> >
>> > RTC needs to be initialized when BCD registers have invalid value.
>>
>> Do you mean that the hardware register does not have default value?
>> Any results if no initialized value here?
>>
> Hi,
>
> Yes..I mean that it has no default value.
> As you know, it has to be keep the previous time value after reset..a=
nd the reset value is not defined.
>

So, reset is no use to this RTC BCD registers, it still keep previous
time value.

> So added check that functionality, because if it has no valid BCD val=
ue, RTC time does not move on.
> Of course, if we set time at that time, RTC works well...I mean just =
need initialize that.
>

Okay,good patch.:)

In addtion,For making sure to get valid value, it is much better to
use also 'rtc_valid_tm(tm)' to check returning time value in your
s3c_rtc_gettime() and s3c_rtc_getalarm(() functions.


>> >
>> > Signed-off-by: Taekgyun Ko <taeggyun.ko@samsung.com>
>> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>> > ---
>> > =C2=A0drivers/rtc/rtc-s3c.c | =C2=A0 14 ++++++++++++--
>> > =C2=A01 files changed, 12 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
>> > index 2040017..e96e109 100644
>> > --- a/drivers/rtc/rtc-s3c.c
>> > +++ b/drivers/rtc/rtc-s3c.c
>> > @@ -536,10 +536,20 @@ static int __devinit s3c_rtc_probe(struct
>> platform_device *pdev)
>> >
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0s3c_rtc_cpu_type =3D platform_get_devic=
e_id(pdev)->driver_data;
>> >
>> > - =C2=A0 =C2=A0 =C2=A0 if (s3c_rtc_cpu_type =3D=3D TYPE_S3C64XX)
>> > + =C2=A0 =C2=A0 =C2=A0 if (s3c_rtc_cpu_type =3D=3D TYPE_S3C64XX) {
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rtc->max_us=
er_freq =3D 32768;
>> > - =C2=A0 =C2=A0 =C2=A0 else
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Check RTC Ti=
me */
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (i =3D S3C2=
410_RTCSEC; i <=3D S3C2410_RTCYEAR; i +=3D 0x4) {
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 tmp =3D readb(s3c_rtc_base + i);
>> > +
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 if (((tmp & 0xf) > 0x9) || (((tmp >> 4) & 0xf) > 0x9))
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 writeb(0, s3c_rtc_base + i);
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>> > + =C2=A0 =C2=A0 =C2=A0 } else {
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rtc->max_us=
er_freq =3D 128;
>> > + =C2=A0 =C2=A0 =C2=A0 }
>> >
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0platform_set_drvdata(pdev, rtc);
>> >
>> > --
>> > 1.6.2.5
>> >
>
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
> You received this message because you are subscribed to "rtc-linux".
> Membership options at http://groups.google.com/group/rtc-linux .
> Please read http://groups.google.com/group/rtc-linux/web/checklist
> before submitting a driver.



--=20
*linux-arm-kernel mailing list
mail addr:linux-arm-kernel@lists.infradead.org
you can subscribe by:
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

* linux-arm-NUC900 mailing list
mail addr:NUC900@googlegroups.com
main web: https://groups.google.com/group/NUC900
you can subscribe it by sending me mail:
mcuos.com@gmail.com
