Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C2935A297
	for <linux-samsung-soc@vger.kernel.org>; Mon, 18 Aug 2025 14:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755527202; cv=none; b=r/JV13eTl/dBaaMSm+Q4NIlQ91BbDheoVgNxafn6M/e3aesecz1MBC1vlRjwqxvWKg/wT3z+3yw3CzdosBT1lFccpbXXH8DrK3zGVEN6gNsNHbZU+3EQiiumIHFgODvbklPysU/q4Suetz0i87a1rPlBDZlVvVyCB8VkuYTgonM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755527202; c=relaxed/simple;
	bh=7ezW0xgjOVU/HPPI7EH3iQMRVDsw5p4GIjkLUnHQnrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XsZWa2tRDoRQXioEKrTwL6QLqBsZHLvbotbIdZ5xgquxTvnZ7UDE8CJ+aO1YnRAjHJBkXjC3c/PojylIH7EPrS5R2LXzD124N+15pWL0AFD6u1Y/RwG36qNyz/XHUfnSAyDjwUG/qKuXB8tOHecW2VnOZIfZV4yU2v7V7Y3GgOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=oCTeUOto; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="oCTeUOto"
Date: Mon, 18 Aug 2025 16:26:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1755527196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BM8JYvbLnO1/Ucg0aYL8ohJY0qTf1X3d+as2UPeqOU8=;
	b=oCTeUOtozrDTdHGSj3+NoHvrSsFIqNNNFX//yWAy7zaUQbKmfENq2THr1VTKZlqr1zdqCp
	HIUJ3nZttJm+2CajM+QR3lVlbO3ruMapBmi3ibRZo/Wyy2SJIUzMiyWRNn4+Fms8etW9cJ
	spD7VQJEJxbi/90YXfW/DGiDrS2LMw8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Henrik Grimler <henrik@grimler.se>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
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
Subject: Re: [PATCH v2 3/3] drm/bridge: sii9234: use extcon cable detection
 logic to detect MHL
Message-ID: <20250818142622.GA286180@grimfrac.localdomain>
References: <20250724-exynos4-sii9234-driver-v2-0-faee244f1d40@grimler.se>
 <CGME20250724185204eucas1p1d699db3abebc702ea8261b2e41a77c52@eucas1p1.samsung.com>
 <20250724-exynos4-sii9234-driver-v2-3-faee244f1d40@grimler.se>
 <1840a54c-c03a-42e3-a3a8-52e38919df38@samsung.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1840a54c-c03a-42e3-a3a8-52e38919df38@samsung.com>
X-Migadu-Flow: FLOW_OUT

Hi Marek,

On Thu, Aug 14, 2025 at 01:26:33PM +0200, Marek Szyprowski wrote:
> On 24.07.2025 20:50, Henrik Grimler wrote:
> > To use MHL we currently need the MHL chip to be permanently on, which
> > consumes unnecessary power. Let's use extcon attached to MUIC to enable
> > the MHL chip only if it detects an MHL cable.
> >
> > Signed-off-by: Henrik Grimler <henrik@grimler.se>
> > ---
> > v2: add dependency on extcon. Issue reported by kernel test robot
> >      <lkp@intel.com>
> > ---
> >   drivers/gpu/drm/bridge/Kconfig   |  1 +
> >   drivers/gpu/drm/bridge/sii9234.c | 89 ++++++++++++++++++++++++++++++++++++++--
> >   2 files changed, 87 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> > index b9e0ca85226a603a24f90c6879d1499f824060cb..f18a083f6e1c6fe40bde5e65a1548acc61a162ae 100644
> > --- a/drivers/gpu/drm/bridge/Kconfig
> > +++ b/drivers/gpu/drm/bridge/Kconfig
> > @@ -303,6 +303,7 @@ config DRM_SII902X
> >   config DRM_SII9234
> >   	tristate "Silicon Image SII9234 HDMI/MHL bridge"
> >   	depends on OF
> > +	select EXTCON
> >   	help
> >   	  Say Y here if you want support for the MHL interface.
> >   	  It is an I2C driver, that detects connection of MHL bridge
> > diff --git a/drivers/gpu/drm/bridge/sii9234.c b/drivers/gpu/drm/bridge/sii9234.c
> > index 0e0bb1bf71fdcef788715cfd6fa158a6992def33..4d84ba01ea76816bebdbc29d48a041c9c6cd508e 100644
> > --- a/drivers/gpu/drm/bridge/sii9234.c
> > +++ b/drivers/gpu/drm/bridge/sii9234.c

