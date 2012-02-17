From: Shubhrajyoti Datta <omaplinuxkernel@gmail.com>
Subject: Re: [PATCH 3/3] i2c-s3c2410: Refactor ifdefs for PM_SLEEP
Date: Fri, 17 Feb 2012 17:49:40 +0530
Message-ID: <CAM=Q2cuo3BPK3ZEm-ad_0k_tOsiB3rc=sRjdrKgYu7UGCy1yoQ@mail.gmail.com>
References: <1329174304-12228-1-git-send-email-broonie@opensource.wolfsonmicro.com>
	<1329174304-12228-3-git-send-email-broonie@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:62097 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751298Ab2BQMTl convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 17 Feb 2012 07:19:41 -0500
In-Reply-To: <1329174304-12228-3-git-send-email-broonie@opensource.wolfsonmicro.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Ben Dooks <ben-linux@fluff.org>, khali@linux-fr.org, w.sang@pengutronix.de, linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org

On Tue, Feb 14, 2012 at 4:35 AM, Mark Brown
<broonie@opensource.wolfsonmicro.com> wrote:
> Use the PM_SLEEP ifdef for system suspend and resume. This is partly
> in preparation for adding runtime operations and partly because a use=
r
> may in theory choose to enable runtime suspend but not system suspend=
=2E
>
Yes also rand defconfig may see some warns.

Looks good to me
Reviewed-by: Shubhrajyoti D <shubhrajyoti@ti.com>

> Signed-off-by: Mark Brown <broonie@opensource.wolfsonmicro.com>
> ---
> =A0drivers/i2c/busses/i2c-s3c2410.c | =A0 =A06 +++++-
> =A01 files changed, 5 insertions(+), 1 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2=
c-s3c2410.c
> index 1cb06c58..5d8e802 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -1073,7 +1073,7 @@ static int s3c24xx_i2c_remove(struct platform_d=
evice *pdev)
> =A0 =A0 =A0 =A0return 0;
> =A0}
>
> -#ifdef CONFIG_PM
> +#ifdef CONFIG_PM_SLEEP
> =A0static int s3c24xx_i2c_suspend_noirq(struct device *dev)
> =A0{
> =A0 =A0 =A0 =A0struct platform_device *pdev =3D to_platform_device(de=
v);
> @@ -1096,10 +1096,14 @@ static int s3c24xx_i2c_resume(struct device *=
dev)
>
> =A0 =A0 =A0 =A0return 0;
> =A0}
> +#endif
>
> +#ifdef CONFIG_PM
> =A0static const struct dev_pm_ops s3c24xx_i2c_dev_pm_ops =3D {
> +#ifdef CONFIG_PM_SLEEP
> =A0 =A0 =A0 =A0.suspend_noirq =3D s3c24xx_i2c_suspend_noirq,
> =A0 =A0 =A0 =A0.resume =3D s3c24xx_i2c_resume,
> +#endif
> =A0};
>
> =A0#define S3C24XX_DEV_PM_OPS (&s3c24xx_i2c_dev_pm_ops)
> --
> 1.7.9.rc1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-i2c" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
