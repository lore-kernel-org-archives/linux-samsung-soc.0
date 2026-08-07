Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D027446D092;
	Fri,  7 Aug 2026 12:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786105726; cv=none; b=CCI7PzWuxv8l88mPWN9Y50RkA6KXr/XhVxMGuxKZrvTl4cQ9mOgwQ7jdDSTbITHv8Efu4wZWVJRic0m8AjsVelv0VfxLHMDEp+R9yaFxikGJ7ySJw3wvPkAhVQucXKNLSmrbl9behXGB7AedrdbJY1BLDFQv+0y9/wzckta46do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786105726; c=relaxed/simple;
	bh=3cSBl7HReDfm7Zk0sgjHm1MDmnlqQLZ8cInaYFaSiZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TZQbNVJ/kYKOH5wIshfaap8Ypknb8HBG6XO5R/1dWCyikxJ6taKkuoHo7KOIfX7CJQds/12gliwCeZgKoj8YJCPZKCCvkcnzZwFiFr4eVyg4Gt8LeciVy1VKl7RoDisyihno7Z7V63Tw9KVWzMmXZlV11B5sue5Tgu3qfA/XcX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=THr1K3jb; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="THr1K3jb"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C20B456D;
	Fri,  7 Aug 2026 14:27:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1786105634;
	bh=3cSBl7HReDfm7Zk0sgjHm1MDmnlqQLZ8cInaYFaSiZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=THr1K3jbVhkvA/tOKaBQeQphUp0VSzC9tRmsjFGUHUMVQs9OvW2v5SOLdozWTic7S
	 fS/hAzdkK/iJYmfr97p1xciaNn5l2FE1xBUOpjGlqs4wOqlznw1VjJsIG51pJ/cN3D
	 CvfI+vReZXQAizg+DjxTPrvWoCdIgYh/R7ol+XZQ=
Date: Fri, 7 Aug 2026 15:28:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Julia.Lawall@inria.fr, Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Eugen Hristev <ehristev@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
	Michael Krufky <mkrufky@linuxtv.org>,
	Hans Verkuil <hverkuil@kernel.org>, cocci@inria.fr,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 12/36] media: remove conditional return with no effect
Message-ID: <20260807122825.GJ2201016@killaraus.ideasonboard.com>
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
 <20260723184538.3888637-13-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260723184538.3888637-13-ekffu200098@gmail.com>

On Fri, Jul 24, 2026 at 03:45:14AM +0900, Sang-Heon Jeon wrote:
> Both branches of the check return the same value, so the check has
> no effect. Remove it and return the value directly.
> 
> This is the result of running the Coccinelle script from
> scripts/coccinelle/misc/cond_return_no_effect.cocci.
> 
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> ---
>  drivers/media/i2c/mt9p031.c                          |  6 +-----
>  .../media/platform/microchip/microchip-sama7g5-isc.c |  7 +------
>  drivers/media/platform/qcom/iris/iris_resources.c    |  6 +-----
>  drivers/media/platform/qcom/venus/pm_helpers.c       |  7 +------
>  drivers/media/platform/renesas/rcar-csi2.c           |  6 +-----
>  .../media/platform/samsung/s3c-camif/camif-core.c    |  7 +------
>  drivers/media/usb/dvb-usb-v2/mxl111sf.c              | 12 ++----------
>  drivers/media/usb/gspca/jl2005bcd.c                  |  7 +------
>  8 files changed, 9 insertions(+), 49 deletions(-)
> 
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> index d21510caf45a..2b09e8315c8e 100644
> --- a/drivers/media/i2c/mt9p031.c
> +++ b/drivers/media/i2c/mt9p031.c
> @@ -452,11 +452,7 @@ static int mt9p031_set_params(struct mt9p031 *mt9p031)
>  	ret = mt9p031_write(client, MT9P031_HORIZONTAL_BLANK, hblank - 1);
>  	if (ret < 0)
>  		return ret;
> -	ret = mt9p031_write(client, MT9P031_VERTICAL_BLANK, vblank - 1);
> -	if (ret < 0)
> -		return ret;
> -
> -	return ret;

