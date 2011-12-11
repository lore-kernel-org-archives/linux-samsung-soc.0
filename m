From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH 2/4] rtc-s3c: make room for more variants in devicetree block
Date: Sun, 11 Dec 2011 11:17:43 +0530
Message-ID: <CAJuYYwSvk1_tvNvukn-BQ4Z3JEeD15djs9xP_=jWz4vG-xs_nw@mail.gmail.com>
References: <201112091046.26563.heiko@sntech.de>
	<201112091050.11095.heiko@sntech.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:65007 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750728Ab1LKFro convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Sun, 11 Dec 2011 00:47:44 -0500
Received: by wgbdr13 with SMTP id dr13so8744242wgb.1
        for <linux-samsung-soc@vger.kernel.org>; Sat, 10 Dec 2011 21:47:43 -0800 (PST)
In-Reply-To: <201112091050.11095.heiko@sntech.de>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>
Cc: Kukjin Kim <kgene.kim@samsung.com>, ben-linux@fluff.org, a.zummo@towertech.it, Grant Likely <grant.likely@secretlab.ca>, rtc-linux@googlegroups.com, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, devicetree-discuss@lists.ozlabs.org

Hi Heiko,

On 9 December 2011 15:20, Heiko St=FCbner <heiko@sntech.de> wrote:
> Use the data field of of_device_id to hold the type for
> s3c_cpu_type.
>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
> =A0drivers/rtc/rtc-s3c.c | =A0 27 +++++++++++++++++++++------
> =A01 files changed, 21 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> index 175067a..71807a6 100644
> --- a/drivers/rtc/rtc-s3c.c
> +++ b/drivers/rtc/rtc-s3c.c
> @@ -428,11 +428,18 @@ static int __devexit s3c_rtc_remove(struct plat=
form_device *dev)
> =A0 =A0 =A0 =A0return 0;
> =A0}
>

This patch looks fine but the number of #ifdef's can be reduced in
this patch as below.

static const struct of_device_id s3c_rtc_dt_match[];

static inline int s3c_rtc_get_driver_data(struct platfrom_device *pdev)
{
#ifdef CONFIG_OF
         if (pdev->dev.of_node) {
                 const struct of_device_id *match;
                 match =3D of_match_node(s3c_rtc_dt_match, pdev->dev.of=
_node);
                 return match->data;
         }
#endif
         return platform_get_device_id(pdev)->driver_data;
}

> +#ifdef CONFIG_OF
> +static const struct of_device_id s3c_rtc_dt_match[];
> +#endif
> +
> =A0static int __devinit s3c_rtc_probe(struct platform_device *pdev)
> =A0{
> =A0 =A0 =A0 =A0struct rtc_device *rtc;
> =A0 =A0 =A0 =A0struct rtc_time rtc_tm;
> =A0 =A0 =A0 =A0struct resource *res;
> +#ifdef CONFIG_OF
> + =A0 =A0 =A0 const struct of_device_id *match;
> +#endif

*match not required here.

> =A0 =A0 =A0 =A0int ret;
>
> =A0 =A0 =A0 =A0pr_debug("%s: probe=3D%p\n", __func__, pdev);
> @@ -509,12 +516,15 @@ static int __devinit s3c_rtc_probe(struct platf=
orm_device *pdev)
> =A0 =A0 =A0 =A0}
>
> =A0#ifdef CONFIG_OF
> - =A0 =A0 =A0 if (pdev->dev.of_node)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_rtc_cpu_type =3D of_device_is_compa=
tible(pdev->dev.of_node,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "samsung,s3c6410-rtc") =
? TYPE_S3C64XX : TYPE_S3C2410;
> - =A0 =A0 =A0 else
> + =A0 =A0 =A0 if (pdev->dev.of_node) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 match =3D of_match_node(s3c_rtc_dt_matc=
h, pdev->dev.of_node);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_rtc_cpu_type =3D match->data;
> + =A0 =A0 =A0 } else {
> =A0#endif
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0s3c_rtc_cpu_type =3D platform_get_devi=
ce_id(pdev)->driver_data;
> +#ifdef CONFIG_OF
> + =A0 =A0 =A0 }
> +#endif

This gets replaced with

        s3c_rtc_cpu_type =3D s3c_rtc_get_driver_data(pdev);
>
> =A0 =A0 =A0 =A0/* Check RTC Time */
>
> @@ -638,8 +648,13 @@ static int s3c_rtc_resume(struct platform_device=
 *pdev)
>
> =A0#ifdef CONFIG_OF
> =A0static const struct of_device_id s3c_rtc_dt_match[] =3D {
> - =A0 =A0 =A0 { .compatible =3D "samsung,s3c2410-rtc" },
> - =A0 =A0 =A0 { .compatible =3D "samsung,s3c6410-rtc" },
> + =A0 =A0 =A0 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .compatible =3D "samsung,s3c2410-rtc"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .data =3D TYPE_S3C2410,
> + =A0 =A0 =A0 }, {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .compatible =3D "samsung,s3c6410-rtc"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .data =3D TYPE_S3C64XX,
> + =A0 =A0 =A0 },
> =A0 =A0 =A0 =A0{},
> =A0};
> =A0MODULE_DEVICE_TABLE(of, s3c_rtc_dt_match);
> --
> 1.7.5.4
>

Patch looks fine except the #ifdef's which can be reduced.
Reviewed-by: Thomas Abraham <thomas.abraham@linaro.org>

Regards,
Thomas.
