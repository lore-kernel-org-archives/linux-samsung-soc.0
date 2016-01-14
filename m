From: Inki Dae <inki.dae@samsung.com>
Subject: Re: [PATCH 1/7] drm/exynos/hdmi: clock code re-factoring
Date: Thu, 14 Jan 2016 14:20:49 +0900
Message-ID: <56973031.4000301@samsung.com>
References: <1446470205-15606-1-git-send-email-a.hajda@samsung.com>
 <1446470205-15606-2-git-send-email-a.hajda@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:54259 "EHLO
	mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750871AbcANFUv (ORCPT
	<rfc822;linux-samsung-soc@vger.kernel.org>);
	Thu, 14 Jan 2016 00:20:51 -0500
Received: from epcpsbgr4.samsung.com
 (u144.gpu120.samsung.co.kr [203.254.230.144])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7.0.5.31.0
 64bit (built May  5 2014))
 with ESMTP id <0O0X00BLRG6QQO20@mailout1.samsung.com> for
 linux-samsung-soc@vger.kernel.org; Thu, 14 Jan 2016 14:20:50 +0900 (KST)
In-reply-to: <1446470205-15606-2-git-send-email-a.hajda@samsung.com>
Sender: linux-samsung-soc-owner@vger.kernel.org
List-Id: linux-samsung-soc@vger.kernel.org
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, linux-samsung-soc@vger.kernel.org, dri-devel@lists.freedesktop.org, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <k.kozlowski@samsung.com>



