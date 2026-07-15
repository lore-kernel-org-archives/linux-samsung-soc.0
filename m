Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3998D3C1092
	for <linux-samsung-soc@vger.kernel.org>; Wed, 15 Jul 2026 21:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784149275; cv=none; b=FKhtNhXnSml05MVQ5O3clXZYe5u7puj5G+Ue1A0CsHAwWgoP5Z6pXLDWDcyiVP9re0nGCtaTkWgzOhFwbU/6Fl9XmkmHtZDOocp0DefyszIzkM/LbPtJNiK+dfEHbhfQWSiakE4VNPan96sgFJIO7vBosQ2LAPgfS58Dxj853xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784149275; c=relaxed/simple;
	bh=9mzkR6mK72CbOoNM5u63KwQEb0cgWSJMe3fULxtBV/g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AJF5mUaenSRlfDpcm+mETGmoFTbGF2x3eqTSaSOBX1W92tZg6rWw6oTeAl+E70jZYeK7mulF2LumlfmrrD/p5SISeISGnyzY0rU2Bv4cKkDemvkapnSSJlpx26NCwN4A4azjAnz5ldLdXvD1T0uloMrqtxjrGfQdPxd8yffUeJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=C2qcyZGA; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="C2qcyZGA"
Date: Wed, 15 Jul 2026 23:00:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1784149259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DI98beaWzJsxWR4025nuO00Osx1NSq0imL9gfHXYr5w=;
	b=C2qcyZGAQCYWYHaphCqFN45Un9ibt4AF6XgSMc3hIenYmOoCXGVmfYH3SSpOIGA5zadykM
	maEAZvYOy9eknDsKb78vUdvIwrSut6n1Zn21J7voa91c43d1RjvX94lZ1wj43Z1nUv6mY2
	i/TiQ+HYEXTWs+wbSmpEG6M62zkWwLo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Henrik Grimler <henrik@grimler.se>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht, replicant@osuosl.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND v4 3/3] drm/bridge: sii9234: use extcon cable
 detection logic to detect MHL
Message-ID: <20260715210052.GA32576@l14.localdomain>
References: <20260602-exynos4-sii9234-driver-v4-0-9b2fc38e104a@grimler.se>
 <20260602-exynos4-sii9234-driver-v4-3-9b2fc38e104a@grimler.se>
 <178404686056.173179.5143201359152396886.b4-review@b4>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178404686056.173179.5143201359152396886.b4-review@b4>
X-Migadu-Flow: FLOW_OUT

Hi Luca,

Thanks for reviewing!

On Tue, Jul 14, 2026 at 06:34:20PM +0200, Luca Ceresoli wrote:
> On Tue, 02 Jun 2026 20:36:50 +0200, Henrik Grimler <henrik@grimler.se> wrote:
> 
> Hello Henrik,
> 
> > To use MHL we currently need the MHL chip to be permanently on, which
> > consumes unnecessary power. Let's use extcon attached to MUIC to enable
> > the MHL chip only if it detects an MHL cable.
> > 
> > Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > Signed-off-by: Henrik Grimler <henrik@grimler.se>
> 
> I have several minor comments, but overall looks OK to me.
> 
> >
> >
> > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> > index 4a57d49b4c6d..11171b4054b5 100644
> > --- a/drivers/gpu/drm/bridge/Kconfig
> > +++ b/drivers/gpu/drm/bridge/Kconfig
> > @@ -333,6 +333,7 @@ config DRM_SII902X
> >  config DRM_SII9234
> >  	tristate "Silicon Image SII9234 HDMI/MHL bridge"
> >  	depends on OF
> > +	depends on EXTCON || !EXTCON
> 
> IMO the other syntax is more readable:
> 
>           depends on EXTCON if EXTCON
> 
> See https://www.kernel.org/doc/html/latest/kbuild/kconfig-language.html

Thanks for the link. I was not even aware of the other recommended
variant, seems it is rarely used:

$ find -name Kconfig -exec grep -P '\b(\w+)\b if \1\b' {} +|wc -l
7

Will change in next version that I aim at sending within a week.

