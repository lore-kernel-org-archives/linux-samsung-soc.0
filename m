From: Alim Akhtar <alim.akhtar@gmail.com>
Subject: Re: [PATCH 1/7] DMA: PL330: Add support runtime PM for PL330 DMAC
Date: Tue, 5 Jul 2011 11:41:46 +0530
Message-ID: <CAGOxZ50KGjHM6hUJQ1uEJsQqAzZ7aV+TcYRyhDB=sWQvtTDTxg@mail.gmail.com>
References: <1309781915-31549-1-git-send-email-kgene.kim@samsung.com> <1309781915-31549-2-git-send-email-kgene.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:35404 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753600Ab1GEGM3 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Tue, 5 Jul 2011 02:12:29 -0400
Received: by wyg8 with SMTP id 8so3759201wyg.19
        for <linux-samsung-soc@vger.kernel.org>; Mon, 04 Jul 2011 23:12:27 -0700 (PDT)
In-Reply-To: <1309781915-31549-2-git-send-email-kgene.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Kukjin Kim <kgene.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Grant Likely <grant.likely@secretlab.ca>, Jassi Brar <jassisinghbrar@gmail.com>, Liam Girdwood <lrg@ti.com>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Boojin Kim <boojin.kim@samsung.com>

Hi,

On Mon, Jul 4, 2011 at 5:48 PM, Kukjin Kim <kgene.kim@samsung.com> wrot=
e:
> From: Boojin Kim <boojin.kim@samsung.com>
>
> Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
> Cc: Vinod Koul <vinod.koul@intel.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>
> ---
> =A0drivers/dma/pl330.c | =A0 61 +++++++++++++++++++++++++++++++++++++=
++++++++++++++
> =A01 files changed, 61 insertions(+), 0 deletions(-)
>
> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> index 6abe1ec..7bd72e9 100644
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c
> @@ -17,6 +17,7 @@
> =A0#include <linux/interrupt.h>
> =A0#include <linux/amba/bus.h>
> =A0#include <linux/amba/pl330.h>
> +#include <linux/pm_runtime.h>
>
> =A0#define NR_DEFAULT_DESC =A0 =A0 =A0 =A016
>
> @@ -666,6 +667,7 @@ pl330_probe(struct amba_device *adev, const struc=
t amba_id *id)
> =A0 =A0 =A0 =A0struct dma_device *pd;
> =A0 =A0 =A0 =A0struct resource *res;
> =A0 =A0 =A0 =A0int i, ret, irq;
> + =A0 =A0 =A0 struct clk* clk;
>
> =A0 =A0 =A0 =A0pdat =3D adev->dev.platform_data;
>
> @@ -696,6 +698,28 @@ pl330_probe(struct amba_device *adev, const stru=
ct amba_id *id)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto probe_err1;
> =A0 =A0 =A0 =A0}
>
> +#ifdef CONFIG_PM_RUNTIME
> + =A0 =A0 =A0 /* to use the runtime PM helper functions */
> + =A0 =A0 =A0 pm_runtime_enable(&adev->dev);
> +
> + =A0 =A0 =A0 /* enable the power domain */
> + =A0 =A0 =A0 if (pm_runtime_get_sync(&adev->dev)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&adev->dev, "failed to get runt=
ime pm\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENODEV;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto probe_err1;
> + =A0 =A0 =A0 }
> +#else
> + =A0 =A0 =A0 /* enable dma clk */
> + =A0 =A0 =A0 clk =3D clk_get(&adev->dev, "dma");

Does this really needed here?
AFAIR, amba_get_enable_pclk() does the same thing, provided clock name
as "apb_pclk"
please have a look at drivers/amba/bus.c

> +
> + =A0 =A0 =A0 if (IS_ERR(clk)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&adev->dev, "Cannot get operati=
on clock.\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -EINVAL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto probe_err1;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 clk_enable(clk);
> +#endif
> +
> =A0 =A0 =A0 =A0irq =3D adev->irq[0];
> =A0 =A0 =A0 =A0ret =3D request_irq(irq, pl330_irq_handler, 0,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dev_name(&adev->dev), =
pi);
> @@ -838,10 +862,47 @@ static struct amba_id pl330_ids[] =3D {
> =A0 =A0 =A0 =A0{ 0, 0 },
> =A0};
>
> +#ifdef CONFIG_PM_RUNTIME
> +static int pl330_runtime_suspend(struct device *dev)
> +{
> + =A0 =A0 =A0 struct clk *dmaclk =3D clk_get(dev, "dma");
> +
> + =A0 =A0 =A0 if (dmaclk =3D=3D NULL) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "failed to find dma clock =
source\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 clk_disable(dmaclk);
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static int pl330_runtime_resume(struct device *dev)
> +{
> + =A0 =A0 =A0 struct clk *dmaclk =3D clk_get(dev, "dma");
> +
> + =A0 =A0 =A0 if (dmaclk =3D=3D NULL) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(dev, "failed to find dma clock =
source\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENODEV;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 clk_enable(dmaclk);
> + =A0 =A0 =A0 return 0;
> +}
> +#else
> +#define pl330_runtime_suspend =A0NULL
> +#define pl330_runtime_resume =A0 NULL
> +#endif /* CONFIG_PM_RUNTIME */
> +
> +static const struct dev_pm_ops pl330_pm_ops =3D {
> + =A0 =A0 =A0 .runtime_suspend =3D pl330_runtime_suspend,
> + =A0 =A0 =A0 .runtime_resume =3D pl330_runtime_resume,
> +};
> +
> =A0static struct amba_driver pl330_driver =3D {
> =A0 =A0 =A0 =A0.drv =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.owner =3D THIS_MODULE,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =3D "dma-pl330",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .pm =3D &pl330_pm_ops,
> =A0 =A0 =A0 =A0},
> =A0 =A0 =A0 =A0.id_table =3D pl330_ids,
> =A0 =A0 =A0 =A0.probe =3D pl330_probe,
> --
> 1.7.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-samsu=
ng-soc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
