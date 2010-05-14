From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH v2 11/11] Input: s3c24xx_ts - Uses Feature field instead
	TYPE for Samsung SoCs
Date: Fri, 14 May 2010 21:30:24 +0900
Message-ID: <AANLkTikoeAccwaRclasmr9Ez8yzEeJoB71dCpHeOB5on@mail.gmail.com>
References: <1273821927-17585-1-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-vw0-f46.google.com ([209.85.212.46]:35841 "EHLO
	mail-vw0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751695Ab0ENMa1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Fri, 14 May 2010 08:30:27 -0400
Received: by vws16 with SMTP id 16so790170vws.19
        for <linux-samsung-soc@vger.kernel.org>; Fri, 14 May 2010 05:30:26 -0700 (PDT)
In-Reply-To: <1273821927-17585-1-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Naveen Krishna <ch.naveen@samsung.com>

On Fri, May 14, 2010 at 4:25 PM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> From: Naveen Krishna <ch.naveen@samsung.com>
>
> This patch removes teh TYPE from touchscreen driver for Samsung SoCs
> and uses a Feature bit field instead.
>
> Signed-off-by: Naveen Krishna Ch <ch.naveen@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0drivers/input/touchscreen/s3c2410_ts.c | =A0 23 +++++-------------=
-----
> =A01 files changed, 5 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/input/touchscreen/s3c2410_ts.c b/drivers/input/t=
ouchscreen/s3c2410_ts.c
> index 8a970ea..aa43f93 100644
> --- a/drivers/input/touchscreen/s3c2410_ts.c
> +++ b/drivers/input/touchscreen/s3c2410_ts.c
> @@ -55,6 +55,8 @@
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S3C2410_ADCTSC_AUTO_P=
ST | \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 S3C2410_ADCTSC_XY_PST=
(0))
>
> +#define FEAT_PEN_IRQ =A0 (1 << 0) =A0 =A0 =A0 =A0/* HAS ADCCLRINTPND=
NUP */

It should be go header file for board files to use?

> +
> =A0/* Per-touchscreen data. */
>
> =A0/**
> @@ -81,17 +83,11 @@ struct s3c2410ts {
> =A0 =A0 =A0 =A0int irq_tc;
> =A0 =A0 =A0 =A0int count;
> =A0 =A0 =A0 =A0int shift;
> + =A0 =A0 =A0 int feat;
> =A0};

What's the 'feat'? How about to write 'features' exactly.
It's for plurals for future.

Thank you,
Kyungmin Park
>
> =A0static struct s3c2410ts ts;
>
> -enum s3c_cpu_type {
> - =A0 =A0 =A0 TYPE_S3C2410,
> - =A0 =A0 =A0 TYPE_S3C2440,
> - =A0 =A0 =A0 TYPE_S3C64XX, =A0 /* S3C64XX, S5P64XX Series */
> - =A0 =A0 =A0 TYPE_S5PV210, =A0 /* S5PV210 */
> -};
> -
> =A0/**
> =A0* get_down - return the down state of the pen
> =A0* @data0: The data read from ADCDAT0 register.
> @@ -179,7 +175,7 @@ static irqreturn_t stylus_irq(int irq, void *dev_=
id)
> =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_info(ts.dev, "%s: count=3D%d\n", _=
_func__, ts.count);
>
> - =A0 =A0 =A0 if (platform_get_device_id(pdev)->driver_data >=3D TYPE=
_S3C64XX) {
> + =A0 =A0 =A0 if (ts.feat & FEAT_PEN_IRQ) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Clear pen down/up interrupt */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0writel(0x0, ts.io + S3C64XX_ADCCLRINTP=
NDNUP);
> =A0 =A0 =A0 =A0}
> @@ -330,6 +326,7 @@ static int __devinit s3c2410ts_probe(struct platf=
orm_device *pdev)
> =A0 =A0 =A0 =A0ts.input->id.version =3D 0x0102;
>
> =A0 =A0 =A0 =A0ts.shift =3D info->oversampling_shift;
> + =A0 =A0 =A0 ts.feat =3D info->feature;
>
> =A0 =A0 =A0 =A0ret =3D request_irq(ts.irq_tc, stylus_irq, IRQF_DISABL=
ED,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0"s3c2410_ts_pen", =
ts.input);
> @@ -415,15 +412,6 @@ static struct dev_pm_ops s3c_ts_pmops =3D {
> =A0};
> =A0#endif
>
> -static struct platform_device_id s3cts_driver_ids[] =3D {
> - =A0 =A0 =A0 { "s3c2410-ts", TYPE_S3C2410 },
> - =A0 =A0 =A0 { "s3c2440-ts", TYPE_S3C2440 },
> - =A0 =A0 =A0 { "s3c64xx-ts", TYPE_S3C64XX },
> - =A0 =A0 =A0 { "s5pv210-ts", TYPE_S5PV210 },
> - =A0 =A0 =A0 { }
> -};
> -MODULE_DEVICE_TABLE(platform, s3cts_driver_ids);
> -
> =A0static struct platform_driver s3c_ts_driver =3D {
> =A0 =A0 =A0 =A0.driver =A0 =A0 =A0 =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "samsung-ts",
> @@ -432,7 +420,6 @@ static struct platform_driver s3c_ts_driver =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.pm =A0 =A0 =3D &s3c_ts_pmops,
> =A0#endif
> =A0 =A0 =A0 =A0},
> - =A0 =A0 =A0 .id_table =A0 =A0 =A0 =3D s3cts_driver_ids,
> =A0 =A0 =A0 =A0.probe =A0 =A0 =A0 =A0 =A0=3D s3c2410ts_probe,
> =A0 =A0 =A0 =A0.remove =A0 =A0 =A0 =A0 =3D __devexit_p(s3c2410ts_remo=
ve),
> =A0};
> --
> 1.6.2.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
