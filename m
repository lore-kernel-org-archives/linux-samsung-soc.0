From: Thomas Abraham <thomas.abraham@linaro.org>
Subject: Re: [PATCH] rtc: rtc-s3c: Add device tree support
Date: Tue, 11 Oct 2011 12:35:27 +0530
Message-ID: <CAJuYYwQdeD=DEFSBqTTJM_EQcc517LPDy4w-N+mbHdH8Eqh=Dg@mail.gmail.com>
References: <1315064959-16930-1-git-send-email-thomas.abraham@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:61489 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750776Ab1JKHF2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 11 Oct 2011 03:05:28 -0400
Received: by ggnv2 with SMTP id v2so5352447ggn.19
        for <linux-samsung-soc@vger.kernel.org>; Tue, 11 Oct 2011 00:05:27 -0700 (PDT)
In-Reply-To: <1315064959-16930-1-git-send-email-thomas.abraham@linaro.org>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: rtc-linux@googlegroups.com
Cc: devicetree-discuss@lists.ozlabs.org, grant.likely@secretlab.ca, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, kgene.kim@samsung.com, ben-linux@fluff.org

On 3 September 2011 21:19, Thomas Abraham <thomas.abraham@linaro.org> w=
rote:
> Add device tree based discovery support for Samsung's rtc controller.
>
> Cc: Ben Dooks <ben-linux@fluff.org>
> Signed-off-by: Thomas Abraham <thomas.abraham@linaro.org>
> ---
> =A0Documentation/devicetree/bindings/rtc/s3c-rtc.txt | =A0 20 +++++++=
+++++++++++++
> =A0drivers/rtc/rtc-s3c.c =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 | =A0 21 ++++++++++++++++++++-
> =A02 files changed, 40 insertions(+), 1 deletions(-)
> =A0create mode 100644 Documentation/devicetree/bindings/rtc/s3c-rtc.t=
xt

Ping. Any comments for this patch? If this looks fine, can this be
considered for 3.2 merge via the Samsung kernel tree.

Thanks,
Thomas.

>
> diff --git a/Documentation/devicetree/bindings/rtc/s3c-rtc.txt b/Docu=
mentation/devicetree/bindings/rtc/s3c-rtc.txt
> new file mode 100644
> index 0000000..90ec45f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/rtc/s3c-rtc.txt
> @@ -0,0 +1,20 @@
> +* Samsung's S3C Real Time Clock controller
> +
> +Required properties:
> +- compatible: should be one of the following.
> + =A0 =A0* "samsung,s3c2410-rtc" - for controllers compatible with s3=
c2410 rtc.
> + =A0 =A0* "samsung,s3c6410-rtc" - for controllers compatible with s3=
c6410 rtc.
> +- reg: physical base address of the controller and length of memory =
mapped
> + =A0region.
> +- interrupts: Two interrupt numbers to the cpu should be specified. =
=46irst
> + =A0interrupt number is the rtc alarm interupt and second interrupt =
number
> + =A0is the rtc tick interrupt. The number of cells representing a in=
terrupt
> + =A0depends on the parent interrupt controller.
> +
> +Example:
> +
> + =A0 =A0 =A0 rtc@10070000 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 compatible =3D "samsung,s3c6410-rtc";
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 reg =3D <0x10070000 0x100>;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 interrupts =3D <44 0 45 0>;
> + =A0 =A0 =A0 };
> diff --git a/drivers/rtc/rtc-s3c.c b/drivers/rtc/rtc-s3c.c
> index 4e7c04e..29f928c 100644
> --- a/drivers/rtc/rtc-s3c.c
> +++ b/drivers/rtc/rtc-s3c.c
> @@ -25,6 +25,7 @@
> =A0#include <linux/clk.h>
> =A0#include <linux/log2.h>
> =A0#include <linux/slab.h>
> +#include <linux/of.h>
>
> =A0#include <mach/hardware.h>
> =A0#include <asm/uaccess.h>
> @@ -481,7 +482,13 @@ static int __devinit s3c_rtc_probe(struct platfo=
rm_device *pdev)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto err_nortc;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 s3c_rtc_cpu_type =3D platform_get_device_id(pdev)->driv=
er_data;
> +#ifdef CONFIG_OF
> + =A0 =A0 =A0 if (pdev->dev.of_node)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_rtc_cpu_type =3D of_device_is_compa=
tible(pdev->dev.of_node,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "samsung,s3c6410-rtc") =
? TYPE_S3C64XX : TYPE_S3C2410;
> + =A0 =A0 =A0 else
> +#endif
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 s3c_rtc_cpu_type =3D platform_get_devic=
e_id(pdev)->driver_data;
>
> =A0 =A0 =A0 =A0/* Check RTC Time */
>
> @@ -603,6 +610,17 @@ static int s3c_rtc_resume(struct platform_device=
 *pdev)
> =A0#define s3c_rtc_resume =A0NULL
> =A0#endif
>
> +#ifdef CONFIG_OF
> +static const struct of_device_id s3c_rtc_dt_match[] =3D {
> + =A0 =A0 =A0 { .compatible =3D "samsung,s3c2410-rtc" },
> + =A0 =A0 =A0 { .compatible =3D "samsung,s3c6410-rtc" },
> + =A0 =A0 =A0 {},
> +};
> +MODULE_DEVICE_TABLE(of, s3c_rtc_dt_match);
> +#else
> +#define s3c_rtc_dt_match NULL
> +#endif
> +
> =A0static struct platform_device_id s3c_rtc_driver_ids[] =3D {
> =A0 =A0 =A0 =A0{
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =A0 =A0 =A0 =A0 =3D "s3c2410=
-rtc",
> @@ -625,6 +643,7 @@ static struct platform_driver s3c_rtc_driver =3D =
{
> =A0 =A0 =A0 =A0.driver =A0 =A0 =A0 =A0 =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =A0 =3D "s3c-rtc",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.owner =A0=3D THIS_MODULE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .of_match_table =3D s3c_rtc_dt_match,
> =A0 =A0 =A0 =A0},
> =A0};
>
> --
> 1.6.6.rc2
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
