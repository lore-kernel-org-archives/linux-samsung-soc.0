From: Wan ZongShun <mcuos.com@gmail.com>
Subject: Re: [rtc-linux] [PATCH v3 3/3] rtc: rtc-s3c: Add BCD register
	initialization codes
Date: Thu, 29 Jul 2010 13:19:27 +0800
Message-ID: <AANLkTimoyYGXc-bwQCOWFSBP+nWTVVri6ZMsNuwwYtC7@mail.gmail.com>
References: <1280379570-6147-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:38566 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750845Ab0G2FTb convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 Jul 2010 01:19:31 -0400
Received: by vws3 with SMTP id 3so315829vws.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Jul 2010 22:19:30 -0700 (PDT)
In-Reply-To: <1280379570-6147-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: rtc-linux@googlegroups.com, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, p_gortmaker@yahoo.com, a.zummo@towertech.it, Taekgyun Ko <taeggyun.ko@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>

2010/7/29 Kukjin Kim <kgene.kim@samsung.com>:
> From: Taekgyun Ko <taeggyun.ko@samsung.com>
>
> RTC needs to be initialized when BCD registers have invalid value.
>
> Signed-off-by: Taekgyun Ko <taeggyun.ko@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> Cc: Ben Dooks <ben-linux@fluff.org>
> ---
> Hi, Alessandro Zummo
> Just moved the routine to support all Samsung SoCs' RTC.
> Is still your ack valid?

Alessandro is busy, not every patch he can reviewed and acked,
if nobody have any other suggestions about your patch, you can
merge it. if you donot have specific git tree to merge it, you can get
Andrew's help.

>
> Changes since v2:
> Moved chekcing BCD registers to support all Samsung SoCs as per Ben's=
 comments.
>
> =C2=A0drivers/rtc/rtc-s3c.c | =C2=A0 10 ++++++++++
> =C2=A01 files changed, 10 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> index 2040017..a0d3ec8 100644
> --- a/drivers/rtc/rtc-s3c.c
> +++ b/drivers/rtc/rtc-s3c.c
> @@ -458,6 +458,7 @@ static int __devinit s3c_rtc_probe(struct platfor=
m_device *pdev)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct rtc_device *rtc;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct resource *res;
> + =C2=A0 =C2=A0 =C2=A0 unsigned int tmp, i;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug("%s: probe=3D%p\n", __func__, pde=
v);
> @@ -536,6 +537,15 @@ static int __devinit s3c_rtc_probe(struct platfo=
rm_device *pdev)
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0s3c_rtc_cpu_type =3D platform_get_device_i=
d(pdev)->driver_data;
>
> + =C2=A0 =C2=A0 =C2=A0 /* Check RTC Time */
> +
> + =C2=A0 =C2=A0 =C2=A0 for (i =3D S3C2410_RTCSEC; i <=3D S3C2410_RTCY=
EAR; i +=3D 0x4) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 tmp =3D readb(s3c_=
rtc_base + i);
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((tmp & 0xf) > =
0x9 || ((tmp >> 4) & 0xf) > 0x9)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 writeb(0, s3c_rtc_base + i);
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (s3c_rtc_cpu_type =3D=3D TYPE_S3C64XX)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rtc->max_user_=
freq =3D 32768;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0else
> --
> 1.6.2.5
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
