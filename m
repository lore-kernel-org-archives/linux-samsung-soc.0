From: Kyungmin Park <kmpark@infradead.org>
Subject: Re: [PATCH 5/5] ARM: SAMSUNG: Add to enable/disable clock on S3C PL330
Date: Thu, 21 Oct 2010 10:32:51 +0900
Message-ID: <AANLkTi=ZTBuPBDL4MZ7MPn3Ha_cNhyShosyzn8q6QF3N@mail.gmail.com>
References: <1287622713-1657-1-git-send-email-kgene.kim@samsung.com>
	<1287622713-1657-6-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:36933 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753002Ab0JUBcy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Oct 2010 21:32:54 -0400
Received: by wyb28 with SMTP id 28so4507394wyb.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Oct 2010 18:32:52 -0700 (PDT)
In-Reply-To: <1287622713-1657-6-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, ben-linux@fluff.org, Seungwhan Youn <sw.youn@samsung.com>

On Thu, Oct 21, 2010 at 9:58 AM, Kukjin Kim <kgene.kim@samsung.com> wro=
te:
> From: Seungwhan Youn <sw.youn@samsung.com>
>
> This patch adds to enable/disable DMA operation clock on S3C-PL330
> DMA controller driver.

The title and description seems to clock gating but actual code is
just enable at probe and disable at remove.

Can you make it REAL clock gating, enable clock only when using?

Thank you,
Kyungmin Park
>
> Signed-off-by: Seungwhan Youn <sw.youn@samsung.com>
> Acked-by: Jassi Brar <jassi.brar@samsung.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0arch/arm/plat-samsung/s3c-pl330.c | =A0 34 +++++++++++++++++++++++=
++++-------
> =A01 files changed, 27 insertions(+), 7 deletions(-)
>
> diff --git a/arch/arm/plat-samsung/s3c-pl330.c b/arch/arm/plat-samsun=
g/s3c-pl330.c
> index a91305a..b4ff8d7 100644
> --- a/arch/arm/plat-samsung/s3c-pl330.c
> +++ b/arch/arm/plat-samsung/s3c-pl330.c
> @@ -15,6 +15,8 @@
> =A0#include <linux/io.h>
> =A0#include <linux/slab.h>
> =A0#include <linux/platform_device.h>
> +#include <linux/clk.h>
> +#include <linux/err.h>
>
> =A0#include <asm/hardware/pl330.h>
>
> @@ -27,6 +29,7 @@
> =A0* @node: To attach to the global list of DMACs.
> =A0* @pi: PL330 configuration info for the DMAC.
> =A0* @kmcache: Pool to quickly allocate xfers for all channels in the=
 dmac.
> + * @clk: Pointer of DMAC operation clock.
> =A0*/
> =A0struct s3c_pl330_dmac {
> =A0 =A0 =A0 =A0unsigned =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0busy_chan;
> @@ -34,6 +37,7 @@ struct s3c_pl330_dmac {
> =A0 =A0 =A0 =A0struct list_head =A0 =A0 =A0 =A0node;
> =A0 =A0 =A0 =A0struct pl330_info =A0 =A0 =A0 *pi;
> =A0 =A0 =A0 =A0struct kmem_cache =A0 =A0 =A0 *kmcache;
> + =A0 =A0 =A0 struct clk =A0 =A0 =A0 =A0 =A0 =A0 =A0*clk;
> =A0};
>
> =A0/**
> @@ -1072,16 +1076,25 @@ static int pl330_probe(struct platform_device=
 *pdev)
> =A0 =A0 =A0 =A0if (ret)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto probe_err4;
>
> - =A0 =A0 =A0 ret =3D pl330_add(pl330_info);
> - =A0 =A0 =A0 if (ret)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto probe_err5;
> -
> =A0 =A0 =A0 =A0/* Allocate a new DMAC */
> =A0 =A0 =A0 =A0s3c_pl330_dmac =3D kmalloc(sizeof(*s3c_pl330_dmac), GF=
P_KERNEL);
> =A0 =A0 =A0 =A0if (!s3c_pl330_dmac) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D -ENOMEM;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto probe_err5;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* Get operation clock and enable it */
> + =A0 =A0 =A0 s3c_pl330_dmac->clk =3D clk_get(&pdev->dev, "pdma");
> + =A0 =A0 =A0 if (IS_ERR(s3c_pl330_dmac->clk)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "Cannot get operati=
on clock.\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto probe_err6;
> =A0 =A0 =A0 =A0}
> + =A0 =A0 =A0 clk_enable(s3c_pl330_dmac->clk);
> +
> + =A0 =A0 =A0 ret =3D pl330_add(pl330_info);
> + =A0 =A0 =A0 if (ret)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto probe_err7;
>
> =A0 =A0 =A0 =A0/* Hook the info */
> =A0 =A0 =A0 =A0s3c_pl330_dmac->pi =3D pl330_info;
> @@ -1094,7 +1107,7 @@ static int pl330_probe(struct platform_device *=
pdev)
>
> =A0 =A0 =A0 =A0if (!s3c_pl330_dmac->kmcache) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D -ENOMEM;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto probe_err7;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto probe_err8;
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0/* Get the list of peripherals */
> @@ -1120,10 +1133,13 @@ static int pl330_probe(struct platform_device=
 *pdev)
>
> =A0 =A0 =A0 =A0return 0;
>
> +probe_err8:
> + =A0 =A0 =A0 pl330_del(pl330_info);
> =A0probe_err7:
> - =A0 =A0 =A0 kfree(s3c_pl330_dmac);
> + =A0 =A0 =A0 clk_disable(s3c_pl330_dmac->clk);
> + =A0 =A0 =A0 clk_put(s3c_pl330_dmac->clk);
> =A0probe_err6:
> - =A0 =A0 =A0 pl330_del(pl330_info);
> + =A0 =A0 =A0 kfree(s3c_pl330_dmac);
> =A0probe_err5:
> =A0 =A0 =A0 =A0free_irq(irq, pl330_info);
> =A0probe_err4:
> @@ -1188,6 +1204,10 @@ static int pl330_remove(struct platform_device=
 *pdev)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0}
>
> + =A0 =A0 =A0 /* Disable operation clock */
> + =A0 =A0 =A0 clk_disable(dmac->clk);
> + =A0 =A0 =A0 clk_put(dmac->clk);
> +
> =A0 =A0 =A0 =A0/* Remove the DMAC */
> =A0 =A0 =A0 =A0list_del(&dmac->node);
> =A0 =A0 =A0 =A0kfree(dmac);
> --
> 1.6.2.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
