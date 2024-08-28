Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB5617799F
	for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Aug 2024 12:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724849053; cv=none; b=SdYbKRWizcRUeLlDBkxWHKNL0pzgbF96ZtUiLJFZJuhAlo3ucQG1SH6D+uQmJYD7CpPRcunk+0q44miJ4YtvpfPSTgc/ppViYDnzW3KcwxUv5PCF540LHKrN0K3rEyE502c5U48qeNuCJzkQNE8c8W7OEurO59WlS7I2Y/qqgaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724849053; c=relaxed/simple;
	bh=4K82F/aiIXgrAqvd1yreWzMhUXvX2go9CfVPTiL+/lA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uW9yivvqInCw3QANn0wOiOXw3dwRWBttdc0TRp7JR0T87XTSul57sVJoURxCImOccgwezZTncZFsBwm929GTjux8RHjuVUuRAaVPU3NuqX/Ln6UW7TvJx4BZI/Bm00NcL6pnJrfB1s+dIPruPC/6tzkzqW8vhCREbbec0cgtmsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=Xj+WbFXh; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="Xj+WbFXh"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-428243f928fso73790205e9.0
        for <linux-samsung-soc@vger.kernel.org>; Wed, 28 Aug 2024 05:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1724849049; x=1725453849; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PJoy2cgS+HW0K4p2KnocRxI+9IVsCSi90PCNEOIIuJ8=;
        b=Xj+WbFXh9F2Qzz7Hp+Nmw9oQW3LnP/NR6uhRP1kgXH9nekaJN5ecPs87FobeCh7tZI
         FvvWmL96JfqJdH/RbDxnWZFyFUy9P0ZU0ehIq1bgDtnytL1TJHWaR9MU0rGZ+GYu3aQs
         J1f4cqCnPyF4ky9cO+cYK5xPmNguAJP705lsM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724849049; x=1725453849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PJoy2cgS+HW0K4p2KnocRxI+9IVsCSi90PCNEOIIuJ8=;
        b=K1UG/O9CzTiSOTaPQo2oYDvRdBSpj5W8F15k8WeoYeu7GUXAoSvdXM+fl45qz4mQ6M
         QFCP22QKS+VAyfC/3v4HpYT7lZm14lh0N0JU8Xv7LRccSDSK16jAogHmsAbXkqnXllHo
         2SBkCxaV0vqNOkSrFj7p6f6izdTST7TXR7+OhM9YIXZ6pr6MhWpNbK/M7dYiCp3feOEW
         Ik7MiE9ZtYWt+XG5UDQb3mcy1YI3k/1mwD+w7ixcvGJAGp4c5LrnBUugiKvJDRNSxQQs
         f/WJecDnvbKNJFjAz9GW0NB2+73PexFd5vOus8HJwCzoThU6BJVi9M79aB61sC/WR6vM
         sUjA==
X-Forwarded-Encrypted: i=1; AJvYcCVw8wF3La1G0GzFAz7Rnm9yv2dsTRr37se/adKul9WzF9C1zbTWhhcUfXUjcLa2N4JIiQZtVF5veaA25+dWVf9FDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1aV7BQU1WzBQ6lhuRmEIDIaE59syjcJs3iZfmc1fXbF00tnsT
	A7Nzoqdzrs8MoKG1m0ktyCMa41OWlVz7gFzJRCvgBBGPaPVLQchJnzy9uit/XqI=
X-Google-Smtp-Source: AGHT+IHu+Ym/EOCxiFAA+P0FEH5X9n6NL4h+Op9J46iU85Y8xtgIQz69/IK4Rj0aOvHw6CKRmZSolA==
X-Received: by 2002:a05:600c:816:b0:42b:892a:3296 with SMTP id 5b1f17b1804b1-42b892a33d0mr113204905e9.37.1724849049421;
        Wed, 28 Aug 2024 05:44:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba63abe97sm20507885e9.24.2024.08.28.05.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 05:44:09 -0700 (PDT)
Date: Wed, 28 Aug 2024 14:44:07 +0200
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 2/6] drm/exynos: hdmi: use display_info for printing
 display dimensions
Message-ID: <Zs8blw9nvgv-BfzB@phenom.ffwll.local>
References: <cover.1724348429.git.jani.nikula@intel.com>
 <8a6fd6de1853dbc337c5c26c65268604d3e91fe2.1724348429.git.jani.nikula@intel.com>
Precedence: bulk
X-Mailing-List: linux-samsung-soc@vger.kernel.org
List-Id: <linux-samsung-soc.vger.kernel.org>
List-Subscribe: <mailto:linux-samsung-soc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-samsung-soc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a6fd6de1853dbc337c5c26c65268604d3e91fe2.1724348429.git.jani.nikula@intel.com>
X-Operating-System: Linux phenom 6.9.12-amd64 

On Thu, Aug 22, 2024 at 08:42:48PM +0300, Jani Nikula wrote:
> Look up display dimensions from display_info instead of the EDID
> directly. This will be helpful for the follow-up work.
> 
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

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
>  drivers/gpu/drm/exynos/exynos_hdmi.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index 1e26cd4f8347..25d508b25921 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -883,6 +883,7 @@ static const struct drm_connector_funcs hdmi_connector_funcs = {
>  static int hdmi_get_modes(struct drm_connector *connector)
>  {
>  	struct hdmi_context *hdata = connector_to_hdmi(connector);
> +	const struct drm_display_info *info = &connector->display_info;
>  	struct edid *edid;
>  	int ret;
>  
> @@ -893,10 +894,10 @@ static int hdmi_get_modes(struct drm_connector *connector)
>  	if (!edid)
>  		goto no_edid;
>  
> -	hdata->dvi_mode = !connector->display_info.is_hdmi;
> +	hdata->dvi_mode = !info->is_hdmi;
>  	DRM_DEV_DEBUG_KMS(hdata->dev, "%s : width[%d] x height[%d]\n",
>  			  (hdata->dvi_mode ? "dvi monitor" : "hdmi monitor"),
> -			  edid->width_cm, edid->height_cm);
> +			  info->width_mm / 10, info->height_mm / 10);
>  
>  	drm_connector_update_edid_property(connector, edid);
>  	cec_notifier_set_phys_addr_from_edid(hdata->notifier, edid);
> -- 
> 2.39.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
