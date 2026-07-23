Received: from flow-b8-smtp.messagingengine.com (flow-b8-smtp.messagingengine.com [202.12.124.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84B4372B27;
	Thu, 23 Jul 2026 20:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784838383; cv=none; b=mwfgMk5fudXgdjmec0ktKO1H7VxlzgfS+UnhYHBe/iLT8xe3YUdCzpfUer7Hez5pgAgZWL/BbvIPXXr7Z+4myJnchnVaPWWrJT4rgIAFEF3Oido5yOMHGql88K3HoxNfYaRhPKRMuePv75qV69pRF0vdK8d51LUbZihCqXvBBmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784838383; c=relaxed/simple;
	bh=5iG8Fb/wE2D83EOlwWwa80p3yf8ydNzzDHEtgWXwQ+M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qT/Zk6vfYI950RT6rVMn37N60Cvueinuq1dywE2zKP/p0BEdMZJrltfZnx3BT04eBCqC5nTs2x+is9lZoLOK2fs7dEGiFEYJefsYj7pjtbn1LUnD06LlejfKwj7BnVM3r3yyuPVU9V/nxbjbeFWk1gMyCOuHzBJJzUOJeK3IoN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=TXfg5ubM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=eoV4KXT3; arc=none smtp.client-ip=202.12.124.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="TXfg5ubM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="eoV4KXT3"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.stl.internal (Postfix) with ESMTP id 67ABA13005AB;
	Thu, 23 Jul 2026 16:26:19 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 23 Jul 2026 16:26:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1784838379;
	 x=1784845579; bh=W3JglPnWk9TBq4x0G1FeLIkVSrGWMGHIqS6ALjWfpa0=; b=
	TXfg5ubMGpI7NH2+Kilra5KFHoKlpaz8cZfxh6VS0Y8aco6ACn5bHVXXNhuqfdNz
	AHnuDiorIp9DgwlNO+v7fnyXJSh0ch6JmJRwJLqkU/D8t1IP5h99QfouIP4tukaP
	BlRyW5EIlO5Fc1xoDsDwGE1DuTLfLfRGXr9hsDkbq6c0qdfbgZu0iewm5r/wbtIg
	pccyjlUmfHVcp/JCc1IfzmJfclrUNq4zJxVHycV+85mfTCkb1c2xe78MuNoJZBE2
	YFMiJZ+wKgNOq/FhrVkn4C5ayCoN+4A6akEA03CiW88iEIipAQ6LFbwbMwU3cPe3
	enFj9VY8Px/AydESmr18PA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1784838379; x=
	1784845579; bh=W3JglPnWk9TBq4x0G1FeLIkVSrGWMGHIqS6ALjWfpa0=; b=e
	oV4KXT3Ym/YV5GkF2QRCa4+pOlI/zY8q4hcvjJ3LxL9gvXQU6dggg4Kx4JHeElJC
	9IM6iw8nO/pEEwu2ZxZc40FBfz/CNw7/4q11pncrryEXvDEfI50yEbSOTjXWvB6c
	P6riHQKso/WbIn20eXxFtKjaVHL19mCYnPU/hv9Zw6sa4UbpVCoZ7Z5ZzySoCYxC
	rsD6zwlNXs2pymTpfxtlUvJOPfoEPTdVzhqLwqxI88o9iHMtbamqeT28J5rgypVy
	xx/io/NKkJpvLEVPWaoqxyiz/DA16RAdOQNHHUPdj90X3sysR6zA1a4OM2vafVby
	9vlzKc58AmpQ/K+BZW37Q==
X-ME-Sender: <xms:6nhiaq0GCCJ3UjZ1Tl2tjNSSOnLYa4n_DvEcQxwQC9GuOs_D83Mzog>
    <xme:6nhiaqScHvfaZ8a3YA8X-XOWjv0Qdvpj2dus8nerwH4i6u3xSe-ZOxZ6idILJxXim
    y1KXEIpiY7SW9YeE_uONa8KUBeR7Q5D2gjX1lMoCNkek2ZgELFkeA>
X-ME-Received: <xmr:6nhianaCq0-8aK30F5jYwZGN-zCrvAD2Sd6SGgBH9Eu3eu1y9EjCtytpO_M1R6a-kZg2BJEbUUYPYJms-lGCWOBvUA9tEM8>
X-ME-Proxy-Cause: dmFkZTGtHfvCGLFNFtcVRq1cHrKjv7HYmoxFw1SEsPfggLpPF3+EigNttIIi46yncFHb8w
    RNhYQ07T1sllTu+sciGyBlKNcqXi+ymeT8cw3/9uVWtj/55kw2wskM5if1ZNL/3AIR5RA7
    JKSkKWovXVlh7x77H2TM7Fwa4ev5Ev2uAIZzQMb9G24Gxj0uSSfHKfofOICsmDLLuGJSqQ
    arq+kkHAqnBsywojtxH84aBy8syhUvWsWbGXXq4laZV35SkdUVXHQX8BaFHGaJFjYDX/ty
    4nfo9ODP4B4TvmLO5jB3ku72GvF+yhV8RnLjRs4UWFh7UVF90OGDAER6ybUj5upM1dXNGZ
    F03sjgtZ4n7EW2/LRPbX33fsmxdTQZM4Vw5QGKeQRTtYxEOchEyqIxRBu4LbkRDn73kWsj
    LxYHgAovK+XVj0yrC2GlG4PIwCuhaVZl4PNrkMgjuuHaVnpbrMOazhWf+XHy5e4/kzdEPK
    ESIrNm8TOPUo7esJ9Bowy13hBURoivHoZBN+d4ZkKnSoXGR5vuSaTyzTxQ+Hzaay0E7Lfr
    xq6M32C+odLuFXo74tayix0UXXCfsRftO/iWF6RnjQkHlRCv1V8SQ1MYK7N3gRXqdouc8l
    jyXZqRQAN02lAaHt2bHhaQRmnjivyIfZ3NUs7hofb60faFpc5bKWXMeqNoIw
X-ME-Proxy: <xmx:6nhiaoCXzbGIALywOyKdXlCmgNNav7K7UV8hqKi_9N-GTFvh7oRdGw>
    <xmx:6nhiauBmaHuLQ1nKqA7wC38CXfEeYaFqFWIRA7sNALBbywVskdn7Lw>
    <xmx:6nhiakG0cjRTw4Z4znK2C-2aTt_TaksxSzeagr3CTWcsXG4N-rNvpA>
    <xmx:6nhiahnCr7pm_ynLAL8AGOG2tvn6-_tx8d1jY7ys3gGWLrP5zNJxoA>
    <xmx:63hianEYvSz2qubeSY6ig3NYWooFgtsXupJs-9XDOyc4f82FAicO-1U8>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jul 2026 16:26:17 -0400 (EDT)
Date: Thu, 23 Jul 2026 22:26:16 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Julia.Lawall@inria.fr, Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Eugen Hristev <ehristev@kernel.org>,
	Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
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
Message-ID: <20260723202616.GE2273555@ragnatech.se>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260723184538.3888637-13-ekffu200098@gmail.com>

Hi Sang-Heon,

Thanks for your work.

On 2026-07-24 03:45:14 +0900, Sang-Heon Jeon wrote:
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

For rcar-csi2.c,

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

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
> -- 
> 2.43.0
> 

-- 
Kind Regards,
Niklas Söderlund
