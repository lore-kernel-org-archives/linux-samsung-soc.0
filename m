Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D324D8DB9
	for <linux-samsung-soc@vger.kernel.org>; Tue, 14 Jul 2026 16:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784046886; cv=none; b=uMoibDjZ0HUpGg+DIrzoDgrZUhPcnPPtz6hgPFI3I6Fx1xH8gOccyFCxSSFbQ/aXf7RpluG0S0kMkcbAxY5Wdz+tF1tLtaVZqjwyFUUDpBwibdJ4DShXyia9JgAntPhm7rQfDflik0HzSDD/JUGI+X4tNg5u4qjInV7ltRf0q/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784046886; c=relaxed/simple;
	bh=Uu1OWjuzuYaDfteRE1vZ1Llxzc5feTHtc4vtd2Hpx+M=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=eDUKptHrko02HVcUDGuDgUMCB3K6ndDiqReidMk7RDq5uioUxk31U7CU2M9D6H/LK2dnhstpLPPfmgufmK/8Ce3+ewtRd4qscWLHYL2fRg5RiD/wqBMrnVHMEDGr2HHB9y0WkLNCe0MTrVU12xW11AdP4QvbvI3HXsaLoNoi8Oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=0f4AODlr; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="0f4AODlr"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 29B3F1A0FD1;
	Tue, 14 Jul 2026 16:34:42 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F18DE60346;
	Tue, 14 Jul 2026 16:34:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 593A011BD2234;
	Tue, 14 Jul 2026 18:34:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784046880; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=E0IcMTMGfz1S5Qk5HK6Iiap0iTukd7f1HD82LoIsjI8=;
	b=0f4AODlrXznX/HInV9ya6JDxQeEi9VHpmLxWY7s0BJzlLFxReZMj0lsVT9AV7Kg2+1V+kW
	BqG0NU1SwlwCBMy9s8ie6kpFuCyS43PaJk+rhGA7aCtzj4ZCzpVGAgytBs0UQh/Rqm1YgI
	aMSSN7/hNAMvZzG4xf8vmdAczB7UxauX3pNph2Ij3xPHikrvY80ggDs4c4eM7ypqojeHDR
	NnpZIotWj0o88DIRVuiiA1yUG2FcId4ZYSw84gik9U7MSbgm5VFPP5wuOjET5HyOLsk5/B
	OTZoKIH8Cts2D9X8UHw8HtUlvAeUmZNRTjY2D+vg0isujKUB3MqyzvSVg6MBYw==
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH RESEND v4 3/3] drm/bridge: sii9234: use extcon cable
 detection logic to detect MHL
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Henrik Grimler <henrik@grimler.se>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260602-exynos4-sii9234-driver-v4-3-9b2fc38e104a@grimler.se>
References: <20260602-exynos4-sii9234-driver-v4-0-9b2fc38e104a@grimler.se>
 <20260602-exynos4-sii9234-driver-v4-3-9b2fc38e104a@grimler.se>
Date: Tue, 14 Jul 2026 18:34:20 +0200
Message-Id: <178404686056.173179.5143201359152396886.b4-review@b4>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 02 Jun 2026 20:36:50 +0200, Henrik Grimler <henrik@grimler.se> wrote:

Hello Henrik,

> To use MHL we currently need the MHL chip to be permanently on, which
> consumes unnecessary power. Let's use extcon attached to MUIC to enable
> the MHL chip only if it detects an MHL cable.
> 
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Henrik Grimler <henrik@grimler.se>

I have several minor comments, but overall looks OK to me.

>
>
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index 4a57d49b4c6d..11171b4054b5 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -333,6 +333,7 @@ config DRM_SII902X
>  config DRM_SII9234
>  	tristate "Silicon Image SII9234 HDMI/MHL bridge"
>  	depends on OF
> +	depends on EXTCON || !EXTCON

IMO the other syntax is more readable:

          depends on EXTCON if EXTCON