[ ...]

> > +
> > +	edev = extcon_find_edev_by_node(muic);
> > +	of_node_put(muic);
> > +	if (IS_ERR(edev)) {
> > +		dev_err_probe(ctx->dev, PTR_ERR(edev),
> > +			      "invalid or missing extcon\n");
> > +	}
> 
> It looks that the original logic got lost somehow in the above code 
> block, what causes kernel oops if compiled as module and loaded before 
> extcon provider. Please handle -EPROBE_DEFER and propagate error value, 
> like the original code did in sii8620 driver:
> 
>          if (IS_ERR(edev)) {
>                  if (PTR_ERR(edev) == -EPROBE_DEFER)
>                          return -EPROBE_DEFER;
>                  dev_err(ctx->dev, "Invalid or missing extcon\n");
>                  return PTR_ERR(edev);
>          }

Thanks for detecting the issue! I think my code is just missing return
before dev_err_probe (same mistake as I did on patch 2). With return
added I have not been able to reproduce any kernel oops, but if
CONFIG_DRM_SII9234=y and CONFIG_EXTCON_MAX77693=m then it seems like
linux gets stuck probing sii9234 and waiting for the extcon provider
(verified with some printf debugging). This happens for me both with:

	edev = extcon_find_edev_by_node(muic);
	of_node_put(muic);
	if (IS_ERR(edev)) {
		return dev_err_probe(ctx->dev, PTR_ERR(edev),
				     "Invalid or missing extcon\n");
	}

and

	edev = extcon_find_edev_by_node(muic);
	of_node_put(muic);
	if (IS_ERR(edev)) {
		if (PTR_ERR(edev) == -EPROBE_DEFER)
			return -EPROBE_DEFER;
		dev_err(ctx->dev, "Invalid or missing extcon\n");
		return PTR_ERR(edev);
	}

I am not sure what to do to fix the issue, as far as I can see probe
logic and extcon handling is the same as in sil-sii8620 and ite-it6505
(i.e. the other bridges that use extcon). Will investigate further.

Best regards,
Henrik Grimler

> > +
> > +	ctx->extcon = edev;
> > +	ctx->extcon_nb.notifier_call = sii9234_extcon_notifier;
> > +	INIT_WORK(&ctx->extcon_wq, sii9234_extcon_work);
> > +	ret = extcon_register_notifier(edev, EXTCON_DISP_MHL, &ctx->extcon_nb);
> > +	if (ret) {
> > +		dev_err(ctx->dev, "failed to register notifier for MHL\n");
> > +		return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >   static enum drm_mode_status sii9234_mode_valid(struct drm_bridge *bridge,
> >   					 const struct drm_display_info *info,
> >   					 const struct drm_display_mode *mode)
> > @@ -916,12 +986,17 @@ static int sii9234_probe(struct i2c_client *client)
> >   	if (ret < 0)
> >   		return ret;
> >   
> > +	ret = sii9234_extcon_init(ctx);
> > +	if (ret < 0)
> > +		return ret;
> > +
> >   	i2c_set_clientdata(client, ctx);
> >   
> >   	ctx->bridge.of_node = dev->of_node;
> >   	drm_bridge_add(&ctx->bridge);
> >   
> > -	sii9234_cable_in(ctx);
> > +	if (!ctx->extcon)
> > +		sii9234_cable_in(ctx);
> >   
> >   	return 0;
> >   }
> > @@ -930,7 +1005,15 @@ static void sii9234_remove(struct i2c_client *client)
> >   {
> >   	struct sii9234 *ctx = i2c_get_clientdata(client);
> >   
> > -	sii9234_cable_out(ctx);
> > +	if (ctx->extcon) {
> > +		extcon_unregister_notifier(ctx->extcon, EXTCON_DISP_MHL,
> > +					   &ctx->extcon_nb);
> > +		flush_work(&ctx->extcon_wq);
> > +		if (ctx->cable_state > 0)
> > +			sii9234_cable_out(ctx);
> > +	} else {
> > +		sii9234_cable_out(ctx);
> > +	}
> >   	drm_bridge_remove(&ctx->bridge);
> >   }
> >   
> >
> Best regards
> -- 
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> 
