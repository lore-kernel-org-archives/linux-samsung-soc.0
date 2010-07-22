From: Wan ZongShun <mcuos.com@gmail.com>
Subject: Re: [rtc-linux] [PATCH 2/2] rtc: rtc-s3c: Updates RTC driver for
	clock enabling support
Date: Thu, 22 Jul 2010 14:09:00 +0800
Message-ID: <AANLkTikGjzmHxCX6_s5Z-ZXkoyPbtF28uCyE1VqdGPvb@mail.gmail.com>
References: <1279702501-6803-1-git-send-email-kgene.kim@samsung.com>
	<1279702501-6803-3-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:55976 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751096Ab0GVGJC convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 22 Jul 2010 02:09:02 -0400
Received: by gxk23 with SMTP id 23so4311086gxk.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 21 Jul 2010 23:09:01 -0700 (PDT)
In-Reply-To: <1279702501-6803-3-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: rtc-linux@googlegroups.com
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, p_gortmaker@yahoo.com, a.zummo@towertech.it, Atul Dahiya <atul.dahiya@samsung.com>, Kukjin Kim <kgene.kim@samsung.com>, Andrew Morton <akpm@linux-foundation.org>

2010/7/21 Kukjin Kim <kgene.kim@samsung.com>:
> From: Atul Dahiya <atul.dahiya@samsung.com>
>
> This Patch updates existing Samsung RTC driver for clock enabling sup=
port.
>
> Signed-off-by: Atul Dahiya <atul.dahiya@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =C2=A0drivers/rtc/rtc-s3c.c | =C2=A0 22 ++++++++++++++++++++++
> =C2=A01 files changed, 22 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> index 70b68d3..c032a15 100644
> --- a/drivers/rtc/rtc-s3c.c
> +++ b/drivers/rtc/rtc-s3c.c
> @@ -1,5 +1,8 @@
> =C2=A0/* drivers/rtc/rtc-s3c.c
> =C2=A0*
> + * Copyright (c) 2010 Samsung Electronics Co., Ltd.
> + * =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://www.samsung.com/
> + *
> =C2=A0* Copyright (c) 2004,2006 Simtec Electronics
> =C2=A0* =C2=A0 =C2=A0 Ben Dooks, <ben@simtec.co.uk>
> =C2=A0* =C2=A0 =C2=A0 http://armlinux.simtec.co.uk/
> @@ -39,6 +42,7 @@ enum s3c_cpu_type {
>
> =C2=A0static struct resource *s3c_rtc_mem;
>
> +static struct clk *rtc_clk;
> =C2=A0static void __iomem *s3c_rtc_base;
> =C2=A0static int s3c_rtc_alarmno =3D NO_IRQ;
> =C2=A0static int s3c_rtc_tickno =C2=A0=3D NO_IRQ;
> @@ -431,6 +435,10 @@ static int __devexit s3c_rtc_remove(struct platf=
orm_device *dev)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0s3c_rtc_setpie(&dev->dev, 0);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0s3c_rtc_setaie(0);
>
> + =C2=A0 =C2=A0 =C2=A0 clk_disable(rtc_clk);
> + =C2=A0 =C2=A0 =C2=A0 clk_put(rtc_clk);
> + =C2=A0 =C2=A0 =C2=A0 rtc_clk =3D NULL;
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0iounmap(s3c_rtc_base);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0release_resource(s3c_rtc_mem);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(s3c_rtc_mem);
> @@ -488,6 +496,16 @@ static int __devinit s3c_rtc_probe(struct platfo=
rm_device *pdev)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto err_nomap=
;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>
> + =C2=A0 =C2=A0 =C2=A0 rtc_clk =3D clk_get(&pdev->dev, "rtc");

Do you really need the second argument? I think the bus clock for
a device should be findable with NULL for s3c platform..

> + =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(rtc_clk)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&pdev->dev=
, "failed to find rtc clock source\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D PTR_ERR(rt=
c_clk);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rtc_clk =3D NULL;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto err_clk;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 clk_enable(rtc_clk);
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* check to see if everything is setup cor=
rectly */
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0s3c_rtc_enable(pdev, 1);
> @@ -523,6 +541,10 @@ static int __devinit s3c_rtc_probe(struct platfo=
rm_device *pdev)
>
> =C2=A0err_nortc:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0s3c_rtc_enable(pdev, 0);
> + =C2=A0 =C2=A0 =C2=A0 clk_disable(rtc_clk);
> + =C2=A0 =C2=A0 =C2=A0 clk_put(rtc_clk);
> +
> + err_clk:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0iounmap(s3c_rtc_base);
>
> =C2=A0err_nomap:
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