See https://www.kernel.org/doc/html/latest/kbuild/kconfig-language.html

>
> diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
> index e43248e515b3..72c6aeed6e12 100644
> --- a/drivers/gpu/drm/bridge/sii9234.c
> +++ b/drivers/gpu/drm/bridge/sii9234.c
> @@ -170,8 +172,12 @@ struct sii9234 {
>  	struct drm_bridge bridge;
>  	struct device *dev;
>  	struct gpio_desc *gpio_reset;
> -	int i2c_error;
>  	struct regulator_bulk_data supplies[4];
> +	struct extcon_dev *extcon;
> +	struct notifier_block extcon_nb;
> +	struct work_struct extcon_wq;
> +	int cable_state;
> +	int i2c_error;

Moving i2c_error is unrelated, and apparently unneeded unless I'm missing
something.

> @@ -863,6 +869,70 @@ static int sii9234_init_resources(struct sii9234 *ctx,
>  	return 0;
>  }
>  
> +static void sii9234_extcon_work(struct work_struct *work)
> +{
> +	struct sii9234 *ctx =
> +		container_of(work, struct sii9234, extcon_wq);

Can fit on a single line.

> +	int state = extcon_get_state(ctx->extcon, EXTCON_DISP_MHL);
> +
> +	if (state == ctx->cable_state)
> +		return;
> +
> +	ctx->cable_state = state;
> +
> +	if (state > 0)
> +		sii9234_cable_in(ctx);
> +	else
> +		sii9234_cable_out(ctx);
> +}
> +
> +static int sii9234_extcon_notifier(struct notifier_block *self,

"self" is not a very descriptive name. What about "nb", being a notifier
block?

> +			unsigned long event, void *ptr)
> +{
> +	struct sii9234 *ctx =
> +		container_of(self, struct sii9234, extcon_nb);

Single line here too.

> [ ... skip 14 lines ... ]
> +	/* Then get micro-USB Interface Controller node */
> +	muic = of_get_next_parent(musb);
> +
> +	if (!muic) {
> +		dev_info(ctx->dev,
> +			 "no extcon found, switching to 'always on' mode\n");

Can fit in a line.

> +		return 0;
> +	}
> +
> +	edev = extcon_find_edev_by_node(muic);
> +	of_node_put(muic);
> +	if (IS_ERR(edev)) {
> +		return dev_err_probe(ctx->dev, PTR_ERR(edev),
> +			      "invalid or missing extcon\n");
> +	}

You can drop the curly braces, and perhaps the dev_err_probe() can fit in a
100-chars line.

> +
> +	ctx->extcon = edev;
> +	ctx->extcon_nb.notifier_call = sii9234_extcon_notifier;
> +	INIT_WORK(&ctx->extcon_wq, sii9234_extcon_work);
> +	ret = extcon_register_notifier(edev, EXTCON_DISP_MHL, &ctx->extcon_nb);
> +	if (ret) {
> +		dev_err(ctx->dev, "failed to register notifier for MHL\n");
> +		return ret;
> +	}

Use dev_err_probe(), and so remove the {}.

> @@ -929,7 +1004,15 @@ static void sii9234_remove(struct i2c_client *client)
>  {
>  	struct sii9234 *ctx = i2c_get_clientdata(client);
>  
> -	sii9234_cable_out(ctx);
> +	if (ctx->extcon) {
> +		extcon_unregister_notifier(ctx->extcon, EXTCON_DISP_MHL,
> +					   &ctx->extcon_nb);

I guess you can use devm_extcon_register_notifier() to simplify a bit the
code.

> +		flush_work(&ctx->extcon_wq);
> +		if (ctx->cable_state > 0)
> +			sii9234_cable_out(ctx);
> +	} else {
> +		sii9234_cable_out(ctx);
> +	}
>  	drm_bridge_remove(&ctx->bridge);
>  }
>  

Luca

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

