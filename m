From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH] drm/exynos: consider deferred probe case
Date: Thu, 29 May 2014 18:29:52 +0900
Message-ID: <5386FE10.5020802@samsung.com>
References: <1401355635-6883-1-git-send-email-inki.dae@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:65113 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932814AbaE2J3z (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 29 May 2014 05:29:55 -0400
Received: from epcpsbgr2.samsung.com
 (u142.gpu120.samsung.co.kr [203.254.230.142])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N6B00FZPX1TO720@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 29 May 2014 18:29:53 +0900 (KST)
In-reply-to: <1401355635-6883-1-git-send-email-inki.dae@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Inki Dae <inki.dae@samsung.com>
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, a.hajda@samsung.com


Sorry for wrong patch version. Ignore this patch.

Thanks,
Inki Dae


On 2014=EB=85=84 05=EC=9B=94 29=EC=9D=BC 18:27, Inki Dae wrote:
> This patch makes sure that exynos drm framework handles deferred
> probe case correctly.
>=20
> Sub drivers could be probed before resources, clock, regulator,
> phy or panel, are ready for them so we should make sure that exynos
> drm core waits until all resources are ready and sub drivers are
> probed correctly.
>=20
> Chagelog v2:
> - Make sure that exynos drm core tries to bind sub drivers only in ca=
se that
>   they have a pair: crtc and encoder/connector components should be a=
 pair.
> - Remove unnecessary patch:
>   drm/exynos: mipi-dsi: consider panel driver-deferred probe
> - Return error type correctly.
>=20
> Signed-off-by: Inki Dae <inki.dae@samsung.com>
> Acked-by: Kyungmin Park <kyungmin.park@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_dp_core.c  |   18 +++-
>  drivers/gpu/drm/exynos/exynos_drm_dpi.c  |   22 ++++-
>  drivers/gpu/drm/exynos/exynos_drm_drv.c  |  139 ++++++++++++++++++++=
+++++-----
>  drivers/gpu/drm/exynos/exynos_drm_drv.h  |   13 ++-
>  drivers/gpu/drm/exynos/exynos_drm_dsi.c  |   41 ++++++---
>  drivers/gpu/drm/exynos/exynos_drm_fimd.c |   51 ++++++++---
>  drivers/gpu/drm/exynos/exynos_hdmi.c     |   78 ++++++++++++-----
>  drivers/gpu/drm/exynos/exynos_mixer.c    |   17 +++-
>  8 files changed, 304 insertions(+), 75 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_dp_core.c b/drivers/gpu/dr=
m/exynos/exynos_dp_core.c
> index ff63901..a892586 100644
> --- a/drivers/gpu/drm/exynos/exynos_dp_core.c
> +++ b/drivers/gpu/drm/exynos/exynos_dp_core.c
> @@ -1328,12 +1328,26 @@ static const struct component_ops exynos_dp_o=
ps =3D {
> =20
>  static int exynos_dp_probe(struct platform_device *pdev)
>  {
> -	return exynos_drm_component_add(&pdev->dev, &exynos_dp_ops);
> +	int ret;
> +
> +	ret =3D exynos_drm_component_add(&pdev->dev, EXYNOS_DEVICE_TYPE_CON=
NECTOR,
> +					exynos_dp_display.type);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D component_add(&pdev->dev, &exynos_dp_ops);
> +	if (ret)
> +		exynos_drm_component_del(&pdev->dev,
> +						EXYNOS_DEVICE_TYPE_CONNECTOR);
> +
> +	return ret;
>  }
> =20
>  static int exynos_dp_remove(struct platform_device *pdev)
>  {
> -	exynos_drm_component_del(&pdev->dev, &exynos_dp_ops);
> +	component_del(&pdev->dev, &exynos_dp_ops);
> +	exynos_drm_component_del(&pdev->dev, EXYNOS_DEVICE_TYPE_CONNECTOR);
> +
>  	return 0;
>  }
> =20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dpi.c b/drivers/gpu/dr=
m/exynos/exynos_drm_dpi.c
> index a832364..f1b8587 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dpi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dpi.c
> @@ -295,9 +295,15 @@ struct exynos_drm_display *exynos_dpi_probe(stru=
ct device *dev)
>  	struct exynos_dpi *ctx;
>  	int ret;
> =20
> +	ret =3D exynos_drm_component_add(dev,
> +					EXYNOS_DEVICE_TYPE_CONNECTOR,
> +					exynos_dpi_display.type);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>  	ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
>  	if (!ctx)
> -		return NULL;
> +		goto err_del_component;
> =20
>  	ctx->dev =3D dev;
>  	exynos_dpi_display.ctx =3D ctx;
> @@ -306,16 +312,24 @@ struct exynos_drm_display *exynos_dpi_probe(str=
uct device *dev)
>  	ret =3D exynos_dpi_parse_dt(ctx);
>  	if (ret < 0) {
>  		devm_kfree(dev, ctx);
> -		return NULL;
> +		goto err_del_component;
>  	}
> =20
>  	if (ctx->panel_node) {
>  		ctx->panel =3D of_drm_find_panel(ctx->panel_node);
> -		if (!ctx->panel)
> +		if (!ctx->panel) {
> +			exynos_drm_component_del(dev,
> +						EXYNOS_DEVICE_TYPE_CONNECTOR);
>  			return ERR_PTR(-EPROBE_DEFER);
> +		}
>  	}
> =20
>  	return &exynos_dpi_display;
> +
> +err_del_component:
> +	exynos_drm_component_del(dev, EXYNOS_DEVICE_TYPE_CONNECTOR);
> +
> +	return NULL;
>  }
> =20
>  int exynos_dpi_remove(struct device *dev)
> @@ -327,5 +341,7 @@ int exynos_dpi_remove(struct device *dev)
>  	encoder->funcs->destroy(encoder);
>  	drm_connector_cleanup(&ctx->connector);
> =20
> +	exynos_drm_component_del(dev, EXYNOS_DEVICE_TYPE_CONNECTOR);
> +
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/dr=
m/exynos/exynos_drm_drv.c
> index c5a401ae..72a5de1 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -48,7 +48,10 @@ static LIST_HEAD(drm_component_list);
> =20
>  struct component_dev {
>  	struct list_head list;
> -	struct device *dev;
> +	struct device *crtc_dev;
> +	struct device *conn_dev;
> +	enum exynos_drm_output_type out_type;
> +	unsigned int dev_type_flag;
>  };
> =20
>  static int exynos_drm_load(struct drm_device *dev, unsigned long fla=
gs)
> @@ -382,22 +385,65 @@ static const struct dev_pm_ops exynos_drm_pm_op=
s =3D {
>  };
> =20
>  int exynos_drm_component_add(struct device *dev,
> -				const struct component_ops *ops)
> +				enum exynos_drm_device_type dev_type,
> +				enum exynos_drm_output_type out_type)
>  {
>  	struct component_dev *cdev;
> -	int ret;
> +
> +	if (dev_type !=3D EXYNOS_DEVICE_TYPE_CRTC &&
> +			dev_type !=3D EXYNOS_DEVICE_TYPE_CONNECTOR) {
> +		DRM_ERROR("invalid device type.\n");
> +		return -EINVAL;
> +	}
> +
> +	mutex_lock(&drm_component_lock);
> +
> +	/*
> +	 * Make sure to check if there is a component which has two device
> +	 * objects, for connector and for encoder/connector.
> +	 * It should make sure that crtc and encoder/connector drivers are
> +	 * ready before exynos drm core binds them.
> +	 */
> +	list_for_each_entry(cdev, &drm_component_list, list) {
> +		if (cdev->out_type =3D=3D out_type) {
> +			/*
> +			 * If crtc and encoder/connector device objects are
> +			 * added already just return.
> +			 */
> +			if (cdev->dev_type_flag =3D=3D (EXYNOS_DEVICE_TYPE_CRTC |
> +						EXYNOS_DEVICE_TYPE_CONNECTOR)) {
> +				mutex_unlock(&drm_component_lock);
> +				return 0;
> +			}
> +
> +			if (dev_type =3D=3D EXYNOS_DEVICE_TYPE_CRTC) {
> +				cdev->crtc_dev =3D dev;
> +				cdev->dev_type_flag |=3D dev_type;
> +			}
> +
> +			if (dev_type =3D=3D EXYNOS_DEVICE_TYPE_CONNECTOR) {
> +				cdev->conn_dev =3D dev;
> +				cdev->dev_type_flag |=3D dev_type;
> +			}
> +
> +			mutex_unlock(&drm_component_lock);
> +			return 0;
> +		}
> +	}
> +
> +	mutex_unlock(&drm_component_lock);
> =20
>  	cdev =3D kzalloc(sizeof(*cdev), GFP_KERNEL);
>  	if (!cdev)
>  		return -ENOMEM;
> =20
> -	ret =3D component_add(dev, ops);
> -	if (ret) {
> -		kfree(cdev);
> -		return ret;
> -	}
> +	if (dev_type =3D=3D EXYNOS_DEVICE_TYPE_CRTC)
> +		cdev->crtc_dev =3D dev;
> +	if (dev_type =3D=3D EXYNOS_DEVICE_TYPE_CONNECTOR)
> +		cdev->conn_dev =3D dev;
> =20
> -	cdev->dev =3D dev;
> +	cdev->out_type =3D out_type;
> +	cdev->dev_type_flag =3D dev_type;
> =20
>  	mutex_lock(&drm_component_lock);
>  	list_add_tail(&cdev->list, &drm_component_list);
> @@ -407,23 +453,40 @@ int exynos_drm_component_add(struct device *dev=
,
>  }
> =20
>  void exynos_drm_component_del(struct device *dev,
> -				const struct component_ops *ops)
> +				enum exynos_drm_device_type dev_type)
>  {
>  	struct component_dev *cdev, *next;
> =20
>  	mutex_lock(&drm_component_lock);
> =20
>  	list_for_each_entry_safe(cdev, next, &drm_component_list, list) {
> -		if (dev =3D=3D cdev->dev) {
> +		if (dev_type =3D=3D EXYNOS_DEVICE_TYPE_CRTC) {
> +			if (cdev->crtc_dev =3D=3D dev) {
> +				cdev->crtc_dev =3D NULL;
> +				cdev->dev_type_flag &=3D ~dev_type;
> +			}
> +		}
> +
> +		if (dev_type =3D=3D EXYNOS_DEVICE_TYPE_CONNECTOR) {
> +			if (cdev->conn_dev =3D=3D dev) {
> +				cdev->conn_dev =3D NULL;
> +				cdev->dev_type_flag &=3D ~dev_type;
> +			}
> +		}
> +
> +		/*
> +		 * Release cdev object only in case that both of crtc and
> +		 * encoder/connector device objects are NULL.
> +		 */
> +		if (!cdev->crtc_dev && !cdev->conn_dev) {
>  			list_del(&cdev->list);
>  			kfree(cdev);
> -			break;
>  		}
> +
> +		break;
>  	}
> =20
>  	mutex_unlock(&drm_component_lock);
> -
> -	component_del(dev, ops);
>  }
> =20
>  static int compare_of(struct device *dev, void *data)
> @@ -433,29 +496,61 @@ static int compare_of(struct device *dev, void =
*data)
> =20
>  static int exynos_drm_add_components(struct device *dev, struct mast=
er *m)
>  {
> -	unsigned int attached_cnt =3D 0;
>  	struct component_dev *cdev;
> +	unsigned int attach_cnt =3D 0;
> =20
>  	mutex_lock(&drm_component_lock);
> =20
>  	list_for_each_entry(cdev, &drm_component_list, list) {
>  		int ret;
> =20
> +		/*
> +		 * Add components to master only in case that crtc and
> +		 * encoder/connector device objects exist.
> +		 */
> +		if (!cdev->crtc_dev || !cdev->conn_dev)
> +			continue;
> +
> +		attach_cnt++;
> +
>  		mutex_unlock(&drm_component_lock);
> =20
> -		ret =3D component_master_add_child(m, compare_of, cdev->dev);
> -		if (!ret)
> -			attached_cnt++;
> +		/*
> +		 * fimd and dpi modules have same device object so add
> +		 * only crtc device object in this case.
> +		 *
> +		 * TODO. if dpi module follows driver-model driver then
> +		 * below codes can be removed.
> +		 */
> +		if (cdev->crtc_dev =3D=3D cdev->conn_dev) {
> +			ret =3D component_master_add_child(m, compare_of,
> +					cdev->crtc_dev);
> +			if (ret < 0)
> +				return ret;
> +
> +			goto out_lock;
> +		}
> +
> =20
> +		/*
> +		 * Do not chage below call order.
> +		 * crtc device first should be added to master because
> +		 * connector/encoder need pipe number of crtc when they
> +		 * are created.
> +		 */
> +		ret =3D component_master_add_child(m, compare_of, cdev->crtc_dev);
> +		ret |=3D component_master_add_child(m, compare_of,
> +							cdev->conn_dev);
> +		if (ret < 0)
> +			return ret;
> +
> +out_lock:
>  		mutex_lock(&drm_component_lock);
>  	}
> =20
>  	mutex_unlock(&drm_component_lock);
> =20
> -	if (!attached_cnt)
> -		return -ENXIO;
> -
> -	return 0;
> +	return attach_cnt ? 0 : -ENODEV;
>  }
> =20
>  static int exynos_drm_bind(struct device *dev)
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.h b/drivers/gpu/dr=
m/exynos/exynos_drm_drv.h
> index e82e620..36535f3 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
> @@ -42,6 +42,13 @@ struct drm_connector;
> =20
>  extern unsigned int drm_vblank_offdelay;
> =20
> +/* This enumerates device type. */
> +enum exynos_drm_device_type {
> +	EXYNOS_DEVICE_TYPE_NONE,
> +	EXYNOS_DEVICE_TYPE_CRTC,
> +	EXYNOS_DEVICE_TYPE_CONNECTOR,
> +};
> +
>  /* this enumerates display type. */
>  enum exynos_drm_output_type {
>  	EXYNOS_DISPLAY_TYPE_NONE,
> @@ -354,12 +361,12 @@ void exynos_drm_remove_vidi(void);
>  int exynos_drm_create_enc_conn(struct drm_device *dev,
>  				struct exynos_drm_display *display);
> =20
> -struct component_ops;
>  int exynos_drm_component_add(struct device *dev,
> -				const struct component_ops *ops);
> +				enum exynos_drm_device_type dev_type,
> +				enum exynos_drm_output_type out_type);
> =20
>  void exynos_drm_component_del(struct device *dev,
> -				const struct component_ops *ops);
> +				enum exynos_drm_device_type dev_type);
> =20
>  extern struct platform_driver fimd_driver;
>  extern struct platform_driver dp_driver;
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/dr=
m/exynos/exynos_drm_dsi.c
> index 84661fe..6302aa6 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1423,10 +1423,16 @@ static int exynos_dsi_probe(struct platform_d=
evice *pdev)
>  	struct exynos_dsi *dsi;
>  	int ret;
> =20
> +	ret =3D exynos_drm_component_add(&pdev->dev, EXYNOS_DEVICE_TYPE_CON=
NECTOR,
> +					exynos_dsi_display.type);
> +	if (ret)
> +		return ret;
> +
>  	dsi =3D devm_kzalloc(&pdev->dev, sizeof(*dsi), GFP_KERNEL);
>  	if (!dsi) {
>  		dev_err(&pdev->dev, "failed to allocate dsi object.\n");
> -		return -ENOMEM;
> +		ret =3D -ENOMEM;
> +		goto err_del_component;
>  	}
> =20
>  	init_completion(&dsi->completed);
> @@ -1440,7 +1446,7 @@ static int exynos_dsi_probe(struct platform_dev=
ice *pdev)
> =20
>  	ret =3D exynos_dsi_parse_dt(dsi);
>  	if (ret)
> -		return ret;
> +		goto err_del_component;
> =20
>  	dsi->supplies[0].supply =3D "vddcore";
>  	dsi->supplies[1].supply =3D "vddio";
> @@ -1454,32 +1460,37 @@ static int exynos_dsi_probe(struct platform_d=
evice *pdev)
>  	dsi->pll_clk =3D devm_clk_get(&pdev->dev, "pll_clk");
>  	if (IS_ERR(dsi->pll_clk)) {
>  		dev_info(&pdev->dev, "failed to get dsi pll input clock\n");
> -		return -EPROBE_DEFER;
> +		ret =3D PTR_ERR(dsi->pll_clk);
> +		goto err_del_component;
>  	}
> =20
>  	dsi->bus_clk =3D devm_clk_get(&pdev->dev, "bus_clk");
>  	if (IS_ERR(dsi->bus_clk)) {
>  		dev_info(&pdev->dev, "failed to get dsi bus clock\n");
> -		return -EPROBE_DEFER;
> +		ret =3D PTR_ERR(dsi->bus_clk);
> +		goto err_del_component;
>  	}
> =20
>  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	dsi->reg_base =3D devm_ioremap_resource(&pdev->dev, res);
>  	if (IS_ERR(dsi->reg_base)) {
>  		dev_err(&pdev->dev, "failed to remap io region\n");
> -		return PTR_ERR(dsi->reg_base);
> +		ret =3D PTR_ERR(dsi->reg_base);
> +		goto err_del_component;
>  	}
> =20
>  	dsi->phy =3D devm_phy_get(&pdev->dev, "dsim");
>  	if (IS_ERR(dsi->phy)) {
>  		dev_info(&pdev->dev, "failed to get dsim phy\n");
> -		return -EPROBE_DEFER;
> +		ret =3D PTR_ERR(dsi->phy);
> +		goto err_del_component;
>  	}
> =20
>  	dsi->irq =3D platform_get_irq(pdev, 0);
>  	if (dsi->irq < 0) {
>  		dev_err(&pdev->dev, "failed to request dsi irq resource\n");
> -		return dsi->irq;
> +		ret =3D dsi->irq;
> +		goto err_del_component;
>  	}
> =20
>  	irq_set_status_flags(dsi->irq, IRQ_NOAUTOEN);
> @@ -1488,19 +1499,29 @@ static int exynos_dsi_probe(struct platform_d=
evice *pdev)
>  					dev_name(&pdev->dev), dsi);
>  	if (ret) {
>  		dev_err(&pdev->dev, "failed to request dsi irq\n");
> -		return ret;
> +		goto err_del_component;
>  	}
> =20
>  	exynos_dsi_display.ctx =3D dsi;
> =20
>  	platform_set_drvdata(pdev, &exynos_dsi_display);
> =20
> -	return exynos_drm_component_add(&pdev->dev, &exynos_dsi_component_o=
ps);
> +	ret =3D component_add(&pdev->dev, &exynos_dsi_component_ops);
> +	if (ret)
> +		goto err_del_component;
> +
> +	return ret;
> +
> +err_del_component:
> +	exynos_drm_component_del(&pdev->dev, EXYNOS_DEVICE_TYPE_CONNECTOR);
> +	return ret;
>  }
> =20
>  static int exynos_dsi_remove(struct platform_device *pdev)
>  {
> -	exynos_drm_component_del(&pdev->dev, &exynos_dsi_component_ops);
> +	component_del(&pdev->dev, &exynos_dsi_component_ops);
> +	exynos_drm_component_del(&pdev->dev, EXYNOS_DEVICE_TYPE_CONNECTOR);
> +
>  	return 0;
>  }
> =20
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_fimd.c b/drivers/gpu/d=
rm/exynos/exynos_drm_fimd.c
> index bd30d0c..47a772d 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_fimd.c
> @@ -941,12 +941,21 @@ static int fimd_probe(struct platform_device *p=
dev)
>  	struct resource *res;
>  	int ret =3D -EINVAL;
> =20
> -	if (!dev->of_node)
> -		return -ENODEV;
> +	ret =3D exynos_drm_component_add(&pdev->dev, EXYNOS_DEVICE_TYPE_CRT=
C,
> +					fimd_manager.type);
> +	if (ret)
> +		return ret;
> +
> +	if (!dev->of_node) {
> +		ret =3D -ENODEV;
> +		goto err_del_component;
> +	}
> =20
>  	ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> -	if (!ctx)
> -		return -ENOMEM;
> +	if (!ctx) {
> +		ret =3D -ENOMEM;
> +		goto err_del_component;
> +	}
> =20
>  	ctx->dev =3D dev;
>  	ctx->suspended =3D true;
> @@ -959,32 +968,37 @@ static int fimd_probe(struct platform_device *p=
dev)
>  	ctx->bus_clk =3D devm_clk_get(dev, "fimd");
>  	if (IS_ERR(ctx->bus_clk)) {
>  		dev_err(dev, "failed to get bus clock\n");
> -		return PTR_ERR(ctx->bus_clk);
> +		ret =3D PTR_ERR(ctx->bus_clk);
> +		goto err_del_component;
>  	}
> =20
>  	ctx->lcd_clk =3D devm_clk_get(dev, "sclk_fimd");
>  	if (IS_ERR(ctx->lcd_clk)) {
>  		dev_err(dev, "failed to get lcd clock\n");
> -		return PTR_ERR(ctx->lcd_clk);
> +		ret =3D PTR_ERR(ctx->lcd_clk);
> +		goto err_del_component;
>  	}
> =20
>  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> =20
>  	ctx->regs =3D devm_ioremap_resource(dev, res);
> -	if (IS_ERR(ctx->regs))
> -		return PTR_ERR(ctx->regs);
> +	if (IS_ERR(ctx->regs)) {
> +		ret =3D PTR_ERR(ctx->regs);
> +		goto err_del_component;
> +	}
> =20
>  	res =3D platform_get_resource_byname(pdev, IORESOURCE_IRQ, "vsync")=
;
>  	if (!res) {
>  		dev_err(dev, "irq request failed.\n");
> -		return -ENXIO;
> +		ret =3D -ENXIO;
> +		goto err_del_component;
>  	}
> =20
>  	ret =3D devm_request_irq(dev, res->start, fimd_irq_handler,
>  							0, "drm_fimd", ctx);
>  	if (ret) {
>  		dev_err(dev, "irq request failed.\n");
> -		return ret;
> +		goto err_del_component;
>  	}
> =20
>  	ctx->driver_data =3D drm_fimd_get_driver_data(pdev);
> @@ -1001,14 +1015,27 @@ static int fimd_probe(struct platform_device =
*pdev)
> =20
>  	pm_runtime_enable(&pdev->dev);
> =20
> -	return exynos_drm_component_add(&pdev->dev, &fimd_component_ops);
> +	ret =3D component_add(&pdev->dev, &fimd_component_ops);
> +	if (ret)
> +		goto err_disable_pm_runtime;
> +
> +	return ret;
> +
> +err_disable_pm_runtime:
> +	pm_runtime_disable(&pdev->dev);
> +
> +err_del_component:
> +	exynos_drm_component_del(&pdev->dev, EXYNOS_DEVICE_TYPE_CRTC);
> +	return ret;
>  }
> =20
>  static int fimd_remove(struct platform_device *pdev)
>  {
>  	pm_runtime_disable(&pdev->dev);
> =20
> -	exynos_drm_component_del(&pdev->dev, &fimd_component_ops);
> +	component_del(&pdev->dev, &fimd_component_ops);
> +	exynos_drm_component_del(&pdev->dev, EXYNOS_DEVICE_TYPE_CRTC);
> +
>  	return 0;
>  }
> =20
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/e=
xynos/exynos_hdmi.c
> index e05c86a..0c3bcee 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -2134,26 +2134,31 @@ static int hdmi_resources_init(struct hdmi_co=
ntext *hdata)
>  	res->hdmi =3D devm_clk_get(dev, "hdmi");
>  	if (IS_ERR(res->hdmi)) {
>  		DRM_ERROR("failed to get clock 'hdmi'\n");
> +		ret =3D PTR_ERR(res->hdmi);
>  		goto fail;
>  	}
>  	res->sclk_hdmi =3D devm_clk_get(dev, "sclk_hdmi");
>  	if (IS_ERR(res->sclk_hdmi)) {
>  		DRM_ERROR("failed to get clock 'sclk_hdmi'\n");
> +		ret =3D PTR_ERR(res->sclk_hdmi);
>  		goto fail;
>  	}
>  	res->sclk_pixel =3D devm_clk_get(dev, "sclk_pixel");
>  	if (IS_ERR(res->sclk_pixel)) {
>  		DRM_ERROR("failed to get clock 'sclk_pixel'\n");
> +		ret =3D PTR_ERR(res->sclk_pixel);
>  		goto fail;
>  	}
>  	res->sclk_hdmiphy =3D devm_clk_get(dev, "sclk_hdmiphy");
>  	if (IS_ERR(res->sclk_hdmiphy)) {
>  		DRM_ERROR("failed to get clock 'sclk_hdmiphy'\n");
> +		ret =3D PTR_ERR(res->sclk_hdmiphy);
>  		goto fail;
>  	}
>  	res->mout_hdmi =3D devm_clk_get(dev, "mout_hdmi");
>  	if (IS_ERR(res->mout_hdmi)) {
>  		DRM_ERROR("failed to get clock 'mout_hdmi'\n");
> +		ret =3D PTR_ERR(res->mout_hdmi);
>  		goto fail;
>  	}
> =20
> @@ -2161,8 +2166,10 @@ static int hdmi_resources_init(struct hdmi_con=
text *hdata)
> =20
>  	res->regul_bulk =3D devm_kzalloc(dev, ARRAY_SIZE(supply) *
>  		sizeof(res->regul_bulk[0]), GFP_KERNEL);
> -	if (!res->regul_bulk)
> +	if (!res->regul_bulk) {
> +		ret =3D -ENOMEM;
>  		goto fail;
> +	}
>  	for (i =3D 0; i < ARRAY_SIZE(supply); ++i) {
>  		res->regul_bulk[i].supply =3D supply[i];
>  		res->regul_bulk[i].consumer =3D NULL;
> @@ -2170,14 +2177,14 @@ static int hdmi_resources_init(struct hdmi_co=
ntext *hdata)
>  	ret =3D devm_regulator_bulk_get(dev, ARRAY_SIZE(supply), res->regul=
_bulk);
>  	if (ret) {
>  		DRM_ERROR("failed to get regulators\n");
> -		goto fail;
> +		return ret;
>  	}
>  	res->regul_count =3D ARRAY_SIZE(supply);
> =20
> -	return 0;
> +	return ret;
>  fail:
>  	DRM_ERROR("HDMI resource init - failed\n");
> -	return -ENODEV;
> +	return ret;
>  }
> =20
>  static struct s5p_hdmi_platform_data *drm_hdmi_dt_parse_pdata
> @@ -2275,24 +2282,37 @@ static int hdmi_probe(struct platform_device =
*pdev)
>  	struct resource *res;
>  	int ret;
> =20
> -	if (!dev->of_node)
> -		return -ENODEV;
> +	ret =3D exynos_drm_component_add(&pdev->dev, EXYNOS_DEVICE_TYPE_CON=
NECTOR,
> +					hdmi_display.type);
> +	if (ret)
> +		return ret;
> +
> +	if (!dev->of_node) {
> +		ret =3D -ENODEV;
> +		goto err_del_component;
> +	}
> =20
>  	pdata =3D drm_hdmi_dt_parse_pdata(dev);
> -	if (!pdata)
> -		return -EINVAL;
> +	if (!pdata) {
> +		ret =3D -EINVAL;
> +		goto err_del_component;
> +	}
> =20
>  	hdata =3D devm_kzalloc(dev, sizeof(struct hdmi_context), GFP_KERNEL=
);
> -	if (!hdata)
> -		return -ENOMEM;
> +	if (!hdata) {
> +		ret =3D -ENOMEM;
> +		goto err_del_component;
> +	}
> =20
>  	mutex_init(&hdata->hdmi_mutex);
> =20
>  	platform_set_drvdata(pdev, &hdmi_display);
> =20
>  	match =3D of_match_node(hdmi_match_types, dev->of_node);
> -	if (!match)
> -		return -ENODEV;
> +	if (!match) {
> +		ret =3D -ENODEV;
> +		goto err_del_component;
> +	}
> =20
>  	drv_data =3D (struct hdmi_driver_data *)match->data;
>  	hdata->type =3D drv_data->type;
> @@ -2305,18 +2325,20 @@ static int hdmi_probe(struct platform_device =
*pdev)
>  	ret =3D hdmi_resources_init(hdata);
>  	if (ret) {
>  		DRM_ERROR("hdmi_resources_init failed\n");
> -		return -EINVAL;
> +		return ret;
>  	}
> =20
>  	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
>  	hdata->regs =3D devm_ioremap_resource(dev, res);
> -	if (IS_ERR(hdata->regs))
> -		return PTR_ERR(hdata->regs);
> +	if (IS_ERR(hdata->regs)) {
> +		ret =3D PTR_ERR(hdata->regs);
> +		goto err_del_component;
> +	}
> =20
>  	ret =3D devm_gpio_request(dev, hdata->hpd_gpio, "HPD");
>  	if (ret) {
>  		DRM_ERROR("failed to request HPD gpio\n");
> -		return ret;
> +		goto err_del_component;
>  	}
> =20
>  	ddc_node =3D hdmi_legacy_ddc_dt_binding(dev);
> @@ -2327,14 +2349,15 @@ static int hdmi_probe(struct platform_device =
*pdev)
>  	ddc_node =3D of_parse_phandle(dev->of_node, "ddc", 0);
>  	if (!ddc_node) {
>  		DRM_ERROR("Failed to find ddc node in device tree\n");
> -		return -ENODEV;
> +		ret =3D -ENODEV;
> +		goto err_del_component;
>  	}
> =20
>  out_get_ddc_adpt:
>  	hdata->ddc_adpt =3D of_find_i2c_adapter_by_node(ddc_node);
>  	if (!hdata->ddc_adpt) {
>  		DRM_ERROR("Failed to get ddc i2c adapter by node\n");
> -		return -ENODEV;
> +		return -EPROBE_DEFER;
>  	}
> =20
>  	phy_node =3D hdmi_legacy_phy_dt_binding(dev);
> @@ -2361,7 +2384,7 @@ out_get_phy_port:
>  		hdata->hdmiphy_port =3D of_find_i2c_device_by_node(phy_node);
>  		if (!hdata->hdmiphy_port) {
>  			DRM_ERROR("Failed to get hdmi phy i2c client\n");
> -			ret =3D -ENODEV;
> +			ret =3D -EPROBE_DEFER;
>  			goto err_ddc;
>  		}
>  	}
> @@ -2390,19 +2413,31 @@ out_get_phy_port:
>  			"samsung,syscon-phandle");
>  	if (IS_ERR(hdata->pmureg)) {
>  		DRM_ERROR("syscon regmap lookup failed.\n");
> +		ret =3D -EPROBE_DEFER;
>  		goto err_hdmiphy;
>  	}
> =20
>  	pm_runtime_enable(dev);
>  	hdmi_display.ctx =3D hdata;
> =20
> -	return exynos_drm_component_add(&pdev->dev, &hdmi_component_ops);
> +	ret =3D component_add(&pdev->dev, &hdmi_component_ops);
> +	if (ret)
> +		goto err_disable_pm_runtime;
> +
> +	return ret;
> +
> +err_disable_pm_runtime:
> +	pm_runtime_disable(dev);
> =20
>  err_hdmiphy:
>  	if (hdata->hdmiphy_port)
>  		put_device(&hdata->hdmiphy_port->dev);
>  err_ddc:
>  	put_device(&hdata->ddc_adpt->dev);
> +
> +err_del_component:
> +	exynos_drm_component_del(&pdev->dev, EXYNOS_DEVICE_TYPE_CONNECTOR);
> +
>  	return ret;
>  }
> =20
> @@ -2416,8 +2451,9 @@ static int hdmi_remove(struct platform_device *=
pdev)
>  	put_device(&hdata->ddc_adpt->dev);
> =20
>  	pm_runtime_disable(&pdev->dev);
> +	component_del(&pdev->dev, &hdmi_component_ops);
> =20
> -	exynos_drm_component_del(&pdev->dev, &hdmi_component_ops);
> +	exynos_drm_component_del(&pdev->dev, EXYNOS_DEVICE_TYPE_CONNECTOR);
>  	return 0;
>  }
> =20
> diff --git a/drivers/gpu/drm/exynos/exynos_mixer.c b/drivers/gpu/drm/=
exynos/exynos_mixer.c
> index 483d7c0..4c5aed7 100644
> --- a/drivers/gpu/drm/exynos/exynos_mixer.c
> +++ b/drivers/gpu/drm/exynos/exynos_mixer.c
> @@ -1273,12 +1273,25 @@ static const struct component_ops mixer_compo=
nent_ops =3D {
> =20
>  static int mixer_probe(struct platform_device *pdev)
>  {
> -	return exynos_drm_component_add(&pdev->dev, &mixer_component_ops);
> +	int ret;
> +
> +	ret =3D exynos_drm_component_add(&pdev->dev, EXYNOS_DEVICE_TYPE_CRT=
C,
> +					mixer_manager.type);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D component_add(&pdev->dev, &mixer_component_ops);
> +	if (ret)
> +		exynos_drm_component_del(&pdev->dev, EXYNOS_DEVICE_TYPE_CRTC);
> +
> +	return ret;
>  }
> =20
>  static int mixer_remove(struct platform_device *pdev)
>  {
> -	exynos_drm_component_del(&pdev->dev, &mixer_component_ops);
> +	component_del(&pdev->dev, &mixer_component_ops);
> +	exynos_drm_component_del(&pdev->dev, EXYNOS_DEVICE_TYPE_CRTC);
> +
>  	return 0;
>  }
> =20
>=20