> >
> > diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
> > index e43248e515b3..72c6aeed6e12 100644
> > --- a/drivers/gpu/drm/bridge/sii9234.c
> > +++ b/drivers/gpu/drm/bridge/sii9234.c
> > @@ -170,8 +172,12 @@ struct sii9234 {
> >  	struct drm_bridge bridge;
> >  	struct device *dev;
> >  	struct gpio_desc *gpio_reset;
> > -	int i2c_error;
> >  	struct regulator_bulk_data supplies[4];
> > +	struct extcon_dev *extcon;
> > +	struct notifier_block extcon_nb;
> > +	struct work_struct extcon_wq;
> > +	int cable_state;
> > +	int i2c_error;
> 
> Moving i2c_error is unrelated, and apparently unneeded unless I'm missing
> something.

Yes, it is unneeded, will drop the change in next version.

> > @@ -863,6 +869,70 @@ static int sii9234_init_resources(struct sii9234 *ctx,
> >  	return 0;
> >  }
> >  
> > +static void sii9234_extcon_work(struct work_struct *work)
> > +{
> > +	struct sii9234 *ctx =
> > +		container_of(work, struct sii9234, extcon_wq);
> 
> Can fit on a single line.

Will fix.

> > +	int state = extcon_get_state(ctx->extcon, EXTCON_DISP_MHL);
> > +
> > +	if (state == ctx->cable_state)
> > +		return;
> > +
> > +	ctx->cable_state = state;
> > +
> > +	if (state > 0)
> > +		sii9234_cable_in(ctx);
> > +	else
> > +		sii9234_cable_out(ctx);
> > +}
> > +
> > +static int sii9234_extcon_notifier(struct notifier_block *self,
> 
> "self" is not a very descriptive name. What about "nb", being a notifier
> block?

Sure, will fix.

> > +			unsigned long event, void *ptr)
> > +{
> > +	struct sii9234 *ctx =
> > +		container_of(self, struct sii9234, extcon_nb);
> 
> Single line here too.

Will fix.

> > [ ... skip 14 lines ... ]
> > +	/* Then get micro-USB Interface Controller node */
> > +	muic = of_get_next_parent(musb);
> > +
> > +	if (!muic) {
> > +		dev_info(ctx->dev,
> > +			 "no extcon found, switching to 'always on' mode\n");
> 
> Can fit in a line.

The rest of the file uses 80 char line limit, but seems sensible to
exceed it here. Will fix.

> > +		return 0;
> > +	}
> > +
> > +	edev = extcon_find_edev_by_node(muic);
> > +	of_node_put(muic);
> > +	if (IS_ERR(edev)) {
> > +		return dev_err_probe(ctx->dev, PTR_ERR(edev),
> > +			      "invalid or missing extcon\n");
> > +	}
> 
> You can drop the curly braces, and perhaps the dev_err_probe() can fit in a
> 100-chars line.

Will fix.

> > +
> > +	ctx->extcon = edev;
> > +	ctx->extcon_nb.notifier_call = sii9234_extcon_notifier;
> > +	INIT_WORK(&ctx->extcon_wq, sii9234_extcon_work);
> > +	ret = extcon_register_notifier(edev, EXTCON_DISP_MHL, &ctx->extcon_nb);
> > +	if (ret) {
> > +		dev_err(ctx->dev, "failed to register notifier for MHL\n");
> > +		return ret;
> > +	}
> 
> Use dev_err_probe(), and so remove the {}.

Will fix.

> > @@ -929,7 +1004,15 @@ static void sii9234_remove(struct i2c_client *client)
> >  {
> >  	struct sii9234 *ctx = i2c_get_clientdata(client);
> >  
> > -	sii9234_cable_out(ctx);
> > +	if (ctx->extcon) {
> > +		extcon_unregister_notifier(ctx->extcon, EXTCON_DISP_MHL,
> > +					   &ctx->extcon_nb);
> 
> I guess you can use devm_extcon_register_notifier() to simplify a bit the
> code.

Will look into it, thanks!

Best regards,
Henrik Grimler

> > +		flush_work(&ctx->extcon_wq);
> > +		if (ctx->cable_state > 0)
> > +			sii9234_cable_out(ctx);
> > +	} else {
> > +		sii9234_cable_out(ctx);
> > +	}
> >  	drm_bridge_remove(&ctx->bridge);
> >  }
> >  
> 
> Luca
> 
> -- 
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> 
