Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C528156C4B
	for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Aug 2024 12:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724849160; cv=none; b=tguZye8uPCK2J+asmHG48edFSAyYSEOgR4I4wzgiKGR/hm2c9lorVDUJrQznhS/MD4AjmNrMH7WJIkPLsTRtsyESgaeqIoTsZNLOhNhDKYaT9OC9MPl+THFtZbTA2iiRGvHyMXm9NqAEamsYuh00rAgVzA5UzL5s0Hk1fdWWMSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724849160; c=relaxed/simple;
	bh=hkTKs0+DeGcyzXdqX/8I8uBWA8UwaEJ/2FzNhkwajRM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=h1ZLAbvyegfC5UhQkrOnY/BONcQUSzVJq7H+kDxoXOlo1DHhEHkxRX7/5TrFfsBX9wpmqHK+XK97HckRJGOP9I+Rguh4fHkAxA09BbBzkHEvsLTUFl5Tb4hjai197gIitJwgoLFrH8i0efn05KWeVrvgp+3xLmKDJQG2BEKJprs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=ebf58Nox; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="ebf58Nox"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-428141be2ddso57096785e9.2
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Aug 2024 05:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1724849157; x=1725453957; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ftRdv0MLU+3ijXVFoJmvVkSok6Tm8Wviwpu9Wkm/YDY=;
        b=ebf58Noxni3ntpjdVWy2Cx36esHY2z9Oj4Dv8oqvriyOh/LKs4d4r2dk0xx10rqVOA
         EC9WTjFurB1nAtCHprKHm6nSaxyv2QE0GCBo4W6pd1RKEjO0lKBZnLOs4rz2kbdLgk6b
         ApJG45iwntJFyE2/a/ievU8pjpxssxrT5JkAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724849157; x=1725453957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftRdv0MLU+3ijXVFoJmvVkSok6Tm8Wviwpu9Wkm/YDY=;
        b=hsP2xw8cWOX2GsnNy0+OvFOVEW3bqmEOgPuyezuM5cdt6MF1kY50k8iaUM98cy7z6K
         Cthvma5eCiQxxz9cx3LYdMeXzng8YWkY0jDZR12TF4UOT8Qnv9roKRyQbCVr5DVFhFKM
         QUIgfsr7R3lOO55+yakYwI+fjZaHYjOQ3CoEmU4Ot/Tl9fph/wjmAjNz+h4YAlky7CUg
         bhtvbrMmX6wOFmypwVPc6L3g3Y0ZaCRczMcCNxKwe8XAYawfHWYqFp9B7r/6RyCoN4e6
         qONfy/vv5QEgO2Q0fYorWBw1tnt+gCKPq+UHNcLc2COCNyzW9u1fZEbCUvjalhzhooYv
         EmQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6emLZaW/jLMa9LgMm9cYaSg+pCVtaRs4R+FQ5ClQbDXqrYmQoPjQamH7FV3eHYFEHAr955ed/TZesngJpG8CRJg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9WKg6g+6PkC7vXE51OOZBqk29GmdVXlDqy9s2qbNUFWaVJ4EB
	8OYBGG8/sMhUyPBn404BY169BoWKW/tlwyrx1a6K7VA1GK5XwOiXxyJX4A1bjJc=
X-Google-Smtp-Source: AGHT+IHJLuY388mFQiWhVPxgkqgSy18vMCcZhNzc2YHb6bAZ5VajwOyWWRJA7igX6fSAvH8sZu1CAw==
X-Received: by 2002:a05:600c:3514:b0:426:51dc:f6cd with SMTP id 5b1f17b1804b1-42acd57a01dmr123145165e9.18.1724849156478;
        Wed, 28 Aug 2024 05:45:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba63a53f9sm20899835e9.12.2024.08.28.05.45.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 05:45:56 -0700 (PDT)
Date: Wed, 28 Aug 2024 14:45:54 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 3/6] drm/exynos: hdmi: convert to struct drm_edid
Message-ID: <Zs8cAse9Tyv6JTe_@phenom.ffwll.local>
References: <cover.1724348429.git.jani.nikula@intel.com>
 <be15dce66a5373a7aed797a4ef63b0ba90b231e9.1724348429.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be15dce66a5373a7aed797a4ef63b0ba90b231e9.1724348429.git.jani.nikula@intel.com>
X-Operating-System: Linux phenom 6.9.12-amd64 

On Thu, Aug 22, 2024 at 08:42:49PM +0300, Jani Nikula wrote:
> Prefer the struct drm_edid based functions for reading the EDID and
> updating the connector.
> 
> The functional change is that the CEC physical address gets invalidated
> when the EDID could not be read.
> 
> v2:
> - display info usage was split to a separate patch
> - check drm_edid_connector_update() return value
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> 
> ---
> 
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: Alim Akhtar <alim.akhtar@samsung.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> ---
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index 25d508b25921..c9d4b9146df9 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -884,14 +884,21 @@ static int hdmi_get_modes(struct drm_connector *connector)
>  {
>  	struct hdmi_context *hdata = connector_to_hdmi(connector);
>  	const struct drm_display_info *info = &connector->display_info;
> -	struct edid *edid;
> +	const struct drm_edid *drm_edid;
>  	int ret;
>  
>  	if (!hdata->ddc_adpt)
>  		goto no_edid;
>  
> -	edid = drm_get_edid(connector, hdata->ddc_adpt);
> -	if (!edid)
> +	drm_edid = drm_edid_read_ddc(connector, hdata->ddc_adpt);

hdmi_create_connector seems to set up the right ddc already, so I think
drm_edid_read should be working. With that:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +
> +	ret = drm_edid_connector_update(connector, drm_edid);
> +	if (ret)
> +		return 0;
> +
> +	cec_notifier_set_phys_addr(hdata->notifier, info->source_physical_address);
> +
> +	if (!drm_edid)
>  		goto no_edid;
>  
>  	hdata->dvi_mode = !info->is_hdmi;
> @@ -899,12 +906,9 @@ static int hdmi_get_modes(struct drm_connector *connector)
>  			  (hdata->dvi_mode ? "dvi monitor" : "hdmi monitor"),
>  			  info->width_mm / 10, info->height_mm / 10);
>  
> -	drm_connector_update_edid_property(connector, edid);
> -	cec_notifier_set_phys_addr_from_edid(hdata->notifier, edid);
> -
> -	ret = drm_add_edid_modes(connector, edid);
> +	ret = drm_edid_connector_add_modes(connector);
>  
> -	kfree(edid);
> +	drm_edid_free(drm_edid);
>  
>  	return ret;
>  
> -- 
> 2.39.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
