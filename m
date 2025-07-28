Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E34D8BE8
	for <linux-samsung-soc@vger.kernel.org>; Mon, 28 Jul 2025 18:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753728993; cv=none; b=mxuPl1ftzOyo5ATjnX8EdZq6kIMt/BhpLrHVt2om+v0SX5C7I6N780N137gOTFBTDyAjC71vz/DNObNe+uaVn4yLv4nnAlGCwX1uIYaNQfhe74Dk7PwR+7XXsTELdfeiaZZgD3Mztm1TnThTBC8xyc1Eekz+bIYVhqeaxcBdk6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753728993; c=relaxed/simple;
	bh=vxlYLrRCullUV4UDOPB4cS4TOimPyODJGXbciEost6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HeXCoRd18ITXMJtxruwZ3EtZPkNvifCIKrMu1CiT5oUoDwP+nDz1oceZ+dqsnevIUIECbF71YmRL1SOolzZOZ3BicwJaxkUCGcV8uubu0GGYe+1rzEEHE6IB5iDx7+LDfQK0o7xowtW/XkmqTUgfu656DKJcsH34wNf0IgSUH+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se; spf=pass smtp.mailfrom=grimler.se; dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b=AdLxBKNw; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=grimler.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=grimler.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=grimler.se header.i=@grimler.se header.b="AdLxBKNw"
Date: Mon, 28 Jul 2025 20:56:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=grimler.se; s=key1;
	t=1753728985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GsTJh65LY657rqwkxVWVgzfBPNOafbvVgWWFNGM+6ko=;
	b=AdLxBKNw43B4adzhvF90yj/2kXCTQ4k6U4mTfyNfit06LtIw5DxJYHqFBUpqzXQuVBnazH
	kkTf6Am29nrGFZPJkTE6Em6nIq3uRq3WtOQDGMvUO2zuuXDFPrZuvRZQmFs5UdVw06mIyJ
	o3y35B+xuSzWfcQZ5HIDh/WDP64Jexw=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Henrik Grimler <henrik@grimler.se>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
Subject: Re: [PATCH v2 2/3] drm/bridge: sii9234: use dev_err_probe where
 applicable
Message-ID: <20250728185609.GA160878@grimfrac.localdomain>
References: <20250724-exynos4-sii9234-driver-v2-0-faee244f1d40@grimler.se>
 <20250724-exynos4-sii9234-driver-v2-2-faee244f1d40@grimler.se>
 <opsrp4mlhwzoldthsna5wx32b755wl3uxrbqvocvnl5ssduf3k@76a7fycatbho>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <opsrp4mlhwzoldthsna5wx32b755wl3uxrbqvocvnl5ssduf3k@76a7fycatbho>
X-Migadu-Flow: FLOW_OUT

Hi Dmitry,

On Sun, Jul 27, 2025 at 07:38:12PM +0300, Dmitry Baryshkov wrote:
> On Thu, Jul 24, 2025 at 08:50:52PM +0200, Henrik Grimler wrote:
> > In case of error during resource acquisition the driver should print
> > an error message only if it is not deferred probe. Use dev_err_probe
> > helper to handle this, which will also record defer probe reason for
> > debugging.
[...]
> > @@ -836,9 +835,7 @@ static int sii9234_init_resources(struct sii9234 *ctx,
> >  	ctx->supplies[3].supply = "cvcc12";
> >  	ret = devm_regulator_bulk_get(ctx->dev, 4, ctx->supplies);
> >  	if (ret) {
> > -		if (ret != -EPROBE_DEFER)
> > -			dev_err(ctx->dev, "regulator_bulk failed\n");
> > -		return ret;
> > +		dev_err_probe(ctx->dev, ret, "regulator_bulk failed\n");
> 
> Drop the braces, use 'return dev_err_probe(...)'
> 
> >  	}
> >  
> >  	ctx->client[I2C_MHL] = client;

Thanks for reviewing and spotting that, will fix in next version!

Best regards,
Henrik Grimler