2015=EB=85=84 11=EC=9B=94 02=EC=9D=BC 22:16=EC=97=90 Andrzej Hajda =EC=9D=
=B4(=EA=B0=80) =EC=93=B4 =EA=B8=80:
> With incoming support for newer SoCs different set of clocks will be =
required,
> depending on IP version. The patch prepares the driver for it.
>=20
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 184 +++++++++++++++++++++++++=
+---------
>  1 file changed, 137 insertions(+), 47 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/e=
xynos/exynos_hdmi.c
> index 57b6755..d720b77 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -90,11 +90,24 @@ static const char * const supply[] =3D {
>  	"vdd_pll",
>  };
> =20
> +struct string_array_spec {
> +	int count;
> +	const char * const *data;
> +};
> +
> +#define INIT_ARRAY_SPEC(a) { .count =3D ARRAY_SIZE(a), .data =3D a }
> +
>  struct hdmi_driver_data {
>  	unsigned int type;
>  	const struct hdmiphy_config *phy_confs;
>  	unsigned int phy_conf_count;
>  	unsigned int is_apb_phy:1;
> +	struct string_array_spec clk_gates;
> +	/*
> +	 * Array of triplets (p_off, p_on, clock), where p_off and p_on are
> +	 * required parents of clock when HDMI-PHY is respectively off or o=
n.
> +	 */
> +	struct string_array_spec clk_muxes;
>  };
> =20
>  struct hdmi_context {
> @@ -116,11 +129,8 @@ struct hdmi_context {
>  	struct gpio_desc 		*hpd_gpio;
>  	int				irq;
>  	struct regmap			*pmureg;
> -	struct clk			*hdmi;
> -	struct clk			*sclk_hdmi;
> -	struct clk			*sclk_pixel;
> -	struct clk			*sclk_hdmiphy;
> -	struct clk			*mout_hdmi;
> +	struct clk			**clk_gates;
> +	struct clk			**clk_muxes;
>  	struct regulator_bulk_data	regul_bulk[ARRAY_SIZE(supply)];
>  	struct regulator		*reg_hdmi_en;
>  };
> @@ -501,11 +511,21 @@ static const struct hdmiphy_config hdmiphy_5420=
_configs[] =3D {
>  	},
>  };
> =20
> +static const char *hdmi_clk_gates4[] =3D {
> +	"hdmi", "sclk_hdmi"
> +};
> +
> +static const char *hdmi_clk_muxes4[] =3D {
> +	"sclk_pixel", "sclk_hdmiphy", "mout_hdmi"
> +};
> +
>  static struct hdmi_driver_data exynos5420_hdmi_driver_data =3D {
>  	.type		=3D HDMI_TYPE14,
>  	.phy_confs	=3D hdmiphy_5420_configs,
>  	.phy_conf_count	=3D ARRAY_SIZE(hdmiphy_5420_configs),
>  	.is_apb_phy	=3D 1,
> +	.clk_gates	=3D INIT_ARRAY_SPEC(hdmi_clk_gates4),
> +	.clk_muxes	=3D INIT_ARRAY_SPEC(hdmi_clk_muxes4),
>  };
> =20
>  static struct hdmi_driver_data exynos4212_hdmi_driver_data =3D {
> @@ -513,6 +533,8 @@ static struct hdmi_driver_data exynos4212_hdmi_dr=
iver_data =3D {
>  	.phy_confs	=3D hdmiphy_v14_configs,
>  	.phy_conf_count	=3D ARRAY_SIZE(hdmiphy_v14_configs),
>  	.is_apb_phy	=3D 0,
> +	.clk_gates	=3D INIT_ARRAY_SPEC(hdmi_clk_gates4),
> +	.clk_muxes	=3D INIT_ARRAY_SPEC(hdmi_clk_muxes4),
>  };
> =20
>  static struct hdmi_driver_data exynos4210_hdmi_driver_data =3D {
> @@ -520,6 +542,8 @@ static struct hdmi_driver_data exynos4210_hdmi_dr=
iver_data =3D {
>  	.phy_confs	=3D hdmiphy_v13_configs,
>  	.phy_conf_count	=3D ARRAY_SIZE(hdmiphy_v13_configs),
>  	.is_apb_phy	=3D 0,
> +	.clk_gates	=3D INIT_ARRAY_SPEC(hdmi_clk_gates4),
> +	.clk_muxes	=3D INIT_ARRAY_SPEC(hdmi_clk_muxes4),
>  };
> =20
>  static inline u32 hdmi_map_reg(struct hdmi_context *hdata, u32 reg_i=
d)
> @@ -847,6 +871,54 @@ static void hdmi_regs_dump(struct hdmi_context *=
hdata, char *prefix)
>  		hdmi_v14_regs_dump(hdata, prefix);
>  }
> =20
> +static int hdmi_clk_enable_gates(struct hdmi_context *hdata)
> +{
> +	int i, ret;
> +
> +	for (i =3D 0; i < hdata->drv_data->clk_gates.count; ++i) {
> +		ret =3D clk_prepare_enable(hdata->clk_gates[i]);
> +		if (!ret)
> +			continue;
> +
> +		dev_err(hdata->dev, "Cannot enable clock '%s', %d\n",
> +			hdata->drv_data->clk_gates.data[i], ret);
> +		while (i--)
> +			clk_disable_unprepare(hdata->clk_gates[i]);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void hdmi_clk_disable_gates(struct hdmi_context *hdata)
> +{
> +	int i =3D hdata->drv_data->clk_gates.count;
> +
> +	while (i--)
> +		clk_disable_unprepare(hdata->clk_gates[i]);
> +}
> +
> +static int hdmi_clk_set_parents(struct hdmi_context *hdata, bool to_=
phy)
> +{
> +	struct device *dev =3D hdata->dev;
> +	int ret =3D 0;
> +	int i;
> +
> +	for (i =3D 0; i < hdata->drv_data->clk_muxes.count; i +=3D 3) {
> +		struct clk **c =3D &hdata->clk_muxes[i];
> +
> +		ret =3D clk_set_parent(c[2], c[to_phy]);
> +		if (!ret)
> +			continue;
> +
> +		dev_err(dev, "Cannot set clock parent of '%s' to '%s', %d\n",
> +			hdata->drv_data->clk_muxes.data[i + 2],
> +			hdata->drv_data->clk_muxes.data[i + to_phy], ret);
> +	}
> +
> +	return ret;
> +}
> +
>  static u8 hdmi_chksum(struct hdmi_context *hdata,
>  			u32 start, u8 len, u32 hdr_sum)
>  {
> @@ -1509,7 +1581,7 @@ static void hdmi_mode_apply(struct hdmi_context=
 *hdata)
> =20
>  	hdmiphy_wait_for_pll(hdata);
> =20
> -	clk_set_parent(hdata->mout_hdmi, hdata->sclk_hdmiphy);
> +	hdmi_clk_set_parents(hdata, true);
> =20
>  	/* enable HDMI and timing generator */
>  	hdmi_start(hdata, true);
> @@ -1517,7 +1589,7 @@ static void hdmi_mode_apply(struct hdmi_context=
 *hdata)
> =20
>  static void hdmiphy_conf_reset(struct hdmi_context *hdata)
>  {
> -	clk_set_parent(hdata->mout_hdmi, hdata->sclk_pixel);
> +	hdmi_clk_set_parents(hdata, false);
> =20
>  	/* reset hdmiphy */
>  	hdmi_reg_writemask(hdata, HDMI_PHY_RSTOUT, ~0, HDMI_PHY_SW_RSTOUT);
> @@ -1599,8 +1671,7 @@ static void hdmi_enable(struct drm_encoder *enc=
oder)
>  	regmap_update_bits(hdata->pmureg, PMU_HDMI_PHY_CONTROL,
>  			PMU_HDMI_PHY_ENABLE_BIT, 1);
> =20
> -	clk_prepare_enable(hdata->hdmi);
> -	clk_prepare_enable(hdata->sclk_hdmi);
> +	hdmi_clk_enable_gates(hdata);
> =20
>  	hdmi_conf_apply(hdata);
>  }
> @@ -1633,8 +1704,7 @@ static void hdmi_disable(struct drm_encoder *en=
coder)
> =20
>  	cancel_delayed_work(&hdata->hotplug_work);
> =20
> -	clk_disable_unprepare(hdata->sclk_hdmi);
> -	clk_disable_unprepare(hdata->hdmi);
> +	hdmi_clk_disable_gates(hdata);
> =20
>  	/* reset pmu hdmiphy control bit to disable hdmiphy */
>  	regmap_update_bits(hdata->pmureg, PMU_HDMI_PHY_CONTROL,
> @@ -1678,6 +1748,56 @@ static irqreturn_t hdmi_irq_thread(int irq, vo=
id *arg)
>  	return IRQ_HANDLED;
>  }
> =20
> +static int hdmi_clks_get(struct hdmi_context *hdata,
> +			 const struct string_array_spec *names,
> +			 struct clk **clks)
> +{
> +	struct device *dev =3D hdata->dev;
> +	int i;
> +
> +	for (i =3D 0; i < names->count; ++i) {
> +		struct clk *clk =3D devm_clk_get(dev, names->data[i]);
> +
> +		if (IS_ERR(clk)) {
> +			int ret =3D PTR_ERR(clk);
> +
> +			dev_err(dev, "Cannot get clock %s, %d\n",
> +				names->data[i], ret);
> +
> +			return ret;
> +		}
> +
> +		clks[i] =3D clk;
> +	}
> +
> +	return 0;
> +}
> +
> +static int hdmi_clk_init(struct hdmi_context *hdata)
> +{
> +	const struct hdmi_driver_data *drv_data =3D hdata->drv_data;
> +	int count =3D drv_data->clk_gates.count + drv_data->clk_muxes.count=
;
> +	struct device *dev =3D hdata->dev;
> +	struct clk **clks;
> +	int ret;
> +
> +	if (!count)
> +		return 0;
> +
> +	clks =3D devm_kzalloc(dev, sizeof(*clks) * count, GFP_KERNEL);
> +	if (!clks)
> +	return -ENOMEM;
> +
> +	hdata->clk_gates =3D clks;
> +	hdata->clk_muxes =3D clks + drv_data->clk_gates.count;
> +
> +	ret =3D hdmi_clks_get(hdata, &drv_data->clk_gates, hdata->clk_gates=
);
> +	if (ret)
> +		return ret;
> +
> +	return hdmi_clks_get(hdata, &drv_data->clk_muxes, hdata->clk_muxes)=
;
> +}
> +
>  static int hdmi_resources_init(struct hdmi_context *hdata)
>  {
>  	struct device *dev =3D hdata->dev;
> @@ -1694,41 +1814,14 @@ static int hdmi_resources_init(struct hdmi_co=
ntext *hdata)
>  	hdata->irq =3D gpiod_to_irq(hdata->hpd_gpio);
>  	if (hdata->irq < 0) {
>  		DRM_ERROR("failed to get GPIO irq\n");
> -		return  hdata->irq;
> -	}
> -	/* get clocks, power */
> -	hdata->hdmi =3D devm_clk_get(dev, "hdmi");
> -	if (IS_ERR(hdata->hdmi)) {
> -		DRM_ERROR("failed to get clock 'hdmi'\n");
> -		ret =3D PTR_ERR(hdata->hdmi);
> -		goto fail;
> -	}
> -	hdata->sclk_hdmi =3D devm_clk_get(dev, "sclk_hdmi");
> -	if (IS_ERR(hdata->sclk_hdmi)) {
> -		DRM_ERROR("failed to get clock 'sclk_hdmi'\n");
> -		ret =3D PTR_ERR(hdata->sclk_hdmi);
> -		goto fail;
> -	}
> -	hdata->sclk_pixel =3D devm_clk_get(dev, "sclk_pixel");
> -	if (IS_ERR(hdata->sclk_pixel)) {
> -		DRM_ERROR("failed to get clock 'sclk_pixel'\n");
> -		ret =3D PTR_ERR(hdata->sclk_pixel);
> -		goto fail;
> -	}
> -	hdata->sclk_hdmiphy =3D devm_clk_get(dev, "sclk_hdmiphy");
> -	if (IS_ERR(hdata->sclk_hdmiphy)) {
> -		DRM_ERROR("failed to get clock 'sclk_hdmiphy'\n");
> -		ret =3D PTR_ERR(hdata->sclk_hdmiphy);
> -		goto fail;
> -	}
> -	hdata->mout_hdmi =3D devm_clk_get(dev, "mout_hdmi");
> -	if (IS_ERR(hdata->mout_hdmi)) {
> -		DRM_ERROR("failed to get clock 'mout_hdmi'\n");
> -		ret =3D PTR_ERR(hdata->mout_hdmi);
> -		goto fail;
> +		return hdata->irq;
>  	}
> =20
> -	clk_set_parent(hdata->mout_hdmi, hdata->sclk_pixel);
> +	ret =3D hdmi_clk_init(hdata);
> +	if (ret)
> +		return ret;
> +
> +	hdmi_clk_set_parents(hdata, false);

You should check return type but I can fix it.

Thanks,
Inki Dae

> =20
>  	for (i =3D 0; i < ARRAY_SIZE(supply); ++i) {
>  		hdata->regul_bulk[i].supply =3D supply[i];
> @@ -1753,9 +1846,6 @@ static int hdmi_resources_init(struct hdmi_cont=
ext *hdata)
>  		DRM_ERROR("failed to enable hdmi-en regulator\n");
> =20
>  	return ret;
> -fail:
> -	DRM_ERROR("HDMI resource init - failed\n");
> -	return ret;
>  }
> =20
>  static struct of_device_id hdmi_match_types[] =3D {
>=20
