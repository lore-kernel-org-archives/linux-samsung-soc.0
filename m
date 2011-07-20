From: Jassi Brar <jassisinghbrar@gmail.com>
Subject: Re: [PATCH V4 01/13] DMA: PL330: Add support runtime PM for PL330 DMAC
Date: Thu, 21 Jul 2011 00:05:26 +0530
Message-ID: <CABb+yY3iseS4pSc1TbUxJ+axC=h5EYEA+JRumZcJt8f0x3FCTg@mail.gmail.com>
References: <1311158773-30314-1-git-send-email-boojin.kim@samsung.com>
	<1311158773-30314-2-git-send-email-boojin.kim@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mail-ew0-f46.google.com ([209.85.215.46]:50754 "EHLO
	mail-ew0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751921Ab1GTSf1 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Wed, 20 Jul 2011 14:35:27 -0400
Received: by ewy4 with SMTP id 4so725591ewy.19
        for <linux-samsung-soc@vger.kernel.org>; Wed, 20 Jul 2011 11:35:26 -0700 (PDT)
In-Reply-To: <1311158773-30314-2-git-send-email-boojin.kim@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Boojin Kim <boojin.kim@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, Vinod Koul <vinod.koul@intel.com>, Dan Williams <dan.j.williams@intel.com>, Kukjin Kim <kgene.kim@samsung.com>

On Wed, Jul 20, 2011 at 4:16 PM, Boojin Kim <boojin.kim@samsung.com> wr=
ote:
> Signed-off-by: Boojin Kim <boojin.kim@samsung.com>
> Cc: Vinod Koul <vinod.koul@intel.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Kukjin Kim <kgene.kim@samsung.com>

Acked-by: Jassi Brar <jassisinghbrar@gmail.com>


> ---
> =C2=A0drivers/dma/pl330.c | =C2=A0 75 +++++++++++++++++++++++++++++++=
++++++++++++++++++-
> =C2=A01 files changed, 73 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
> index 6abe1ec..b7ecf47 100644
> --- a/drivers/dma/pl330.c
> +++ b/drivers/dma/pl330.c
> @@ -17,6 +17,7 @@
> =C2=A0#include <linux/interrupt.h>
> =C2=A0#include <linux/amba/bus.h>
> =C2=A0#include <linux/amba/pl330.h>
> +#include <linux/pm_runtime.h>
>
> =C2=A0#define NR_DEFAULT_DESC =C2=A0 =C2=A0 =C2=A0 =C2=A016
>
> @@ -83,6 +84,8 @@ struct dma_pl330_dmac {
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Peripheral channels connected to this D=
MAC */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct dma_pl330_chan peripherals[0]; /* k=
eep at end */
> +
> + =C2=A0 =C2=A0 =C2=A0 struct clk *clk;
> =C2=A0};
>
> =C2=A0struct dma_pl330_desc {
> @@ -696,6 +699,30 @@ pl330_probe(struct amba_device *adev, const stru=
ct amba_id *id)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto probe_err=
1;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>
> + =C2=A0 =C2=A0 =C2=A0 pdmac->clk =3D clk_get(&adev->dev, "dma");
> + =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(pdmac->clk)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&adev->dev=
, "Cannot get operation clock.\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -EINVAL;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto probe_err1;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 amba_set_drvdata(adev, pdmac);
> +
> +#ifdef CONFIG_PM_RUNTIME
> + =C2=A0 =C2=A0 =C2=A0 /* to use the runtime PM helper functions */
> + =C2=A0 =C2=A0 =C2=A0 pm_runtime_enable(&adev->dev);
> +
> + =C2=A0 =C2=A0 =C2=A0 /* enable the power domain */
> + =C2=A0 =C2=A0 =C2=A0 if (pm_runtime_get_sync(&adev->dev)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(&adev->dev=
, "failed to get runtime pm\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D -ENODEV;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto probe_err1;
> + =C2=A0 =C2=A0 =C2=A0 }
> +#else
> + =C2=A0 =C2=A0 =C2=A0 /* enable dma clk */
> + =C2=A0 =C2=A0 =C2=A0 clk_enable(pdmac->clk);
> +#endif
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0irq =3D adev->irq[0];
> =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D request_irq(irq, pl330_irq_handler=
, 0,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0dev_name(&adev->dev), pi);
> @@ -763,8 +790,6 @@ pl330_probe(struct amba_device *adev, const struc=
t amba_id *id)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0goto probe_err=
4;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>
> - =C2=A0 =C2=A0 =C2=A0 amba_set_drvdata(adev, pdmac);
> -
> =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_info(&adev->dev,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"Loaded driver=
 for PL330 DMAC-%d\n", adev->periphid);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0dev_info(&adev->dev,
> @@ -825,6 +850,13 @@ static int __devexit pl330_remove(struct amba_de=
vice *adev)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0res =3D &adev->res;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0release_mem_region(res->start, resource_si=
ze(res));
>
> +#ifdef CONFIG_PM_RUNTIME
> + =C2=A0 =C2=A0 =C2=A0 pm_runtime_put(&adev->dev);
> + =C2=A0 =C2=A0 =C2=A0 pm_runtime_disable(&adev->dev);
> +#else
> + =C2=A0 =C2=A0 =C2=A0 clk_disable(pdmac->clk);
> +#endif
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0kfree(pdmac);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> @@ -838,10 +870,49 @@ static struct amba_id pl330_ids[] =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0{ 0, 0 },
> =C2=A0};
>
> +#ifdef CONFIG_PM_RUNTIME
> +static int pl330_runtime_suspend(struct device *dev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct dma_pl330_dmac *pdmac =3D dev_get_drvda=
ta(dev);
> +
> + =C2=A0 =C2=A0 =C2=A0 if (!pdmac) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(dev, "fail=
ed to get dmac\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 clk_disable(pdmac->clk);
> +
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}
> +
> +static int pl330_runtime_resume(struct device *dev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct dma_pl330_dmac *pdmac =3D dev_get_drvda=
ta(dev);
> +
> + =C2=A0 =C2=A0 =C2=A0 if (!pdmac) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_err(dev, "fail=
ed to get dmac\n");
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENODEV;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 clk_enable(pdmac->clk);
> +
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}
> +#else
> +#define pl330_runtime_suspend =C2=A0NULL
> +#define pl330_runtime_resume =C2=A0 NULL
> +#endif /* CONFIG_PM_RUNTIME */
> +
> +static const struct dev_pm_ops pl330_pm_ops =3D {
> + =C2=A0 =C2=A0 =C2=A0 .runtime_suspend =3D pl330_runtime_suspend,
> + =C2=A0 =C2=A0 =C2=A0 .runtime_resume =3D pl330_runtime_resume,
> +};
> +
> =C2=A0static struct amba_driver pl330_driver =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.drv =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.owner =3D THI=
S_MODULE,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D "dma=
-pl330",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .pm =3D &pl330_pm_=
ops,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0},
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.id_table =3D pl330_ids,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.probe =3D pl330_probe,
> --
> 1.7.1
>
>
