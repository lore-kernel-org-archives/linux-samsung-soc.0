From: Wan ZongShun <mcuos.com@gmail.com>
Subject: Re: [rtc-linux] [PATCH 2/2] rtc: rtc-s3c: Updates RTC driver for
	clock enabling support
Date: Wed, 28 Jul 2010 12:42:05 +0800
Message-ID: <AANLkTimCd-4mqW6vt1f+xVVzMdzOqD0RwzLu3-Ue41gs@mail.gmail.com>
References: <1279702501-6803-1-git-send-email-kgene.kim@samsung.com>
	<1279702501-6803-3-git-send-email-kgene.kim@samsung.com>
	<AANLkTikGjzmHxCX6_s5Z-ZXkoyPbtF28uCyE1VqdGPvb@mail.gmail.com>
	<AANLkTikEanSQBeFoqpMxR3tWxWTci_ytNsEhe9VS9ygg@mail.gmail.com>
	<AANLkTin=bqMRLYgAd4NvVnKZi1PWAGPqQSsZDPxvitfh@mail.gmail.com>
	<007a01cb2e0e$6760ad40$362207c0$%kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:58969 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751233Ab0G1EmJ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 28 Jul 2010 00:42:09 -0400
Received: by vws3 with SMTP id 3so4061707vws.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 27 Jul 2010 21:42:06 -0700 (PDT)
In-Reply-To: <007a01cb2e0e$6760ad40$362207c0$%kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: rtc-linux@googlegroups.com
Cc: Atul Dahiya <atuldahiya84@gmail.com>, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, p_gortmaker@yahoo.com, a.zummo@towertech.it, Atul Dahiya <atul.dahiya@samsung.com>

2010/7/28 Kukjin Kim <kgene.kim@samsung.com>:
> Wan ZongShun wrote:
>>
>> 2010/7/22 Atul Dahiya <atuldahiya84@gmail.com>:
>> > On Thu, Jul 22, 2010 at 11:39 AM, Wan ZongShun <mcuos.com@gmail.co=
m>
>> wrote:
>> >>
>> >> 2010/7/21 Kukjin Kim <kgene.kim@samsung.com>:
>> >> > From: Atul Dahiya <atul.dahiya@samsung.com>
>> >> >
>> >> > This Patch updates existing Samsung RTC driver for clock enabli=
ng support.
>> >> >
>> >> > Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
>> >> > Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
>> >> > ---
>> >> > =C2=A0drivers/rtc/rtc-s3c.c | =C2=A0 22 ++++++++++++++++++++++
>> >> > =C2=A01 files changed, 22 insertions(+), 0 deletions(-)
>> >> >
>> >> > diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
>> >> > index 70b68d3..c032a15 100644
>> >> > --- a/drivers/rtc/rtc-s3c.c
>> >> > +++ b/drivers/rtc/rtc-s3c.c
>> >> > @@ -1,5 +1,8 @@
>> >> > =C2=A0/* drivers/rtc/rtc-s3c.c
>> >> > =C2=A0*
>> >> > + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
>> >> > + * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://www.samsun=
g.com/
>> >> > + *
>> >> > =C2=A0* Copyright (c) 2004,2006 Simtec Electronics
>> >> > =C2=A0* =C2=A0 =C2=A0 Ben Dooks, <ben@simtec.co.uk>
>> >> > =C2=A0* =C2=A0 =C2=A0 http://armlinux.simtec.co.uk/
>> >> > @@ -39,6 +42,7 @@ enum s3c_cpu_type {
>> >> >
>> >> > =C2=A0static struct resource *s3c_rtc_mem;
>> >> >
>> >> > +static struct clk *rtc_clk;
>> >> > =C2=A0static void __iomem *s3c_rtc_base;
>> >> > =C2=A0static int s3c_rtc_alarmno =3D NO_IRQ;
>> >> > =C2=A0static int s3c_rtc_tickno =C2=A0=3D NO_IRQ;
>> >> > @@ -431,6 +435,10 @@ static int __devexit s3c_rtc_remove(struct
>> platform_device *dev)
>> >> > =C2=A0 =C2=A0 =C2=A0 =C2=A0s3c_rtc_setpie(&dev->dev, 0);
>> >> > =C2=A0 =C2=A0 =C2=A0 =C2=A0s3c_rtc_setaie(0);
>> >> >
>> >> > + =C2=A0 =C2=A0 =C2=A0 clk_disable(rtc_clk);
>> >> > + =C2=A0 =C2=A0 =C2=A0 clk_put(rtc_clk);
>> >> > + =C2=A0 =C2=A0 =C2=A0 rtc_clk =3D NULL;
>> >> > +
>> >> > =C2=A0 =C2=A0 =C2=A0 =C2=A0iounmap(s3c_rtc_base);
>> >> > =C2=A0 =C2=A0 =C2=A0 =C2=A0release_resource(s3c_rtc_mem);
>> >> > =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(s3c_rtc_mem);
>> >> > @@ -488,6 +496,16 @@ static int __devinit s3c_rtc_probe(struct
>> platform_device *pdev)
>> >> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err=
_nomap;
>> >> > =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> >> >
>> >> > + =C2=A0 =C2=A0 =C2=A0 rtc_clk =3D clk_get(&pdev->dev, "rtc");
>> >>
>> >> Do you really need the second argument? I think the bus clock for
>> >> a device should be findable with NULL for s3c platform..
>> >
>> > No, actually =C2=A0clk_get() function for s3c platform searches on=
 the
>> > basis of second parameter passed
>> > so need to pass the second argument here.
>>
>> Okay, good patch!
>>
>> Acked-by: Wan ZongShun <mcuos.com@gmail.com>
>>
> Thanks for your review and ack.
>
> As I asked to Alessandro, does this goes through what subsystem go to=
 upstream?
>
After you get ack, Samsung git tree or Andrew's mm git tree can do it.
Thanks!

> (snip)
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