I would have just replaced the last line with a

	return 0;

as I find it easier to read code that has multiple error paths when all
the error paths look the same. It's a small personal preference though
(and ths best option would be to convert this driver to the CCI
helpers), so I'm OK with this change as-is.

> +	return mt9p031_write(client, MT9P031_VERTICAL_BLANK, vblank - 1);
>  }
>  
>  static int mt9p031_s_stream(struct v4l2_subdev *subdev, int enable)
> diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
> index b0302dfc3278..7383341ec51d 100644
> --- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
> +++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
> @@ -598,13 +598,8 @@ static int __maybe_unused xisc_runtime_suspend(struct device *dev)
>  static int __maybe_unused xisc_runtime_resume(struct device *dev)
>  {
>  	struct isc_device *isc = dev_get_drvdata(dev);
> -	int ret;
> -
> -	ret = clk_prepare_enable(isc->hclock);
> -	if (ret)
> -		return ret;
>  
> -	return ret;
> +	return clk_prepare_enable(isc->hclock);

Here the change looks good, there's a single error paths so a direct
return is fine.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  }
>  
>  static const struct dev_pm_ops microchip_xisc_dev_pm_ops = {
> diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
> index 773f6548370a..872bd09656b1 100644
> --- a/drivers/media/platform/qcom/iris/iris_resources.c
> +++ b/drivers/media/platform/qcom/iris/iris_resources.c
> @@ -78,11 +78,7 @@ int iris_enable_power_domains(struct iris_core *core, struct device *pd_dev)
>  	if (ret)
>  		return ret;
>  
> -	ret = pm_runtime_get_sync(pd_dev);
> -	if (ret < 0)
> -		return ret;
> -
> -	return ret;
> +	return pm_runtime_get_sync(pd_dev);
>  }
>  
>  int iris_disable_power_domains(struct iris_core *core, struct device *pd_dev)
> diff --git a/drivers/media/platform/qcom/venus/pm_helpers.c b/drivers/media/platform/qcom/venus/pm_helpers.c
> index be1cbd5cfe84..e88e66be4f6d 100644
> --- a/drivers/media/platform/qcom/venus/pm_helpers.c
> +++ b/drivers/media/platform/qcom/venus/pm_helpers.c
> @@ -781,7 +781,6 @@ static int decide_core(struct venus_inst *inst)
>  	unsigned long max_freq = ULONG_MAX;
>  	struct device *dev = core->dev;
>  	struct dev_pm_opp *opp;
> -	int ret = 0;
>  
>  	if (legacy_binding) {
>  		if (inst->session_type == VIDC_SESSION_TYPE_DEC)
> @@ -829,11 +828,7 @@ static int decide_core(struct venus_inst *inst)
>  	}
>  
>  done:
> -	ret = hfi_session_set_property(inst, ptype, &cu);
> -	if (ret)
> -		return ret;
> -
> -	return ret;
> +	return hfi_session_set_property(inst, ptype, &cu);
>  }
>  
>  static int acquire_core(struct venus_inst *inst)
> diff --git a/drivers/media/platform/renesas/rcar-csi2.c b/drivers/media/platform/renesas/rcar-csi2.c
> index 7305cc4a04cb..6635f5782175 100644
> --- a/drivers/media/platform/renesas/rcar-csi2.c
> +++ b/drivers/media/platform/renesas/rcar-csi2.c
> @@ -2273,11 +2273,7 @@ static int rcsi2_init_phtw_v3u(struct rcar_csi2 *priv,
>  			return ret;
>  	}
>  
> -	ret = rcsi2_phtw_write_array(priv, step4, ARRAY_SIZE(step4));
> -	if (ret)
> -		return ret;
> -
> -	return ret;
> +	return rcsi2_phtw_write_array(priv, step4, ARRAY_SIZE(step4));
>  }
>  
>  /* -----------------------------------------------------------------------------
> diff --git a/drivers/media/platform/samsung/s3c-camif/camif-core.c b/drivers/media/platform/samsung/s3c-camif/camif-core.c
> index 14eedd1ceb27..bb06847f3a63 100644
> --- a/drivers/media/platform/samsung/s3c-camif/camif-core.c
> +++ b/drivers/media/platform/samsung/s3c-camif/camif-core.c
> @@ -301,7 +301,6 @@ static int camif_media_dev_init(struct camif_dev *camif)
>  	struct media_device *md = &camif->media_dev;
>  	struct v4l2_device *v4l2_dev = &camif->v4l2_dev;
>  	unsigned int ip_rev = camif->variant->ip_revision;
> -	int ret;
>  
>  	memset(md, 0, sizeof(*md));
>  	snprintf(md->model, sizeof(md->model), "Samsung S3C%s CAMIF",
> @@ -316,11 +315,7 @@ static int camif_media_dev_init(struct camif_dev *camif)
>  
>  	media_device_init(md);
>  
> -	ret = v4l2_device_register(camif->dev, v4l2_dev);
> -	if (ret < 0)
> -		return ret;
> -
> -	return ret;
> +	return v4l2_device_register(camif->dev, v4l2_dev);
>  }
>  
>  static void camif_clk_put(struct camif_dev *camif)
> diff --git a/drivers/media/usb/dvb-usb-v2/mxl111sf.c b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
> index 870ac3c8b085..6404eb74db32 100644
> --- a/drivers/media/usb/dvb-usb-v2/mxl111sf.c
> +++ b/drivers/media/usb/dvb-usb-v2/mxl111sf.c
> @@ -987,11 +987,7 @@ static int mxl111sf_frontend_attach_atsc_mh(struct dvb_usb_adapter *adap)
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = mxl111sf_lg2160_frontend_attach(adap, 2);
> -	if (ret < 0)
> -		return ret;
> -
> -	return ret;
> +	return mxl111sf_lg2160_frontend_attach(adap, 2);
>  }
>  
>  static int mxl111sf_frontend_attach_mercury(struct dvb_usb_adapter *adap)
> @@ -1007,11 +1003,7 @@ static int mxl111sf_frontend_attach_mercury(struct dvb_usb_adapter *adap)
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = mxl111sf_lg2161_ep6_frontend_attach(adap, 2);
> -	if (ret < 0)
> -		return ret;
> -
> -	return ret;
> +	return mxl111sf_lg2161_ep6_frontend_attach(adap, 2);
>  }
>  
>  static int mxl111sf_frontend_attach_mercury_mh(struct dvb_usb_adapter *adap)
> diff --git a/drivers/media/usb/gspca/jl2005bcd.c b/drivers/media/usb/gspca/jl2005bcd.c
> index a408fcc3a060..4988fbf5005e 100644
> --- a/drivers/media/usb/gspca/jl2005bcd.c
> +++ b/drivers/media/usb/gspca/jl2005bcd.c
> @@ -148,17 +148,12 @@ static int jl2005c_start_new_frame(struct gspca_dev *gspca_dev)
>  static int jl2005c_write_reg(struct gspca_dev *gspca_dev, unsigned char reg,
>  						    unsigned char value)
>  {
> -	int retval;
>  	u8 instruction[2];
>  
>  	instruction[0] = reg;
>  	instruction[1] = value;
>  
> -	retval = jl2005c_write2(gspca_dev, instruction);
> -	if (retval < 0)
> -			return retval;
> -
> -	return retval;
> +	return jl2005c_write2(gspca_dev, instruction);
>  }
>  
>  static int jl2005c_get_firmware_id(struct gspca_dev *gspca_dev)

-- 
Regards,

Laurent Pinchart
